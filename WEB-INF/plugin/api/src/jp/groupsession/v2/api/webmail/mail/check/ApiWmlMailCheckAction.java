package jp.groupsession.v2.api.webmail.mail.check;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.sjts.util.io.IOToolsException;
import jp.co.sjts.util.struts.StrutsUtil;
import jp.groupsession.v2.api.AbstractApiAction;
import jp.groupsession.v2.api.webmail.mail.ApiWmlMailBiz;
import jp.groupsession.v2.cmn.GSConstWebmail;
import jp.groupsession.v2.cmn.dao.BaseUserModel;
import jp.groupsession.v2.cmn.dao.WmlDao;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.struts.msg.GsMessage;
import jp.groupsession.v2.wml.wml010.Wml010Biz;
import jp.groupsession.v2.wml.wml010.Wml010Const;
import jp.groupsession.v2.wml.wml010.Wml010Form;
import jp.groupsession.v2.wml.wml012.Wml012AddressModel;
import jp.groupsession.v2.wml.wml012.Wml012Biz;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMessage;
import org.jdom.Document;
import org.jdom.Element;

/**
 * <br>[機  能] WEBメールを送信前チェックするWEBAPIアクション
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class ApiWmlMailCheckAction extends AbstractApiAction {
    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(ApiWmlMailCheckAction.class);

    /** 送信先ドメイン色固定データ */
    private static String[] colorArray__ = {
        "#0000FF",
        "#FF0000",
        "#009900",
        "#ff9900",
        "#333333",
        "#000080",
        "#ffb6c1",
        "#2f4f4f",
        "#a0522d",
        "#808080"
    };

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

        String  message   = null;

        ApiWmlMailCheckForm form = (ApiWmlMailCheckForm) aForm;
        GsMessage    gsMsg  = new GsMessage(req);
        RequestModel reqMdl = getRequestModel(req);

        int        userSid     = getSessionUserSid(req);
        String     appRootDir  = getAppRootPath();
        String     tempRootDir = getTempPath(req);
        Wml010Form wml010Form  = null;
        List<Wml012AddressModel> toAdrList  = null;
        List<Wml012AddressModel> ccAdrList  = null;
        List<Wml012AddressModel> bccAdrList = null;
        ActionErrors errors = new ActionErrors();

        boolean commitFlg = false;

        try {
            // アカウント使用可否チェック
            WmlDao wmlDao = new WmlDao(con);
            if (!wmlDao.canUseAccount(form.getWacSid(), userSid)) {
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
            if (message == null) {
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
                    }
                }
            }

            if (message == null && wml010Form != null) {
                // メールチェックで問題ない場合、ドメイン情報を返す
                Wml012Biz wml012Biz = new Wml012Biz();
                Map<String, String> domainMap = new HashMap<String, String>();
                toAdrList  = wml012Biz.getAddressList(form.getSendAdrToStr(), domainMap);
                ccAdrList  = wml012Biz.getAddressList(form.getSendAdrCcStr(), domainMap);
                bccAdrList = wml012Biz.getAddressList(form.getSendAdrBccStr(), domainMap);
                commitFlg  = true;
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
        }

        log__.debug("createXml end");

        //Result
        Element result = new Element("Result");
        Document doc = new Document(result);

        if (commitFlg) {
            // チェックＯＫ → 確認画面の送信先情報を返す
            Element atesakiSet = new Element("atesakiSet");
            this.setWmlElement(atesakiSet, toAdrList,  0);
            this.setWmlElement(atesakiSet, ccAdrList,  1);
            this.setWmlElement(atesakiSet, bccAdrList, 2);
            result.addContent(atesakiSet);
        } else {
            // チェックＮＧ → エラーメッセージを返す
            if (message == null || message.length() == 0) {
                // エラーメッセージがないので、ここで指定
                message = gsMsg.getMessage("wml.136");
            }
            //result.addContent(_createElement("Message", message));
            ActionMessage msg = new ActionMessage("errors.free.msg", message);
            StrutsUtil.addMessage(errors, msg, "meailCheckError");
            addErrors(req, errors);
            return null;
        }
        return doc;
    }

    /**
     * <br>[機  能] webmailアカウント情報をXMLのresult属性にセットする。
     * <br>[解  説]
     * <br>[備  考]
     * @param result     エレメント
     * @param adrMdlList アドレス情報一覧
     * @param type       送信先タイプ(0:宛先 1:ＣＣ 2:ＢＣＣ)
     * @throws Exception 実行例外
     */
    protected void setWmlElement(Element result, List<Wml012AddressModel> adrMdlList, int type)
            throws Exception {

        if (adrMdlList != null && adrMdlList.size() > 0) {
            for (Wml012AddressModel mdl : adrMdlList) {
                Element adrElm = new Element("atesaki");

                String colorStr = colorArray__[0];
                if (mdl.getDomainType() != null && mdl.getDomainType().length() > 0) {
                    // ドメインタイプ(1～10)
                    int domainType = Integer.valueOf(mdl.getDomainType()).intValue() - 1;
                    if (domainType >= 0 && domainType < colorArray__.length) {
                        colorStr = colorArray__[domainType];
                    }
                }

                adrElm.addContent(_createElement("address", mdl.getAddress())); // アドレス
                adrElm.addContent(_createElement("sendKbn", type));             // 送信先区分
                adrElm.addContent(_createElement("user",    mdl.getUser()));    // ユーザ名
                adrElm.addContent(_createElement("domain",  mdl.getDomain()));  // ドメイン
                adrElm.addContent(_createElement("color",   colorStr));         // ドメイン色
                result.addContent(adrElm);
            }
        }
    }
}
