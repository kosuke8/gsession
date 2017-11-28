package jp.groupsession.v2.sch.sch086;

import java.util.List;

import org.apache.struts.util.LabelValueBean;

import jp.groupsession.v2.cmn.GSConstSchedule;
import jp.groupsession.v2.sch.sch080.Sch080Form;

/**
 * <br>[機  能] スケジュール 管理者設定 スケジュール初期値設定画面のフォーム
 * <br>[解  説]
 * <br>[備  考]
 */
public class Sch086Form extends Sch080Form {

    /** 初期表示フラグ */
    private int sch086init__ = 0;

    /**時間 選択区分*/
    private int sch086TimeType__ = GSConstSchedule.SAD_INITIME_STYPE_USER;
    /** 開始 時 */
    private int sch086DefFrH__ = -1;
    /** 開始 分 */
    private int sch086DefFrM__ = -1;
    /** 終了 時 */
    private int sch086DefToH__ = -1;
    /** 終了 分 */
    private int sch086DefToM__ = -1;
    /** ラベル 時 */
    private List < LabelValueBean > sch086HourLabel__ = null;
    /** ラベル 分 */
    private List < LabelValueBean > sch086MinuteLabel__ = null;

    /** 編集権限 選択区分 */
    private int sch086EditType__ = GSConstSchedule.SAD_INIEDIT_STYPE_USER;
    /** 編集権限 */
    private int sch086Edit__ = GSConstSchedule.EDIT_CONF_NONE;

    /** 公開区分 選択区分 */
    private int sch086PublicType__ = GSConstSchedule.SAD_INIPUBLIC_STYPE_USER;
    /** 公開区分 */
    private int sch086Public__ = GSConstSchedule.DSP_PUBLIC;

    /** 同時編集 選択区分 */
    private int sch086SameType__ = GSConstSchedule.SAD_INISAME_STYPE_USER;
    /** 同時編集 */
    private int sch086Same__ = GSConstSchedule.SAME_EDIT_ON;

    /**
     * <p>sch086Edit を取得します。
     * @return sch086Edit
     */
    public int getSch086Edit() {
        return sch086Edit__;
    }
    /**
     * <p>sch086Edit をセットします。
     * @param sch086Edit sch086Edit
     */
    public void setSch086Edit(int sch086Edit) {
        sch086Edit__ = sch086Edit;
    }
    /**
     * <p>sch086EditType を取得します。
     * @return sch086EditType
     */
    public int getSch086EditType() {
        return sch086EditType__;
    }
    /**
     * <p>sch086EditType をセットします。
     * @param sch086EditType sch086EditType
     */
    public void setSch086EditType(int sch086EditType) {
        sch086EditType__ = sch086EditType;
    }
    /**
     * <p>sch086init を取得します。
     * @return sch086init
     */
    public int getSch086init() {
        return sch086init__;
    }
    /**
     * <p>sch086init をセットします。
     * @param sch086init sch086init
     */
    public void setSch086init(int sch086init) {
        sch086init__ = sch086init;
    }
    /***
     * <p>sch086TimeTypeを取得します。
     * @return sch086TimeType
     */
    public int getSch086TimeType() {
        return sch086TimeType__;
    }
    /**
     * <p>sch086TimeTypeをセットします。
     * @param sch086TimeType sch086TimeType
     *
     * */
    public void setSch086TimeType(int sch086TimeType) {
        sch086TimeType__ = sch086TimeType;
    }
    /**
     * <p>sch091DefFrH を取得します。
     * @return sch091DefFrH
     */
    public int getSch086DefFrH() {
        return sch086DefFrH__;
    }

    /**
     * <p>sch086DefFrH をセットします。
     * @param sch086DefFrH sch086DefFrH
     */
    public void setSch086DefFrH(int sch086DefFrH) {
        sch086DefFrH__ = sch086DefFrH;
    }

    /**
     * <p>sch086DefFrM を取得します。
     * @return sch086DefFrM
     */
    public int getSch086DefFrM() {
        return sch086DefFrM__;
    }

    /**
     * <p>sch086DefFrM をセットします。
     * @param sch086DefFrM sch086DefFrM
     */
    public void setSch086DefFrM(int sch086DefFrM) {
        sch086DefFrM__ = sch086DefFrM;
    }

    /**
     * <p>sch086DefToH を取得します。
     * @return sch086DefToH
     */
    public int getSch086DefToH() {
        return sch086DefToH__;
    }

    /**
     * <p>sch086DefToH をセットします。
     * @param sch086DefToH sch086DefToH
     */
    public void setSch086DefToH(int sch086DefToH) {
        sch086DefToH__ = sch086DefToH;
    }

    /**
     * <p>sch086DefToM を取得します。
     * @return sch086DefToM
     */
    public int getSch086DefToM() {
        return sch086DefToM__;
    }

    /**
     * <p>sch086DefToM をセットします。
     * @param sch086DefToM sch086DefToM
     */
    public void setSch086DefToM(int sch086DefToM) {
        sch086DefToM__ = sch086DefToM;
    }

    /**
     * <p>sch086HourLabel を取得します。
     * @return sch086HourLabel
     */
    public List<LabelValueBean> getSch086HourLabel() {
        return sch086HourLabel__;
    }

    /**
     * <p>sch086HourLabel をセットします。
     * @param sch086HourLabel sch086HourLabel
     */
    public void setSch086HourLabel(List<LabelValueBean> sch086HourLabel) {
        sch086HourLabel__ = sch086HourLabel;
    }

    /**
     * <p>sch086MinuteLabel を取得します。
     * @return sch086MinuteLabel
     */
    public List<LabelValueBean> getSch086MinuteLabel() {
        return sch086MinuteLabel__;
    }

    /**
     * <p>sch086MinuteLabel をセットします。
     * @param sch086MinuteLabel sch086MinuteLabel
     */
    public void setSch086MinuteLabel(List<LabelValueBean> sch086MinuteLabel) {
        sch086MinuteLabel__ = sch086MinuteLabel;
    }
    /**
     * <p>sch086PublicType を取得します。
     * @return sch086PublicType
     */
    public int getSch086PublicType() {
        return sch086PublicType__;
    }
    /**
     * <p>sch086PublicType をセットします。
     * @param sch086PublicType sch086PublicType
     */
    public void setSch086PublicType(int sch086PublicType) {
        sch086PublicType__ = sch086PublicType;
    }
    /**
     * <p>sch086Public を取得します。
     * @return sch086Public
     */
    public int getSch086Public() {
        return sch086Public__;
    }
    /**
     * <p>sch086Public をセットします。
     * @param sch086Public sch086Public
     */
    public void setSch086Public(int sch086Public) {
        sch086Public__ = sch086Public;
    }
    /**
     * <p>sch086SameType を取得します。
     * @return sch086SameType
     */
    public int getSch086SameType() {
        return sch086SameType__;
    }
    /**
     * <p>sch086SameType をセットします。
     * @param sch086SameType sch086SameType
     */
    public void setSch086SameType(int sch086SameType) {
        sch086SameType__ = sch086SameType;
    }
    /**
     * <p>sch086Same を取得します。
     * @return sch086Same
     */
    public int getSch086Same() {
        return sch086Same__;
    }
    /**
     * <p>sch086Same をセットします。
     * @param sch086Same sch086Same
     */
    public void setSch086Same(int sch086Same) {
        sch086Same__ = sch086Same;
    }
}