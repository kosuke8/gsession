package jp.groupsession.v2.api.smail.mail.send;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.io.IOToolsException;
import jp.co.sjts.util.jdbc.JDBCUtil;
import jp.co.sjts.util.struts.StrutsUtil;
import jp.groupsession.v2.api.AbstractApiAction;
import jp.groupsession.v2.api.smail.mail.ApiSmlMailBiz;
import jp.groupsession.v2.api.smail.mail.ApiSmlMailDao;
import jp.groupsession.v2.cmn.GSConstLog;
import jp.groupsession.v2.cmn.biz.CommonBiz;
import jp.groupsession.v2.cmn.config.PluginConfig;
import jp.groupsession.v2.cmn.dao.BaseUserModel;
import jp.groupsession.v2.cmn.dao.MlCountMtController;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.sml.GSConstSmail;
import jp.groupsession.v2.sml.biz.SmlCommonBiz;
import jp.groupsession.v2.sml.dao.SmlAccountDao;
import jp.groupsession.v2.sml.model.SmlAccountModel;
import jp.groupsession.v2.sml.sml020kn.Sml020knBiz;
import jp.groupsession.v2.sml.sml020kn.Sml020knForm;
import jp.groupsession.v2.sml.sml020kn.Sml020knParamModel;
import jp.groupsession.v2.struts.msg.GsMessage;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMessage;
import org.jdom.Document;

