package jp.groupsession.v2.rsv.rsv110kn;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.MessageResources;

import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.jdbc.JDBCUtil;
import jp.groupsession.v2.cmn.GSConst;
import jp.groupsession.v2.cmn.GSConstLog;
import jp.groupsession.v2.cmn.biz.CommonBiz;
import jp.groupsession.v2.cmn.cmn999.Cmn999Form;
import jp.groupsession.v2.cmn.config.PluginConfig;
import jp.groupsession.v2.cmn.dao.BaseUserModel;
import jp.groupsession.v2.cmn.dao.MlCountMtController;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.man.GSConstMain;
import jp.groupsession.v2.rsv.AbstractReserveAction;
import jp.groupsession.v2.rsv.AbstractReserveBiz;
import jp.groupsession.v2.rsv.GSConstReserve;
import jp.groupsession.v2.rsv.biz.RsvCommonBiz;
import jp.groupsession.v2.rsv.dao.RsvSisGrpDao;
import jp.groupsession.v2.rsv.dao.RsvSisYrkDao;
import jp.groupsession.v2.rsv.model.RsvRegSmailModel;
import jp.groupsession.v2.rsv.model.RsvSisGrpModel;
import jp.groupsession.v2.rsv.model.RsvSisYrkModel;
import jp.groupsession.v2.struts.msg.GsMessage;

