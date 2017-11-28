package jp.groupsession.v2.api.smail.labeladd;

import jp.groupsession.v2.api.smail.labellist.ApiSmlLabelListForm;

/**
 * <br>[機  能] ショートメールラベルを追加するWEBAPIフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class ApiSmlLabelAddForm extends ApiSmlLabelListForm {
    /** ラベル名*/
    private String slbName__ = null;

    /**
     * <p>slbName を取得します。
     * @return labelName
     */
    public String getSlbName() {
        return slbName__;
    }
    /**
     * <p>slbName をセットします。
     * @param slbName 追加するラベル名
     */
    public void setSlbName(String slbName) {
        slbName__ = slbName;
    }
}
