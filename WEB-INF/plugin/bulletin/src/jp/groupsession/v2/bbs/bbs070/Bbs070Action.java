package jp.groupsession.v2.bbs.bbs070;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.sjts.util.Encoding;
import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.http.TempFileUtil;
import jp.co.sjts.util.io.IOTools;
import jp.co.sjts.util.io.ObjectFile;
import jp.groupsession.v2.bbs.AbstractBulletinAction;
import jp.groupsession.v2.bbs.BbsBiz;
import jp.groupsession.v2.bbs.GSConstBulletin;
import jp.groupsession.v2.cmn.GSConst;
import jp.groupsession.v2.cmn.GSConstCommon;
import jp.groupsession.v2.cmn.biz.CommonBiz;
import jp.groupsession.v2.cmn.cmn110.Cmn110FileModel;
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
 * <br>[機  能] 掲示板 スレッド登録画面のアクションクラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Bbs070Action extends AbstractBulletinAction {

    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Bbs070Action.class);

    /**
     * <br>[機  能] キャッシュを有効にして良いか判定を行う
     * <br>[解  説] ダウンロード時のみ有効にする
     * <br>[備  考]
     * @param req リクエスト
     * @param form アクションフォーム
     * @return true:有効にする,false:無効にする
     */
    public boolean isCacheOk(HttpServletRequest req, ActionForm form) {

        //CMD
        String cmd = NullDefault.getString(req.getParameter(GSConst.P_CMD), "");
        cmd = cmd.trim();

        if (cmd.equals("getBodyFile")) {
            log__.debug("添付ファイルダウンロード");
            return true;

        }
        return false;
    }

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
        Bbs070Form bbsForm = (Bbs070Form) form;

        //コマンド
        String cmd = NullDefault.getString(req.getParameter("CMD"), "");
        log__.debug("CMD= " + cmd);

        //フォーラム編集権限チェック
        if (!cmd.equals("getBodyFile")) {
            con.setAutoCommit(true);
            boolean forumAuthWrite = _checkForumAuth(map, req, con,
                    bbsForm.getBbs010forumSid(), GSConstBulletin.ACCESS_KBN_WRITE);
            if (!forumAuthWrite) {
                return map.findForward("gf_msg");
            }
        }

        if (cmd.equals("moveThreadConfirm")) {
            //ＯＫボタンクリック
            forward = __doConfirm(map, bbsForm, req, res, con);
        } else if (cmd.equals("backList")) {
            //戻るボタンクリック
            _deleteBulletinTempDir(req, bbsForm);

            if (bbsForm.getBbs070cmdMode() == GSConstBulletin.BBSCMDMODE_ADD) {
                forward = map.findForward("moveThreadList");

            } else if (bbsForm.getBbs070cmdMode() == GSConstBulletin.BBSCMDMODE_EDIT
                    || bbsForm.getBbs070cmdMode() == GSConstBulletin.BBSCMDMODE_COPY) {
                String backID = NullDefault.getString(bbsForm.getBbs070BackID(), "");

                if (backID.equals(GSConstBulletin.DSP_ID_BBS170)) {
                    //掲示予定一覧に戻る
                    forward = map.findForward("rsvThreadList");

                } else if (backID.equals(GSConstBulletin.DSP_ID_BBS041)) {
                    //検索結果一覧に戻る
                    forward = map.findForward("moveSearchList");

                } else {
                    //スレッド一覧に戻る
                    forward = map.findForward("moveThreadList");
                }
            }

        } else if (cmd.equals("getBodyFile")) {
            //添付画像ダウンロード
            forward = __doGetBodyFile(map, bbsForm, req, res, con);

        } else if (cmd.equals("delTempFile")) {
            //添付ファイル削除
            forward = __doDelete(map, bbsForm, req, res, con);
        } else {
            //初期表示
            if (!cmd.equals("backToInput")) {
                _deleteBulletinTempDir(req, bbsForm);
            }
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
        Bbs070Form form,
        HttpServletRequest req,
        HttpServletResponse res,
        Connection con)
                throws Exception {

        String cmd = NullDefault.getString(req.getParameter("CMD"), "");

        //投稿一覧(掲示予定一覧)または検索結果一覧からの遷移、かつ処理モード = 編集または複写新規の場合はスレッド情報を取得する
        if (((cmd.equals("editThread") || cmd.equals("moveResult"))
                && (form.getBbs070cmdMode() == GSConstBulletin.BBSCMDMODE_EDIT))
                ||  (cmd.equals("editThread")
                        && form.getBbs070cmdMode() == GSConstBulletin.BBSCMDMODE_COPY)) {
            //投稿の存在チェックを行う
            BbsBiz bbsBiz = new BbsBiz();
            if (!bbsBiz.isCheckExistWrite(con, form.getBbs060postSid())) {
                //フォーラム内スレッド件数取得
                return __setAlreadyDelWrite(map, req, form, con);
            }
        }

        _initBulletinTempDir(req, form);

        con.setAutoCommit(true);
        Bbs070ParamModel paramMdl = new Bbs070ParamModel();
        paramMdl.setParam(form);
        Bbs070Biz biz = new Bbs070Biz();
        biz.setInitData(cmd, getRequestModel(req), paramMdl, con,
                getAppRootPath(), _getBulletinTempDir(req, form));
        paramMdl.setFormData(form);
        con.setAutoCommit(false);
        return map.getInputForward();
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
        Bbs070Form form,
        HttpServletRequest req,
        HttpServletResponse res,
        Connection con)
        throws Exception {

        ActionErrors errors = new ActionErrors();
        errors = form.validateCheck(con, getRequestModel(req), _getBulletinTempDir(req, form));
        if (!errors.isEmpty()) {
            addErrors(req, errors);
            return __doInit(map, form, req, res, con);
        }

        saveToken(req);
        return map.findForward("moveThreadConfirm");
    }

    /**
     * <br>[機  能] 削除ボタンクリック時の処理
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
    private ActionForward __doDelete(
        ActionMapping map,
        Bbs070Form form,
        HttpServletRequest req,
        HttpServletResponse res,
        Connection con)
                throws Exception {

        //テンポラリディレクトリパスを取得
        String tempDir = _getBulletinTempDir(req, form);
        log__.debug("テンポラリディレクトリ = " + tempDir);

        //選択された添付ファイルを削除する
        CommonBiz biz = new CommonBiz();
        biz.deleteFile(form.getBbs070files(), tempDir);

        return __doInit(map, form, req, res, con);
    }

    /**
     * <br>[機  能] スレッド or 投稿削除時権限エラーメッセージ画面遷移時の設定
     * <br>[解  説]
     * <br>[備  考]
     * @param map マッピング
     * @param req リクエスト
     * @param form アクションフォーム
     * @param con コネクション
     * @return ActionForward フォワード
     * @throws SQLException SQL例外発生
     */
    private ActionForward __setAlreadyDelWrite(
        ActionMapping map,
        HttpServletRequest req,
        Bbs070Form form,
        Connection con
            ) throws SQLException {

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
        String textDel = gsMsg.getMessage(req, "cmn.edit");

        //メッセージセット
        String msgState = "error.none.edit.data";
        cmn999Form.setMessage(msgRes.getMessage(msgState,
                textDelWrite,
                textDel));

        req.setAttribute("cmn999Form", cmn999Form);

        return map.findForward("gf_msg");
    }

    /**
     * <br>[機  能] tempディレクトリの画像を読み込む
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param map マップ
     * @param form フォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con Connection
     * @return ActionForward フォワード
     * @throws Exception 実行時例外
     */
    private ActionForward __doGetBodyFile(
            ActionMapping map,
            Bbs070Form form,
            HttpServletRequest req,
            HttpServletResponse res,
            Connection con)
                    throws Exception {

        String tempSaveId = form.getBbs070TempSaveId();

        String tempDir = IOTools.replaceFileSep(
                _getBulletinTempDir(req, form) + GSConstCommon.EDITOR_BODY_FILE + "/" + tempSaveId);

        File bodyFileDir = new File(tempDir);
        File[] files = bodyFileDir.listFiles();
        if (files == null || files.length < 1) {
            return null;
        }

        String downFilePath = "";
        String downFileName = "";
        String tempFileName = "";
        for (File file : files) {
            tempFileName = file.getName();

            if (tempFileName.endsWith(GSConstCommon.ENDSTR_SAVEFILE)) {
                downFilePath = IOTools.replaceFileSep(tempDir + "/" + file.getName());

            } else if (tempFileName.endsWith(GSConstCommon.ENDSTR_OBJFILE)) {
                ObjectFile objFile = new ObjectFile(tempDir, tempFileName);
                Object fObj = objFile.load();
                if (fObj == null) {
                    continue;
                }
                Cmn110FileModel fMdl = (Cmn110FileModel) fObj;
                downFileName = fMdl.getFileName();
            }
        }
        TempFileUtil.downloadInline(req, res, downFilePath, downFileName, Encoding.UTF_8);

        return null;
    }
}
