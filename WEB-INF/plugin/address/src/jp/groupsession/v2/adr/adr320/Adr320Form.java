package jp.groupsession.v2.adr.adr320;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jp.co.sjts.util.struts.StrutsUtil;
import jp.groupsession.v2.adr.adr030.Adr030Form;
import jp.groupsession.v2.adr.model.AdrArestModel;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.struts.msg.GsMessage;
import jp.groupsession.v2.usr.model.UsrLabelValueBean;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;

/**
 * <br>[機  能] アドレス帳 管理者設定 権限設定画面のフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Adr320Form extends Adr030Form {

    /** 初期化フラグ*/
    private int adr320initFlg__ = 0;

    /** 画面項目登録者制限権限有無 */
    private int adr320AacArestKbn__ = 0;
    /** アンケート作成可能ユーザリスト */
    private String[] adr320AdrArestList__ = null;

    /** グループSID */
    private String adr320GroupSid__ = null;
    /** グループ一覧 */
    private List<UsrLabelValueBean> adr320GroupLabel__ = null;

    /** アンケート発信対象者リスト（左） */
    private ArrayList<UsrLabelValueBean> adr320AdrArestSelectLabel__ = null;
    /** アンケート発信対象者リスト（右） */
    private ArrayList<UsrLabelValueBean> adr320AdrArestBelongLabel__ = null;
    /** アンケート発信対象者 選択SID （左） */
    private String[] adr320AdrArestSelectSid__ = null;
    /** アンケート非発信対象者 選択SID （右） */
    private String[] adr320AdrArestBelongSid__ = null;

    /**
     * <br>[機  能] デフォルトコンストラクタ
     * <br>[解  説]
     * <br>[備  考]
     */
    public Adr320Form() {

    }

    /**
     * <p>adr320initFlg を取得します。
     * @return adr320initFlg
     */
    public int getAdr320initFlg() {
        return adr320initFlg__;
    }

    /**
     * <p>adr320initFlg をセットします。
     * @param adr320initFlg adr320initFlg
     */
    public void setAdr320initFlg(int adr320initFlg) {
        adr320initFlg__ = adr320initFlg;
    }

    /**
     * <p>adr320AacArestKbn を取得します。
     * @return adr320AacArestKbn
     */
    public int getAdr320AacArestKbn() {
        return adr320AacArestKbn__;
    }

    /**
     * <p>adr320AacArestKbn をセットします。
     * @param adr320AacArestKbn adr320AacArestKbn
     */
    public void setAdr320AacArestKbn(int adr320AacArestKbn) {
        adr320AacArestKbn__ = adr320AacArestKbn;
    }

    /**
     * <p>adr320AdrArestList を取得します。
     * @return adr320AdrArestList
     */
    public String[] getAdr320AdrArestList() {
        return adr320AdrArestList__;
    }

    /**
     * <p>adr320AdrArestList をセットします。
     * @param adr320AdrArestList adr320AdrArestList
     */
    public void setAdr320AdrArestList(String[] adr320AdrArestList) {
        adr320AdrArestList__ = adr320AdrArestList;
    }

    /**
     * <p>adr320GroupSid を取得します。
     * @return adr320GroupSid
     */
    public String getAdr320GroupSid() {
        return adr320GroupSid__;
    }

    /**
     * <p>adr320GroupSid をセットします。
     * @param adr320GroupSid adr320GroupSid
     */
    public void setAdr320GroupSid(String adr320GroupSid) {
        adr320GroupSid__ = adr320GroupSid;
    }

    /**
     * <p>adr320GroupLabel を取得します。
     * @return adr320GroupLabel
     */
    public List<UsrLabelValueBean> getAdr320GroupLabel() {
        return adr320GroupLabel__;
    }

    /**
     * <p>adr320GroupLabel をセットします。
     * @param adr320GroupLabel adr320GroupLabel
     */
    public void setAdr320GroupLabel(List<UsrLabelValueBean> adr320GroupLabel) {
        adr320GroupLabel__ = adr320GroupLabel;
    }

    /**
     * <p>adr320AdrArestSelectLabel を取得します。
     * @return adr320AdrArestSelectLabel
     */
    public ArrayList<UsrLabelValueBean> getAdr320AdrArestSelectLabel() {
        return adr320AdrArestSelectLabel__;
    }

    /**
     * <p>adr320AdrArestSelectLabel をセットします。
     * @param adr320AdrArestSelectLabel adr320AdrArestSelectLabel
     */
    public void setAdr320AdrArestSelectLabel(
            ArrayList<UsrLabelValueBean> adr320AdrArestSelectLabel) {
        adr320AdrArestSelectLabel__ = adr320AdrArestSelectLabel;
    }

    /**
     * <p>adr320AdrArestBelongLabel を取得します。
     * @return adr320AdrArestBelongLabel
     */
    public ArrayList<UsrLabelValueBean> getAdr320AdrArestBelongLabel() {
        return adr320AdrArestBelongLabel__;
    }

    /**
     * <p>adr320AdrArestBelongLabel をセットします。
     * @param adr320AdrArestBelongLabel adr320AdrArestBelongLabel
     */
    public void setAdr320AdrArestBelongLabel(
            ArrayList<UsrLabelValueBean> adr320AdrArestBelongLabel) {
        adr320AdrArestBelongLabel__ = adr320AdrArestBelongLabel;
    }

    /**
     * <p>adr320AdrArestSelectSid を取得します。
     * @return adr320AdrArestSelectSid
     */
    public String[] getAdr320AdrArestSelectSid() {
        return adr320AdrArestSelectSid__;
    }

    /**
     * <p>adr320AdrArestSelectSid をセットします。
     * @param adr320AdrArestSelectSid adr320AdrArestSelectSid
     */
    public void setAdr320AdrArestSelectSid(String[] adr320AdrArestSelectSid) {
        adr320AdrArestSelectSid__ = adr320AdrArestSelectSid;
    }

    /**
     * <p>adr320AdrArestBelongSid を取得します。
     * @return adr320AdrArestBelongSid
     */
    public String[] getAdr320AdrArestBelongSid() {
        return adr320AdrArestBelongSid__;
    }

    /**
     * <p>adr320AdrArestBelongSid をセットします。
     * @param adr320AdrArestBelongSid adr320AdrArestBelongSid
     */
    public void setAdr320AdrArestBelongSid(String[] adr320AdrArestBelongSid) {
        adr320AdrArestBelongSid__ = adr320AdrArestBelongSid;
    }
    /**
     *
     * <br>[機  能] 確定時 入力チェック
     * <br>[解  説]
     * <br>[備  考]
     * @param reqMdl リクエストモデル
     * @param con コネクション
     * @return エラーオブジェクト
     * @throws SQLException SQL実行時例外
     */
    public ActionErrors validateCommit(RequestModel reqMdl,
            Connection con) throws SQLException {
        ActionErrors errors = new ActionErrors();
        GsMessage gsMsg = new GsMessage(reqMdl);

        if (adr320AacArestKbn__ != 0) {
            Adr320Biz biz = new Adr320Biz();
            List<AdrArestModel> list = biz.createArestList(reqMdl, con, adr320AdrArestList__);
            if (list.isEmpty()) {
                String msgKey = "error.select.required.text";
                ActionMessage msg = new ActionMessage(msgKey, gsMsg.getMessage("cmn.registant"));
                StrutsUtil.addMessage(errors, msg, "adr320AdrArestList." + msgKey);
            }
        }

        return errors;
    }


}