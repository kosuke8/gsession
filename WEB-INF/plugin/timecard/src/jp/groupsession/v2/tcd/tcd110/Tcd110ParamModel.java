package jp.groupsession.v2.tcd.tcd110;

import java.util.List;

import jp.groupsession.v2.tcd.tcd030.Tcd030ParamModel;

import org.apache.struts.util.LabelValueBean;

/**
 * <br>[機  能] タイムカード 管理者設定 基本設定画面の情報を保持するModelクラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Tcd110ParamModel extends Tcd030ParamModel {
    /** 初期表示フラグ */
    private int tcd110initFlg__ = 0;
    /** 出力対象 年 */
    private int tcd110Year__ = 0;
    /** 出力対象 月 */
    private int tcd110Month__ = 0;

    /** 出力対象 年 コンボ */
    private List<LabelValueBean> tcd110YearLabelList__ = null;
    /** 出力対象 月 コンボ */
    private List<LabelValueBean> tcd110MonthLabelList__ = null;

    /** 出力対象 */
    private String[] tcd110target__ = null;
    /** 出力対象 選択中グループ */
    private int tcd110targetGroup__  = -1;
    /** 出力対象 選択中ユーザ・グループ */
    private String[] tcd110targetSelect__  = null;
    /** 出力対象 未選択ユーザ・グループ */
    private String[] tcd110targetNoSelect__ = null;

    /** グループコンボ */
    private List<LabelValueBean> groupCombo__ = null;
    /** 出力対象 ユーザコンボ */
    private List<LabelValueBean> tcd110targetSelectCombo__  = null;
    /** 出力対象 未選択コンボ */
    private List<LabelValueBean> tcd110targetNoSelectCombo__  = null;

    /** 出力形式 0:Excel, 1:PDF */
    private int tcd110OutputFileType__ = 0;

    /**
     * <p>tcd110initFlg を取得します。
     * @return tcd110initFlg
     */
    public int getTcd110initFlg() {
        return tcd110initFlg__;
    }

    /**
     * <p>tcd110initFlg をセットします。
     * @param tcd110initFlg tcd110initFlg
     */
    public void setTcd110initFlg(int tcd110initFlg) {
        tcd110initFlg__ = tcd110initFlg;
    }

    /**
     * <p>tcd110Year を取得します。
     * @return tcd110Year
     */
    public int getTcd110Year() {
        return tcd110Year__;
    }

    /**
     * <p>tcd110Year をセットします。
     * @param tcd110Year tcd110Year
     */
    public void setTcd110Year(int tcd110Year) {
        tcd110Year__ = tcd110Year;
    }

    /**
     * <p>tcd110Month を取得します。
     * @return tcd110Month
     */
    public int getTcd110Month() {
        return tcd110Month__;
    }

    /**
     * <p>tcd110Month をセットします。
     * @param tcd110Month tcd110Month
     */
    public void setTcd110Month(int tcd110Month) {
        tcd110Month__ = tcd110Month;
    }

    /**
     * <p>tcd110YearLabelList を取得します。
     * @return tcd110YearLabelList
     */
    public List<LabelValueBean> getTcd110YearLabelList() {
        return tcd110YearLabelList__;
    }

    /**
     * <p>tcd110YearLabelList をセットします。
     * @param tcd110YearLabelList tcd110YearLabelList
     */
    public void setTcd110YearLabelList(List<LabelValueBean> tcd110YearLabelList) {
        tcd110YearLabelList__ = tcd110YearLabelList;
    }

    /**
     * <p>tcd110MonthLabelList を取得します。
     * @return tcd110MonthLabelList
     */
    public List<LabelValueBean> getTcd110MonthLabelList() {
        return tcd110MonthLabelList__;
    }

    /**
     * <p>tcd110MonthLabelList をセットします。
     * @param tcd110MonthLabelList tcd110MonthLabelList
     */
    public void setTcd110MonthLabelList(List<LabelValueBean> tcd110MonthLabelList) {
        tcd110MonthLabelList__ = tcd110MonthLabelList;
    }

    /**
     * <p>tcd110target を取得します。
     * @return tcd110target
     */
    public String[] getTcd110target() {
        return tcd110target__;
    }

    /**
     * <p>tcd110target をセットします。
     * @param tcd110target tcd110target
     */
    public void setTcd110target(String[] tcd110target) {
        tcd110target__ = tcd110target;
    }

    /**
     * <p>tcd110targetGroup を取得します。
     * @return tcd110targetGroup
     */
    public int getTcd110targetGroup() {
        return tcd110targetGroup__;
    }

    /**
     * <p>tcd110targetGroup をセットします。
     * @param tcd110targetGroup tcd110targetGroup
     */
    public void setTcd110targetGroup(int tcd110targetGroup) {
        tcd110targetGroup__ = tcd110targetGroup;
    }

    /**
     * <p>tcd110targetSelect を取得します。
     * @return tcd110targetSelect
     */
    public String[] getTcd110targetSelect() {
        return tcd110targetSelect__;
    }

    /**
     * <p>tcd110targetSelect をセットします。
     * @param tcd110targetSelect tcd110targetSelect
     */
    public void setTcd110targetSelect(String[] tcd110targetSelect) {
        tcd110targetSelect__ = tcd110targetSelect;
    }

    /**
     * <p>tcd110targetNoSelect を取得します。
     * @return tcd110targetNoSelect
     */
    public String[] getTcd110targetNoSelect() {
        return tcd110targetNoSelect__;
    }

    /**
     * <p>tcd110targetNoSelect をセットします。
     * @param tcd110targetNoSelect tcd110targetNoSelect
     */
    public void setTcd110targetNoSelect(String[] tcd110targetNoSelect) {
        tcd110targetNoSelect__ = tcd110targetNoSelect;
    }

    /**
     * <p>groupCombo を取得します。
     * @return groupCombo
     */
    public List<LabelValueBean> getGroupCombo() {
        return groupCombo__;
    }

    /**
     * <p>groupCombo をセットします。
     * @param groupCombo groupCombo
     */
    public void setGroupCombo(List<LabelValueBean> groupCombo) {
        groupCombo__ = groupCombo;
    }

    /**
     * <p>tcd110targetSelectCombo を取得します。
     * @return tcd110targetSelectCombo
     */
    public List<LabelValueBean> getTcd110targetSelectCombo() {
        return tcd110targetSelectCombo__;
    }

    /**
     * <p>tcd110targetSelectCombo をセットします。
     * @param tcd110targetSelectCombo tcd110targetSelectCombo
     */
    public void setTcd110targetSelectCombo(
            List<LabelValueBean> tcd110targetSelectCombo) {
        tcd110targetSelectCombo__ = tcd110targetSelectCombo;
    }

    /**
     * <p>tcd110targetNoSelectCombo を取得します。
     * @return tcd110targetNoSelectCombo
     */
    public List<LabelValueBean> getTcd110targetNoSelectCombo() {
        return tcd110targetNoSelectCombo__;
    }

    /**
     * <p>tcd110targetNoSelectCombo をセットします。
     * @param tcd110targetNoSelectCombo tcd110targetNoSelectCombo
     */
    public void setTcd110targetNoSelectCombo(
            List<LabelValueBean> tcd110targetNoSelectCombo) {
        tcd110targetNoSelectCombo__ = tcd110targetNoSelectCombo;
    }

    /**
     * <p>tcd110OutputFileType を取得します。
     * @return tcd110OutputFileType
     */
    public int getTcd110OutputFileType() {
        return tcd110OutputFileType__;
    }

    /**
     * <p>tcd110OutputFileType をセットします。
     * @param tcd110OutputFileType tcd110OutputFileType
     */
    public void setTcd110OutputFileType(int tcd110OutputFileType) {
        tcd110OutputFileType__ = tcd110OutputFileType;
    }

}