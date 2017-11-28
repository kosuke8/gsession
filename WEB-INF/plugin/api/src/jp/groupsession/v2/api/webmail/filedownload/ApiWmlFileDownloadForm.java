package jp.groupsession.v2.api.webmail.filedownload;

import java.sql.Connection;
import java.sql.SQLException;

import jp.co.sjts.util.struts.StrutsUtil;
import jp.groupsession.v2.api.AbstractApiForm;
import jp.groupsession.v2.api.GSConstApi;
import jp.groupsession.v2.struts.msg.GsMessage;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;

/**
 * <br>[機  能] ファイルのダウンロードを行うWEBAPIフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class ApiWmlFileDownloadForm extends AbstractApiForm {

    /** バイナリSID */
    private long wtfSid__ = -1;
    /** WEBメールSID */
    private long wmlSid__ = -1;

    /**
     * <br>[機  能] 入力チェックを行う
     * <br>[解  説]
     * <br>[備  考]
     * @param con コネクション
     * @param gsMsg GsMessage
     * @return エラー
     * @throws SQLException SQL実行時例外
     */
    public ActionErrors validateCmnDownload(Connection con, GsMessage gsMsg)
    throws SQLException {
        ActionErrors errors = new ActionErrors();
        ActionMessage msg = null;

        if (wtfSid__ < 0) {
            //未入力
            msg = new ActionMessage("error.input.required.text",
                    gsMsg.getMessage(GSConstApi.TEXT_BIN_SID));
            StrutsUtil.addMessage(errors, msg, "binSid");
        }

        if (wmlSid__ < 0) {
            //未入力
            msg = new ActionMessage("error.input.required.text",
                    gsMsg.getMessage("wml.wml010.25"));
            StrutsUtil.addMessage(errors, msg, "wmlSid");
        }

        //if (errors.size() < 1) {
        //    //ショートメール添付ファイルチェック
        //    if (!__isFileOk(usrSid, con)) {
        //        msg = new ActionMessage("search.notfound.tdfkcode",
        //                gsMsg.getMessage(GSConstApi.TEXT_TEMP_FILE));
        //            StrutsUtil.addMessage(errors, msg, "wmlSid");
        //    }
        //}

        return errors;
    }

    /**
     * @return wtfSid
     */
    public long getWtfSid() {
        return wtfSid__;
    }

    /**
     * @param wtfSid 設定する wtfSid
     */
    public void setWtfSid(long wtfSid) {
        wtfSid__ = wtfSid;
    }

    /**
     * <p>wmlSid を取得します。
     * @return wmlSid
     */
    public long getWmlSid() {
        return wmlSid__;
    }

    /**
     * <p>wmlSid をセットします。
     * @param wmlSid wmlSid
     */
    public void setWmlSid(long wmlSid) {
        wmlSid__ = wmlSid;
    }
}
