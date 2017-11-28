package jp.groupsession.v2.api.smail.hinalist;

import jp.groupsession.v2.api.AbstractApiForm;

/**
 * <br>[機  能] ショートメールひな形一覧を取得するWEBAPIフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class ApiSmlHinaListForm extends AbstractApiForm {
    /** アカウントSID*/
    private int sacSid__ = -1;
    /** ひな形タイプ*/
    private int shnType__ = -1;

    /**
     * <p>sacSid を取得します。
     * @return sacSid
     */
    public int getSacSid() {
        return sacSid__;
    }
    /**
     * <p>sacSid をセットします。
     * @param sacSid アカウントSID
     */
    public void setSacSid(int sacSid) {
        sacSid__ = sacSid;
    }
    /**
     * <p>shnType を取得します。
     * @return shnType
     */
    public int getShnType() {
        return shnType__;
    }
    /**
     * <p>shnType をセットします。
     * @param shnType ひな形タイプ
     */
    public void setShnType(int shnType) {
        shnType__ = shnType;
    }
}
