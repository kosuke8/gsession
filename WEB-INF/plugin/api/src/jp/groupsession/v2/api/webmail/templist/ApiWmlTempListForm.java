package jp.groupsession.v2.api.webmail.templist;

import jp.groupsession.v2.api.AbstractApiForm;

/**
 * <br>[機  能] WEBメールのテンプレート一覧を取得するWEBAPIフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class ApiWmlTempListForm extends AbstractApiForm {
    /** アカウントSID*/
    private int wacSid__  = -1;
    /** テンプレートタイプ*/
    private int wtpType__ = -1;

    /**
     * <p>wacSid を取得します。
     * @return wacSid
     */
    public int getWacSid() {
        return wacSid__;
    }
    /**
     * <p>wacSid をセットします。
     * @param wacSid アカウントSID
     */
    public void setWacSid(int wacSid) {
        wacSid__ = wacSid;
    }

    /**
     * <p>wtpType を取得します。
     * @return wtpType
     */
    public int getWtpType() {
        return wtpType__;
    }
    /**
     * <p>wtpType をセットします。
     * @param wtpType テンプレートタイプ
     */
    public void setWtpType(int wtpType) {
        wtpType__ = wtpType;
    }
}
