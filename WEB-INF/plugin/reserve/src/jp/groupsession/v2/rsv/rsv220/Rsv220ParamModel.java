package jp.groupsession.v2.rsv.rsv220;

import java.util.ArrayList;

import org.apache.struts.util.LabelValueBean;

import jp.groupsession.v2.rsv.rsv040.Rsv040ParamModel;

/**
 * <br>[機  能] 施設予約 管理者設定 施設予約基本設定画面のフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Rsv220ParamModel extends Rsv040ParamModel {

    /** 施設予約単位分設定 */
    private String rsv220HourDiv__ = null;

    /** 午前開始時 */
    private String rsv220AmFrHour__ = null;
    /** 午前開始分 */
    private String rsv220AmFrMin__ = null;
    /** 午前終了時 */
    private String rsv220AmToHour__ = null;
    /** 午前終了分 */
    private String rsv220AmToMin__ = null;

    /** 午後開始時 */
    private String rsv220PmFrHour__ = null;
    /** 午後開始分 */
    private String rsv220PmFrMin__ = null;
    /** 午後終了時 */
    private String rsv220PmToHour__ = null;
    /** 午後終了分 */
    private String rsv220PmToMin__ = null;

    /** 終日開始時 */
    private String rsv220AllDayFrHour__ = null;
    /** 終日開始分 */
    private String rsv220AllDayFrMin__ = null;
    /** 終日終了時 */
    private String rsv220AllDayToHour__ = null;
    /** 終日終了分 */
    private String rsv220AllDayToMin__ = null;

    /** 午前開始時リスト */
    private ArrayList <LabelValueBean> rsv220AmFrHourLabel__ = null;
    /** 午前開始分リスト */
    private ArrayList <LabelValueBean> rsv220AmFrMinuteLabel__ = null;
    /** 午前終了時リスト */
    private ArrayList <LabelValueBean> rsv220AmToHourLabel__ = null;
    /** 午前終了分リスト */
    private ArrayList <LabelValueBean> rsv220AmToMinuteLabel__ = null;

    /** 午後開始時リスト */
    private ArrayList <LabelValueBean> rsv220PmFrHourLabel__ = null;
    /** 午後開始分リスト */
    private ArrayList <LabelValueBean> rsv220PmFrMinuteLabel__ = null;
    /** 午後終了時リスト */
    private ArrayList <LabelValueBean> rsv220PmToHourLabel__ = null;
    /** 午後終了分リスト */
    private ArrayList <LabelValueBean> rsv220PmToMinuteLabel__ = null;

    /** 終日開始時リスト */
    private ArrayList <LabelValueBean> rsv220AllDayFrHourLabel__ = null;
    /** 終日開始分リスト */
    private ArrayList <LabelValueBean> rsv220AllDayFrMinuteLabel__ = null;
    /** 終日終了時リスト */
    private ArrayList <LabelValueBean> rsv220AllDayToHourLabel__ = null;
    /** 終日終了分リスト */
    private ArrayList <LabelValueBean> rsv220AllDayToMinuteLabel__ = null;

    /** 表示用午前マスタ */
    private String rsv220AmTime__ = null;
    /** 表示用午後マスタ */
    private String rsv220PmTime__ = null;
    /** 表示用終日マスタ */
    private String rsv220AllTime__ = null;

    /**
     * <br>[機  能] デフォルトコンストラクタ
     * <br>[解  説]
     * <br>[備  考]
     */
    public Rsv220ParamModel() {
    }

    /**
     * <p>rsv220HourDiv を取得します。
     * @return rsv220HourDiv
     */
    public String getRsv220HourDiv() {
        return rsv220HourDiv__;
    }

    /**
     * <p>rsv220HourDiv をセットします。
     * @param rsv220HourDiv rsv220HourDiv
     */
    public void setRsv220HourDiv(String rsv220HourDiv) {
        rsv220HourDiv__ = rsv220HourDiv;
    }

    /**
     * <p>rsv220AmFrHour を取得します。
     * @return rsv220AmFrHour
     */
    public String getRsv220AmFrHour() {
        return rsv220AmFrHour__;
    }

    /**
     * <p>rsv220AmFrHour をセットします。
     * @param rsv220AmFrHour rsv220AmFrHour
     */
    public void setRsv220AmFrHour(String rsv220AmFrHour) {
        rsv220AmFrHour__ = rsv220AmFrHour;
    }

    /**
     * <p>rsv220AmFrMin を取得します。
     * @return rsv220AmFrMin
     */
    public String getRsv220AmFrMin() {
        return rsv220AmFrMin__;
    }

    /**
     * <p>rsv220AmFrMin をセットします。
     * @param rsv220AmFrMin rsv220AmFrMin
     */
    public void setRsv220AmFrMin(String rsv220AmFrMin) {
        rsv220AmFrMin__ = rsv220AmFrMin;
    }

    /**
     * <p>rsv220AmToHour を取得します。
     * @return rsv220AmToHour
     */
    public String getRsv220AmToHour() {
        return rsv220AmToHour__;
    }

    /**
     * <p>rsv220AmToHour をセットします。
     * @param rsv220AmToHour rsv220AmToHour
     */
    public void setRsv220AmToHour(String rsv220AmToHour) {
        rsv220AmToHour__ = rsv220AmToHour;
    }

    /**
     * <p>rsv220AmToMin を取得します。
     * @return rsv220AmToMin
     */
    public String getRsv220AmToMin() {
        return rsv220AmToMin__;
    }

    /**
     * <p>rsv220AmToMin をセットします。
     * @param rsv220AmToMin rsv220AmToMin
     */
    public void setRsv220AmToMin(String rsv220AmToMin) {
        rsv220AmToMin__ = rsv220AmToMin;
    }

    /**
     * <p>rsv220PmFrHour を取得します。
     * @return rsv220PmFrHour
     */
    public String getRsv220PmFrHour() {
        return rsv220PmFrHour__;
    }

    /**
     * <p>rsv220PmFrHour をセットします。
     * @param rsv220PmFrHour rsv220PmFrHour
     */
    public void setRsv220PmFrHour(String rsv220PmFrHour) {
        rsv220PmFrHour__ = rsv220PmFrHour;
    }

    /**
     * <p>rsv220PmFrMin を取得します。
     * @return rsv220PmFrMin
     */
    public String getRsv220PmFrMin() {
        return rsv220PmFrMin__;
    }

    /**
     * <p>rsv220PmFrMin をセットします。
     * @param rsv220PmFrMin rsv220PmFrMin
     */
    public void setRsv220PmFrMin(String rsv220PmFrMin) {
        rsv220PmFrMin__ = rsv220PmFrMin;
    }

    /**
     * <p>rsv220PmToHour を取得します。
     * @return rsv220PmToHour
     */
    public String getRsv220PmToHour() {
        return rsv220PmToHour__;
    }

    /**
     * <p>rsv220PmToHour をセットします。
     * @param rsv220PmToHour rsv220PmToHour
     */
    public void setRsv220PmToHour(String rsv220PmToHour) {
        rsv220PmToHour__ = rsv220PmToHour;
    }

    /**
     * <p>rsv220PmToMin を取得します。
     * @return rsv220PmToMin
     */
    public String getRsv220PmToMin() {
        return rsv220PmToMin__;
    }

    /**
     * <p>rsv220PmToMin をセットします。
     * @param rsv220PmToMin rsv220PmToMin
     */
    public void setRsv220PmToMin(String rsv220PmToMin) {
        rsv220PmToMin__ = rsv220PmToMin;
    }

    /**
     * <p>rsv220AllDayFrHour を取得します。
     * @return rsv220AllDayFrHour
     */
    public String getRsv220AllDayFrHour() {
        return rsv220AllDayFrHour__;
    }

    /**
     * <p>rsv220AllDayFrHour をセットします。
     * @param rsv220AllDayFrHour rsv220AllDayFrHour
     */
    public void setRsv220AllDayFrHour(String rsv220AllDayFrHour) {
        rsv220AllDayFrHour__ = rsv220AllDayFrHour;
    }

    /**
     * <p>rsv220AllDayFrMin を取得します。
     * @return rsv220AllDayFrMin
     */
    public String getRsv220AllDayFrMin() {
        return rsv220AllDayFrMin__;
    }

    /**
     * <p>rsv220AllDayFrMin をセットします。
     * @param rsv220AllDayFrMin rsv220AllDayFrMin
     */
    public void setRsv220AllDayFrMin(String rsv220AllDayFrMin) {
        rsv220AllDayFrMin__ = rsv220AllDayFrMin;
    }

    /**
     * <p>rsv220AllDayToHour を取得します。
     * @return rsv220AllDayToHour
     */
    public String getRsv220AllDayToHour() {
        return rsv220AllDayToHour__;
    }

    /**
     * <p>rsv220AllDayToHour をセットします。
     * @param rsv220AllDayToHour rsv220AllDayToHour
     */
    public void setRsv220AllDayToHour(String rsv220AllDayToHour) {
        rsv220AllDayToHour__ = rsv220AllDayToHour;
    }

    /**
     * <p>rsv220AllDayToMin を取得します。
     * @return rsv220AllDayToMin
     */
    public String getRsv220AllDayToMin() {
        return rsv220AllDayToMin__;
    }

    /**
     * <p>rsv220AllDayToMin をセットします。
     * @param rsv220AllDayToMin rsv220AllDayToMin
     */
    public void setRsv220AllDayToMin(String rsv220AllDayToMin) {
        rsv220AllDayToMin__ = rsv220AllDayToMin;
    }

    /**
     * <p>rsv220AmFrHourLabel を取得します。
     * @return rsv220AmFrHourLabel
     */
    public ArrayList<LabelValueBean> getRsv220AmFrHourLabel() {
        return rsv220AmFrHourLabel__;
    }

    /**
     * <p>rsv220AmFrHourLabel をセットします。
     * @param rsv220AmFrHourLabel rsv220AmFrHourLabel
     */
    public void setRsv220AmFrHourLabel(
            ArrayList<LabelValueBean> rsv220AmFrHourLabel) {
        rsv220AmFrHourLabel__ = rsv220AmFrHourLabel;
    }

    /**
     * <p>rsv220AmFrMinuteLabel を取得します。
     * @return rsv220AmFrMinuteLabel
     */
    public ArrayList<LabelValueBean> getRsv220AmFrMinuteLabel() {
        return rsv220AmFrMinuteLabel__;
    }

    /**
     * <p>rsv220AmFrMinuteLabel をセットします。
     * @param rsv220AmFrMinuteLabel rsv220AmFrMinuteLabel
     */
    public void setRsv220AmFrMinuteLabel(
            ArrayList<LabelValueBean> rsv220AmFrMinuteLabel) {
        rsv220AmFrMinuteLabel__ = rsv220AmFrMinuteLabel;
    }

    /**
     * <p>rsv220AmToHourLabel を取得します。
     * @return rsv220AmToHourLabel
     */
    public ArrayList<LabelValueBean> getRsv220AmToHourLabel() {
        return rsv220AmToHourLabel__;
    }

    /**
     * <p>rsv220AmToHourLabel をセットします。
     * @param rsv220AmToHourLabel rsv220AmToHourLabel
     */
    public void setRsv220AmToHourLabel(
            ArrayList<LabelValueBean> rsv220AmToHourLabel) {
        rsv220AmToHourLabel__ = rsv220AmToHourLabel;
    }

    /**
     * <p>rsv220AmToMinuteLabel を取得します。
     * @return rsv220AmToMinuteLabel
     */
    public ArrayList<LabelValueBean> getRsv220AmToMinuteLabel() {
        return rsv220AmToMinuteLabel__;
    }

    /**
     * <p>rsv220AmToMinuteLabel をセットします。
     * @param rsv220AmToMinuteLabel rsv220AmToMinuteLabel
     */
    public void setRsv220AmToMinuteLabel(
            ArrayList<LabelValueBean> rsv220AmToMinuteLabel) {
        rsv220AmToMinuteLabel__ = rsv220AmToMinuteLabel;
    }

    /**
     * <p>rsv220PmFrHourLabel を取得します。
     * @return rsv220PmFrHourLabel
     */
    public ArrayList<LabelValueBean> getRsv220PmFrHourLabel() {
        return rsv220PmFrHourLabel__;
    }

    /**
     * <p>rsv220PmFrHourLabel をセットします。
     * @param rsv220PmFrHourLabel rsv220PmFrHourLabel
     */
    public void setRsv220PmFrHourLabel(
            ArrayList<LabelValueBean> rsv220PmFrHourLabel) {
        rsv220PmFrHourLabel__ = rsv220PmFrHourLabel;
    }

    /**
     * <p>rsv220PmFrMinuteLabel を取得します。
     * @return rsv220PmFrMinuteLabel
     */
    public ArrayList<LabelValueBean> getRsv220PmFrMinuteLabel() {
        return rsv220PmFrMinuteLabel__;
    }

    /**
     * <p>rsv220PmFrMinuteLabel をセットします。
     * @param rsv220PmFrMinuteLabel rsv220PmFrMinuteLabel
     */
    public void setRsv220PmFrMinuteLabel(
            ArrayList<LabelValueBean> rsv220PmFrMinuteLabel) {
        rsv220PmFrMinuteLabel__ = rsv220PmFrMinuteLabel;
    }

    /**
     * <p>rsv220PmToHourLabel を取得します。
     * @return rsv220PmToHourLabel
     */
    public ArrayList<LabelValueBean> getRsv220PmToHourLabel() {
        return rsv220PmToHourLabel__;
    }

    /**
     * <p>rsv220PmToHourLabel をセットします。
     * @param rsv220PmToHourLabel rsv220PmToHourLabel
     */
    public void setRsv220PmToHourLabel(
            ArrayList<LabelValueBean> rsv220PmToHourLabel) {
        rsv220PmToHourLabel__ = rsv220PmToHourLabel;
    }

    /**
     * <p>rsv220PmToMinuteLabel を取得します。
     * @return rsv220PmToMinuteLabel
     */
    public ArrayList<LabelValueBean> getRsv220PmToMinuteLabel() {
        return rsv220PmToMinuteLabel__;
    }

    /**
     * <p>rsv220PmToMinuteLabel をセットします。
     * @param rsv220PmToMinuteLabel rsv220PmToMinuteLabel
     */
    public void setRsv220PmToMinuteLabel(
            ArrayList<LabelValueBean> rsv220PmToMinuteLabel) {
        rsv220PmToMinuteLabel__ = rsv220PmToMinuteLabel;
    }

    /**
     * <p>rsv220AllDayFrHourLabel を取得します。
     * @return rsv220AllDayFrHourLabel
     */
    public ArrayList<LabelValueBean> getRsv220AllDayFrHourLabel() {
        return rsv220AllDayFrHourLabel__;
    }

    /**
     * <p>rsv220AllDayFrHourLabel をセットします。
     * @param rsv220AllDayFrHourLabel rsv220AllDayFrHourLabel
     */
    public void setRsv220AllDayFrHourLabel(
            ArrayList<LabelValueBean> rsv220AllDayFrHourLabel) {
        rsv220AllDayFrHourLabel__ = rsv220AllDayFrHourLabel;
    }

    /**
     * <p>rsv220AllDayFrMinuteLabel を取得します。
     * @return rsv220AllDayFrMinuteLabel
     */
    public ArrayList<LabelValueBean> getRsv220AllDayFrMinuteLabel() {
        return rsv220AllDayFrMinuteLabel__;
    }

    /**
     * <p>rsv220AllDayFrMinuteLabel をセットします。
     * @param rsv220AllDayFrMinuteLabel rsv220AllDayFrMinuteLabel
     */
    public void setRsv220AllDayFrMinuteLabel(
            ArrayList<LabelValueBean> rsv220AllDayFrMinuteLabel) {
        rsv220AllDayFrMinuteLabel__ = rsv220AllDayFrMinuteLabel;
    }

    /**
     * <p>rsv220AllDayToHourLabel を取得します。
     * @return rsv220AllDayToHourLabel
     */
    public ArrayList<LabelValueBean> getRsv220AllDayToHourLabel() {
        return rsv220AllDayToHourLabel__;
    }

    /**
     * <p>rsv220AllDayToHourLabel をセットします。
     * @param rsv220AllDayToHourLabel rsv220AllDayToHourLabel
     */
    public void setRsv220AllDayToHourLabel(
            ArrayList<LabelValueBean> rsv220AllDayToHourLabel) {
        rsv220AllDayToHourLabel__ = rsv220AllDayToHourLabel;
    }

    /**
     * <p>rsv220AllDayToMinuteLabel を取得します。
     * @return rsv220AllDayToMinuteLabel
     */
    public ArrayList<LabelValueBean> getRsv220AllDayToMinuteLabel() {
        return rsv220AllDayToMinuteLabel__;
    }

    /**
     * <p>rsv220AllDayToMinuteLabel をセットします。
     * @param rsv220AllDayToMinuteLabel rsv220AllDayToMinuteLabel
     */
    public void setRsv220AllDayToMinuteLabel(
            ArrayList<LabelValueBean> rsv220AllDayToMinuteLabel) {
        rsv220AllDayToMinuteLabel__ = rsv220AllDayToMinuteLabel;
    }

    /**
     * <p>rsv220AmTime を取得します。
     * @return rsv220AmTime
     */
    public String getRsv220AmTime() {
        return rsv220AmTime__;
    }

    /**
     * <p>rsv220AmTime をセットします。
     * @param rsv220AmTime rsv220AmTime
     */
    public void setRsv220AmTime(String rsv220AmTime) {
        rsv220AmTime__ = rsv220AmTime;
    }

    /**
     * <p>rsv220PmTime を取得します。
     * @return rsv220PmTime
     */
    public String getRsv220PmTime() {
        return rsv220PmTime__;
    }

    /**
     * <p>rsv220PmTime をセットします。
     * @param rsv220PmTime rsv220PmTime
     */
    public void setRsv220PmTime(String rsv220PmTime) {
        rsv220PmTime__ = rsv220PmTime;
    }

    /**
     * <p>rsv220AllTime を取得します。
     * @return rsv220AllTime
     */
    public String getRsv220AllTime() {
        return rsv220AllTime__;
    }

    /**
     * <p>rsv220AllTime をセットします。
     * @param rsv220AllTime rsv220AllTime
     */
    public void setRsv220AllTime(String rsv220AllTime) {
        rsv220AllTime__ = rsv220AllTime;
    }
}