/**
 * <br>[機  能] ショートメールを草稿へ保存するWEBAPIアクション
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class ApiSmlMailSendAction extends AbstractApiAction {
    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(ApiSmlMailSendAction.class);

    /**
     * <br>[機  能] レスポンスXML情報を作成する。
     * <br>[解  説]
     * <br>[備  考]
     * @param aForm フォーム
     * @param req リクエスト
     * @param res レスポンス
     * @param con DBコネクション
     * @param umodel ユーザ情報
     * @return ActionForward フォワード
     * @throws Exception 実行例外
     */
    public Document createXml(ActionForm aForm, HttpServletRequest req,
            HttpServletResponse res, Connection con, BaseUserModel umodel)
            throws Exception {

        log__.debug("createXml start");
        //ショートメールプラグインアクセス権限確認
        if (!canAccsessSelectPlugin(GSConstSmail.PLUGIN_ID_SMAIL)) {
            addErrors(req, addCantAccsessPluginError(req, null, GSConstSmail.PLUGIN_ID_SMAIL));
            return null;
        }

        boolean commitFlg = false;

        ApiSmlMailSendForm form   = (ApiSmlMailSendForm) aForm;
        RequestModel       reqMdl = getRequestModel(req);

        ApiSmlMailBiz biz = new ApiSmlMailBiz();

        int sacSid  = form.getSacSid();
        int userSid = getSessionUserSid(req);
        String sacName = "";
        GsMessage gsMsg = new GsMessage(req);

        try {
            // アカウントチェック＋メール閲覧可否チェック(返信、転送、草稿で参照するメールへのアクセス制限確認)
            ActionErrors err = biz.validateCheckSmlAccount(con, gsMsg, userSid, sacSid);
            if (!err.isEmpty()) {
                addErrors(req, err);
                return null;
            }

            // 参照メールの使用可否チェック
            biz.validateFormSmail(err, con, gsMsg, form);
            if (!err.isEmpty()) {
                addErrors(req, err);
                return null;
            }

            // 宛先のうち存在しないアカウントを除外
            List<Integer> sendToList  = form.getSendToList();
            List<Integer> sendCcList  = form.getSendCcList();
            List<Integer> sendBccList = form.getSendBccList();
            HashSet<Integer> checkSidList = new HashSet<Integer>();
            checkSidList.addAll(sendToList);
            checkSidList.addAll(sendCcList);
            checkSidList.addAll(sendBccList);
            HashMap<Integer, Integer> existSidMap = null;
            if (!checkSidList.isEmpty()) {
                ApiSmlMailDao apiDao = new ApiSmlMailDao(con);
                existSidMap = apiDao.getExistSacSidList(checkSidList);
            }
            if (existSidMap == null || existSidMap.isEmpty()) {
                // 宛先が見つからない場合はエラーとする
                ActionMessage msg = new ActionMessage("search.data.notfound",
                        gsMsg.getMessage("cmn.from"));
                StrutsUtil.addMessage(err, msg, "atesaki");
                addErrors(req, err);
                return null;
            }

            // フォームへ情報セット(PCブラウザと共通処理を使用)
            Sml020knForm sml020knForm = new Sml020knForm();
            sml020knForm.setSml020ProcMode(form.getProcMode());
            sml020knForm.setSml020MailType(GSConstSmail.SAC_SEND_MAILTYPE_NORMAL); // メールタイプは固定
            sml020knForm.setSml010EditSid(form.getSmlSid());
            sml020knForm.setSml010SelectedSid(form.getSmlSid());
            sml020knForm.setSml020Title(NullDefault.getString(form.getTitle(), ""));
            sml020knForm.setSmlViewAccount(sacSid);
            sml020knForm.setSml020Mark(form.getMark());
            sml020knForm.setSml020Body(form.getBody());
            sml020knForm.setSml020userSid(biz.convertSacSidList(sendToList, existSidMap));
            sml020knForm.setSml020userSidCc(biz.convertSacSidList(sendCcList, existSidMap));
            sml020knForm.setSml020userSidBcc(biz.convertSacSidList(sendBccList, existSidMap));

            SmlAccountDao sacDao = new SmlAccountDao(con);
            SmlAccountModel sacMdl = sacDao.select(sacSid);
            if (sacMdl != null) {
                sacName = sacMdl.getSacName();
            }

            //テンポラリディレクトリパスを取得
            CommonBiz cmnBiz = new CommonBiz();
            String   tempDir = cmnBiz.getTempDir(getTempPath(req), getPluginId(), reqMdl);
            //アプリケーションのルートパス
            String appRootPath = getAppRootPath();
            String domain      = reqMdl.getDomain();

            // 添付ファイルのアップロード
            biz.uploadTmpFile(err, con, gsMsg, req, form, domain, appRootPath, tempDir);
            if (!err.isEmpty()) {
                addErrors(req, err);
                return null;
            }

            //if (!isTokenValid(req, true)) {
            //    log__.info("２重投稿");
            //    ActionMessage msg = new ActionMessage("errors.free.msg",
            //                       gsMsg.getMessage("cmn.double.error"));
            //    StrutsUtil.addMessage(errors, msg, "double.send.smail");
            //    addErrors(req, err);
            //    return null;
            //}

            //入力チェック
            err = sml020knForm.validateCheck020kn(
                            Sml020knForm.VALIDATE_MODE_SOUSIN, con, reqMdl, tempDir);
            if (!err.isEmpty()) {
                addErrors(req, err);
                return null;
            }

            // メール情報をDBに登録
            Sml020knBiz sml020knbiz = new Sml020knBiz(reqMdl);
            MlCountMtController cntCon = getCountMtController(req);
            PluginConfig pluginConfig = getPluginConfigForMain(getPluginConfig(req), con);

            Sml020knParamModel paramMdl = new Sml020knParamModel();
            paramMdl.setParam(sml020knForm);
            sml020knbiz.insertMailData(paramMdl, getRequestModel(req), con, cntCon,
                    appRootPath, tempDir, pluginConfig);

            // 結果判定
            if (paramMdl.getErrorsList() == null || paramMdl.getErrorsList().size() == 0) {
                // エラーなし → データ更新OK
                commitFlg = true;

                //ログ出力処理
                SmlCommonBiz smlBiz = new SmlCommonBiz(con, reqMdl);
                smlBiz.outPutApiLog(req, con, userSid, this.getClass().getCanonicalName(),
                        getInterMessage(req, "cmn.sent"), GSConstLog.LEVEL_TRACE,
                                                          "アカウント:" + sacName
                                                          + "\n[title]" + form.getTitle());
            }
        } catch (ClassNotFoundException e) {
            log__.error("リスナー起動に失敗しました。", e);
            throw e;
        } catch (IllegalAccessException e) {
            log__.error("リスナー起動に失敗しました。", e);
            throw e;
        } catch (InstantiationException e) {
            log__.error("リスナー起動に失敗しました。", e);
            throw e;
        } catch (SQLException e) {
            log__.error("メッセージの送信に失敗", e);
            throw e;
        } catch (IOToolsException e) {
            log__.error("IOToolsException", e);
            throw e;
        } catch (IOException e) {
            log__.error("IOException", e);
            throw e;
        } finally {
            if (commitFlg) {
                con.commit();
            } else {
                JDBCUtil.rollback(con);
            }
        }

        log__.debug("createXml end");

        return biz.resultDocument(commitFlg);
    }
}
