package jp.groupsession.v2.api.webmail.destlist.address;

import jp.groupsession.v2.api.AbstractApiForm;

/**
 * <br>[機  能] WEBメール送信先リストのアドレス一覧を取得するWEBAPIフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class ApiWmlDestAddressForm extends AbstractApiForm {
    /** 送信先リストSID*/
    private int wdlSid__ = -1;

    /**
     * <p>wdlSid を取得します。
     * @return wdlSid
     */
    public int getWdlSid() {
        return wdlSid__;
    }
    /**
     * <p>wdlSid をセットします。
     * @param wdlSid 送信先リストSID
     */
    public void setWdlSid(int wdlSid) {
        wdlSid__ = wdlSid;
    }
}
