package jp.groupsession.v2.ntp.ntp089;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.util.LabelValueBean;

import jp.co.sjts.util.NullDefault;
import jp.groupsession.v2.cmn.biz.UserBiz;
import jp.groupsession.v2.cmn.cmn999.Cmn999Form;
import jp.groupsession.v2.cmn.dao.BaseUserModel;
import jp.groupsession.v2.cmn.dao.GroupModel;
import jp.groupsession.v2.cmn.dao.UsidSelectGrpNameDao;
import jp.groupsession.v2.cmn.dao.base.CmnPositionDao;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.ntp.GSValidateNippou;
import jp.groupsession.v2.ntp.ntp088.Ntp088Form;
import jp.groupsession.v2.struts.msg.GsMessage;
import jp.groupsession.v2.usr.GSConstUser;
import jp.groupsession.v2.usr.model.UsrLabelValueBean;


/**
 * <br>[機  能] 日報 テンプレート登録画面のフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Ntp089Form extends Ntp088Form {


    /** ユーザ情報 or アクセス制御コンボ(選択用)のグループコンボに設定する値 グループ一覧のVALUE */
    public static final int GROUP_COMBO_VALUE = -9;
    /** 特例アクセス名 MAX文字数 */
    public static final int MAXLEN_NAME = 50;
    /** 備考 MAX文字数 */
    public static final int MAXLEN_BIKO = 1000;
    /** 役職 権限区分 追加・変更・削除 */
    public static final int POTION_AUTH_EDIT = 0;
    /** 役職 権限区分 閲覧 */
    public static final int POTION_AUTH_VIEW = 1;

    /** 初期表示 */
    private int ntp089initFlg__ = 0;

    /** 特例アクセス名称 */
    private String ntp089name__ = null;
    /** 備考 */
    private String ntp089biko__ = null;
    /** 役職 */
    private int ntp089position__ = 0;
    /** 役職 権限区分 */
    private int ntp089positionAuth__ = 0;
    /** 役職コンボ */
    private List<LabelValueBean> ntp089positionCombo__  = null;

    /** 制限対象 */
    private String[] ntp089subject__ = null;
    /** 制限対象 グループ */
    private int ntp089subjectGroup__  = -1;
    /** 制限対象(選択用) */
    private String[] ntp089subjectSelect__  = null;
    /** 制限対象(未選択用) */
    private String[] ntp089subjectNoSelect__ = null;

    /** 許可ユーザ 追加・変更・削除 */
    private String[] ntp089editUser__ = null;
    /** 許可ユーザ 閲覧 */
    private String[] ntp089accessUser__ = null;
    /** 許可ユーザ グループ */
    private int ntp089accessGroup__  = -1;
    /** 許可ユーザ(選択用) */
    private String[] ntp089editUserSelect__  = null;
    /** 許可ユーザ 追加・変更・削除(選択用) */
    private String[] ntp089accessUserSelect__  = null;
    /** 許可ユーザ 閲覧(未選択用) */
    private String[] ntp089accessUserNoSelect__ = null;

    /** グループコンボ */
    private List<LabelValueBean> groupCombo__ = null;
    /** 制限対象 ユーザコンボ */
    private List<UsrLabelValueBean> ntp089subjectSelectCombo__  = null;
    /** 制限対象 未選択コンボ */
    private List<UsrLabelValueBean> ntp089subjectNoSelectCombo__  = null;
    /** 許可ユーザ 追加・変更・削除 ユーザコンボ */
    private List<UsrLabelValueBean> ntp089editUserSelectCombo__  = null;
    /** 許可ユーザ 閲覧 ユーザコンボ */
    private List<UsrLabelValueBean> ntp089accessSelectCombo__  = null;
    /** 許可ユーザ 未選択コンボ */
    private List<UsrLabelValueBean> ntp089accessNoSelectCombo__  = null;


    /**
     * <p>ntp089initFlg を取得します。
     * @return ntp089initFlg
     */
    public int getNtp089initFlg() {
        return ntp089initFlg__;
    }
    /**
     * <p>ntp089initFlg をセットします。
     * @param ntp089initFlg ntp089initFlg
     */
    public void setNtp089initFlg(int ntp089initFlg) {
        ntp089initFlg__ = ntp089initFlg;
    }
    /**
     * <p>ntp089name を取得します。
     * @return ntp089name
     */
    public String getNtp089name() {
        return ntp089name__;
    }
    /**
     * <p>ntp089name をセットします。
     * @param ntp089name ntp089name
     */
    public void setNtp089name(String ntp089name) {
        ntp089name__ = ntp089name;
    }
    /**
     * <p>ntp089biko を取得します。
     * @return ntp089biko
     */
    public String getNtp089biko() {
        return ntp089biko__;
    }
    /**
     * <p>ntp089biko をセットします。
     * @param ntp089biko ntp089biko
     */
    public void setNtp089biko(String ntp089biko) {
        ntp089biko__ = ntp089biko;
    }
    /**
     * <p>ntp089position を取得します。
     * @return ntp089position
     */
    public int getNtp089position() {
        return ntp089position__;
    }
    /**
     * <p>ntp089position をセットします。
     * @param ntp089position ntp089position
     */
    public void setNtp089position(int ntp089position) {
        ntp089position__ = ntp089position;
    }
    /**
     * <p>ntp089positionAuth を取得します。
     * @return ntp089positionAuth
     */
    public int getNtp089positionAuth() {
        return ntp089positionAuth__;
    }
    /**
     * <p>ntp089positionAuth をセットします。
     * @param ntp089positionAuth ntp089positionAuth
     */
    public void setNtp089positionAuth(int ntp089positionAuth) {
        ntp089positionAuth__ = ntp089positionAuth;
    }
    /**
     * <p>ntp089positionCombo を取得します。
     * @return ntp089positionCombo
     */
    public List<LabelValueBean> getNtp089positionCombo() {
        return ntp089positionCombo__;
    }
    /**
     * <p>ntp089positionCombo をセットします。
     * @param ntp089positionCombo ntp089positionCombo
     */
    public void setNtp089positionCombo(List<LabelValueBean> ntp089positionCombo) {
        ntp089positionCombo__ = ntp089positionCombo;
    }
    /**
     * <p>ntp089subject を取得します。
     * @return ntp089subject
     */
    public String[] getNtp089subject() {
        return ntp089subject__;
    }
    /**
     * <p>ntp089subject をセットします。
     * @param ntp089subject ntp089subject
     */
    public void setNtp089subject(String[] ntp089subject) {
        ntp089subject__ = ntp089subject;
    }
    /**
     * <p>ntp089subjectGroup を取得します。
     * @return ntp089subjectGroup
     */
    public int getNtp089subjectGroup() {
        return ntp089subjectGroup__;
    }
    /**
     * <p>ntp089subjectGroup をセットします。
     * @param ntp089subjectGroup ntp089subjectGroup
     */
    public void setNtp089subjectGroup(int ntp089subjectGroup) {
        ntp089subjectGroup__ = ntp089subjectGroup;
    }
    /**
     * <p>ntp089subjectSelect を取得します。
     * @return ntp089subjectSelect
     */
    public String[] getNtp089subjectSelect() {
        return ntp089subjectSelect__;
    }
    /**
     * <p>ntp089subjectSelect をセットします。
     * @param ntp089subjectSelect ntp089subjectSelect
     */
    public void setNtp089subjectSelect(String[] ntp089subjectSelect) {
        ntp089subjectSelect__ = ntp089subjectSelect;
    }
    /**
     * <p>ntp089subjectNoSelect を取得します。
     * @return ntp089subjectNoSelect
     */
    public String[] getNtp089subjectNoSelect() {
        return ntp089subjectNoSelect__;
    }
    /**
     * <p>ntp089subjectNoSelect をセットします。
     * @param ntp089subjectNoSelect ntp089subjectNoSelect
     */
    public void setNtp089subjectNoSelect(String[] ntp089subjectNoSelect) {
        ntp089subjectNoSelect__ = ntp089subjectNoSelect;
    }
    /**
     * <p>ntp089editUser を取得します。
     * @return ntp089editUser
     */
    public String[] getNtp089editUser() {
        return ntp089editUser__;
    }
    /**
     * <p>ntp089editUser をセットします。
     * @param ntp089editUser ntp089editUser
     */
    public void setNtp089editUser(String[] ntp089editUser) {
        ntp089editUser__ = ntp089editUser;
    }
    /**
     * <p>ntp089accessUser を取得します。
     * @return ntp089accessUser
     */
    public String[] getNtp089accessUser() {
        return ntp089accessUser__;
    }
    /**
     * <p>ntp089accessUser をセットします。
     * @param ntp089accessUser ntp089accessUser
     */
    public void setNtp089accessUser(String[] ntp089accessUser) {
        ntp089accessUser__ = ntp089accessUser;
    }
    /**
     * <p>ntp089accessGroup を取得します。
     * @return ntp089accessGroup
     */
    public int getNtp089accessGroup() {
        return ntp089accessGroup__;
    }
    /**
     * <p>ntp089accessGroup をセットします。
     * @param ntp089accessGroup ntp089accessGroup
     */
    public void setNtp089accessGroup(int ntp089accessGroup) {
        ntp089accessGroup__ = ntp089accessGroup;
    }
    /**
     * <p>ntp089editUserSelect を取得します。
     * @return ntp089editUserSelect
     */
    public String[] getNtp089editUserSelect() {
        return ntp089editUserSelect__;
    }
    /**
     * <p>ntp089editUserSelect をセットします。
     * @param ntp089editUserSelect ntp089editUserSelect
     */
    public void setNtp089editUserSelect(String[] ntp089editUserSelect) {
        ntp089editUserSelect__ = ntp089editUserSelect;
    }
    /**
     * <p>ntp089accessUserSelect を取得します。
     * @return ntp089accessUserSelect
     */
    public String[] getNtp089accessUserSelect() {
        return ntp089accessUserSelect__;
    }
    /**
     * <p>ntp089accessUserSelect をセットします。
     * @param ntp089accessUserSelect ntp089accessUserSelect
     */
    public void setNtp089accessUserSelect(String[] ntp089accessUserSelect) {
        ntp089accessUserSelect__ = ntp089accessUserSelect;
    }
    /**
     * <p>ntp089accessUserNoSelect を取得します。
     * @return ntp089accessUserNoSelect
     */
    public String[] getNtp089accessUserNoSelect() {
        return ntp089accessUserNoSelect__;
    }
    /**
     * <p>ntp089accessUserNoSelect をセットします。
     * @param ntp089accessUserNoSelect ntp089accessUserNoSelect
     */
    public void setNtp089accessUserNoSelect(String[] ntp089accessUserNoSelect) {
        ntp089accessUserNoSelect__ = ntp089accessUserNoSelect;
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
     * <p>ntp089subjectSelectCombo を取得します。
     * @return ntp089subjectSelectCombo
     */
    public List<UsrLabelValueBean> getNtp089subjectSelectCombo() {
        return ntp089subjectSelectCombo__;
    }
    /**
     * <p>ntp089subjectSelectCombo をセットします。
     * @param ntp089subjectSelectCombo ntp089subjectSelectCombo
     */
    public void setNtp089subjectSelectCombo(
            List<UsrLabelValueBean> ntp089subjectSelectCombo) {
        ntp089subjectSelectCombo__ = ntp089subjectSelectCombo;
    }
    /**
     * <p>ntp089subjectNoSelectCombo を取得します。
     * @return ntp089subjectNoSelectCombo
     */
    public List<UsrLabelValueBean> getNtp089subjectNoSelectCombo() {
        return ntp089subjectNoSelectCombo__;
    }
    /**
     * <p>ntp089subjectNoSelectCombo をセットします。
     * @param ntp089subjectNoSelectCombo ntp089subjectNoSelectCombo
     */
    public void setNtp089subjectNoSelectCombo(
            List<UsrLabelValueBean> ntp089subjectNoSelectCombo) {
        ntp089subjectNoSelectCombo__ = ntp089subjectNoSelectCombo;
    }
    /**
     * <p>ntp089editUserSelectCombo を取得します。
     * @return ntp089editUserSelectCombo
     */
    public List<UsrLabelValueBean> getNtp089editUserSelectCombo() {
        return ntp089editUserSelectCombo__;
    }
    /**
     * <p>ntp089editUserSelectCombo をセットします。
     * @param ntp089editUserSelectCombo ntp089editUserSelectCombo
     */
    public void setNtp089editUserSelectCombo(
            List<UsrLabelValueBean> ntp089editUserSelectCombo) {
        ntp089editUserSelectCombo__ = ntp089editUserSelectCombo;
    }
    /**
     * <p>ntp089accessSelectCombo を取得します。
     * @return ntp089accessSelectCombo
     */
    public List<UsrLabelValueBean> getNtp089accessSelectCombo() {
        return ntp089accessSelectCombo__;
    }
    /**
     * <p>ntp089accessSelectCombo をセットします。
     * @param ntp089accessSelectCombo ntp089accessSelectCombo
     */
    public void setNtp089accessSelectCombo(
            List<UsrLabelValueBean> ntp089accessSelectCombo) {
        ntp089accessSelectCombo__ = ntp089accessSelectCombo;
    }
    /**
     * <p>ntp089accessNoSelectCombo を取得します。
     * @return ntp089accessNoSelectCombo
     */
    public List<UsrLabelValueBean> getNtp089accessNoSelectCombo() {
        return ntp089accessNoSelectCombo__;
    }
    /**
     * <p>ntp089accessNoSelectCombo をセットします。
     * @param ntp089accessNoSelectCombo ntp089accessNoSelectCombo
     */
    public void setNtp089accessNoSelectCombo(
            List<UsrLabelValueBean> ntp089accessNoSelectCombo) {
        ntp089accessNoSelectCombo__ = ntp089accessNoSelectCombo;
    }

    /**
     * <br>[機  能] 入力チェックを行う
     * <br>[解  説]
     * <br>[備  考]
     * @param reqMdl リクエスト情報
     * @param con コネクション
     * @return エラー
     * @throws SQLException SQL実行時例外
     */
    public ActionErrors validateCheck(RequestModel reqMdl, Connection con) throws SQLException {
        ActionErrors errors = new ActionErrors();
        GsMessage gsMsg = new GsMessage(reqMdl);

        //特例アクセス名入力チェック
        GSValidateNippou.validateCmnFieldText(
                errors,
                gsMsg.getMessage("schedule.sch240.04"),
                ntp089name__,
                "ntp089name",
                MAXLEN_NAME, true);

        //制限対象入力チェック
        __validateTargetCheck(errors, con, reqMdl);
        //アクセス許可入力チェック
        __validatePermitCheck(errors, con, reqMdl);

        //備考入力チェック
        GSValidateNippou.validateCmnFieldText(errors, ntp089biko__,
                "ntp089biko",
                gsMsg.getMessage("cmn.memo"),
                MAXLEN_BIKO,
                false);
        return errors;

    }

    /**
    *
    * <br>[機  能] 制限先入力チェック
    * <br>[解  説]
    * <br>[備  考]
    * @param errors アクションエラー
    * @param con コネクション
    * @param reqMdl リクエストモデル
    * @throws SQLException SQL実行時例外
    */
    private void __validateTargetCheck(ActionErrors errors, Connection con, RequestModel reqMdl)
    throws SQLException {
        //制限対象入力チェック
        GsMessage gsMsg = new GsMessage(reqMdl);
        ArrayList<Integer> grpSids = new ArrayList<Integer>();
        List<String> usrSids = new ArrayList<String>();
        if (ntp089subject__ != null) {
            for (String target : ntp089subject__) {
                if (target.startsWith("G")) {
                    grpSids.add(NullDefault.getInt(
                            target.substring(1), -1));
                } else {
                    if (NullDefault.getInt(
                            target, -1) > GSConstUser.USER_RESERV_SID) {
                        usrSids.add(target);
                    }
                }
            }
        }
        int count = 0;
        UsidSelectGrpNameDao gdao = new UsidSelectGrpNameDao(con);
        ArrayList<GroupModel> glist = gdao.selectGroupNmListOrderbyClass(grpSids);
        if (glist != null) {
            count += glist.size();
        }
        UserBiz userBiz = new UserBiz();
        ArrayList<BaseUserModel> ulist
                = userBiz.getBaseUserList(con,
                                        (String[]) usrSids.toArray(new String[usrSids.size()]));
        if (ulist != null) {
            count += ulist.size();
        }
        if (count == 0) {
            GSValidateNippou.validateNoSelect(errors, null,
                    "ntp089subject",
                    gsMsg.getMessage("schedule.sch240.06"));

        }
    }

    /**
   *
   * <br>[機  能] 許可入力チェック
   * <br>[解  説]
   * <br>[備  考]
   * @param errors アクションエラー
   * @param con コネクション
   * @param reqMdl リクエストモデル
   * @throws SQLException SQL実行時例外
   */
    private void __validatePermitCheck(ActionErrors errors, Connection con, RequestModel reqMdl)
    throws SQLException {

        GsMessage gsMsg = new GsMessage(reqMdl);
        ArrayList<Integer> grpSids = new ArrayList<Integer>();
        List<String> usrSids = new ArrayList<String>();

        if (ntp089accessUser__ != null) {
            for (String target : ntp089accessUser__) {
                if (target.startsWith("G")) {
                    grpSids.add(NullDefault.getInt(
                            target.substring(1), -1));
                } else {
                    if (NullDefault.getInt(
                            target, -1) > GSConstUser.USER_RESERV_SID) {
                        usrSids.add(target);
                    }
                }
            }
        }

        if (ntp089editUser__ != null) {
            for (String target : ntp089editUser__) {
                if (target.startsWith("G")) {
                    grpSids.add(NullDefault.getInt(
                            target.substring(1), -1));
                } else {
                    if (NullDefault.getInt(
                            target, -1) > GSConstUser.USER_RESERV_SID) {
                        usrSids.add(target);
                    }
                }
            }
        }

        int count = 0;
        UsidSelectGrpNameDao gdao = new UsidSelectGrpNameDao(con);
        ArrayList<GroupModel> glist = gdao.selectGroupNmListOrderbyClass(grpSids);
        if (glist != null) {
            count += glist.size();
        }
        UserBiz userBiz = new UserBiz();
        ArrayList<BaseUserModel> ulist
                = userBiz.getBaseUserList(con,
                                        (String[]) usrSids.toArray(new String[usrSids.size()]));
        if (ulist != null) {
            count += ulist.size();
        }
        CmnPositionDao pdao = new CmnPositionDao(con);
        if (ntp089position__ > 0 && pdao.getPosInfo(ntp089position__) != null) {
            count++;
        }

        if (count == 0) {
            GSValidateNippou.validateNoSelect(errors, null,
                    "ntp089accessUser",
                    gsMsg.getMessage("schedule.sch240.08"));
        }
    }

    /**
     * <br>[機  能] 共通メッセージ画面遷移時に保持するパラメータを設定する
     * <br>[解  説]
     * <br>[備  考]
     * @param msgForm 共通メッセージ画面Form
     */
    public void setHiddenParam(Cmn999Form msgForm) {
        super.setHiddenParam(msgForm);
        msgForm.addHiddenParam("ntp089initFlg", ntp089initFlg__);
        msgForm.addHiddenParam("ntp089name", ntp089name__);
        msgForm.addHiddenParam("ntp089biko", ntp089biko__);
        msgForm.addHiddenParam("ntp089position", ntp089position__);
        msgForm.addHiddenParam("ntp089positionAuth", ntp089positionAuth__);
        msgForm.addHiddenParam("ntp089subject", ntp089subject__);
        msgForm.addHiddenParam("ntp089subjectGroup", ntp089subjectGroup__);
        msgForm.addHiddenParam("ntp089subjectSelect", ntp089subjectSelect__);
        msgForm.addHiddenParam("ntp089subjectNoSelect", ntp089subjectNoSelect__);
        msgForm.addHiddenParam("ntp089editUser", ntp089editUser__);
        msgForm.addHiddenParam("ntp089accessUser", ntp089accessUser__);
        msgForm.addHiddenParam("ntp089accessGroup", ntp089accessGroup__);
        msgForm.addHiddenParam("ntp089accessUserSelect", ntp089accessUserSelect__);
        msgForm.addHiddenParam("ntp089accessUserNoSelect", ntp089accessUserNoSelect__);
    }

}
