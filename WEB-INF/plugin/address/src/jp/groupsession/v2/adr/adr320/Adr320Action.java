package jp.groupsession.v2.adr.adr320;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.sjts.util.NullDefault;
import jp.groupsession.v2.adr.AbstractAddressAdminAction;
import jp.groupsession.v2.cmn.biz.UserGroupSelectBiz;
import jp.groupsession.v2.cmn.model.RequestModel;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * <br>[機  能] アドレス帳 管理者設定 権限設定画面のアクションクラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Adr320Action extends AbstractAddressAdminAction {

    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Adr320Action.class);

    /**
     * <br>アクション実行
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

        ActionForward forward = null;
        Adr320Form adrForm = (Adr320Form) form;

        //コマンドパラメータ取得
        String cmd = NullDefault.getString(req.getParameter("CMD"), "");
        if (cmd.equals("adr320kakunin")) {
            //確認
            forward = __doKakunin(map, adrForm, req, res, con);
        } else if (cmd.equals("adr320back")) {
            //戻る
            forward = __doBack(map, adrForm, req, res, con);
        } else if (cmd.equals("addArest")) {
            // アンケート作成可能ユーザ追加
            forward = __doAddUser(map, adrForm, req, res, con);

        } else if (cmd.equals("removeArest")) {
            // アンケート作成可能ユーザ削除
            forward = __doRemoveUser(map, adrForm, req, res, con);

        } else {
            //デフォルト
            forward = __doInit(map, adrForm, req, res, con);
        }
        return forward;
    }

    /**
     * <br>確認処理
     * @param map アクションマッピング
     * @param form アクションフォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @return アクションフォーワード
     * @throws Exception SQL実行時例外
     */
    private ActionForward __doKakunin(ActionMapping map, Adr320Form form,
            HttpServletRequest req, HttpServletResponse res, Connection con)
            throws Exception {
        log__.debug("確認");
        // 入力チェック
        ActionErrors errors = form.validateCommit(getRequestModel(req), con);

        if (!errors.isEmpty()) {
            addErrors(req, errors);
            return __doInit(map, form, req, res, con);
        }
        saveToken(req);

        return map.findForward("adr320kn");
    }

    /**
     * <br>戻る処理
     * @param map アクションマッピング
     * @param form アクションフォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @return アクションフォーワード
     * @throws SQLException SQL実行時例外
     */
    private ActionForward __doBack(ActionMapping map, Adr320Form form,
            HttpServletRequest req, HttpServletResponse res, Connection con)
            throws SQLException {

        log__.debug("戻る");
        ActionForward forward = null;
        forward = map.findForward("adr030");
        return forward;
    }

    /**
     * <br>初期表示
     * @param map アクションマッピング
     * @param form アクションフォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @return アクションフォーワード
     * @throws Exception SQL実行時例外
     */
    private ActionForward __doInit(ActionMapping map, Adr320Form form,
            HttpServletRequest req, HttpServletResponse res, Connection con)
            throws Exception {

        log__.debug("初期表示");
        ActionForward forward = null;
        RequestModel reqMdl = getRequestModel(req);
        con.setAutoCommit(true);
        Adr320Biz biz = new Adr320Biz();
        Adr320ParamModel paramMdl = new Adr320ParamModel();
        paramMdl.setParam(form);
        biz.setInitData(paramMdl, reqMdl, con);
        paramMdl.setFormData(form);

        forward = map.getInputForward();
        con.setAutoCommit(false);
        return forward;
    }

    /**
     * <br>[機  能] ユーザ追加ボタン押下
     * <br>[解  説]
     * <br>[備  考]
     * @param map アクションマッピング
     * @param form アクションフォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @return フォワード
     * @throws Exception 実行時例外
     */
    private ActionForward __doAddUser(ActionMapping map,
                                      Adr320Form form,
                                      HttpServletRequest req,
                                      HttpServletResponse res,
                                      Connection con)
    throws Exception {

        log__.debug("アンケート作成可能ユーザ追加処理");

        // 選択ユーザを含めた、作成可能ユーザリストを再作成
        UserGroupSelectBiz biz = new UserGroupSelectBiz();
        String[] addUser = biz.getListToAdd(form.getAdr320AdrArestList(),
                                            form.getAdr320AdrArestBelongSid());
        form.setAdr320AdrArestList(addUser);

        return __doInit(map, form, req, res, con);
    }

    /**
     * <br>[機  能] ユーザ削除ボタン押下
     * <br>[解  説]
     * <br>[備  考]
     * @param map アクションマッピング
     * @param form アクションフォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @return フォワード
     * @throws Exception 実行時例外
     */
    private ActionForward __doRemoveUser(ActionMapping map,
                                         Adr320Form form,
                                         HttpServletRequest req,
                                         HttpServletResponse res,
                                         Connection con)
    throws Exception {

        log__.debug("アンケート作成可能ユーザ削除処理");

        UserGroupSelectBiz biz = new UserGroupSelectBiz();
        String[] addUser = biz.getListToRemove(form.getAdr320AdrArestList(),
                                               form.getAdr320AdrArestSelectSid());
        form.setAdr320AdrArestList(addUser);

        return __doInit(map, form, req, res, con);
    }
}
