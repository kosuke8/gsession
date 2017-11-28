package jp.groupsession.v2.sch.sch081;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.util.LabelValueBean;

import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.ValidateUtil;
import jp.co.sjts.util.struts.StrutsUtil;
import jp.groupsession.v2.cmn.GSConstSchedule;
import jp.groupsession.v2.cmn.GSValidateUtil;
import jp.groupsession.v2.sch.model.SchColMsgModel;
import jp.groupsession.v2.sch.sch100.Sch100Form;
import jp.groupsession.v2.struts.msg.GsMessage;

/**
 * <br>[機  能] スケジュール基本設定画面のフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Sch081Form extends Sch100Form {
    /** 共有範囲設定 */
    private String sch081Crange__ = null;
    /** スケジュール単位分設定 */
    private String sch081HourDiv__ = null;
    /** スケジュールタイトルカラー情報 */
    private ArrayList<SchColMsgModel> sch081ColorCommentList__ = null;
    /** スケジュールタイトルカラー*/
    private String sch081ColorComment1__ = null;
    /** スケジュールタイトルカラー*/
    private String sch081ColorComment2__ = null;
    /** スケジュールタイトルカラー*/
    private String sch081ColorComment3__ = null;
    /** スケジュールタイトルカラー*/
    private String sch081ColorComment4__ = null;
    /** スケジュールタイトルカラー*/
    private String sch081ColorComment5__ = null;

    /** タイトルカラー設定 */
    private int sch081colorKbn__ = GSConstSchedule.SAD_MSG_NO_ADD;

    /** スケジュールタイトルカラー*/
    private String sch081ColorComment6__ = null;
    /** スケジュールタイトルカラー*/
    private String sch081ColorComment7__ = null;
    /** スケジュールタイトルカラー*/
    private String sch081ColorComment8__ = null;
    /** スケジュールタイトルカラー*/
    private String sch081ColorComment9__ = null;
    /** スケジュールタイトルカラー*/
    private String sch081ColorComment10__ = null;

    /** 午前開始時 */
    private String sch081AmFrHour__ = null;
    /** 午前開始分 */
    private String sch081AmFrMin__ = null;
    /** 午前終了時 */
    private String sch081AmToHour__ = null;
    /** 午前終了分 */
    private String sch081AmToMin__ = null;

    /** 午後開始時 */
    private String sch081PmFrHour__ = null;
    /** 午後開始分 */
    private String sch081PmFrMin__ = null;
    /** 午後終了時 */
    private String sch081PmToHour__ = null;
    /** 午後終了分 */
    private String sch081PmToMin__ = null;

    /** 終日開始時 */
    private String sch081AllDayFrHour__ = null;
    /** 終日開始分 */
    private String sch081AllDayFrMin__ = null;
    /** 終日終了時 */
    private String sch081AllDayToHour__ = null;
    /** 終日終了分 */
    private String sch081AllDayToMin__ = null;

    /** 午前開始時リスト */
    private ArrayList <LabelValueBean> sch081AmFrHourLabel__ = null;
    /** 午前開始分リスト */
    private ArrayList <LabelValueBean> sch081AmFrMinuteLabel__ = null;
    /** 午前終了時リスト */
    private ArrayList <LabelValueBean> sch081AmToHourLabel__ = null;
    /** 午前終了分リスト */
    private ArrayList <LabelValueBean> sch081AmToMinuteLabel__ = null;

    /** 午後開始時リスト */
    private ArrayList <LabelValueBean> sch081PmFrHourLabel__ = null;
    /** 午後開始分リスト */
    private ArrayList <LabelValueBean> sch081PmFrMinuteLabel__ = null;
    /** 午後終了時リスト */
    private ArrayList <LabelValueBean> sch081PmToHourLabel__ = null;
    /** 午後終了分リスト */
    private ArrayList <LabelValueBean> sch081PmToMinuteLabel__ = null;

    /** 終日開始時リスト */
    private ArrayList <LabelValueBean> sch081AllDayFrHourLabel__ = null;
    /** 終日開始分リスト */
    private ArrayList <LabelValueBean> sch081AllDayFrMinuteLabel__ = null;
    /** 終日終了時リスト */
    private ArrayList <LabelValueBean> sch081AllDayToHourLabel__ = null;
    /** 終日終了分リスト */
    private ArrayList <LabelValueBean> sch081AllDayToMinuteLabel__ = null;

    /**
     * <br>[機  能] デフォルトコンストラクタ
     * <br>[解  説]
     * <br>[備  考]
     */
    public Sch081Form() {
    }

    /**
     * <p>sch081ColorComment1 を取得します。
     * @return sch081ColorComment1
     */
    public String getSch081ColorComment1() {
        return sch081ColorComment1__;
    }

    /**
     * <p>sch081ColorComment1 をセットします。
     * @param sch081ColorComment1 sch081ColorComment1
     */
    public void setSch081ColorComment1(String sch081ColorComment1) {
        sch081ColorComment1__ = sch081ColorComment1;
    }

    /**
     * <p>sch081ColorComment2 を取得します。
     * @return sch081ColorComment2
     */
    public String getSch081ColorComment2() {
        return sch081ColorComment2__;
    }

    /**
     * <p>sch081ColorComment2 をセットします。
     * @param sch081ColorComment2 sch081ColorComment2
     */
    public void setSch081ColorComment2(String sch081ColorComment2) {
        sch081ColorComment2__ = sch081ColorComment2;
    }

    /**
     * <p>sch081ColorComment3 を取得します。
     * @return sch081ColorComment3
     */
    public String getSch081ColorComment3() {
        return sch081ColorComment3__;
    }

    /**
     * <p>sch081ColorComment3 をセットします。
     * @param sch081ColorComment3 sch081ColorComment3
     */
    public void setSch081ColorComment3(String sch081ColorComment3) {
        sch081ColorComment3__ = sch081ColorComment3;
    }

    /**
     * <p>sch081ColorComment4 を取得します。
     * @return sch081ColorComment4
     */
    public String getSch081ColorComment4() {
        return sch081ColorComment4__;
    }

    /**
     * <p>sch081ColorComment4 をセットします。
     * @param sch081ColorComment4 sch081ColorComment4
     */
    public void setSch081ColorComment4(String sch081ColorComment4) {
        sch081ColorComment4__ = sch081ColorComment4;
    }

    /**
     * <p>sch081ColorComment5 を取得します。
     * @return sch081ColorComment5
     */
    public String getSch081ColorComment5() {
        return sch081ColorComment5__;
    }

    /**
     * <p>sch081ColorComment5 をセットします。
     * @param sch081ColorComment5 sch081ColorComment5
     */
    public void setSch081ColorComment5(String sch081ColorComment5) {
        sch081ColorComment5__ = sch081ColorComment5;
    }

    /**
     * <p>sch081ColorCommentList を取得します。
     * @return sch081ColorCommentList
     */
    public ArrayList<SchColMsgModel> getSch081ColorCommentList() {
        return sch081ColorCommentList__;
    }

    /**
     * <p>sch081ColorCommentList をセットします。
     * @param sch081ColorCommentList sch081ColorCommentList
     */
    public void setSch081ColorCommentList(
            ArrayList<SchColMsgModel> sch081ColorCommentList) {
        sch081ColorCommentList__ = sch081ColorCommentList;
    }

    /**
     * <p>sch081Crange を取得します。
     * @return sch081Crange
     */
    public String getSch081Crange() {
        return sch081Crange__;
    }

    /**
     * <p>sch081Crange をセットします。
     * @param sch081Crange sch081Crange
     */
    public void setSch081Crange(String sch081Crange) {
        sch081Crange__ = sch081Crange;
    }

    /**
     * <p>sch081HourDiv を取得します。
     * @return sch081HourDiv
     */
    public String getSch081HourDiv() {
        return sch081HourDiv__;
    }

    /**
     * <p>sch081HourDiv をセットします。
     * @param sch081HourDiv sch081HourDiv
     */
    public void setSch081HourDiv(String sch081HourDiv) {
        sch081HourDiv__ = sch081HourDiv;
    }

    /**
     * <br>[機  能] 入力チェックを行う
     * <br>[解  説]
     * <br>[備  考]
     * @param map アクションマッピング
     * @param req リクエスト
     * @param con コネクション
     * @return エラー
     * @throws SQLException SQL実行時例外
     */
    public ActionErrors validateCheck(
            ActionMapping map,
            HttpServletRequest req,
            Connection con) throws SQLException {

        ActionErrors errors = new ActionErrors();
        ActionMessage msg = null;
        GsMessage gsMsg = new GsMessage();
        //カラーコメント
        String textColorComment = gsMsg.getMessage(req, "schedule.src.16");
        //カラーコメントのチェック
        if (NullDefault.getString(sch081ColorComment1__, "").length() > 0) {
            //青
            String textBlue = gsMsg.getMessage(req, "schedule.src.49");
            if (__checkRange(
                    errors,
                    sch081ColorComment1__,
                    "sch081ColorComment1",
                    textColorComment + textBlue,
                    GSConstSchedule.MAX_LENGTH_TITLE)) {
                //先頭スペースチェック
                if (ValidateUtil.isSpaceStart(sch081ColorComment1__)) {
                    msg = new ActionMessage("error.input.spase.start",
                                            textColorComment);
                    StrutsUtil.addMessage(errors, msg, "sch081ColorComment1");
                } else {
                    __checkJisString(
                            errors,
                            sch081ColorComment1__,
                            "sch081ColorComment1",
                            textColorComment + textBlue);
                }
            }
        }
        if (NullDefault.getString(sch081ColorComment2__, "").length() > 0) {
            //赤
            String textRed = gsMsg.getMessage(req, "schedule.src.50");
            if (__checkRange(
                    errors,
                    sch081ColorComment2__,
                    "sch081ColorComment2",
                    textColorComment + textRed,
                    GSConstSchedule.MAX_LENGTH_TITLE)) {
                //先頭スペースチェック
                if (ValidateUtil.isSpaceStart(sch081ColorComment2__)) {
                    msg = new ActionMessage("error.input.spase.start",
                                            textColorComment);
                    StrutsUtil.addMessage(errors, msg, "sch081ColorComment2");
                } else {
                    __checkJisString(
                            errors,
                            sch081ColorComment2__,
                            "sch081ColorComment2",
                            textColorComment + textRed);
                }
            }
        }
        if (NullDefault.getString(sch081ColorComment3__, "").length() > 0) {
            //緑
            String textGreen = gsMsg.getMessage(req, "schedule.src.50");
            if (__checkRange(
                    errors,
                    sch081ColorComment3__,
                    "sch081ColorComment3",
                    textColorComment + textGreen,
                    GSConstSchedule.MAX_LENGTH_TITLE)) {
                //先頭スペースチェック
                if (ValidateUtil.isSpaceStart(sch081ColorComment3__)) {
                    msg = new ActionMessage("error.input.spase.start",
                                            textColorComment);
                    StrutsUtil.addMessage(errors, msg, "sch081ColorComment3");
                } else {
                    __checkJisString(
                            errors,
                            sch081ColorComment3__,
                            "sch081ColorComment3",
                            textColorComment + textGreen);
                }
            }
        }
        if (NullDefault.getString(sch081ColorComment4__, "").length() > 0) {
            //黄
            String textYellow = gsMsg.getMessage(req, "schedule.src.47");
            if (__checkRange(
                    errors,
                    sch081ColorComment4__,
                    "sch081ColorComment4",
                    textColorComment + textYellow,
                    GSConstSchedule.MAX_LENGTH_TITLE)) {
                //先頭スペースチェック
                if (ValidateUtil.isSpaceStart(sch081ColorComment4__)) {
                    msg = new ActionMessage("error.input.spase.start",
                                            textColorComment);
                    StrutsUtil.addMessage(errors, msg, "sch081ColorComment4");
                } else {
                    __checkJisString(
                            errors,
                            sch081ColorComment4__,
                            "sch081ColorComment4",
                            textColorComment + textYellow);
                }
            }
        }
        if (NullDefault.getString(sch081ColorComment5__, "").length() > 0) {
            //黒
            String textBlack = gsMsg.getMessage(req, "schedule.src.48");
            if (__checkRange(
                    errors,
                    sch081ColorComment5__,
                    "sch081ColorComment5",
                    textColorComment + textBlack,
                    GSConstSchedule.MAX_LENGTH_TITLE)) {
                //先頭スペースチェック
                if (ValidateUtil.isSpaceStart(sch081ColorComment5__)) {
                    msg = new ActionMessage("error.input.spase.start",
                                            textColorComment);
                    StrutsUtil.addMessage(errors, msg, "sch081ColorComment5");
                } else {
                    __checkJisString(
                            errors,
                            sch081ColorComment5__,
                            "sch081ColorComment5",
                            textColorComment + textBlack);
                }
            }
        }

        //午前 from～to大小チェック
        __checkInputTime(errors, sch081AmFrHour__, sch081AmToHour__,
                sch081AmFrMin__, sch081AmToMin__, gsMsg.getMessage("cmn.am"));

        //午後 from～to大小チェック
        __checkInputTime(errors, sch081PmFrHour__, sch081PmToHour__,
                sch081PmFrMin__, sch081PmToMin__, gsMsg.getMessage("cmn.pm"));

        //終日 from～to大小チェック
        __checkInputTime(errors, sch081AllDayFrHour__, sch081AllDayToHour__,
                sch081AllDayFrMin__, sch081AllDayToMin__, gsMsg.getMessage("cmn.allday"));

        return errors;
    }

    /**
     * <br>[機  能] 開始時間、終了時間の値が正常値かチェックします
     * <br>[解  説]
     * <br>[備  考]
     * @param errors ActionErrors
     * @param strFrTimeH 開始時
     * @param strToTimeH 終了時
     * @param strFrTimeM 開始分
     * @param strToTimeM 終了分
     * @param timeKbn 時間区分
     * @return errors
     */
    private ActionErrors __checkInputTime(
            ActionErrors errors,
            String strFrTimeH,
            String strToTimeH,
            String strFrTimeM,
            String strToTimeM,
            String timeKbn) {

        GsMessage gsMsg = new GsMessage();
        ActionMessage msg = null;
        int frTimeH = Integer.valueOf(strFrTimeH);
        int toTimeH = Integer.valueOf(strToTimeH);

        StringBuilder errorMessage = new StringBuilder();
        errorMessage.append(timeKbn);
        errorMessage.append(":");

        //開始時間が0~24の間でない時はエラー
        if (frTimeH < 0 || frTimeH > 23) {
            //timeKbn:開始時間は0~23で入力してください。
            errorMessage.append(gsMsg.getMessage("cmn.start"));
            errorMessage.append(gsMsg.getMessage("cmn.time"));
            String errorPlace = errorMessage.toString();
            String errorCause = "0 ~ 23";

            msg = new ActionMessage("error.input.comp.text",
                    errorPlace, errorCause);
            errors.add("error.input.comp.text", msg);
            return errors;
        }

        //終了時間が0~24の間でない時はエラー
        if (toTimeH < 0 || toTimeH > 23) {
            //timeKbn:終了時間は0~23で入力してください。
            errorMessage.append(gsMsg.getMessage("cmn.end"));
            errorMessage.append(gsMsg.getMessage("cmn.time"));
            String errorPlace = errorMessage.toString();
            String errorCause = "0 ~ 23";
            msg = new ActionMessage("error.input.comp.text",
                    errorPlace, errorCause);

            errors.add("error.input.comp.text", msg);

            return errors;
        }

        int frTimeM = Integer.valueOf(strFrTimeM);
        int toTimeM = Integer.valueOf(strToTimeM);

        //開始分の範囲が0~59の外の場合エラー
        if (frTimeM < 0 || frTimeM > 59) {
            //timeKbn:開始時間は0~23で入力してください。
            errorMessage.append(gsMsg.getMessage("cmn.start"));
            errorMessage.append(gsMsg.getMessage("cmn.minute"));
            String errorPlace = errorMessage.toString();
            String errorCause = "0 ~ 59";

            msg = new ActionMessage("error.input.comp.text",
                    errorPlace, errorCause);
            errors.add("error.input.comp.text", msg);
            return errors;
        }

        //終了分の範囲が0~59の外の場合エラー
        if (toTimeM < 0 || toTimeM > 59) {
            //timeKbn:終了時間は0~23で入力してください。
            errorMessage.append(gsMsg.getMessage("cmn.end"));
            errorMessage.append(gsMsg.getMessage("cmn.minute"));
            String errorPlace = errorMessage.toString();
            String errorCause = "0 ~ 59";
            msg = new ActionMessage("error.input.comp.text",
                    errorPlace, errorCause);

            errors.add("error.input.comp.text", msg);
            return errors;
        }

        //時間の整合性チェック
        __compareTimeHour(frTimeH, toTimeH, frTimeM,
                toTimeM, timeKbn, errors);

        return errors;
    }

    /**
     * 
     * <br>[機  能] 開始時間と終了時間の整合性をチェックします。
     * <br>[解  説]
     * <br>[備  考]
     * @param frTimeH 開始時間
     * @param toTimeH 終了時間
     * @param frTimeM 開始分
     * @param toTimeM 終了分
     * @param timeKbn 午前、午後、終日区分
     * @param errors  アクションエラー
     * @return アクションエラー
     */
    private ActionErrors __compareTimeHour(
            int frTimeH, int toTimeH,
            int frTimeM, int toTimeM,
            String timeKbn, ActionErrors errors) {
        GsMessage gsMsg = new GsMessage();
        ActionMessage msg = null;
        //開始時間が終了時間より遅い場合エラー
        if (frTimeH > toTimeH) {
            //開始・終了
            String textStartEnd = gsMsg.getMessage("cmn.start.end");
            //開始<終了
            String textStartLessEnd = gsMsg.getMessage("cmn.start.lessthan.end");
            msg = new ActionMessage("error.input.comp.text",
                    timeKbn + "：" + textStartEnd, textStartLessEnd);
            errors.add("" + "error.input.comp.text", msg);
            return errors;
        }

        //もし時が同じならば、分で大小比較を行う。
        if (frTimeH == toTimeH) {
            __compareTimeMin(errors, frTimeM, toTimeM, timeKbn);
        }

        return errors;
    }
    
    /**
     * 
     * <br>[機  能]開始分と終了分の大小比較を行います。
     * <br>[解  説]
     * <br>[備  考]
     * @param errors アクションエラー
     * @param frTimeM 開始分
     * @param toTimeM 終了分
     * @param timeKbn 午前午後終日区分
     * @return アクションエラー
     */
    private ActionErrors __compareTimeMin(
            ActionErrors errors,
            int frTimeM,
            int toTimeM,
            String timeKbn) {
        GsMessage gsMsg = new GsMessage();
        ActionMessage msg = null;

        //開始分が終了分より遅いとエラー
        if (frTimeM >= toTimeM) {
            //開始・終了
            String textStartEnd = gsMsg.getMessage("cmn.start.end");
            //開始<終了
            String textStartLessEnd = gsMsg.getMessage("cmn.start.lessthan.end");
            msg = new ActionMessage("error.input.comp.text",
                    timeKbn + "：" + textStartEnd, textStartLessEnd);
            errors.add("" + "error.input.comp.text", msg);
            return errors;
        }

        return errors;
    }

    /**
     * <br>[機  能] 指定された項目の桁数チェックを行う
     * <br>[解  説]
     * <br>[備  考]
     * @param errors アクションエラー
     * @param value 項目の値
     * @param element 項目名
     * @param elementName 項目名(日本語)
     * @param range 桁数
     * @return チェック結果 true : 正常, false : 異常
     */
    private boolean __checkRange(ActionErrors errors,
                                String value,
                                String element,
                                String elementName,
                                int range) {
        boolean result = true;
        ActionMessage msg = null;

        //MAX値を超えていないか
        if (value.length() > range) {
            msg = new ActionMessage("error.input.length.text", elementName,
                    String.valueOf(range));
            errors.add(element + "error.input.length.text", msg);
            result = false;
        }
        return result;
    }
    /**
     * <br>[機  能] 指定された項目がJIS第2水準文字かチェックを行う
     * <br>[解  説]
     * <br>[備  考]
     * @param errors アクションエラー
     * @param value 項目の値
     * @param element 項目名
     * @param elementName 項目名(日本語)
     * @return チェック結果 true : 正常, false : 異常
     */
    private boolean __checkJisString(ActionErrors errors,
                                String value,
                                String element,
                                String elementName) {
        boolean result = true;
        ActionMessage msg = null;
        //JIS第2水準文字か
        if (!GSValidateUtil.isGsJapaneaseStringTextArea(value)) {
            //利用不可能な文字を入力した場合
            String nstr = GSValidateUtil.getNotGsJapaneaseStringTextArea(value);
            msg = new ActionMessage("error.input.njapan.text", elementName, nstr);
            errors.add(element + "error.input.njapan.text", msg);
            result = false;
        }
        return result;
    }

    /**
     * <p>sch081colorKbn を取得します。
     * @return sch081colorKbn
     */
    public int getSch081colorKbn() {
        return sch081colorKbn__;
    }

    /**
     * <p>sch081colorKbn をセットします。
     * @param sch081colorKbn sch081colorKbn
     */
    public void setSch081colorKbn(int sch081colorKbn) {
        sch081colorKbn__ = sch081colorKbn;
    }

    /**
     * <p>sch081ColorComment6 を取得します。
     * @return sch081ColorComment6
     */
    public String getSch081ColorComment6() {
        return sch081ColorComment6__;
    }

    /**
     * <p>sch081ColorComment6 をセットします。
     * @param sch081ColorComment6 sch081ColorComment6
     */
    public void setSch081ColorComment6(String sch081ColorComment6) {
        sch081ColorComment6__ = sch081ColorComment6;
    }

    /**
     * <p>sch081ColorComment7 を取得します。
     * @return sch081ColorComment7
     */
    public String getSch081ColorComment7() {
        return sch081ColorComment7__;
    }

    /**
     * <p>sch081ColorComment7 をセットします。
     * @param sch081ColorComment7 sch081ColorComment7
     */
    public void setSch081ColorComment7(String sch081ColorComment7) {
        sch081ColorComment7__ = sch081ColorComment7;
    }

    /**
     * <p>sch081ColorComment8 を取得します。
     * @return sch081ColorComment8
     */
    public String getSch081ColorComment8() {
        return sch081ColorComment8__;
    }

    /**
     * <p>sch081ColorComment8 をセットします。
     * @param sch081ColorComment8 sch081ColorComment8
     */
    public void setSch081ColorComment8(String sch081ColorComment8) {
        sch081ColorComment8__ = sch081ColorComment8;
    }

    /**
     * <p>sch081ColorComment9 を取得します。
     * @return sch081ColorComment9
     */
    public String getSch081ColorComment9() {
        return sch081ColorComment9__;
    }

    /**
     * <p>sch081ColorComment9 をセットします。
     * @param sch081ColorComment9 sch081ColorComment9
     */
    public void setSch081ColorComment9(String sch081ColorComment9) {
        sch081ColorComment9__ = sch081ColorComment9;
    }

    /**
     * <p>sch081ColorComment10 を取得します。
     * @return sch081ColorComment10
     */
    public String getSch081ColorComment10() {
        return sch081ColorComment10__;
    }

    /**
     * <p>sch081ColorComment10 をセットします。
     * @param sch081ColorComment10 sch081ColorComment10
     */
    public void setSch081ColorComment10(String sch081ColorComment10) {
        sch081ColorComment10__ = sch081ColorComment10;
    }
    /**
     * <p>sch081AmFrHour を取得します。
     * @return sch081AmFrHour
     */
    public String getSch081AmFrHour() {
        return sch081AmFrHour__;
    }

    /**
     * <p>sch081AmFrHour をセットします。
     * @param sch081AmFrHour sch081AmFrHour
     */
    public void setSch081AmFrHour(String sch081AmFrHour) {
        sch081AmFrHour__ = sch081AmFrHour;
    }

    /**
     * <p>sch081AmFrMin を取得します。
     * @return sch081AmFrMin
     */
    public String getSch081AmFrMin() {
        return sch081AmFrMin__;
    }

    /**
     * <p>sch081AmFrMin をセットします。
     * @param sch081AmFrMin sch081AmFrMin
     */
    public void setSch081AmFrMin(String sch081AmFrMin) {
        sch081AmFrMin__ = sch081AmFrMin;
    }

    /**
     * <p>sch081AmToHour を取得します。
     * @return sch081AmToHour
     */
    public String getSch081AmToHour() {
        return sch081AmToHour__;
    }

    /**
     * <p>sch081AmToHour をセットします。
     * @param sch081AmToHour sch081AmToHour
     */
    public void setSch081AmToHour(String sch081AmToHour) {
        sch081AmToHour__ = sch081AmToHour;
    }

    /**
     * <p>sch081AmToMin を取得します。
     * @return sch081AmToMin
     */
    public String getSch081AmToMin() {
        return sch081AmToMin__;
    }

    /**
     * <p>sch081AmToMin をセットします。
     * @param sch081AmToMin sch081AmToMin
     */
    public void setSch081AmToMin(String sch081AmToMin) {
        sch081AmToMin__ = sch081AmToMin;
    }

    /**
     * <p>sch081PmFrHour を取得します。
     * @return sch081PmFrHour
     */
    public String getSch081PmFrHour() {
        return sch081PmFrHour__;
    }

    /**
     * <p>sch081PmFrHour をセットします。
     * @param sch081PmFrHour sch081PmFrHour
     */
    public void setSch081PmFrHour(String sch081PmFrHour) {
        sch081PmFrHour__ = sch081PmFrHour;
    }

    /**
     * <p>sch081PmFrMin を取得します。
     * @return sch081PmFrMin
     */
    public String getSch081PmFrMin() {
        return sch081PmFrMin__;
    }

    /**
     * <p>sch081PmFrMin をセットします。
     * @param sch081PmFrMin sch081PmFrMin
     */
    public void setSch081PmFrMin(String sch081PmFrMin) {
        sch081PmFrMin__ = sch081PmFrMin;
    }

    /**
     * <p>sch081PmToHour を取得します。
     * @return sch081PmToHour
     */
    public String getSch081PmToHour() {
        return sch081PmToHour__;
    }

    /**
     * <p>sch081PmToHour をセットします。
     * @param sch081PmToHour sch081PmToHour
     */
    public void setSch081PmToHour(String sch081PmToHour) {
        sch081PmToHour__ = sch081PmToHour;
    }

    /**
     * <p>sch081PmToMin を取得します。
     * @return sch081PmToMin
     */
    public String getSch081PmToMin() {
        return sch081PmToMin__;
    }

    /**
     * <p>sch081PmToMin をセットします。
     * @param sch081PmToMin sch081PmToMin
     */
    public void setSch081PmToMin(String sch081PmToMin) {
        sch081PmToMin__ = sch081PmToMin;
    }

    /**
     * <p>sch081AllDayFrHour を取得します。
     * @return sch081AllDayFrHour
     */
    public String getSch081AllDayFrHour() {
        return sch081AllDayFrHour__;
    }

    /**
     * <p>sch081AllDayFrHour をセットします。
     * @param sch081AllDayFrHour sch081AllDayFrHour
     */
    public void setSch081AllDayFrHour(String sch081AllDayFrHour) {
        sch081AllDayFrHour__ = sch081AllDayFrHour;
    }

    /**
     * <p>sch081AllDayFrMin を取得します。
     * @return sch081AllDayFrMin
     */
    public String getSch081AllDayFrMin() {
        return sch081AllDayFrMin__;
    }

    /**
     * <p>sch081AllDayFrMin をセットします。
     * @param sch081AllDayFrMin sch081AllDayFrMin
     */
    public void setSch081AllDayFrMin(String sch081AllDayFrMin) {
        sch081AllDayFrMin__ = sch081AllDayFrMin;
    }

    /**
     * <p>sch081AllDayToHour を取得します。
     * @return sch081AllDayToHour
     */
    public String getSch081AllDayToHour() {
        return sch081AllDayToHour__;
    }

    /**
     * <p>sch081AllDayToHour をセットします。
     * @param sch081AllDayToHour sch081AllDayToHour
     */
    public void setSch081AllDayToHour(String sch081AllDayToHour) {
        sch081AllDayToHour__ = sch081AllDayToHour;
    }

    /**
     * <p>sch081AllDayToMin を取得します。
     * @return sch081AllDayToMin
     */
    public String getSch081AllDayToMin() {
        return sch081AllDayToMin__;
    }

    /**
     * <p>sch081AllDayToMin をセットします。
     * @param sch081AllDayToMin sch081AllDayToMin
     */
    public void setSch081AllDayToMin(String sch081AllDayToMin) {
        sch081AllDayToMin__ = sch081AllDayToMin;
    }
    /**
     * <p>sch081AmFrHourLabel を取得します。
     * @return sch081AmFrHourLabel
     */
    public ArrayList<LabelValueBean> getSch081AmFrHourLabel() {
        return sch081AmFrHourLabel__;
    }

    /**
     * <p>sch081AmFrHourLabel をセットします。
     * @param sch081AmFrHourLabel sch081AmFrHourLabel
     */
    public void setSch081AmFrHourLabel(
            ArrayList<LabelValueBean> sch081AmFrHourLabel) {
        sch081AmFrHourLabel__ = sch081AmFrHourLabel;
    }

    /**
     * <p>sch081AmFrMinuteLabel を取得します。
     * @return sch081AmFrMinuteLabel
     */
    public ArrayList<LabelValueBean> getSch081AmFrMinuteLabel() {
        return sch081AmFrMinuteLabel__;
    }

    /**
     * <p>sch081AmFrMinuteLabel をセットします。
     * @param sch081AmFrMinuteLabel sch081AmFrMinuteLabel
     */
    public void setSch081AmFrMinuteLabel(
            ArrayList<LabelValueBean> sch081AmFrMinuteLabel) {
        sch081AmFrMinuteLabel__ = sch081AmFrMinuteLabel;
    }

    /**
     * <p>sch081AmToHourLabel を取得します。
     * @return sch081AmToHourLabel
     */
    public ArrayList<LabelValueBean> getSch081AmToHourLabel() {
        return sch081AmToHourLabel__;
    }

    /**
     * <p>sch081AmToHourLabel をセットします。
     * @param sch081AmToHourLabel sch081AmToHourLabel
     */
    public void setSch081AmToHourLabel(
            ArrayList<LabelValueBean> sch081AmToHourLabel) {
        sch081AmToHourLabel__ = sch081AmToHourLabel;
    }

    /**
     * <p>sch081AmToMinuteLabel を取得します。
     * @return sch081AmToMinuteLabel
     */
    public ArrayList<LabelValueBean> getSch081AmToMinuteLabel() {
        return sch081AmToMinuteLabel__;
    }

    /**
     * <p>sch081AmToMinuteLabel をセットします。
     * @param sch081AmToMinuteLabel sch081AmToMinuteLabel
     */
    public void setSch081AmToMinuteLabel(
            ArrayList<LabelValueBean> sch081AmToMinuteLabel) {
        sch081AmToMinuteLabel__ = sch081AmToMinuteLabel;
    }

    /**
     * <p>sch081PmFrHourLabel を取得します。
     * @return sch081PmFrHourLabel
     */
    public ArrayList<LabelValueBean> getSch081PmFrHourLabel() {
        return sch081PmFrHourLabel__;
    }

    /**
     * <p>sch081PmFrHourLabel をセットします。
     * @param sch081PmFrHourLabel sch081PmFrHourLabel
     */
    public void setSch081PmFrHourLabel(
            ArrayList<LabelValueBean> sch081PmFrHourLabel) {
        sch081PmFrHourLabel__ = sch081PmFrHourLabel;
    }

    /**
     * <p>sch081PmFrMinuteLabel を取得します。
     * @return sch081PmFrMinuteLabel
     */
    public ArrayList<LabelValueBean> getSch081PmFrMinuteLabel() {
        return sch081PmFrMinuteLabel__;
    }

    /**
     * <p>sch081PmFrMinuteLabel をセットします。
     * @param sch081PmFrMinuteLabel sch081PmFrMinuteLabel
     */
    public void setSch081PmFrMinuteLabel(
            ArrayList<LabelValueBean> sch081PmFrMinuteLabel) {
        sch081PmFrMinuteLabel__ = sch081PmFrMinuteLabel;
    }

    /**
     * <p>sch081PmToHourLabel を取得します。
     * @return sch081PmToHourLabel
     */
    public ArrayList<LabelValueBean> getSch081PmToHourLabel() {
        return sch081PmToHourLabel__;
    }

    /**
     * <p>sch081PmToHourLabel をセットします。
     * @param sch081PmToHourLabel sch081PmToHourLabel
     */
    public void setSch081PmToHourLabel(
            ArrayList<LabelValueBean> sch081PmToHourLabel) {
        sch081PmToHourLabel__ = sch081PmToHourLabel;
    }

    /**
     * <p>sch081PmToMinuteLabel を取得します。
     * @return sch081PmToMinuteLabel
     */
    public ArrayList<LabelValueBean> getSch081PmToMinuteLabel() {
        return sch081PmToMinuteLabel__;
    }

    /**
     * <p>sch081PmToMinuteLabel をセットします。
     * @param sch081PmToMinuteLabel sch081PmToMinuteLabel
     */
    public void setSch081PmToMinuteLabel(
            ArrayList<LabelValueBean> sch081PmToMinuteLabel) {
        sch081PmToMinuteLabel__ = sch081PmToMinuteLabel;
    }

    /**
     * <p>sch081AllDayFrHourLabel を取得します。
     * @return sch081AllDayFrHourLabel
     */
    public ArrayList<LabelValueBean> getSch081AllDayFrHourLabel() {
        return sch081AllDayFrHourLabel__;
    }

    /**
     * <p>sch081AllDayFrHourLabel をセットします。
     * @param sch081AllDayFrHourLabel sch081AllDayFrHourLabel
     */
    public void setSch081AllDayFrHourLabel(
            ArrayList<LabelValueBean> sch081AllDayFrHourLabel) {
        sch081AllDayFrHourLabel__ = sch081AllDayFrHourLabel;
    }

    /**
     * <p>sch081AllDayFrMinuteLabel を取得します。
     * @return sch081AllDayFrMinuteLabel
     */
    public ArrayList<LabelValueBean> getSch081AllDayFrMinuteLabel() {
        return sch081AllDayFrMinuteLabel__;
    }

    /**
     * <p>sch081AllDayFrMinuteLabel をセットします。
     * @param sch081AllDayFrMinuteLabel sch081AllDayFrMinuteLabel
     */
    public void setSch081AllDayFrMinuteLabel(
            ArrayList<LabelValueBean> sch081AllDayFrMinuteLabel) {
        sch081AllDayFrMinuteLabel__ = sch081AllDayFrMinuteLabel;
    }

    /**
     * <p>sch081AllDayToHourLabel を取得します。
     * @return sch081AllDayToHourLabel
     */
    public ArrayList<LabelValueBean> getSch081AllDayToHourLabel() {
        return sch081AllDayToHourLabel__;
    }

    /**
     * <p>sch081AllDayToHourLabel をセットします。
     * @param sch081AllDayToHourLabel sch081AllDayToHourLabel
     */
    public void setSch081AllDayToHourLabel(
            ArrayList<LabelValueBean> sch081AllDayToHourLabel) {
        sch081AllDayToHourLabel__ = sch081AllDayToHourLabel;
    }

    /**
     * <p>sch081AllDayToMinuteLabel を取得します。
     * @return sch081AllDayToMinuteLabel
     */
    public ArrayList<LabelValueBean> getSch081AllDayToMinuteLabel() {
        return sch081AllDayToMinuteLabel__;
    }

    /**
     * <p>sch081AllDayToMinuteLabel をセットします。
     * @param sch081AllDayToMinuteLabel sch081AllDayToMinuteLabel
     */
    public void setSch081AllDayToMinuteLabel(
            ArrayList<LabelValueBean> sch081AllDayToMinuteLabel) {
        sch081AllDayToMinuteLabel__ = sch081AllDayToMinuteLabel;
    }
}