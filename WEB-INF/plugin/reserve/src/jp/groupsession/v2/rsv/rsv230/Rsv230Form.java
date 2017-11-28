package jp.groupsession.v2.rsv.rsv230;

import java.util.List;

import org.apache.struts.util.LabelValueBean;

import jp.groupsession.v2.rsv.GSConstReserve;
import jp.groupsession.v2.rsv.rsv140.Rsv140Form;

/**
 * <br>[機  能] 施設予約 初期値設定画面のフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Rsv230Form extends Rsv140Form {

    /** 開始 時 */
    private int rsv230DefFrH__ = 9;
    /** 開始 分 */
    private int rsv230DefFrM__ = 0;
    /** 終了 時 */
    private int rsv230DefToH__ = 18;
    /** 終了 分 */
    private int rsv230DefToM__ = 0;
    /** ラベル 時 */
    private List < LabelValueBean > rsv230HourLabel__ = null;
    /** ラベル 分 */
    private List < LabelValueBean > rsv230MinuteLabel__ = null;
    /** 期間 編集許可 */
    private boolean rsv230PeriodFlg__ = false;
    /** 編集権限 */
    private int rsv230Edit__ = GSConstReserve.EDIT_AUTH_NONE;
    /** 編集権限 編集許可 */
    private boolean rsv230EditFlg__ = false;
    /** 公開区分 */
    private int rsv230Public__ = GSConstReserve.PUBLIC_KBN_ALL;
    /** 公開区分 編集許可 */
    private boolean rsv230PublicFlg__ = false;

    /**
     * <p>rsv230DefFrH を取得します。
     * @return rsv230DefFrH
     */
    public int getRsv230DefFrH() {
        return rsv230DefFrH__;
    }
    /**
     * <p>rsv230DefFrH をセットします。
     * @param rsv230DefFrH rsv230DefFrH
     */
    public void setRsv230DefFrH(int rsv230DefFrH) {
        rsv230DefFrH__ = rsv230DefFrH;
    }
    /**
     * <p>rsv230DefFrM を取得します。
     * @return rsv230DefFrM
     */
    public int getRsv230DefFrM() {
        return rsv230DefFrM__;
    }
    /**
     * <p>rsv230DefFrM をセットします。
     * @param rsv230DefFrM rsv230DefFrM
     */
    public void setRsv230DefFrM(int rsv230DefFrM) {
        rsv230DefFrM__ = rsv230DefFrM;
    }
    /**
     * <p>rsv230DefToH を取得します。
     * @return rsv230DefToH
     */
    public int getRsv230DefToH() {
        return rsv230DefToH__;
    }
    /**
     * <p>rsv230DefToH をセットします。
     * @param rsv230DefToH rsv230DefToH
     */
    public void setRsv230DefToH(int rsv230DefToH) {
        rsv230DefToH__ = rsv230DefToH;
    }
    /**
     * <p>rsv230DefToM を取得します。
     * @return rsv230DefToM
     */
    public int getRsv230DefToM() {
        return rsv230DefToM__;
    }
    /**
     * <p>rsv230DefToM をセットします。
     * @param rsv230DefToM rsv230DefToM
     */
    public void setRsv230DefToM(int rsv230DefToM) {
        rsv230DefToM__ = rsv230DefToM;
    }
    /**
     * <p>rsv230Edit を取得します。
     * @return rsv230Edit
     */
    public int getRsv230Edit() {
        return rsv230Edit__;
    }
    /**
     * <p>rsv230Edit をセットします。
     * @param rsv230Edit rsv230Edit
     */
    public void setRsv230Edit(int rsv230Edit) {
        rsv230Edit__ = rsv230Edit;
    }
    /**
     * <p>rsv230HourLabel を取得します。
     * @return rsv230HourLabel
     */
    public List<LabelValueBean> getRsv230HourLabel() {
        return rsv230HourLabel__;
    }
    /**
     * <p>rsv230HourLabel をセットします。
     * @param rsv230HourLabel rsv230HourLabel
     */
    public void setRsv230HourLabel(List<LabelValueBean> rsv230HourLabel) {
        rsv230HourLabel__ = rsv230HourLabel;
    }
    /**
     * <p>rsv230MinuteLabel を取得します。
     * @return rsv230MinuteLabel
     */
    public List<LabelValueBean> getRsv230MinuteLabel() {
        return rsv230MinuteLabel__;
    }
    /**
     * <p>rsv230MinuteLabel をセットします。
     * @param rsv230MinuteLabel rsv230MinuteLabel
     */
    public void setRsv230MinuteLabel(List<LabelValueBean> rsv230MinuteLabel) {
        rsv230MinuteLabel__ = rsv230MinuteLabel;
    }
    /**
     * <p>rsv230PeriodFlg を取得します。
     * @return rsv230PeriodFlg
     */
    public boolean isRsv230PeriodFlg() {
        return rsv230PeriodFlg__;
    }
    /**
     * <p>rsv230PeriodFlg をセットします。
     * @param rsv230PeriodFlg rsv230PeriodFlg
     */
    public void setRsv230PeriodFlg(boolean rsv230PeriodFlg) {
        rsv230PeriodFlg__ = rsv230PeriodFlg;
    }
    /**
     * <p>rsv230EditFlg を取得します。
     * @return rsv230EditFlg
     */
    public boolean isRsv230EditFlg() {
        return rsv230EditFlg__;
    }
    /**
     * <p>rsv230EditFlg をセットします。
     * @param rsv230EditFlg rsv230EditFlg
     */
    public void setRsv230EditFlg(boolean rsv230EditFlg) {
        rsv230EditFlg__ = rsv230EditFlg;
    }
    /**
     * rsv230Publicを取得します。
     * @return rsv230Public
     * */
    public int getRsv230Public() {
        return rsv230Public__;
    }
    /**
     * rsv230Publicをセットします。
     * @param rsv230Public rsv230Public
     * */
    public void setRsv230Public(int rsv230Public) {
        rsv230Public__ = rsv230Public;
    }
    /**
     * rsv230PublicFlgを取得します。
     * @return rsv230PublicFlg
     * */
    public boolean getRsv230PublicFlg() {
        return rsv230PublicFlg__;
    }
    /**
     * rsv230PublicFlgをセットします。
     * @param rsv230PublicFlg rsv230PublicFlg
     * */
    public void setRsv230PublicFlg(boolean rsv230PublicFlg) {
        rsv230PublicFlg__ = rsv230PublicFlg;
    }

}
