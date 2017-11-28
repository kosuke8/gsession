package jp.groupsession.v2.usr.usr033kn;

import java.util.List;

import jp.groupsession.v2.cmn.model.base.CmnUsrmInfModel;
import jp.groupsession.v2.usr.usr033.Usr033Form;

/**
 * <br>[機  能] メイン 管理者設定 ユーザ一括削除確認画面のフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Usr033knForm extends Usr033Form {

    /** 取込みファイル名 */
    private String usr033knFileName__ = null;
    /** 取込み予定ユーザ情報 */
    private List<CmnUsrmInfModel> usr033knImpList__ = null;

    /**
     * <p>usr033knFileName を取得します。
     * @return usr033knFileName
     */
    public String getUsr033knFileName() {
        return usr033knFileName__;
    }

    /**
     * <p>usr033knFileName をセットします。
     * @param usr033knFileName usr033knFileName
     */
    public void setUsr033knFileName(String usr033knFileName) {
        usr033knFileName__ = usr033knFileName;
    }

    /**
     * <p>usr033knImpList を取得します。
     * @return usr033knImpList
     */
    public List<CmnUsrmInfModel> getUsr033knImpList() {
        return usr033knImpList__;
    }

    /**
     * <p>usr033knImpList をセットします。
     * @param usr033knImpList usr033knImpList
     */
    public void setUsr033knImpList(List<CmnUsrmInfModel> usr033knImpList) {
        usr033knImpList__ = usr033knImpList;
    }
}
