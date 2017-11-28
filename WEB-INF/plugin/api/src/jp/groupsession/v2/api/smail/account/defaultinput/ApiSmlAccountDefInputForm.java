package jp.groupsession.v2.api.smail.account.defaultinput;

import jp.groupsession.v2.api.AbstractApiForm;

/**
 * <br>[機  能] ショートメールアカウント＋初期設定を取得するWEBAPIフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class ApiSmlAccountDefInputForm extends AbstractApiForm {

    /** アカウントSID*/
    private int sacSid__  = -1;

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
}
