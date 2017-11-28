package jp.groupsession.v2.rsv.rsv280;

import java.util.List;

import org.apache.struts.util.LabelValueBean;

import jp.groupsession.v2.rsv.GSConstReserve;
import jp.groupsession.v2.rsv.rsv040.Rsv040Form;

/**
 * <br>[機  能] 施設予約 管理者設定 施設予約初期値設定画面のフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Rsv280Form extends Rsv040Form {

    /** 期間 区分 */
    private int rsv280PeriodKbn__ = GSConstReserve.RAC_INIPERIODKBN_USER;
    /** 開始 時 */
    private int rsv280DefFrH__ = 9;
    /** 開始 分 */
    private int rsv280DefFrM__ = 0;
    /** 終了 時 */
    private int rsv280DefToH__ = 18;
    /** 終了 分 */
    private int rsv280DefToM__ = 0;
    /** ラベル 時 */
    private List < LabelValueBean > rsv280HourLabel__ = null;
    /** ラベル 分 */
    private List < LabelValueBean > rsv280MinuteLabel__ = null;
    /** 編集権限 区分 */
    private int rsv280EditKbn__ = GSConstReserve.RAC_INIEDITKBN_USER;
    /** 編集権限 */
    private int rsv280Edit__ = GSConstReserve.EDIT_AUTH_NONE;
    /** 公開区分 区分 */
    private int rsv280PublicKbn__ = GSConstReserve.RAC_INIEDITKBN_USER;
    /** 公開区分 */
    private int rsv280Public__ = GSConstReserve.PUBLIC_KBN_ALL;
    /** 初期表示フラグ */
    private int rsv280initFlg__ = 0;

    /**
     * rsv280PeriodKbnを取得します。
     * @return rsv280PeriodKbn
     * */
    public int getRsv280PeriodKbn() {
        return rsv280PeriodKbn__;
    }
    /**
     * rsv280PeriodKbnをセットします。
     * @param rsv280PeriodKbn rsv280PeriodKbn
     */
    public void setRsv280PeriodKbn(int rsv280PeriodKbn) {
        rsv280PeriodKbn__ = rsv280PeriodKbn;
    }
    /**
     * <p>rsv280DefFrH を取得します。
     * @return rsv280DefFrH
     */
    public int getRsv280DefFrH() {
        return rsv280DefFrH__;
    }
    /**
     * <p>rsv280DefFrH をセットします。
     * @param rsv280DefFrH rsv280DefFrH
     */
    public void setRsv280DefFrH(int rsv280DefFrH) {
        rsv280DefFrH__ = rsv280DefFrH;
    }
    /**
     * <p>rsv280DefFrM を取得します。
     * @return rsv280DefFrM
     */
    public int getRsv280DefFrM() {
        return rsv280DefFrM__;
    }
    /**
     * <p>rsv280DefFrM をセットします。
     * @param rsv280DefFrM rsv280DefFrM
     */
    public void setRsv280DefFrM(int rsv280DefFrM) {
        rsv280DefFrM__ = rsv280DefFrM;
    }
    /**
     * <p>rsv280DefToH を取得します。
     * @return rsv280DefToH
     */
    public int getRsv280DefToH() {
        return rsv280DefToH__;
    }
    /**
     * <p>rsv280DefToH をセットします。
     * @param rsv280DefToH rsv280DefToH
     */
    public void setRsv280DefToH(int rsv280DefToH) {
        rsv280DefToH__ = rsv280DefToH;
    }
    /**
     * <p>rsv280DefToM を取得します。
     * @return rsv280DefToM
     */
    public int getRsv280DefToM() {
        return rsv280DefToM__;
    }
    /**
     * <p>rsv280DefToM をセットします。
     * @param rsv280DefToM rsv280DefToM
     */
    public void setRsv280DefToM(int rsv280DefToM) {
        rsv280DefToM__ = rsv280DefToM;
    }
    /**
     * <p>rsv280HourLabel を取得します。
     * @return rsv280HourLabel
     */
    public List<LabelValueBean> getRsv280HourLabel() {
        return rsv280HourLabel__;
    }
    /**
     * <p>rsv280HourLabel をセットします。
     * @param rsv280HourLabel rsv280HourLabel
     */
    public void setRsv280HourLabel(List<LabelValueBean> rsv280HourLabel) {
        rsv280HourLabel__ = rsv280HourLabel;
    }
    /**
     * <p>rsv280MinuteLabel を取得します。
     * @return rsv280MinuteLabel
     */
    public List<LabelValueBean> getRsv280MinuteLabel() {
        return rsv280MinuteLabel__;
    }
    /**
     * <p>rsv280MinuteLabel をセットします。
     * @param rsv280MinuteLabel rsv280MinuteLabel
     */
    public void setRsv280MinuteLabel(List<LabelValueBean> rsv280MinuteLabel) {
        rsv280MinuteLabel__ = rsv280MinuteLabel;
    }
    /**
     * <p>rsv280EditKbn を取得します。
     * @return rsv280EditKbn
     */
    /**
     * <p>rsv280EditKbn を取得します。
     * @return rsv280EditKbn
     */
    public int getRsv280EditKbn() {
        return rsv280EditKbn__;
    }
    /**
     * <p>rsv280EditKbn をセットします。
     * @param rsv280EditKbn rsv280EditKbn
     */
    public void setRsv280EditKbn(int rsv280EditKbn) {
        rsv280EditKbn__ = rsv280EditKbn;
    }
    /**
     * <p>rsv280Edit を取得します。
     * @return rsv280Edit
     */
    public int getRsv280Edit() {
        return rsv280Edit__;
    }
    /**
     * <p>rsv280Edit をセットします。
     * @param rsv280Edit rsv280Edit
     */
    public void setRsv280Edit(int rsv280Edit) {
        rsv280Edit__ = rsv280Edit;
    }
    /**
     * <p>rsv280PublicKbnを取得します。
     * @return rsv280PublicKbn
     * */
    public int getRsv280PublicKbn() {
        return rsv280PublicKbn__;
    }
    /**
     * rsv280PublicKbnをセットします。
     * @param rsv280PublicKbn rsv280PublicKbn
     * */
    public void setRsv280PublicKbn(int rsv280PublicKbn) {
        rsv280PublicKbn__ = rsv280PublicKbn;
    }
    /**
     * <p>rsv280Publicを取得します。
     * @return rsv280Public
     * */
    public int getRsv280Public() {
        return rsv280Public__;
    }
    /**
     * rsv280Publicをセットします。
     * @param rsv280Public rsv280Public
     * */
    public void setRsv280Public(int rsv280Public) {
        rsv280Public__ = rsv280Public;
    }
    /**
     * <p>rsv280initFlg を取得します。
     * @return rsv280initFlg
     */
    public int getRsv280initFlg() {
        return rsv280initFlg__;
    }
    /**
     * <p>rsv280initFlg をセットします。
     * @param rsv280initFlg rsv280initFlg
     */
    public void setRsv280initFlg(int rsv280initFlg) {
        rsv280initFlg__ = rsv280initFlg;
    }
}
