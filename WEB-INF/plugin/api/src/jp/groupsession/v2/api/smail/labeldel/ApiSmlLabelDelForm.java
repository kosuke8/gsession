package jp.groupsession.v2.api.smail.labeldel;

import jp.groupsession.v2.api.smail.labellist.ApiSmlLabelListForm;

/**
 * <br>[機  能] ショートメールラベルを削除するWEBAPIフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class ApiSmlLabelDelForm extends ApiSmlLabelListForm {
    /** ラベル名*/
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
     * @param slbSid 削除するラベルSID
     */
    public void setSlbSid(int slbSid) {
        slbSid__ = slbSid;
    }
}
