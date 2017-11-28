package jp.groupsession.v2.api.webmail.labeladd;

import jp.groupsession.v2.api.webmail.labellist.ApiWmlLabelListForm;

/**
 * <br>[機  能] WEBメールラベルを追加するWEBAPIフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class ApiWmlLabelAddForm extends ApiWmlLabelListForm {
    /** ラベル名*/
    private String wlbName__ = null;

    /**
     * <p>wlbName を取得します。
     * @return wlbName
     */
    public String getWlbName() {
        return wlbName__;
    }
    /**
     * <p>wlbName をセットします。
     * @param wlbName ラベル名
     */
    public void setWlbName(String wlbName) {
        wlbName__ = wlbName;
    }
}
