package jp.groupsession.v2.api.webmail.account.defaultinput;

import jp.groupsession.v2.api.AbstractApiForm;

/**
 * <br>[機  能] WEBメールのデフォルトアカウントを取得するWEBAPIフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class ApiWmlAccountDefInputForm extends AbstractApiForm {

    /** アカウントSID*/
    private int wacSid__  = -1;

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

}
