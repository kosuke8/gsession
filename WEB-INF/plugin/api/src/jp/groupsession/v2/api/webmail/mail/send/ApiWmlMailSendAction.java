package jp.groupsession.v2.api.webmail.mail.send;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.StringUtil;
import jp.co.sjts.util.date.UDate;
import jp.co.sjts.util.date.UDateUtil;
import jp.co.sjts.util.io.IOToolsException;
import jp.co.sjts.util.jdbc.JDBCUtil;
import jp.co.sjts.util.struts.StrutsUtil;
import jp.groupsession.v2.api.AbstractApiAction;
import jp.groupsession.v2.api.webmail.mail.ApiWmlMailBiz;
import jp.groupsession.v2.cmn.GSConstLog;
import jp.groupsession.v2.cmn.GSConstWebmail;
import jp.groupsession.v2.cmn.dao.BaseUserModel;
import jp.groupsession.v2.cmn.dao.WmlDao;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.struts.msg.GsMessage;
import jp.groupsession.v2.wml.biz.WmlBiz;
import jp.groupsession.v2.wml.model.WmlMailModel;
import jp.groupsession.v2.wml.model.WmlSendResultModel;
import jp.groupsession.v2.wml.smtp.model.SmtpSendModel;
import jp.groupsession.v2.wml.wml010.Wml010Biz;
import jp.groupsession.v2.wml.wml010.Wml010Const;
import jp.groupsession.v2.wml.wml010.Wml010Form;
import jp.groupsession.v2.wml.wml010.Wml010ParamModel;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMessage;
import org.jdom.Document;
import org.jdom.Element;

