package jp.groupsession.v2.api.smail.mail.list;

import jp.groupsession.v2.api.smail.mail.search.ApiSmlMailSearchForm;

/**
 * <br>[機  能] ショートメールリストを取得するWEBAPIフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class ApiSmlMailListForm extends ApiSmlMailSearchForm {

    /** ラベルSID(ラベル検索のみ)*/
    private int slbSid__ = -1;

    /**
     * <p>slbSid を取得します。
     * @return slbSid
     */
    public int getSlbSid() {
        return slbSid__;
    }
    /**
     * <p>slbSid をセットします。
     * @param slbSid ラベルSID
     */
    public void setSlbSid(int slbSid) {
        slbSid__ = slbSid;
    }
}
