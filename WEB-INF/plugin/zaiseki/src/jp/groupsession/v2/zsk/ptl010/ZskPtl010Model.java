package jp.groupsession.v2.zsk.ptl010;

import jp.groupsession.v2.sch.model.SchDataModel;

/**
 * <br>[機  能] 在席管理 ポートレット グループメンバー スケジュール情報を格納するModelクラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class ZskPtl010Model extends SchDataModel {

    /** スケジュール開始～終了(表示用) */
    private String scdFrToDateDsp__;
    /** セッションユーザが表示グループに所属していない場合にtrue */
    private boolean notBelongGrpFlg__ = false;

    /**
     * <p>scdFrToDateDsp を取得します。
     * @return scdFrToDateDsp
     */
    public String getScdFrToDateDsp() {
        return scdFrToDateDsp__;
    }

    /**
     * <p>scdFrToDateDsp をセットします。
     * @param scdFrToDateDsp scdFrToDateDsp
     */
    public void setScdFrToDateDsp(String scdFrToDateDsp) {
        scdFrToDateDsp__ = scdFrToDateDsp;
    }

    /**
     * <p>notBelongGrpFlgを取得します。
     * @return notBelongGrpFlg
     * */
    public boolean getNotBelongGrpFlg() {
        return notBelongGrpFlg__;
    }

    /**
     * <p>notBelongGrpFlgをセットします。
     * @param notBelongGrpFlg notBelongGrpFlg
     * */
    public void setNotBelongGrpFlg(boolean belongGrpFlg) {
        notBelongGrpFlg__ = belongGrpFlg;
    }
}