/**
 * <br>[機  能] WEBメールを送信するWEBAPIアクション
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class ApiWmlMailSendAction extends AbstractApiAction {
    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(ApiWmlMailSendAction.class);

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
        //WEBメールプラグインアクセス権限確認
        if (!canAccsessSelectPlugin(GSConstWebmail.PLUGIN_ID_WEBMAIL)) {
            addErrors(req, addCantAccsessPluginError(req, null, GSConstWebmail.PLUGIN_ID_WEBMAIL));
            return null;
        }

        boolean commitFlg = false;
        String  message   = null;

        ApiWmlMailSendForm form = (ApiWmlMailSendForm) aForm;
        GsMessage    gsMsg  = new GsMessage(req);
        RequestModel reqMdl = getRequestModel(req);
        WmlBiz       wmlBiz = new WmlBiz();

        int     wacSid      = form.getWacSid();
        int     userSid     = getSessionUserSid(req);
        String  appRootDir  = getAppRootPath();
        String  tempRootDir = getTempPath(req);
        boolean timeSent    = false;
        Wml010Form    wml010Form   = null;
        SmtpSendModel sendData     = null;
        UDate         sendPlanDate = null;
        ActionErrors  errors       = new ActionErrors();

        try {
            // アカウント使用可否チェック
            WmlDao wmlDao = new WmlDao(con);
            if (!wmlDao.canUseAccount(wacSid, userSid)) {
                //message = gsMsg.getMessage("wml.191");
                ActionMessage msg = new ActionMessage("search.data.notfound",
                                                      gsMsg.getMessage("wml.102"));
                StrutsUtil.addMessage(errors, msg, "account");
                addErrors(req, errors);
                return null;
            }

            // フォームパラメータチェック
            ApiWmlMailBiz biz = new ApiWmlMailBiz();
            biz.validateFormSmail(errors, con, gsMsg, form, userSid);
            if (!errors.isEmpty()) {
                addErrors(req, errors);
                return null;
            }

            // パラメータ最大容量チェック
            biz.validateMailSize(errors, req, gsMsg);
            if (!errors.isEmpty()) {
                addErrors(req, errors);
                return null;
            }

            // 送信メール判定
            wml010Form = form.getWml010Form(con);
            if (wml010Form != null) {
                // 予約送信時のみチェック
                if (wml010Form.getSendMailPlanType() == Wml010Const.TIMESENT_AFTER) {
                    if (wml010Form.getWml010sendMailPlanDateYear()   == null
                     || wml010Form.getWml010sendMailPlanDateMonth()  == null
                     || wml010Form.getWml010sendMailPlanDateDay()    == null
                     || wml010Form.getWml010sendMailPlanDateHour()   == null
                     || wml010Form.getWml010sendMailPlanDateMinute() == null
                     ) {
                        // 日付情報が正しくない場合エラー
                        ActionMessage msg = new ActionMessage("error.input.format.text",
                                                              gsMsg.getMessage("wml.260"));
                        StrutsUtil.addMessage(errors, msg, "account");
                        addErrors(req, errors);
                        return null;
                    }
                }

                Wml010Biz wml010Biz = new Wml010Biz();
                wml010Form.setWml010tempDirId(wml010Biz.getSendTempDirID(tempRootDir, reqMdl));

                String tempDir = wml010Biz.getSendTempDir(tempRootDir, reqMdl,
                                                          wml010Form.getWml010tempDirId());

                // サイズ容量チェックの為、添付ファイルサイズを取得
                long fileSize = biz.getTmpFileSize(con, reqMdl, form);

                String[] errMessages = wml010Form.validateSendMail(con,
                                                                getGsContext(),
                                                                userSid,
                                                                appRootDir,
                                                                tempDir,
                                                                reqMdl,
                                                                fileSize);

                if (errMessages != null && errMessages.length > 0) {
                    message = errMessages[0]; // 送信パラメータエラー
                } else {
                    // 添付ファイルのアップロード
                    biz.uploadTmpFile(errors, con, gsMsg, reqMdl, form,
                                                   appRootDir, tempDir);
                    if (!errors.isEmpty()) {
                        addErrors(req, errors);
                        log__.info(errors.toString());
                        return null;
                    }

                    int sendResult = WmlSendResultModel.RESULT_SUCCESS;

                    Wml010ParamModel paramMdl = new Wml010ParamModel(wml010Form);

                    if (wml010Form.getSendMailPlanType() == Wml010Const.TIMESENT_AFTER) {
                        timeSent = true; // 予約送信
                    } else if (wmlBiz.isTimeSent(con, wacSid)) {
                        timeSent = true; // 強制時間差送信
                    } else if (wmlBiz.isTimeSentInput(con, wacSid)
                            && wml010Form.getWml010sendMailPlanImm() != Wml010Const.SENDPLAN_IMM) {
                        timeSent = true; // 作成時に選択＋時間差送信
                    }

                    if (timeSent) {
                        // 時間差送信 or 予約送信
                        WmlMailModel draftSendData = wml010Biz.saveSendPlanMail(con,
                                                        paramMdl,
                                                        getGsContext(),
                                                        userSid,
                                                        tempDir,
                                                        reqMdl);
                        if (draftSendData != null) {
                            //ログ出力用に送信メール情報を設定
                            sendData = new SmtpSendModel();
                            sendData.setSubject(draftSendData.getSubject());
                            sendData.setFrom(wml010Biz.joinAddress(draftSendData.getFrom()));
                            sendData.setTo(wml010Biz.joinAddress(draftSendData.getTo()));
                            sendData.setCc(wml010Biz.joinAddress(draftSendData.getCc()));
                            sendData.setBcc(wml010Biz.joinAddress(draftSendData.getBcc()));

                            sendPlanDate = draftSendData.getSendDate(); // 送信時間コピー(ログ用)
                        }
                    } else {
                        // 即時送信
                        WmlSendResultModel resultMdl = wml010Biz.sendMail(con,
                                                            paramMdl,
                                                            getGsContext(),
                                                            userSid,
                                                            appRootDir,
                                                            tempDir,
                                                            reqMdl);
                        sendResult = resultMdl.getResult();
                        if (sendResult == WmlSendResultModel.RESULT_SUCCESS) {
                            //送信成功
                            sendData = resultMdl.getSendMailData();
                        } else {
                            //送信失敗
                            if (sendResult == WmlSendResultModel.RESULT_SIZEOVER) {
                                String[] mailSize = {Long.toString(
                                                        resultMdl.getMailMaxSize() / (1024 * 1024))
                                                        + "MB"};
                                message = gsMsg.getMessage("wml.245", mailSize);
                            } else {
                                message = gsMsg.getMessage("wml.js.40");
                            }
                        }
                    }
                }

                // 結果判定
                if (sendData != null) {
                    commitFlg = true; // エラーなし → データ更新OK

                    //ログ出力
                    String value = "";
                    if (sendPlanDate != null) {
                        //UDate sendPlanDate = wml010Biz.getSendPlanDate(paramMdl);
                        value = getInterMessage(req, "wml.211") + "：";
                        value += " [" + getInterMessage(req, "wml.260") + "]";
                        value += UDateUtil.getSlashYYMD(sendPlanDate)
                              +  " " + UDateUtil.getSeparateHM(sendPlanDate);
                        value += " ";
                    } else {
                        value = getInterMessage(req, "cmn.mail.send") + "：";
                    }
                    value += "[Subject]" + sendData.getSubject();
                    value += " [From]" + NullDefault.getString(sendData.getFrom(), "");
                    value += " [To]" + NullDefault.getString(sendData.getTo(), "");
                    value += " [Cc]" + NullDefault.getString(sendData.getCc(), "");
                    value += " [Bcc]" + NullDefault.getString(sendData.getBcc(), "");
                    wmlBiz.outPutApiLog(reqMdl, con, userSid, getClass().getCanonicalName(),
                            getInterMessage(req, "cmn.sent"), GSConstLog.LEVEL_TRACE,
                            StringUtil.trimRengeString(value, 3000));
                }
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

        // エラーメッセージがある場合
        if (message != null && message.length() > 0) {
            //result.addContent(_createElement("Message", message));
            ActionMessage msg = new ActionMessage("errors.free.msg", message);
            StrutsUtil.addMessage(errors, msg, "meailSaveError");
            addErrors(req, errors);
            return null;
        }

        log__.debug("createXml end");

        //Result
        Element result = new Element("Result");
        Document doc = new Document(result);

        if (commitFlg) {
            result.addContent("OK");
        } else {
            result.addContent("NG");
        }
        return doc;
    }
}
