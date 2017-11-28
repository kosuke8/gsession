package jp.groupsession.v2.usr.usr031kn;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.sjts.util.Encoding;
import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.StringUtilHtml;
import jp.co.sjts.util.StringUtilKana;
import jp.co.sjts.util.http.TempFileUtil;
import jp.co.sjts.util.io.IOTools;
import jp.co.sjts.util.struts.StrutsUtil;
import jp.groupsession.v2.cmn.GSConst;
import jp.groupsession.v2.cmn.GSConstCommon;
import jp.groupsession.v2.cmn.GSConstLog;
import jp.groupsession.v2.cmn.GroupSession;
import jp.groupsession.v2.cmn.biz.CommonBiz;
import jp.groupsession.v2.cmn.biz.GroupBiz;
import jp.groupsession.v2.cmn.cmn999.Cmn999Form;
import jp.groupsession.v2.cmn.config.PluginConfig;
import jp.groupsession.v2.cmn.dao.BaseUserModel;
import jp.groupsession.v2.cmn.dao.GroupDao;
import jp.groupsession.v2.cmn.dao.MlCountMtController;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.man.GSConstMain;
import jp.groupsession.v2.man.biz.MainCommonBiz;
import jp.groupsession.v2.man.model.base.CmnPconfEditModel;
import jp.groupsession.v2.struts.AdminAction;
import jp.groupsession.v2.struts.msg.GsMessage;
import jp.groupsession.v2.usr.GSPassword;
import jp.groupsession.v2.usr.IUserGroupListener;
import jp.groupsession.v2.usr.UserUtil;
import jp.groupsession.v2.usr.biz.UsrCommonBiz;
import jp.groupsession.v2.usr.usr031.Usr031Biz;
import jp.groupsession.v2.usr.usr031.Usr031Form;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.util.MessageResources;

