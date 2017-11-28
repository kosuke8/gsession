package jp.groupsession.v2.api.smail.mail.count;

import jp.groupsession.v2.api.AbstractApiForm;

/**
 * <br>[機  能] ショートメール未読件数を取得するWEBAPIフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class ApiSmlMailCountForm extends AbstractApiForm {

    /** アカウントSID*/
    private int sacSid__  = -1;

    /** タイプ*/
    private int cntType__  = -1;

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
     * <p>cntType を取得します。
     * @return cntType
     */
    public int getCntType() {
        return cntType__;
    }
    /**
     * <p>cntType をセットします。
     * @param cntType カウントタイプ
     */
    public void setCntType(int cntType) {
        cntType__ = cntType;
    }
}
