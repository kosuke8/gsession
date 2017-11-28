package jp.groupsession.v2.api.webmail.mail.save;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.sjts.util.StringUtil;
import jp.co.sjts.util.io.IOToolsException;
import jp.co.sjts.util.jdbc.JDBCUtil;
import jp.co.sjts.util.struts.StrutsUtil;
import jp.groupsession.v2.api.webmail.mail.ApiWmlMailBiz;
import jp.groupsession.v2.api.webmail.mail.send.ApiWmlMailSendAction;
import jp.groupsession.v2.cmn.GSConstLog;
import jp.groupsession.v2.cmn.GSConstWebmail;
import jp.groupsession.v2.cmn.GSContext;
import jp.groupsession.v2.cmn.dao.BaseUserModel;
import jp.groupsession.v2.cmn.dao.WmlDao;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.struts.msg.GsMessage;
import jp.groupsession.v2.wml.biz.WmlBiz;
import jp.groupsession.v2.wml.model.WmlMailModel;
import jp.groupsession.v2.wml.wml010.Wml010Biz;
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
 * <br>[機  能] WEBメールを編集するWEBAPIアクション
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class ApiWmlMailSaveAction extends ApiWmlMailSendAction {
    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(ApiWmlMailSaveAction.class);

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
        // WEBメールプラグインアクセス権限確認
        if (!canAccsessSelectPlugin(GSConstWebmail.PLUGIN_ID_WEBMAIL)) {
            addErrors(req, addCantAccsessPluginError(req, null, GSConstWebmail.PLUGIN_ID_WEBMAIL));
            return null;
        }

        boolean commitFlg = false;

        ApiWmlMailSaveForm form = (ApiWmlMailSaveForm) aForm;
        GsMessage    gsMsg       = new GsMessage(req);
        RequestModel reqMdl      = getRequestModel(req);
        GSContext    gsContext   = getGsContext();
        String       appRootPath = getAppRootPath();
        String       tmpPath     = getTempPath(req);


        int          userSid    = getSessionUserSid(req);
        String       message    = null;
        WmlMailModel sendData   = null;
        ActionErrors errors     = new ActionErrors();

        try {
            // アカウント使用可否チェック
            WmlDao wmlDao = new WmlDao(con);
            if (!wmlDao.canUseAccount(form.getWacSid(), userSid)) {
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

            // 入力情報の整合性チェック(PC版と同じ判定処理を使用)
            Wml010Form chkForm = form.getWml010Form(con);
            if (chkForm != null) {
                Wml010Biz wml010Biz = new Wml010Biz();
                chkForm.setWml010tempDirId(wml010Biz.getSendTempDirID(tmpPath, reqMdl));
                String tempDir = wml010Biz.getSendTempDir(tmpPath, reqMdl,
                                                          chkForm.getWml010tempDirId());

                // サイズ容量チェックの為、添付ファイルサイズを取得
                long fileSize = biz.getTmpFileSize(con, reqMdl, form);

                String[] errMessages = chkForm.validateSendMailDraft(con,
                        gsContext,
                        userSid,
                        appRootPath,
                        tempDir,
                        reqMdl,
                        fileSize);

                if (errMessages != null && errMessages.length > 0) {
                    message = errMessages[0]; // パラメータエラー
                } else {
                    // 添付ファイルのアップロード
                    biz.uploadTmpFile(errors, con, gsMsg, reqMdl, form, appRootPath, tempDir);
                    if (!errors.isEmpty()) {
                        addErrors(req, errors);
                        log__.info(errors.toString());
                        return null;
                    }

                    Wml010ParamModel paramMdl = new Wml010ParamModel(chkForm);

                    // メール保存
                    sendData = wml010Biz.saveDraftMail(con,
                                                       paramMdl,
                                                       gsContext,
                                                       userSid,
                                                       tempDir,
                                                       reqMdl);
                }

                // 結果判定
                if (sendData != null) {
                    commitFlg = true;  // エラーなし → データ更新OK

                    //ログ出力
                    String value = getInterMessage(req, "cmn.save.draft") + "："
                    + " [Subject]" + sendData.getSubject()
                    + " [To]" + sendData.getTo()
                    + " [Cc]" + sendData.getCc()
                    + " [Bcc]" + sendData.getBcc();

                    WmlBiz wmlBiz = new WmlBiz();
                    wmlBiz.outPutApiLog(reqMdl, con, userSid, getClass().getCanonicalName(),
                            getInterMessage(req, "cmn.entry"), GSConstLog.LEVEL_TRACE,
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
