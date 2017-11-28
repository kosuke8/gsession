package jp.groupsession.v2.usr.model;

import jp.groupsession.v2.cmn.GSConst;
import jp.groupsession.v2.cmn.model.CmnLabelValueModel;
import jp.groupsession.v2.cmn.model.base.CmnUsrmInfModel;
import jp.groupsession.v2.usr.UserUtil;
/**
 *
 * <br>[機  能] ユーザ選択用ラベル
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class UsrLabelValueBean extends CmnLabelValueModel {
    /** ユーザログイン有効フラグ disableとは異なる*/
    private int usrUkoFlg__ = GSConst.YUKOMUKO_YUKO;
    /**
     * コンストラクタ
     */
    public UsrLabelValueBean() {
        super(null, null, "");
    }
    /**
     * コンストラクタ
     * @param label ラベル
     * @param value 値
     */
    public UsrLabelValueBean(String label, String value) {
        super(label, value, "");
    }
    /**
     * コンストラクタ
     * @param label ラベル
     * @param value 値
     * @param ukoFlg 有効フラグ
     */
    public UsrLabelValueBean(String label, String value, int ukoFlg) {
        super(label, value, "");
        setUsrUkoFlg(ukoFlg);
    }
    /**
     * コンストラクタ
     * @param usrMdl ユーザ情報
     */
    public UsrLabelValueBean(CmnUsrmInfModel usrMdl) {
        super(
                UserUtil.makeName(usrMdl.getUsiSei(), usrMdl.getUsiMei()),
                String.valueOf(usrMdl.getUsrSid()), "");
        setUsrUkoFlg(usrMdl.getUsrUkoFlg());

    }
    /**
     * <p>usrUkoFlg を取得します。
     * @return usrUkoFlg
     */
    public int getUsrUkoFlg() {
        return usrUkoFlg__;
    }
    /**
     * <p>usrUkoFlg をセットします。
     * @param usrUkoFlg usrUkoFlg
     */
    public void setUsrUkoFlg(int usrUkoFlg) {
        usrUkoFlg__ = usrUkoFlg;
    }
    /**
     *
     * <br>[機  能] ログイン停止状態用のCSSクラス名を返す
     * <br>[解  説]
     * <br>[備  考] JSPのスクリプトレットにて使用
     * @return ログイン停止状態用のCSSクラス名
     */
    public String getCSSClassNameNormal() {
        return UserUtil.getCSSClassNameNormal(usrUkoFlg__);
    }
    /**
     *
     * <br>[機  能] ログイン停止状態用のCSSクラス名を返す
     * <br>[解  説]
     * <br>[備  考] JSPのスクリプトレットにて使用
     * @return ログイン停止状態用のCSSクラス名
     */
    public String getCSSClassNameOption() {
        return UserUtil.getCSSClassNameOption(usrUkoFlg__);
    }
}
