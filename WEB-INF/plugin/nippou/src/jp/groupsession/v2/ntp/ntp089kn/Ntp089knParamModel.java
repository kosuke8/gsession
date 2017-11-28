package jp.groupsession.v2.ntp.ntp089kn;


import jp.groupsession.v2.ntp.ntp089.Ntp089ParamModel;


/**
 * <br>[機  能] 日報 テンプレート登録画面のフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Ntp089knParamModel extends Ntp089ParamModel {
    /** 備考(表示用) */
    private String ntp089knBiko__ = null;
    /** 役職名(表示用) */
    private String ntp089knpositionName__ = null;
    /**
     * <p>ntp089knBiko を取得します。
     * @return ntp089knBiko
     */
    public String getNtp089knBiko() {
        return ntp089knBiko__;
    }
    /**
     * <p>ntp089knBiko をセットします。
     * @param ntp089knBiko ntp089knBiko
     */
    public void setNtp089knBiko(String ntp089knBiko) {
        ntp089knBiko__ = ntp089knBiko;
    }
    /**
     * <p>ntp089knpositionName を取得します。
     * @return ntp089knpositionName
     */
    public String getNtp089knpositionName() {
        return ntp089knpositionName__;
    }
    /**
     * <p>ntp089knpositionName をセットします。
     * @param ntp089knpositionName ntp089knpositionName
     */
    public void setNtp089knpositionName(String ntp089knpositionName) {
        ntp089knpositionName__ = ntp089knpositionName;
    }
}