/**
 * <br>[機  能] 施設予約 施設予約登録確認画面のアクションクラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Rsv110knAction extends AbstractReserveAction {

    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(Rsv110knAction.class);

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
                                        Connection con) throws Exception {

        ActionForward forward = null;
        Rsv110knForm rsvform = (Rsv110knForm) form;

        //登録対象となる施設のチェックを行う
        String procMode = NullDefault.getString(rsvform.getRsv110ProcMode(), "");
        if (!procMode.equals(GSConstReserve.PROC_MODE_EDIT)) {
            String sisetsuErrMessage = _checkTargetFactory(con, rsvform.getRsv110RsdSid(), req);
            if (sisetsuErrMessage != null) {
                return __doTransitionErrorPage(map, rsvform, req, sisetsuErrMessage);
            }
        }


        //コマンドパラメータ取得
        String cmd = NullDefault.getString(req.getParameter("CMD"), "");
        cmd = cmd.trim();

        //確定ボタン押下
        if (cmd.equals("sisetu_yoyaku_kakutei")) {
            log__.debug("確定ボタン押下");
            forward = __doUpdate(map, rsvform, req, res, con);
        //戻るボタン押下
        } else if (cmd.equals("back_to_sisetu_yoyaku_input")) {
            log__.debug("戻るボタン押下");
            forward = map.findForward("back_to_sisetu_yoyaku_input");
        //初期表示処理
        } else {
            log__.debug("初期表示処理");
            forward = __doInit(map, rsvform, req, res, con);
        }

        return forward;
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
     * @return ActionForward フォワード
     * @throws Exception 実行時例外
     */
    private ActionForward __doInit(ActionMapping map,
                                    Rsv110knForm form,
                                    HttpServletRequest req,
                                    HttpServletResponse res,
                                    Connection con) throws Exception {

        ActionForward forward = null;
        try {
            con.setAutoCommit(true);
            Rsv110knBiz biz = new Rsv110knBiz(getRequestModel(req), con);

            Rsv110knParamModel paramMdl = new Rsv110knParamModel();
            paramMdl.setParam(form);
            biz.setInitData(paramMdl);
            paramMdl.setFormData(form);

            con.setAutoCommit(false);
        } catch (SQLException e) {
            log__.error("SQLException", e);
            throw e;
        }

        forward = map.getInputForward();

        return __checkViewError(req, map, con, forward, form);
    }

    /**
     * <br>[機  能] 確定ボタン押下時処理
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param map マップ
     * @param form フォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @return ActionForward フォワード
     * @throws Exception 実行時例外
     */
    private ActionForward __doUpdate(ActionMapping map,
                                      Rsv110knForm form,
                                      HttpServletRequest req,
                                      HttpServletResponse res,
                                      Connection con) throws Exception {
        con.setAutoCommit(false);
        boolean commitFlg = false;

        //ログインユーザSIDを取得
        int userSid = 0;
        BaseUserModel buMdl = getSessionUserModel(req);
        if (buMdl != null) {
            userSid = buMdl.getUsrsid();
        }
        String tempDir = _getReserveTempDir(req);
        RsvCommonBiz rsvCmnBiz = new RsvCommonBiz();
        int yoyakuSid = 0;
        int sisetsuSid = 0;

        RequestModel reqMdl = getRequestModel(req);
        try {

            //2重投稿
            if (!isTokenValid(req, true)) {
                log__.info("２重投稿");
                return getSubmitErrorPage(map, req);
            }

            //セッション情報を取得
            HttpSession session = req.getSession();
            BaseUserModel usModel =
                (BaseUserModel) session.getAttribute(GSConst.SESSION_KEY);

            //システム管理者グループ所属
            CommonBiz cmnBiz = new CommonBiz();
            boolean admFlg = cmnBiz.isPluginAdmin(con, usModel, GSConstReserve.PLUGIN_ID_RESERVE);
            //編集権限チェック
            if (!__isEditRsvGrp(con, Integer.valueOf(form.getRsvSelectedGrpSid()),
                                                               getSessionUserSid(req), admFlg)) {
                return __doCantUpdate(map, form, req, res, con);
            }

            //入力チェック
            ActionErrors errors
                = form.validateRsv110All(reqMdl, con, getSessionUserSid(req));
            if (!errors.isEmpty()) {
                addErrors(req, errors);
                return __doInit(map, form, req, res, con);
            }

            Rsv110knBiz biz = new Rsv110knBiz(getRequestModel(req), con);
            int entryUserSid = -1;
            //編集時、登録ユーザSID取得(DB更新前に)
            if (form.getRsv110ProcMode().equals(GSConstReserve.PROC_MODE_EDIT)) {
                Rsv110knParamModel paramMdl = new Rsv110knParamModel();
                paramMdl.setParam(form);
                entryUserSid = biz.getEntryUserSid(paramMdl);
                paramMdl.setFormData(form);
            }

            //DB更新
            MlCountMtController cntCon = getCountMtController(req);

            Rsv110knParamModel paramMdl = new Rsv110knParamModel();
            paramMdl.setParam(form);
            int[] sidData = biz.updateYoyakuData(paramMdl, cntCon, userSid, getAppRootPath());
            paramMdl.setFormData(form);

            //編集時のみ
            if (form.getRsv110ProcMode().equals(GSConstReserve.PROC_MODE_EDIT)) {
                //登録者と編集者が別、かつ登録者が更新通知設定
                if (rsvCmnBiz.checkSendSmail(userSid, entryUserSid, con)) {
                    //ショートメールで通知
                    PluginConfig pconfig = getPluginConfigForMain(getPluginConfig(req), con);
                    if (cmnBiz.isCanUsePlugin(GSConstMain.PLUGIN_ID_SMAIL, pconfig)) {

                        paramMdl = new Rsv110knParamModel();
                        paramMdl.setParam(form);
                        biz.sendSmail(paramMdl, cntCon, userSid, getAppRootPath(),
                                tempDir, getPluginConfig(req), entryUserSid);
                        paramMdl.setFormData(form);

                    }
                }
            }

            //申請通知メール
            yoyakuSid = sidData[0];
            sisetsuSid = sidData[1];
            //選択した施設に承認設定がされている場合
            if (rsvCmnBiz.isApprSis(con, sisetsuSid, userSid)) {
                //ショートメールで通知
                PluginConfig pconfig = getPluginConfigForMain(getPluginConfig(req), con);
                if (cmnBiz.isCanUsePlugin(GSConstMain.PLUGIN_ID_SMAIL, pconfig)) {
                    RsvRegSmailModel regMdl = new RsvRegSmailModel();
                    regMdl.setCon(con);
                    regMdl.setReqMdl(getRequestModel(req));
                    regMdl.setRsySid(yoyakuSid);
                    regMdl.setRsdSid(sisetsuSid);
                    regMdl.setCntCon(cntCon);
                    regMdl.setUserSid(userSid);
                    regMdl.setAppRootPath(getAppRootPath());
                    regMdl.setTempDir(tempDir);
                    regMdl.setPluginConfig(getPluginConfig(req));
                    rsvCmnBiz.sendRegSmail(regMdl);
                }
            }
            commitFlg = true;

        } catch (SQLException e) {
            log__.error("SQLException", e);
            throw e;
        } finally {
            if (commitFlg) {
                con.commit();
            } else {
                JDBCUtil.rollback(con);
            }
        }

        //ログ出力準備
        AbstractReserveBiz rsvBiz = new AbstractReserveBiz(con);
        GsMessage gsMsg = new GsMessage(reqMdl);
        Rsv110knBiz biz = new Rsv110knBiz(reqMdl, con);
        StringBuilder opCode = new StringBuilder();
        Rsv110knParamModel paramMdl = new Rsv110knParamModel();
        paramMdl.setParam(form);
        String outOpLog = biz.getOpLog(sisetsuSid, paramMdl);
        paramMdl.setFormData(form);

        //登録or編集
        if (form.getRsv110ProcMode().equals(GSConstReserve.PROC_MODE_SINKI)
                || form.getRsv110ProcMode().equals(GSConstReserve.PROC_MODE_COPY_ADD)) {
            opCode.append(gsMsg.getMessage("cmn.entry"));
        } else if (form.getRsv110ProcMode().equals(GSConstReserve.PROC_MODE_EDIT)) {
            opCode.append(gsMsg.getMessage("cmn.change"));
        }

        //ログ出力処理
        rsvBiz.outPutLog(map, req, res, opCode.toString(),
                GSConstLog.LEVEL_TRACE, outOpLog);

        return __checkViewError(req, map, con,
                __doUpdateComp(map, form, req, res, con), form);
    }

    /**
     * <br>[機  能] 予約更新完了後の画面遷移設定
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param map マップ
     * @param form フォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @return ActionForward フォワード
     * @throws Exception 実行時例外
     */
    private ActionForward __doUpdateComp(ActionMapping map,
                                          Rsv110knForm form,
                                          HttpServletRequest req,
                                          HttpServletResponse res,
                                          Connection con) throws Exception {

        Cmn999Form cmn999Form = new Cmn999Form();
        cmn999Form.setType(Cmn999Form.TYPE_OK);
        cmn999Form.setIcon(Cmn999Form.ICON_INFO);
        cmn999Form.setWtarget(Cmn999Form.WTARGET_BODY);

        ActionForward forwardOk = null;

        //OKボタンクリック時遷移先
        String backPgId =
            NullDefault.getStringZeroLength(
                    form.getRsvBackPgId(), GSConstReserve.DSP_ID_RSV010);

        //予約一覧[週間]画面へ戻る
        if (backPgId.equals(GSConstReserve.DSP_ID_RSV010)) {
            forwardOk = map.findForward("back_to_syukan");
        //予約一覧[日間]画面へ戻る
        } else if (backPgId.equals(GSConstReserve.DSP_ID_RSV020)) {
            forwardOk = map.findForward("back_to_nikkan");
        //予約一覧[月間]画面へ戻る
        } else if (backPgId.equals(GSConstReserve.DSP_ID_RSV030)) {
            forwardOk = map.findForward("back_to_gekkan");
        } else if (backPgId.equals(GSConstReserve.DSP_ID_RSVMAIN)) {
            forwardOk = map.findForward("back_to_main");
        }
        cmn999Form.setUrlOK(forwardOk.getPath());

        //メッセージ
        String msgId = "";
        if (form.getRsv110ProcMode().equals(GSConstReserve.PROC_MODE_SINKI)
                || form.getRsv110ProcMode().equals(GSConstReserve.PROC_MODE_COPY_ADD)) {
            msgId = "touroku.kanryo.object";
        } else if (form.getRsv110ProcMode().equals(GSConstReserve.PROC_MODE_EDIT)) {
            msgId = "hensyu.kanryo.object";
        }

        MessageResources msgRes = getResources(req);
        GsMessage gsMsg = new GsMessage();
        cmn999Form.setMessage(msgRes.getMessage(msgId, gsMsg.getMessage(req, "reserve.src.22")));

        //画面パラメータをセット
        cmn999Form.addHiddenParam("rsvBackPgId", form.getRsvBackPgId());
        cmn999Form.addHiddenParam("rsvDspFrom", form.getRsvDspFrom());
        cmn999Form.addHiddenParam("rsvSelectedGrpSid", form.getRsvSelectedGrpSid());
        cmn999Form.addHiddenParam("rsvSelectedSisetuSid", form.getRsvSelectedSisetuSid());
        cmn999Form.addHiddenParam("rsv100InitFlg",
                String.valueOf(form.isRsv100InitFlg()));
        cmn999Form.addHiddenParam("rsv100SearchFlg",
                String.valueOf(form.isRsv100SearchFlg()));
        cmn999Form.addHiddenParam("rsv100SortKey", form.getRsv100SortKey());
        cmn999Form.addHiddenParam("rsv100OrderKey", form.getRsv100OrderKey());
        cmn999Form.addHiddenParam("rsv100PageTop", form.getRsv100PageTop());
        cmn999Form.addHiddenParam("rsv100PageBottom", form.getRsv100PageBottom());
        cmn999Form.addHiddenParam("rsv100selectedFromYear", form.getRsv100selectedFromYear());
        cmn999Form.addHiddenParam("rsv100selectedFromMonth", form.getRsv100selectedFromMonth());
        cmn999Form.addHiddenParam("rsv100selectedFromDay", form.getRsv100selectedFromDay());
        cmn999Form.addHiddenParam("rsv100selectedToYear", form.getRsv100selectedToYear());
        cmn999Form.addHiddenParam("rsv100selectedToMonth", form.getRsv100selectedToMonth());
        cmn999Form.addHiddenParam("rsv100selectedToDay", form.getRsv100selectedToDay());
        cmn999Form.addHiddenParam("rsv100KeyWord", form.getRsv100KeyWord());
        cmn999Form.addHiddenParam("rsv100SearchCondition", form.getRsv100SearchCondition());
        cmn999Form.addHiddenParam("rsv100TargetMok", form.getRsv100TargetMok());
        cmn999Form.addHiddenParam("rsv100TargetNiyo", form.getRsv100TargetNiyo());
        cmn999Form.addHiddenParam("rsv100CsvOutField", form.getRsv100CsvOutField());
        cmn999Form.addHiddenParam("rsv100SelectedKey1", form.getRsv100SelectedKey1());
        cmn999Form.addHiddenParam("rsv100SelectedKey2", form.getRsv100SelectedKey2());
        cmn999Form.addHiddenParam("rsv100SelectedKey1Sort", form.getRsv100SelectedKey1Sort());
        cmn999Form.addHiddenParam("rsv100SelectedKey2Sort", form.getRsv100SelectedKey2Sort());
        cmn999Form.addHiddenParam("rsvIkkatuTorokuKey", form.getRsvIkkatuTorokuKey());
        cmn999Form.addHiddenParam("rsv100svFromYear", form.getRsv100svFromYear());
        cmn999Form.addHiddenParam("rsv100svFromMonth", form.getRsv100svFromMonth());
        cmn999Form.addHiddenParam("rsv100svFromDay", form.getRsv100svFromDay());
        cmn999Form.addHiddenParam("rsv100svToYear", form.getRsv100svToYear());
        cmn999Form.addHiddenParam("rsv100svToMonth", form.getRsv100svToMonth());
        cmn999Form.addHiddenParam("rsv100svToDay", form.getRsv100svToDay());
        cmn999Form.addHiddenParam("rsv100svGrp1", form.getRsv100svGrp1());
        cmn999Form.addHiddenParam("rsv100svGrp2", form.getRsv100svGrp2());
        cmn999Form.addHiddenParam("rsv100svKeyWord", form.getRsv100svKeyWord());
        cmn999Form.addHiddenParam("rsv100svSearchCondition", form.getRsv100svSearchCondition());
        cmn999Form.addHiddenParam("rsv100svTargetMok", form.getRsv100svTargetMok());
        cmn999Form.addHiddenParam("rsv100svTargetNiyo", form.getRsv100svTargetNiyo());
        cmn999Form.addHiddenParam("rsv100svSelectedKey1", form.getRsv100svSelectedKey1());
        cmn999Form.addHiddenParam("rsv100svSelectedKey2", form.getRsv100svSelectedKey2());
        cmn999Form.addHiddenParam("rsv100svSelectedKey1Sort", form.getRsv100svSelectedKey1Sort());
        cmn999Form.addHiddenParam("rsv100svSelectedKey2Sort", form.getRsv100svSelectedKey2Sort());
        cmn999Form.addHiddenParam("rsv100SearchSvFlg",
                String.valueOf(form.isRsv100SearchSvFlg()));

        cmn999Form.addHiddenParam("rsv100dateKbn", form.getRsv100dateKbn());
        cmn999Form.addHiddenParam("rsv100apprStatus", form.getRsv100apprStatus());
        cmn999Form.addHiddenParam("rsv100svDateKbn", form.getRsv100svDateKbn());
        cmn999Form.addHiddenParam("rsv100svApprStatus", form.getRsv100svApprStatus());
        req.setAttribute("cmn999Form", cmn999Form);

        return map.findForward("gf_msg");
    }
    /**
     * <br>[機  能] 予約更新完了後の画面遷移設定
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param map マップ
     * @param form フォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con コネクション
     * @return ActionForward フォワード
     * @throws Exception 実行時例外
     */
    private ActionForward __doCantUpdate(ActionMapping map,
                                          Rsv110knForm form,
                                          HttpServletRequest req,
                                          HttpServletResponse res,
                                          Connection con) throws Exception {

        Cmn999Form cmn999Form = new Cmn999Form();
        cmn999Form.setType(Cmn999Form.TYPE_OK);
        cmn999Form.setIcon(Cmn999Form.ICON_INFO);
        cmn999Form.setWtarget(Cmn999Form.WTARGET_BODY);

        ActionForward forwardOk = __getBackPageForward(map, form);
        cmn999Form.setUrlOK(forwardOk.getPath());

        //メッセージ
        String msgId = "";
        if (form.getRsv110ProcMode().equals(GSConstReserve.PROC_MODE_SINKI)
                || form.getRsv110ProcMode().equals(GSConstReserve.PROC_MODE_COPY_ADD)) {
            msgId = "error.myself.auth";
        } else if (form.getRsv110ProcMode().equals(GSConstReserve.PROC_MODE_EDIT)) {
            msgId = "error.myself.auth";
        }

        MessageResources msgRes = getResources(req);
        GsMessage gsMsg = new GsMessage();
        cmn999Form.setMessage(msgRes.getMessage(msgId, gsMsg.getMessage(req, "reserve.src.22")));

        //画面パラメータをセット
        __setMsgFormParam(cmn999Form, form);
        req.setAttribute("cmn999Form", cmn999Form);
        return map.findForward("gf_msg");
    }

    /**
    *
    * <br>[機  能] 施設予約が閲覧できるかを判定し、エラーメッセージをセットする。
    * <br>[解  説]
    * <br>[備  考]
    * @param req リクエストモデル
    * @param map アクションマッピング
    * @param con コネクション
    * @param forward アクションフォワード
    * @param form フォーム
    * @return forward アクションフォワード
    * @throws SQLException SQL実行例外
    */
   private ActionForward __checkViewError(HttpServletRequest req,
                                                              ActionMapping map,
                                                              Connection con,
                                                              ActionForward forward,
                                                              Rsv110knForm form
                                                              ) throws SQLException {

       //処理モード
       String procMode = form.getRsv110ProcMode();

       if (procMode.equals(GSConstReserve.PROC_MODE_EDIT)) {

           //セッションユーザSIDを取得
           RequestModel reqMdl = getRequestModel(req);
           BaseUserModel usModel = reqMdl.getSmodel();
           int sessionUsrSid = usModel.getUsrsid();

           //エラーメッセージ
           MessageResources msgRes = getResources(req);
           String errorMessage = null;

           RsvSisYrkDao rsyDao = new RsvSisYrkDao(con);
           RsvSisYrkModel rsyModel = rsyDao.select(form.getRsv110RsySid());
           //データが存在しない場合
           if (rsyModel == null) {
               errorMessage = msgRes.getMessage("error.none.edit.reservedata");
               return __doTransitionErrorPage(map, form, req, errorMessage);
           }

         //セッションユーザが施設予約の公開範囲内にあるかを判定
           RsvCommonBiz rsvBiz = new RsvCommonBiz();
           boolean publicFlg = rsvBiz.isWithinPubilicRange(
                   con, form.getRsv110RsySid(), sessionUsrSid);

           //施設予約の公開区分範囲外である場合
           if (!publicFlg) {
               errorMessage = msgRes.getMessage("error.not.view.reservedata");
               return __doTransitionErrorPage(map, form, req, errorMessage);
           }
       }

       return forward;
   }

    /**
     * <br>エラー画面設定
     * @param map アクションマッピング
     * @param form アクションフォーム
     * @param req リクエスト
     * @param errMessage エラーメッセージ
     * @return ActionForward
     */
    private ActionForward __doTransitionErrorPage(ActionMapping map, Rsv110knForm form,
            HttpServletRequest req, String errMessage) {
        ActionForward forward = null;

        Cmn999Form cmn999Form = new Cmn999Form();
        ActionForward urlForward = __getBackPageForward(map, form);
        //パラメータの設定
        cmn999Form.setType(Cmn999Form.TYPE_OK);
        cmn999Form.setIcon(Cmn999Form.ICON_WARN);
        cmn999Form.setWtarget(Cmn999Form.WTARGET_BODY);
        cmn999Form.setUrlOK(urlForward.getPath());
        cmn999Form.setMessage(errMessage);

        //画面パラメータをセット
        __setMsgFormParam(cmn999Form, form);
        req.setAttribute("cmn999Form", cmn999Form);

        forward = map.findForward("gf_msg");
        return forward;
    }

    /**
     * <br>[機  能] 戻り先画面を取得する
     * <br>[解  説]
     * <br>[備  考]
     * @param map アクションマッピング
     * @param form アクションフォーム
     * @return 戻り先画面
     */
    private ActionForward __getBackPageForward(ActionMapping map, Rsv110knForm form) {
        ActionForward urlForward = null;
        //OKボタンクリック時遷移先
        String backPgId =
            NullDefault.getStringZeroLength(
                    form.getRsvBackPgId(), GSConstReserve.DSP_ID_RSV010);

        //予約一覧[週間]画面へ戻る
        if (backPgId.equals(GSConstReserve.DSP_ID_RSV010)) {
            urlForward = map.findForward("back_to_syukan");
        //予約一覧[日間]画面へ戻る
        } else if (backPgId.equals(GSConstReserve.DSP_ID_RSV020)) {
            urlForward = map.findForward("back_to_nikkan");
        //予約一覧[月間]画面へ戻る
        } else if (backPgId.equals(GSConstReserve.DSP_ID_RSV030)) {
            urlForward = map.findForward("back_to_gekkan");
        } else if (backPgId.equals(GSConstReserve.DSP_ID_RSVMAIN)) {
            urlForward = map.findForward("back_to_main");
        }

        return urlForward;
    }

    /**
     * <br>[機  能] 共通メッセージ画面Formへパラメータを設定する
     * <br>[解  説]
     * <br>[備  考]
     * @param cmn999Form 共通メッセージ画面Form
     * @param form フォーム
     */
    private void __setMsgFormParam(Cmn999Form cmn999Form, Rsv110knForm form) {
        cmn999Form.addHiddenParam("rsvBackPgId", form.getRsvBackPgId());
        cmn999Form.addHiddenParam("rsvDspFrom", form.getRsvDspFrom());
        cmn999Form.addHiddenParam("rsvSelectedGrpSid", form.getRsvSelectedGrpSid());
        cmn999Form.addHiddenParam("rsvSelectedSisetuSid", form.getRsvSelectedSisetuSid());
        cmn999Form.addHiddenParam("rsv100InitFlg",
                String.valueOf(form.isRsv100InitFlg()));
        cmn999Form.addHiddenParam("rsv100SearchFlg",
                String.valueOf(form.isRsv100SearchFlg()));
        cmn999Form.addHiddenParam("rsv100SortKey", form.getRsv100SortKey());
        cmn999Form.addHiddenParam("rsv100OrderKey", form.getRsv100OrderKey());
        cmn999Form.addHiddenParam("rsv100PageTop", form.getRsv100PageTop());
        cmn999Form.addHiddenParam("rsv100PageBottom", form.getRsv100PageBottom());
        cmn999Form.addHiddenParam("rsv100selectedFromYear", form.getRsv100selectedFromYear());
        cmn999Form.addHiddenParam("rsv100selectedFromMonth", form.getRsv100selectedFromMonth());
        cmn999Form.addHiddenParam("rsv100selectedFromDay", form.getRsv100selectedFromDay());
        cmn999Form.addHiddenParam("rsv100selectedToYear", form.getRsv100selectedToYear());
        cmn999Form.addHiddenParam("rsv100selectedToMonth", form.getRsv100selectedToMonth());
        cmn999Form.addHiddenParam("rsv100selectedToDay", form.getRsv100selectedToDay());
        cmn999Form.addHiddenParam("rsv100KeyWord", form.getRsv100KeyWord());
        cmn999Form.addHiddenParam("rsv100SearchCondition", form.getRsv100SearchCondition());
        cmn999Form.addHiddenParam("rsv100TargetMok", form.getRsv100TargetMok());
        cmn999Form.addHiddenParam("rsv100TargetNiyo", form.getRsv100TargetNiyo());
        cmn999Form.addHiddenParam("rsv100CsvOutField", form.getRsv100CsvOutField());
        cmn999Form.addHiddenParam("rsv100SelectedKey1", form.getRsv100SelectedKey1());
        cmn999Form.addHiddenParam("rsv100SelectedKey2", form.getRsv100SelectedKey2());
        cmn999Form.addHiddenParam("rsv100SelectedKey1Sort", form.getRsv100SelectedKey1Sort());
        cmn999Form.addHiddenParam("rsv100SelectedKey2Sort", form.getRsv100SelectedKey2Sort());
        cmn999Form.addHiddenParam("rsvIkkatuTorokuKey", form.getRsvIkkatuTorokuKey());
        cmn999Form.addHiddenParam("rsv100svFromYear", form.getRsv100svFromYear());
        cmn999Form.addHiddenParam("rsv100svFromMonth", form.getRsv100svFromMonth());
        cmn999Form.addHiddenParam("rsv100svFromDay", form.getRsv100svFromDay());
        cmn999Form.addHiddenParam("rsv100svToYear", form.getRsv100svToYear());
        cmn999Form.addHiddenParam("rsv100svToMonth", form.getRsv100svToMonth());
        cmn999Form.addHiddenParam("rsv100svToDay", form.getRsv100svToDay());
        cmn999Form.addHiddenParam("rsv100svGrp1", form.getRsv100svGrp1());
        cmn999Form.addHiddenParam("rsv100svGrp2", form.getRsv100svGrp2());
        cmn999Form.addHiddenParam("rsv100svKeyWord", form.getRsv100svKeyWord());
        cmn999Form.addHiddenParam("rsv100svSearchCondition", form.getRsv100svSearchCondition());
        cmn999Form.addHiddenParam("rsv100svTargetMok", form.getRsv100svTargetMok());
        cmn999Form.addHiddenParam("rsv100svTargetNiyo", form.getRsv100svTargetNiyo());
        cmn999Form.addHiddenParam("rsv100svSelectedKey1", form.getRsv100svSelectedKey1());
        cmn999Form.addHiddenParam("rsv100svSelectedKey2", form.getRsv100svSelectedKey2());
        cmn999Form.addHiddenParam("rsv100svSelectedKey1Sort", form.getRsv100svSelectedKey1Sort());
        cmn999Form.addHiddenParam("rsv100svSelectedKey2Sort", form.getRsv100svSelectedKey2Sort());
        cmn999Form.addHiddenParam("rsv100SearchSvFlg",
                String.valueOf(form.isRsv100SearchSvFlg()));

        cmn999Form.addHiddenParam("rsv100dateKbn", form.getRsv100dateKbn());
        cmn999Form.addHiddenParam("rsv100apprStatus", form.getRsv100apprStatus());
        cmn999Form.addHiddenParam("rsv100svDateKbn", form.getRsv100svDateKbn());
        cmn999Form.addHiddenParam("rsv100svApprStatus", form.getRsv100svApprStatus());
    }

    /**
     * <br>[機  能] 予約可能な施設グループか判定する。
     * <br>[解  説]
     * <br>[備  考]
     *
     * @param con コネクション
     * @param rsgSid 施設グループSID
     * @param sessionUsrSid セッションユーザSID
     * @param admFlg 管理者フラグ
     * @return ret 予約可能:true 予約不可:false
     * @throws SQLException SQL実行時例外
     */
    private boolean __isEditRsvGrp(Connection con,
            int rsgSid, int sessionUsrSid, boolean admFlg)
        throws SQLException {

        if (admFlg) {
            return true;
        }

        RsvSisGrpDao rsgDao = new RsvSisGrpDao(con);
        RsvSisGrpModel grpModel = rsgDao.select(rsgSid);

        //制限方法
        int limitKbn = GSConstReserve.RSV_ACCESS_MODE_FREE;
        if (grpModel != null) {
            limitKbn = grpModel.getRsgAcsLimitKbn();
        }
        if (limitKbn == GSConstReserve.RSV_ACCESS_MODE_FREE) {
            return true;
        }

        RsvSisGrpDao dao = new RsvSisGrpDao(con);
        ArrayList<RsvSisGrpModel> accessList = dao.getCanEditData(sessionUsrSid, rsgSid);
        if (accessList != null && accessList.size() > 0) {
            return true;
        }

        return false;
    }
}