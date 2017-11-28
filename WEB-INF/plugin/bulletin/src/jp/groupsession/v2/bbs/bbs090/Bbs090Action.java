package jp.groupsession.v2.bbs.bbs090;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.sjts.util.NullDefault;
import jp.groupsession.v2.bbs.AbstractBulletinAction;
import jp.groupsession.v2.bbs.BbsBiz;
import jp.groupsession.v2.bbs.GSConstBulletin;
import jp.groupsession.v2.cmn.biz.CommonBiz;
import jp.groupsession.v2.cmn.cmn999.Cmn999Form;
import jp.groupsession.v2.struts.msg.GsMessage;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.MessageResources;

/**
 * <br>[機  能] 掲示板 投稿登録画面のアクションクラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Bbs090Action extends AbstractBulletinAction {

    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Bbs090Action.class);

    /**
     * <br>[機  能] アクション実行
     * <br>[解  説] コントローラの役割を担います
     * <br>[備  考]
     * @param map アクションマッピング
     * @param form アクションフォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @throws Exception 実行例外
     * @return アクションフォーム
     */
    public ActionForward executeAction(ActionMapping map, ActionForm form,
            HttpServletRequest req, HttpServletResponse res, Connection con)
            throws Exception {
        log__.debug("START");

        ActionForward forward = null;
        Bbs090Form bbsForm = (Bbs090Form) form;

        //プラグイン管理者フラグ
        con.setAutoCommit(true);
        try {
            //フォーラム編集権限チェック
            boolean forumAuthWrite = _checkForumAuth(map, req, con,
                    bbsForm.getBbs010forumSid(), GSConstBulletin.ACCESS_KBN_WRITE);
            if (!forumAuthWrite) {
                return map.findForward("gf_msg");
            }

            //投稿可能チェック
            if (!_checkReplyAuth(map, req, con, bbsForm.getBbs010forumSid())) {
                return map.findForward("gf_msg");
            }
        } finally {
            con.setAutoCommit(false);
        }

        //スレッドの存在チェックを行う
        //投稿の存在チェックを行う
        BbsBiz bbsBiz = new BbsBiz(con);
        if (!bbsBiz.isCheckExistThread(con, bbsForm.getThreadSid())) {
            return __setAlreadyDelThread(map, req, bbsForm, con);
        }

        //コマンド
        String cmd = NullDefault.getString(req.getParameter("CMD"), "");
        log__.debug("CMD= " + cmd);
        if (cmd.equals("moveWriteConfirm")) {
            //ＯＫボタンクリック
            forward = __doConfirm(map, bbsForm, req, res, con);
        } else if (cmd.equals("delTemp")) {
            //添付ファイル削除ボタンクリック
            forward = __doDelTemp(map, bbsForm, req, res, con);
        } else if (cmd.equals("backWriteList")) {
            //戻るボタンクリック
            _deleteBulletinTempDir(req, bbsForm);
            forward = map.findForward("moveThreadList");
        } else {
            //初期表示
            forward = __doInit(map, bbsForm, req, res, con);
        }

        log__.debug("END");
        return forward;
    }

    /**
     * <br>[機  能] 初期表示を行う
     * <br>[解  説]
     * <br>[備  考]
     * @param map マップ
     * @param form フォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @return ActionForward フォワード
     * @throws Exception 実行時例外
     */
    private ActionForward __doInit(ActionMapping map,
        Bbs090Form form,
        HttpServletRequest req,
        HttpServletResponse res,
        Connection con)
                throws Exception {

        String cmd = NullDefault.getString(req.getParameter("CMD"), "");

        //投稿一覧からの遷移、かつ処理モード = 編集 または
        //投稿一覧からの遷移、かつ処理モード = 引用投稿 の場合
        //投稿情報を取得する
        int cmdMode = form.getBbs090cmdMode();
        if ((cmd.equals("editPost") && cmdMode == GSConstBulletin.BBSCMDMODE_EDIT)
                || (cmd.equals("inyouWrite") && cmdMode == GSConstBulletin.BBSCMDMODE_INYOU)) {
            //投稿の存在チェックを行う
            BbsBiz bbsBiz = new BbsBiz(con);
            if (!bbsBiz.isCheckExistWrite(con, form.getBbs060postSid())) {
                return __setAlreadyDelWrite(map, req, form, con, cmdMode);
            }
        }
        _initBulletinTempDir(req, form);

        con.setAutoCommit(true);
        Bbs090ParamModel paramMdl = new Bbs090ParamModel();
        paramMdl.setParam(form);
        Bbs090Biz biz = new Bbs090Biz();
        biz.setInitData(cmd, getRequestModel(req), paramMdl, con,
                getAppRootPath(), _getBulletinTempDir(req, form));
        paramMdl.setFormData(form);
        con.setAutoCommit(false);
        return map.getInputForward();
    }

    /**
     * <br>[機  能] 添付ファイル削除ボタンクリック時の処理
     * <br>[解  説]
     * <br>[備  考]
     * @param map アクションマッピング
     * @param form アクションフォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @return ActionForward
     * @throws Exception 実行時例外
     */
    private ActionForward __doDelTemp(
        ActionMapping map,
        Bbs090Form form,
        HttpServletRequest req,
        HttpServletResponse res,
        Connection con)
                throws Exception {

        //テンポラリディレクトリパスを取得
        String tempDir = _getBulletinTempDir(req, form);
        log__.debug("テンポラリディレクトリ = " + tempDir);

        //選択された添付ファイルを削除する
        CommonBiz biz = new CommonBiz();
        biz.deleteFile(form.getBbs090files(), tempDir);

        return __doInit(map, form, req, res, con);
    }

    /**
     * <br>[機  能] ＯＫボタンクリック時処理を行う
     * <br>[解  説]
     * <br>[備  考]
     * @param map マップ
     * @param form フォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @return ActionForward フォワード
     * @throws Exception 実行例外
     */
    private ActionForward __doConfirm(ActionMapping map,
        Bbs090Form form,
        HttpServletRequest req,
        HttpServletResponse res,
        Connection con
        )
        throws Exception {

        ActionErrors errors = new ActionErrors();
        errors = form.validateCheck(con, getRequestModel(req), _getBulletinTempDir(req, form));
        if (!errors.isEmpty()) {
            addErrors(req, errors);
            return __doInit(map, form, req, res, con);
        }

        saveToken(req);
        return map.findForward("moveWriteConfirm");
    }

    /**
     * <br>[機  能] スレッド or 投稿削除時権限エラーメッセージ画面遷移時の設定
     * <br>[解  説]
     * <br>[備  考]
     * @param map マッピング
     * @param req リクエスト
     * @param form アクションフォーム
     * @param con コネクション
     * @param cmdMode コマンド
     * @return ActionForward フォワード
     * @throws SQLException SQL例外発生
     */
    private ActionForward __setAlreadyDelWrite(
        ActionMapping map,
        HttpServletRequest req,
        Bbs090Form form,
        Connection con,
        int cmdMode) throws SQLException {

        Cmn999Form cmn999Form = new Cmn999Form();
        ActionForward urlForward = null;

        MessageResources msgRes = getResources(req);
        cmn999Form.setIcon(Cmn999Form.ICON_WARN);
        cmn999Form.setWtarget(Cmn999Form.WTARGET_BODY);
        cmn999Form.setType(Cmn999Form.TYPE_OK);
        urlForward = map.findForward("backBBSList");
        cmn999Form.setUrlOK(urlForward.getPath());

        GsMessage gsMsg = new GsMessage();
        String textDelWrite = gsMsg.getMessage(req, "bbs.16");
        String textDel = null;
        if (cmdMode == GSConstBulletin.BBSCMDMODE_EDIT) {
            textDel = gsMsg.getMessage(req, "cmn.edit");
        } else {
            textDel = gsMsg.getMessage(req, "bbs.bbs080.5");
        }

        //メッセージセット
        String msgState = "error.none.edit.data";
        cmn999Form.setMessage(msgRes.getMessage(msgState,
                textDelWrite,
                textDel));

        req.setAttribute("cmn999Form", cmn999Form);

        return map.findForward("gf_msg");
    }

    /**
     * <br>[機  能] スレッド新規作成時エラーメッセージ画面遷移時の設定
     * <br>[解  説]
     * <br>[備  考]
     * @param map マッピング
     * @param req リクエスト
     * @param form アクションフォーム
     * @param con コネクション
     * @return ActionForward フォワード
     * @throws SQLException SQL例外発生
     */
    private ActionForward __setAlreadyDelThread(
        ActionMapping map,
        HttpServletRequest req,
        Bbs090Form form,
        Connection con) throws SQLException {

        Cmn999Form cmn999Form = new Cmn999Form();
        ActionForward urlForward = null;

        MessageResources msgRes = getResources(req);
        cmn999Form.setIcon(Cmn999Form.ICON_WARN);
        cmn999Form.setWtarget(Cmn999Form.WTARGET_BODY);
        cmn999Form.setType(Cmn999Form.TYPE_OK);
        urlForward = map.findForward("backBBSList");
        cmn999Form.setUrlOK(urlForward.getPath());

        GsMessage gsMsg = new GsMessage(getRequestModel(req));
        String textDelWrite = gsMsg.getMessage("bbs.2");
        String textDel = gsMsg.getMessage("bbs.bbs090.1");

        //メッセージセット
        String msgState = "error.none.edit.data";
        cmn999Form.setMessage(msgRes.getMessage(msgState,
                textDelWrite,
                textDel));

        req.setAttribute("cmn999Form", cmn999Form);

        return map.findForward("gf_msg");
    }

}