/**
 * <br>[機  能] メイン 管理者設定 ユーザマネージャー（追加）確認画面のアクションクラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Usr031knAction extends AdminAction {

    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Usr031knAction.class);
    /** 写真画像名 */
    public String imageFileName__ = "";
    /** 写真画像保存名 */
    public String imageFileSaveName__ = "";

    /**
     * <p>管理者以外のアクセスを許可するのか判定を行う。
     * <p>サブクラスでこのメソッドをオーバーライドして使用する
     * @param req リクエスト
     * @param form アクションフォーム
     * @return true:許可する,false:許可しない
     */
    public boolean canNotAdminAccess(HttpServletRequest req, ActionForm form) {
        return true;
    }

    /**
     * <br>[機  能] アクションを実行する
     * <br>[解  説]
     * <br>[備  考]
     * @param map ActionMapping
     * @param form ActionForm
     * @param req HttpServletRequest
     * @param res HttpServletResponse
     * @param con DB Connection
     * @return ActionForward
     * @throws Exception 実行時例外
     * @see jp.co.sjts.util.struts.AbstractAction
     * @see #executeAction(org.apache.struts.action.ActionMapping,
     *                      org.apache.struts.action.ActionForm,
     *                      javax.servlet.http.HttpServletRequest,
     *                      javax.servlet.http.HttpServletResponse,
     *                      java.sql.Connection)
     */
    public ActionForward executeAction(ActionMapping map,
                                        ActionForm form,
                                        HttpServletRequest req,
                                        HttpServletResponse res,
                                        Connection con)
        throws Exception {

        ActionForward forward = null;
        //コマンドパラメータ取得
        String cmd = NullDefault.getString(req.getParameter("CMD"), "");
        Usr031knForm usr031Formkn = (Usr031knForm) form;
        String processMode = NullDefault.getString(usr031Formkn.getProcessMode(), "");
        //編集、削除、登録、画像表示、個人設定のどれでもない場合は不正なアクセス
        if (!processMode.equals("add") && !processMode.equals("edit")
                && !processMode.equals("del") && !processMode.equals("kojn_edit")
                && !cmd.equals("getImageFile")
                && !processMode.equals("yuko") && !processMode.equals("muko")) {
            return getSubmitErrorPage(map, req);
        }
        con.setAutoCommit(true);
        try {

            UsrCommonBiz ucBiz = new UsrCommonBiz(con, getRequestModel(req));
            if (processMode.equals("add") && !ucBiz.isNotAdminGroupExists(con)) {
                //ユーザ追加 and
                //システム管理グループ以外のグループが存在しない場合、共通メッセージ画面へ遷移
                return getNotAdminGroupErrorPage(map, req);
            }

            //管理者権限判定
            BaseUserModel umodel = getSessionUserModel(req);
            GroupDao gdao = new GroupDao(con);
            if (gdao.isBelongAdmin(umodel.getUsrsid())) {
                //管理者
                usr031Formkn.setAdminFlg(true);
            } else {
                //一般ユーザ
                usr031Formkn.setAdminFlg(false);
            }

            if (!(usr031Formkn.isAdminFlg())) {
                //個人情報編集区分を取得する
                MainCommonBiz manCmnBiz = new MainCommonBiz();
                CmnPconfEditModel pconfEditMdl = new CmnPconfEditModel();
                pconfEditMdl = manCmnBiz.getCpeConf(0, con);

                //個人情報修正区分が「管理者が設定する」の場合、共通メッセージ画面に遷移する
                if (pconfEditMdl.getCpePconfKbn() == GSConstMain.PCONF_EDIT_ADM) {
                    return __setCompPageParam(map, req, usr031Formkn);
                }
                //個人編集以外は管理者以外実行不可
                if (!processMode.equals("kojn_edit") && !cmd.equals("getImageFile")) {
                    return __setCompPageParam(map, req, usr031Formkn);
                }

                //管理者でないユーザの時、個人編集で被編集ユーザSIDと編集実行SIDが異なる場合エラー
                BaseUserModel usModel = getSessionUserModel(req);
                String[] selectUsers = usr031Formkn.getUsr030selectusers();
                if (!cmd.equals("getImageFile")) {
                    int userSid = NullDefault.getInt(selectUsers[0], -1);
                    if (usModel.getUsrsid() != userSid) {
                        return __setCompPageParam(map, req, usr031Formkn);
                    }
                }
            }

            //パスワード変更の有効・無効を設定
            if (canChangePassword(con, Usr031Biz.getSelectUserSid(usr031Formkn))) {
                usr031Formkn.setChangePassword(GSConst.CHANGEPASSWORD_PARMIT);
            } else {
                usr031Formkn.setChangePassword(GSConst.CHANGEPASSWORD_NOTPARMIT);
            }

            //モバイルプラグイン使用可否設定
            __setMobilePluginUseKbn(usr031Formkn, con, req);
        } finally {
            con.setAutoCommit(false);
        }

        if (cmd.equals("del")) {
            Usr031Form usr031Form = (Usr031Form) form;
            int degGrp = usr031Form.getUsr031defgroup();
            usr031Formkn.setUsr031defgroup(degGrp);
        }

        if (cmd.equals("Usr031kn_Back")) {
            log__.debug("戻るボタン押下");
            //削除処理時
            if (processMode.equals("del")
                    || processMode.equals("yuko") || processMode.equals("muko")) {
                //テンポラリディレクトリのファイル削除を行う
                __doTempDirDelete(map, usr031Formkn, req, res, con);
                forward = map.findForward("delBack");
            //追加、編集処理時
            } else {
                forward = map.findForward("back");
            }
        } else if (cmd.equals("add")) {
            //登録ボタン押下(追加時)
            log__.debug("登録ボタン押下");
            forward = __doAdd(map, usr031Formkn, req, res, con);
        } else if (cmd.equals("edit")) {
            //登録ボタン押下(修正時)
            log__.debug("登録ボタン押下");
            forward = __doEdit(map, usr031Formkn, req, res, con);
        } else if (cmd.equals("usr031kn_del")) {
            //削除ボタン押下
            log__.debug("削除ボタン押下");
            forward = __doDel(map, usr031Formkn, req, res, con, processMode);
        } else if (cmd.equals("usr031kn_yuko")) {
            //削除ボタン押下
            log__.debug("有効ボタン押下");
            forward = __doYukoMuko(map, usr031Formkn, req, res, con, processMode);
        } else if (cmd.equals("usr031kn_muko")) {
            //削除ボタン押下
            log__.debug("無効ボタン押下");
            forward = __doYukoMuko(map, usr031Formkn, req, res, con, processMode);
        } else if (cmd.equals("getImageFile")) {
            log__.debug("写真画像ダウンロード");
            forward = __doGetImageFile(map, usr031Formkn, req, res, con);
        } else {
            log__.debug("初期表示処理");
            forward = __doInit(map, usr031Formkn, req, res, con);
        }

        log__.debug("END");
        return forward;
    }

    /**
     * <br>[機  能] ユーザ追加処理
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param map マップ
     * @param form フォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @throws Exception 実行例外
     * @return アクションフォワード
     */
    private ActionForward __doAdd(ActionMapping map,
                                   Usr031knForm form,
                                   HttpServletRequest req,
                                   HttpServletResponse res,
                                   Connection con)
        throws Exception {

        if (!isTokenValid(req, true)) {
            log__.info("２重投稿");
            return getSubmitErrorPage(map, req);
        }

        ActionForward forward = null;
        //追加モードなのにユーザが指定されている場合はエラー
        if (form.getProcessMode().equals("add") && form.getUsr030selectusers() != null) {
            return getSubmitErrorPage(map, req);
        }

        con.setAutoCommit(true);
        try {
            ActionErrors errors = new ActionErrors();
            String eprefix = "useradd.";
            ActionMessage msg = null;
            UsrCommonBiz usrBiz = new UsrCommonBiz(con, getRequestModel(req));
            if (usrBiz.isUserCountOver(getRequestModel(req), con)) {
                //ユーザ数制限エラー
                msg = new ActionMessage("error.usercount.limit.over",
                        GroupSession.getResourceManager().getUserCountLimit(getRequestModel(req)));
                StrutsUtil.addMessage(errors, msg, eprefix + "error.usercount.limit.over");
                addErrors(req, errors);
                return map.getInputForward();
            }

            //写真のテンポラリディレクトリパスとファイル名をセット
            CommonBiz cmnBiz = new CommonBiz();
            String tempDir = cmnBiz.getTempDir(
                    getTempPath(req), form.getUsr031pluginId(), getRequestModel(req));

            errors = form.validateAdd(map, getRequestModel(req), con,
                                                canChangePassword(con,
                                                            Usr031Biz.getSelectUserSid(form)),
                                                tempDir);
            //再入力チェック
            if (errors.size() > 0) {
                addErrors(req, errors);
                return map.getInputForward();
            }
        } finally {
            con.setAutoCommit(false);
        }

        //採番クラス取得
        MlCountMtController cntCon = null;
        cntCon = getCountMtController(req);

        //ユーザリスナー取得
        IUserGroupListener[] lis = UserUtil.getUserListeners(getPluginConfig(req));

        //アプリケーションのルートパス
        String appRoot = getAppRootPath();

        //テンポラリディレクトリパス
        String tempDir = getTempPath(req);

        //登録処理
        Usr031knBiz biz = new Usr031knBiz(con, getRequestModel(req));

        Usr031knParamModel paramMdl = new Usr031knParamModel();
        paramMdl.setParam(form);
        biz.executeAdd(paramMdl, cntCon, lis, appRoot, tempDir, _getLoginInstance(),
                getRequestModel(req));
        paramMdl.setFormData(form);


        GsMessage gsMsg = new GsMessage(req);
        /** メッセージ 削除 **/
        String entry = gsMsg.getMessage("cmn.entry");

        //ログ出力
        CommonBiz cmnBiz = new CommonBiz();
        cmnBiz.outPutCommonLog(map, getRequestModel(req), gsMsg, con,
                entry, GSConstLog.LEVEL_INFO,
                "[loginid]" + form.getUsr031userid()
                + " [name]" + NullDefault.getString(form.getUsr031sei(), "")
                            + NullDefault.getString(form.getUsr031mei(), ""));

        //テンポラリディレクトリのファイル削除を行う
        __doTempDirDelete(map, form, req, res, con);

        //遷移
        __setKanryou(map, req, form, "touroku.kanryo.object");
        forward = map.findForward("gf_msg");

        return forward;
    }

    /**
     * <br>[機  能] ユーザ編集処理
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param map マップ
     * @param form フォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @throws Exception 実行例外
     * @return アクションフォワード
     */
    private ActionForward __doEdit(ActionMapping map,
                                    Usr031knForm form,
                                    HttpServletRequest req,
                                    HttpServletResponse res,
                                    Connection con)
        throws Exception {

        if (!isTokenValid(req, true)) {
            log__.info("２重投稿");
            return getSubmitErrorPage(map, req);
        }

        //写真のテンポラリディレクトリパスとファイル名をセット
        CommonBiz cmnBiz = new CommonBiz();
        String tempDir = cmnBiz.getTempDir(
                getTempPath(req), form.getUsr031pluginId(), getRequestModel(req));

        ActionForward forward = null;
        con.setAutoCommit(true);
        ActionErrors errors = form.validateAdd(
                map, getRequestModel(req), con,
                canChangePassword(con, Usr031Biz.getSelectUserSid(form)),
                tempDir);
        con.setAutoCommit(false);

        //再入力チェック
        if (errors.size() > 0) {
            addErrors(req, errors);
            return map.getInputForward();
        }

        //採番クラス取得
        MlCountMtController cntCon = null;
        cntCon = getCountMtController(req);

        //ユーザリスナー取得
        IUserGroupListener[] lis = UserUtil.getUserListeners(getPluginConfig(req));
        Usr031knBiz biz = new Usr031knBiz(con, getRequestModel(req));
        BaseUserModel usModel = getSessionUserModel(req);

        //アプリケーションのルートパス
        String appRoot = getAppRootPath();

        //編集処理
        Usr031knParamModel paramMdl = new Usr031knParamModel();
        paramMdl.setParam(form);
        biz.executeEdit(paramMdl, cntCon, usModel, lis,
                appRoot, getTempPath(req),
                canChangePassword(con, Usr031Biz.getSelectUserSid(form)));
        paramMdl.setFormData(form);

        GsMessage gsMsg = new GsMessage(req);
        /** メッセージ 変更 **/
        String change = gsMsg.getMessage("cmn.change");

        //ログ出力
        cmnBiz.outPutCommonLog(map, getRequestModel(req), gsMsg, con,
                change, GSConstLog.LEVEL_INFO,
                "[loginid]" + form.getUsr031userid()
                + " [name]" + NullDefault.getString(form.getUsr031sei(), "")
                            + NullDefault.getString(form.getUsr031mei(), ""));

        //テンポラリディレクトリのファイル削除を行う
        __doTempDirDelete(map, form, req, res, con);

        //遷移
        __setKanryou(map, req, form, "touroku.kanryo.object");
        forward = map.findForward("gf_msg");

        return forward;
    }

    /**
     * <p>
     * ユーザ削除処理
     * @param map アクションマッピング
     * @param form アクションフォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @param processMode 処理モード
     * @throws Exception 実行例外
     * @return アクションフォーワード
     */
    private ActionForward __doDel(ActionMapping map,
                                   Usr031knForm form,
                                   HttpServletRequest req,
                                   HttpServletResponse res,
                                   Connection con,
                                   String processMode)
        throws Exception {

        ActionForward forward = null;

        //SIDが正しいものかチェック
        ActionErrors errors = form.validateDelSidCheck(req, con);
        if (errors.size() > 0) {
            addErrors(req, errors);
            return __setDelErrorDisp(map, req, form, errors);
        }

        MlCountMtController cntCon = null;

        //アプリケーションのルートパス
        String appRoot = getAppRootPath();

        //ユーザリスナー取得
        IUserGroupListener[] lis = UserUtil.getUserListeners(getPluginConfig(req));
        Usr031knBiz biz = new Usr031knBiz(con, getRequestModel(req));

        Usr031knParamModel paramMdl = new Usr031knParamModel();
        paramMdl.setParam(form);
        biz.executeDel(paramMdl, cntCon, lis, appRoot,
                getRequestModel(req));
        paramMdl.setFormData(form);

        GsMessage gsMsg = new GsMessage(req);
        /** メッセージ 削除 **/
        String delete = gsMsg.getMessage("cmn.delete");

        //ログ出力
        CommonBiz cmnBiz = new CommonBiz();
        cmnBiz.outPutCommonLog(map, getRequestModel(req), gsMsg, con,
                delete, GSConstLog.LEVEL_INFO,
                "[loginid]" + form.getUsr031userid()
                + " [name]" + NullDefault.getString(form.getUsr031sei(), "")
                            + NullDefault.getString(form.getUsr031mei(), ""));

        //テンポラリディレクトリのファイル削除を行う
        __doTempDirDelete(map, form, req, res, con);

        //遷移
        __setKanryou(map, req, form, "sakujo.kanryo.object");
        forward = map.findForward("gf_msg");

        return forward;
    }
    /**
     * <p>
     * ユーザ削除処理
     * @param map アクションマッピング
     * @param form アクションフォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @param processMode 処理モード
     * @throws Exception 実行例外
     * @return アクションフォーワード
     */
    private ActionForward __doYukoMuko(ActionMapping map,
                                   Usr031knForm form,
                                   HttpServletRequest req,
                                   HttpServletResponse res,
                                   Connection con,
                                   String processMode)
        throws Exception {

        ActionForward forward = null;

        //SIDが正しいものかチェック
        ActionErrors errors = form.validateTargetSidCheck(req, con, processMode);
        if (errors.size() > 0) {
            addErrors(req, errors);
            return __setDelErrorDisp(map, req, form, errors);
        }
        if (!isTokenValid(req, true)) {
            log__.info("２重投稿");
            return getSubmitErrorPage(map, req);
        }
        GsMessage gsMsg = new GsMessage(req);
        /** メッセージ  **/
        String action = "";
        RequestModel reqMdl = getRequestModel(req);
        Usr031knBiz biz = new Usr031knBiz(con, reqMdl);

        int flg = GSConst.YUKOMUKO_YUKO;
        if (processMode.equals("yuko")) {
            action = gsMsg.getMessage("cmn.effective");
            flg = GSConst.YUKOMUKO_YUKO;
        } else if (processMode.equals("muko")) {
            action = gsMsg.getMessage("cmn.invalid");
            flg = GSConst.YUKOMUKO_MUKO;
        }

        //処理
        biz.changeYukoMuko(con, reqMdl, flg, form.getUsr030selectusers());

        //ログ出力
        CommonBiz cmnBiz = new CommonBiz();
        cmnBiz.outPutCommonLog(map, getRequestModel(req), gsMsg, con,
                action, GSConstLog.LEVEL_INFO,
                "[loginid]" + form.getUsr031userid()
                + " [name]" + NullDefault.getString(form.getUsr031sei(), "")
                            + NullDefault.getString(form.getUsr031mei(), ""));


        //遷移
        __setKanryou(map, req, form, "hensyu.henkou.kanryo.object");
        forward = map.findForward("gf_msg");

        return forward;
    }
    /**
     * [機  能] 登録完了画面のパラメータセット<br>
     * [解  説] <br>
     * [備  考] <br>
     * @param map マッピング
     * @param req リクエスト
     * @param form フォーム
     * @param msgState 完了画面に表示するメッセージのキー
     */
    private void __setKanryou(
        ActionMapping map,
        HttpServletRequest req,
        Usr031knForm form,
        String msgState) {
        log__.debug("START");

        Cmn999Form cmn999Form = new Cmn999Form();
        ActionForward urlForward = null;
        GsMessage gsMsg = new GsMessage();
        //ユーザ
        String textUser = gsMsg.getMessage(req, "cmn.user");
        //権限エラー警告画面パラメータの設定
        MessageResources msgRes = getResources(req);
        cmn999Form.setType(Cmn999Form.TYPE_OK);
        cmn999Form.setIcon(Cmn999Form.ICON_INFO);
        cmn999Form.setWtarget(Cmn999Form.WTARGET_BODY);

        log__.debug("■完了画面msgState :" + msgState);
        cmn999Form.setMessage(msgRes.getMessage(msgState,
                textUser));

        //新規登録時は登録したユーザのカナを表示
        String processMode = NullDefault.getString(form.getProcessMode(), "");
        if (processMode.equals("add")) {
            cmn999Form.addHiddenParam("usr030SearchKana",
                    StringUtilKana.getInitKanaChar(form.getUsr031seikn()));
            cmn999Form.addHiddenParam("usr030selectuser", form.getUsr030selectuser());
            urlForward = map.findForward("list");
        } else if (processMode.equals("kojn_edit")) {
            //一般利用者が個人情報を修正する場合
            urlForward = map.findForward("kojn_settei");
        } else {
            cmn999Form.addHiddenParam("usr030SearchKana", form.getUsr030SearchKana());
            cmn999Form.addHiddenParam("usr030selectuser", form.getUsr030selectuser());

            urlForward = map.findForward("list");
        }

        cmn999Form.addHiddenParam("selectgsid", form.getSelectgsid());
        cmn999Form.addHiddenParam("usr030shainno", form.getUsr030shainno());
        cmn999Form.addHiddenParam("usr030userId", form.getUsr030userId());
        cmn999Form.addHiddenParam("usr030usrUkoFlg", form.getUsr030usrUkoFlg());
        cmn999Form.addHiddenParam("usr030sei", form.getUsr030sei());
        cmn999Form.addHiddenParam("usr030mei", form.getUsr030mei());
        cmn999Form.addHiddenParam("usr030seikn", form.getUsr030seikn());
        cmn999Form.addHiddenParam("usr030meikn", form.getUsr030meikn());
        cmn999Form.addHiddenParam("usr030agefrom", form.getUsr030agefrom());
        cmn999Form.addHiddenParam("usr030ageto", form.getUsr030ageto());
        cmn999Form.addHiddenParam("usr030yakushoku", form.getUsr030yakushoku());
        cmn999Form.addHiddenParam("usr030mail", form.getUsr030mail());
        cmn999Form.addHiddenParam("usr030tdfkCd", form.getUsr030tdfkCd());
        cmn999Form.addHiddenParam("usr030seibetu", form.getUsr030seibetu());
        cmn999Form.addHiddenParam("usr030entranceYearFr", form.getUsr030entranceYearFr());
        cmn999Form.addHiddenParam("usr030entranceMonthFr", form.getUsr030entranceMonthFr());
        cmn999Form.addHiddenParam("usr030entranceDayFr", form.getUsr030entranceDayFr());
        cmn999Form.addHiddenParam("usr030entranceYearTo", form.getUsr030entranceYearTo());
        cmn999Form.addHiddenParam("usr030entranceMonthTo", form.getUsr030entranceMonthTo());
        cmn999Form.addHiddenParam("usr030entranceDayTo", form.getUsr030entranceDayTo());

        cmn999Form.addHiddenParam("selectgsidSave", form.getSelectgsidSave());
        cmn999Form.addHiddenParam("usr030shainnoSave", form.getUsr030shainnoSave());
        cmn999Form.addHiddenParam("usr030userIdSave", form.getUsr030userIdSave());
        cmn999Form.addHiddenParam("usr030usrUkoFlgSave", form.getUsr030usrUkoFlgSave());
        cmn999Form.addHiddenParam("usr030shainnoSave", form.getUsr030shainnoSave());
        cmn999Form.addHiddenParam("usr030seiSave", form.getUsr030seiSave());
        cmn999Form.addHiddenParam("usr030meiSave", form.getUsr030meiSave());
        cmn999Form.addHiddenParam("usr030seiknSave", form.getUsr030seiknSave());
        cmn999Form.addHiddenParam("usr030meiknSave", form.getUsr030meiknSave());
        cmn999Form.addHiddenParam("usr030agefromSave", form.getUsr030agefromSave());
        cmn999Form.addHiddenParam("usr030agetoSave", form.getUsr030agetoSave());
        cmn999Form.addHiddenParam("usr030yakushokuSave", form.getUsr030yakushokuSave());
        cmn999Form.addHiddenParam("usr030mailSave", form.getUsr030mailSave());
        cmn999Form.addHiddenParam("usr030tdfkCdSave", form.getUsr030tdfkCdSave());
        cmn999Form.addHiddenParam("usr030seibetuSave", form.getUsr030seibetu());
        cmn999Form.addHiddenParam("usr030entranceYearFrSave", form.getUsr030entranceYearFrSave());
        cmn999Form.addHiddenParam("usr030entranceMonthFrSave", form.getUsr030entranceMonthFrSave());
        cmn999Form.addHiddenParam("usr030entranceDayFrSave", form.getUsr030entranceDayFrSave());
        cmn999Form.addHiddenParam("usr030entranceYearToSave", form.getUsr030entranceYearToSave());
        cmn999Form.addHiddenParam("usr030entranceMonthToSave", form.getUsr030entranceMonthToSave());
        cmn999Form.addHiddenParam("usr030entranceDayToSave", form.getUsr030entranceDayToSave());

        cmn999Form.addHiddenParam("usr030cmdMode", form.getUsr030cmdMode());
        cmn999Form.addHiddenParam("usr030SearchFlg", form.getUsr030SearchFlg());

        cmn999Form.setUrlOK(urlForward.getPath());
        req.setAttribute("cmn999Form", cmn999Form);

        log__.debug("END");
    }

    /**
     * <br>[機  能] 初期表示処理
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param map マップ
     * @param form フォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @throws Exception 実行例外
     * @return アクションフォワード
     */
    private ActionForward __doInit(ActionMapping map,
                                    Usr031knForm form,
                                    HttpServletRequest req,
                                    HttpServletResponse res,
                                    Connection con)
        throws Exception {

        log__.debug("*****初期化:" + form.getUsr031PswdKbn());

        String processMode = form.getProcessMode();
        Usr031knBiz biz = new Usr031knBiz(con, getRequestModel(req));

        //SIDが正しいものかチェック
        ActionErrors errors = form.validateKnSidCheck(req, con, form, processMode);
        if (errors.size() > 0) {
            addErrors(req, errors);
            return __setDelErrorDisp(map, req, form, errors);
        }

        //削除モード時はDBの値を設定
        if (processMode.equals("del")
             || processMode.equals("yuko")
             || processMode.equals("muko")) {

            //ユーザSID
            String[] usids = form.getUsr030selectusers();
            int usid = NullDefault.getInt(usids[0], -1);

            form.setUsr030selectuser(usid);

            if (usids.length > 1
                    || processMode.equals("yuko")
                    || processMode.equals("muko")) {
                //複数削除モード
                form.setUsr031delPluralKbn(1);
                Usr031knParamModel paramMdl = new Usr031knParamModel();
                paramMdl.setParam(form);
                biz.setInitDataDelPlural(paramMdl);
                paramMdl.setFormData(form);
                return map.getInputForward();
            }

            //アプリケーションのルートパス
            String appRootPath = getAppRootPath();
            //テンポラリディレクトリパス
            String tempDir = getTempPath(req);

            Usr031knParamModel paramMdl = new Usr031knParamModel();
            BaseUserModel usModel = getSessionUserModel(req);
            paramMdl.setParam(form);
            biz.setInitData(usid, appRootPath, tempDir, paramMdl, getRequestModel(req),
                    GroupSession.getResourceManager().getDomain(req), usModel);
            paramMdl.setFormData(form);

        } else {
            //備考
            form.setUsr031bikouHtml(
                    StringUtilHtml.transToHTmlPlusAmparsant(
                            NullDefault.getString(form.getUsr031bikou(), "")));
        }

        if (!NullDefault.getString(form.getUsr031ImageName(), "").equals("")
                && !NullDefault.getString(form.getUsr031ImageSaveName(), "").equals("")) {
            imageFileName__ = form.getUsr031ImageName();
            imageFileSaveName__ = form.getUsr031ImageSaveName();
        }

        Usr031knParamModel paramMdl = new Usr031knParamModel();
        paramMdl.setParam(form);
        //各SIDから名称を取得し、画面へセットする
        biz.setSidName(paramMdl, con);
        //メールアドレスを成型する
        biz.createAddrForHTML(paramMdl);
        paramMdl.setFormData(form);

        //一般利用者はパスワードやグループ情報を変更できないので取得しない
        if (form.isAdminFlg()) {
            //パスワードを同じ文字数分の*に変換
            String pw = form.getUsr031password();
            form.setPassworddamy(GSPassword.createDamyPassword(pw));

            //管理権限があればグループ情報の変更が可能なので値を取得
            int[] gsids = UserUtil.toGroupSidFromCsv(
                    NullDefault.getString(form.getSelectgroup(), "-1"));
            GroupDao dao = new GroupDao(con);
            GroupBiz grpBiz = new GroupBiz();
            form.setUsr031knSltgps(grpBiz.getGroupTreeList(con, gsids));

            //デフォルトグループ
            int dgsid = form.getUsr031defgroup();
            form.setUsr031knDefgp(dao.getGroup(dgsid));
        }

        //写真のテンポラリディレクトリパスとファイル名をセット
        CommonBiz cmnBiz = new CommonBiz();
        String tempDir = cmnBiz.getTempDir(
                getTempPath(req), form.getUsr031pluginId(), getRequestModel(req));

        //削除時はsid以外のチェックを行わない
        if (!processMode.equals("del")) {
            errors = form.validateAdd(
                    map, getRequestModel(req), con,
                    canChangePassword(con, Usr031Biz.getSelectUserSid(form)),
                    tempDir);
            //再入力チェック
            if (errors.size() > 0) {
                addErrors(req, errors);
                return map.getInputForward();
            }
        }
        //重複ラベルチェック
        paramMdl = new Usr031knParamModel();
        paramMdl.setParam(form);
        biz.checkLabel(paramMdl);
        paramMdl.setFormData(form);

        //トランザクショントークン設定
        saveToken(req);

        return map.getInputForward();
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
    private ActionForward __doGetImageFile(ActionMapping map,
                                            Usr031knForm form,
                                            HttpServletRequest req,
                                            HttpServletResponse res,
                                            Connection con)
        throws Exception {

        //テンポラリディレクトリパス
        CommonBiz cmnBiz = new CommonBiz();
        String tempDir = cmnBiz.getTempDir(
                getTempPath(req), form.getUsr031pluginId(), getRequestModel(req));
        String fullPath = IOTools.replaceFileSep(
                tempDir + imageFileSaveName__ + GSConstCommon.ENDSTR_SAVEFILE);

        TempFileUtil.downloadInline(req, res, fullPath, imageFileName__, Encoding.UTF_8);

        return null;
    }

    /**
     * <br>[機  能] テンポラリディレクトリ削除
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param map マップ
     * @param form フォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @throws Exception 実行例外
     */
    private void __doTempDirDelete(ActionMapping map,
                                     Usr031knForm form,
                                     HttpServletRequest req,
                                     HttpServletResponse res,
                                     Connection con)
        throws Exception {

        //テンポラリディレクトリのファイル削除を行う
        CommonBiz cmnBiz = new CommonBiz();
        String tempDir = cmnBiz.getTempDir(
                getTempPath(req), form.getUsr031pluginId(), getRequestModel(req));
        IOTools.deleteDir(tempDir);
    }

    /**
     * <br>[機  能] モバイルプラグインが利用可能かフォームへ設定する
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param form フォーム
     * @param con コネクション
     * @param req リクエスト
     * @throws SQLException SQL実行時例外
     */
    private void __setMobilePluginUseKbn(Usr031knForm form, Connection con, HttpServletRequest req)
        throws SQLException {

        //プラグイン設定を取得する
        con.setAutoCommit(true);
        PluginConfig pconfig = getPluginConfigForMain(getPluginConfig(req), con);
        con.setAutoCommit(false);

        //モバイル機能が利用可能か判定
        CommonBiz cmnBiz = new CommonBiz();
        if (cmnBiz.isCanUsePlugin(GSConstMain.PLUGIN_ID_MOBILE, pconfig)) {
            form.setUsr031UsiMblUse(GSConstMain.PLUGIN_USE);
        } else {
            form.setUsr031UsiMblUse(GSConstMain.PLUGIN_NOT_USE);
        }
    }

    /**
     * <br>[機  能] エラー画面
     * <br>[解  説]
     * <br>[備  考]
     * @param map マッピング
     * @param req リクエスト
     * @param form アクションフォーム
     * @return ActionForward フォワード
     */
    private ActionForward  __setCompPageParam(
        ActionMapping map,
        HttpServletRequest req,
        Usr031knForm form) {

        Cmn999Form cmn999Form = new Cmn999Form();
        ActionForward urlForward = null;

        MessageResources msgRes = getResources(req);
        cmn999Form.setIcon(Cmn999Form.ICON_WARN);
        cmn999Form.setWtarget(Cmn999Form.WTARGET_BODY);
        cmn999Form.setType(Cmn999Form.TYPE_OK);
        urlForward = map.findForward("main");
        cmn999Form.setUrlOK(urlForward.getPath());

        GsMessage gsMsg = new GsMessage();
        String textDelWrite = gsMsg.getMessage("cmn.modify.personalinfo");
        String textDel = gsMsg.getMessage("cmn.edit");

        //メッセージセット
        String msgState = "error.edit.power.user";
        cmn999Form.setMessage(msgRes.getMessage(msgState,
                textDelWrite,
                textDel));

        req.setAttribute("cmn999Form", cmn999Form);
        return map.findForward("gf_msg");
    }

    /**
     * <br>[機  能] 削除エラー画面
     * <br>[解  説]
     * <br>[備  考]
     * @param map マッピング
     * @param req リクエスト
     * @param form アクションフォーム
     * @param errors アクションエラー
     * @return ActionForward フォワード
     */
    private ActionForward  __setDelErrorDisp(
        ActionMapping map,
        HttpServletRequest req,
        Usr031knForm form,
        ActionErrors errors) {

        Cmn999Form cmn999Form = new Cmn999Form();
        ActionForward urlForward = null;

        MessageResources msgRes = getResources(req);
        cmn999Form.setIcon(Cmn999Form.ICON_WARN);
        cmn999Form.setWtarget(Cmn999Form.WTARGET_BODY);
        cmn999Form.setType(Cmn999Form.TYPE_OK);
        urlForward = map.findForward("delBack");
        cmn999Form.setUrlOK(urlForward.getPath());
        GsMessage gsMsg = new GsMessage(req);
        //ユーザ
        String textUser = gsMsg.getMessage("cmn.user");
        //システムユーザ
        String textSystemUser = gsMsg.getMessage("user.src.61");

        String errorMessage = null;

        if (errors.size("sltgp.error.select.required.text") > 0) {
            errorMessage = msgRes.getMessage("error.select.required.text", textUser);
        } else if (errors.size("sltgp.error.common.no.delete") > 0) {
            errorMessage = msgRes.getMessage("error.common.no.delete", textSystemUser);
        } else {
            errorMessage = msgRes.getMessage("error.search.notfound.user");
        }


        //メッセージセット
        cmn999Form.setMessage(errorMessage);
        req.setAttribute("cmn999Form", cmn999Form);
        return map.findForward("gf_msg");
    }

}