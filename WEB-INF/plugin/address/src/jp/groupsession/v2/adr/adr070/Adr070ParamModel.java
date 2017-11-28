package jp.groupsession.v2.adr.adr070;


import java.util.List;

import jp.groupsession.v2.adr.GSConstAddress;
import jp.groupsession.v2.adr.adr010.Adr010ParamModel;
import jp.groupsession.v2.cmn.GSConst;
import jp.groupsession.v2.usr.model.UsrLabelValueBean;

import org.apache.struts.util.LabelValueBean;

/**
 * <br>[機  能] アドレス帳 アドレスインポート画面のフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Adr070ParamModel extends Adr010ParamModel {
    /** 画面初期表示フラグ*/
    private int adr070init__ = 0;
    /** 取込みファイル */
    private String[] adr070file__ = null;
    /** 会社 */
    private int adr070selectCompany__ = 0;
    /** 支店・営業所 */
    private int adr070selectCompanyBase__ = 0;
    /** 閲覧権限 */
    private int adr070permitView__ = GSConst.ADR_VIEWPERMIT_OWN;
    /** 閲覧グループ */
    private String[] adr070permitViewGroup__ = null;
    /** 閲覧ユーザ */
    private String[] adr070permitViewUser__ = null;
    /** 閲覧ユーザグループ */
    private int adr070permitViewUserGroup__ = 0;
    /** 編集権限 */
    private int adr070permitEdit__ = GSConstAddress.EDITPERMIT_OWN;
    /** 編集グループ */
    private String[] adr070permitEditGroup__ = null;
    /** 編集ユーザ */
    private String[] adr070permitEditUser__ = null;
    /** 編集ユーザグループ */
    private int adr070permitEditUserGroup__ = 0;

    /** 取り込みファイルコンボ */
    private List<LabelValueBean> adr070fileCombo__ = null;
    /** 会社コンボ */
    private List<LabelValueBean> adr070CompanyCombo__ = null;
    /** 支店・営業所コンボ */
    private List<LabelValueBean> adr070CompanyBaseCombo__ = null;
    /** 閲覧グループ(選択用) */
    private String[] adr070selectPermitViewGroup__  = null;
    /** 閲覧グループ(未選択 選択用) */
    private String[] adr070NoSelectPermitViewGroup__ = null;
    /** 閲覧グループコンボ */
    private List<LabelValueBean> selectPermitViewGroup__ = null;
    /** 閲覧グループ(未選択)コンボ */
    private List<LabelValueBean> noSelectPermitViewGroup__ = null;
    /** 閲覧ユーザ(選択用) */
    private String[] adr070selectPermitViewUser__  = null;
    /** 閲覧ユーザ(未選択 選択用) */
    private String[] adr070NoSelectPermitViewUser__ = null;
    /** 閲覧ユーザコンボ */
    private List<UsrLabelValueBean> selectPermitViewUser__ = null;
    /** 閲覧ユーザ(未選択)コンボ */
    private List<UsrLabelValueBean> noSelectPermitViewUser__ = null;
    /** 編集グループ(選択用) */
    private String[] adr070selectPermitEditGroup__  = null;
    /** 編集グループ(未選択 選択用) */
    private String[] adr070NoSelectPermitEditGroup__ = null;
    /** 編集グループコンボ */
    private List<LabelValueBean> selectPermitEditGroup__ = null;
    /** 編集グループ(未選択)コンボ */
    private List<LabelValueBean> noSelectPermitEditGroup__ = null;
    /** 編集ユーザ(選択用) */
    private String[] adr070selectPermitEditUser__  = null;
    /** 編集ユーザ(未選択 選択用) */
    private String[] adr070NoSelectPermitEditUser__ = null;
    /** 編集ユーザコンボ */
    private List<UsrLabelValueBean> selectPermitEditUser__ = null;
    /** 編集ユーザ(未選択)コンボ */
    private List<UsrLabelValueBean> noSelectPermitEditUser__ = null;

    /** 担当者(選択用) */
    private String[] adr070selectTantoList__ = null;
    /** 担当者(未選択 選択用) */
    private String[] adr070NoSelectTantoList__ = null;
    /** 担当者グループ */
    private int adr070tantoGroup__ = -2;
    /** 担当者コンボ */
    private List<UsrLabelValueBean> selectTantoCombo__ = null;
    /** 担当者(未選択)コンボ */
    private List<UsrLabelValueBean> noSelectTantoCombo__ = null;
    /** 担当者 */
    private String[] adr070tantoList__ = null;

    /** 画面モード 0:通常, 1:会社同時登録 **/
    private int adr070cmdMode__ = 1;
    /** 既存のユーザ情報更新フラグ */
    private int adr070updateFlg__ = 0;


    /**
     * <p>adr070NoSelectPermitEditGroup を取得します。
     * @return adr070NoSelectPermitEditGroup
     */
    public String[] getAdr070NoSelectPermitEditGroup() {
        return adr070NoSelectPermitEditGroup__;
    }

    /**
     * <p>adr070NoSelectPermitEditGroup をセットします。
     * @param adr070NoSelectPermitEditGroup adr070NoSelectPermitEditGroup
     */
    public void setAdr070NoSelectPermitEditGroup(
            String[] adr070NoSelectPermitEditGroup) {
        adr070NoSelectPermitEditGroup__ = adr070NoSelectPermitEditGroup;
    }

    /**
     * <p>adr070NoSelectPermitEditUser を取得します。
     * @return adr070NoSelectPermitEditUser
     */
    public String[] getAdr070NoSelectPermitEditUser() {
        return adr070NoSelectPermitEditUser__;
    }

    /**
     * <p>adr070NoSelectPermitEditUser をセットします。
     * @param adr070NoSelectPermitEditUser adr070NoSelectPermitEditUser
     */
    public void setAdr070NoSelectPermitEditUser(
            String[] adr070NoSelectPermitEditUser) {
        adr070NoSelectPermitEditUser__ = adr070NoSelectPermitEditUser;
    }

    /**
     * <p>adr070NoSelectPermitViewGroup を取得します。
     * @return adr070NoSelectPermitViewGroup
     */
    public String[] getAdr070NoSelectPermitViewGroup() {
        return adr070NoSelectPermitViewGroup__;
    }

    /**
     * <p>adr070NoSelectPermitViewGroup をセットします。
     * @param adr070NoSelectPermitViewGroup adr070NoSelectPermitViewGroup
     */
    public void setAdr070NoSelectPermitViewGroup(
            String[] adr070NoSelectPermitViewGroup) {
        adr070NoSelectPermitViewGroup__ = adr070NoSelectPermitViewGroup;
    }

    /**
     * <p>adr070NoSelectPermitViewUser を取得します。
     * @return adr070NoSelectPermitViewUser
     */
    public String[] getAdr070NoSelectPermitViewUser() {
        return adr070NoSelectPermitViewUser__;
    }

    /**
     * <p>adr070NoSelectPermitViewUser をセットします。
     * @param adr070NoSelectPermitViewUser adr070NoSelectPermitViewUser
     */
    public void setAdr070NoSelectPermitViewUser(
            String[] adr070NoSelectPermitViewUser) {
        adr070NoSelectPermitViewUser__ = adr070NoSelectPermitViewUser;
    }

    /**
     * <p>adr070permitEdit を取得します。
     * @return adr070permitEdit
     */
    public int getAdr070permitEdit() {
        return adr070permitEdit__;
    }

    /**
     * <p>adr070permitEdit をセットします。
     * @param adr070permitEdit adr070permitEdit
     */
    public void setAdr070permitEdit(int adr070permitEdit) {
        adr070permitEdit__ = adr070permitEdit;
    }

    /**
     * <p>adr070permitEditGroup を取得します。
     * @return adr070permitEditGroup
     */
    public String[] getAdr070permitEditGroup() {
        return adr070permitEditGroup__;
    }

    /**
     * <p>adr070permitEditGroup をセットします。
     * @param adr070permitEditGroup adr070permitEditGroup
     */
    public void setAdr070permitEditGroup(String[] adr070permitEditGroup) {
        adr070permitEditGroup__ = adr070permitEditGroup;
    }

    /**
     * <p>adr070permitEditUser を取得します。
     * @return adr070permitEditUser
     */
    public String[] getAdr070permitEditUser() {
        return adr070permitEditUser__;
    }

    /**
     * <p>adr070permitEditUser をセットします。
     * @param adr070permitEditUser adr070permitEditUser
     */
    public void setAdr070permitEditUser(String[] adr070permitEditUser) {
        adr070permitEditUser__ = adr070permitEditUser;
    }

    /**
     * <p>adr070permitEditUserGroup を取得します。
     * @return adr070permitEditUserGroup
     */
    public int getAdr070permitEditUserGroup() {
        return adr070permitEditUserGroup__;
    }

    /**
     * <p>adr070permitEditUserGroup をセットします。
     * @param adr070permitEditUserGroup adr070permitEditUserGroup
     */
    public void setAdr070permitEditUserGroup(int adr070permitEditUserGroup) {
        adr070permitEditUserGroup__ = adr070permitEditUserGroup;
    }

    /**
     * <p>adr070permitView を取得します。
     * @return adr070permitView
     */
    public int getAdr070permitView() {
        return adr070permitView__;
    }

    /**
     * <p>adr070permitView をセットします。
     * @param adr070permitView adr070permitView
     */
    public void setAdr070permitView(int adr070permitView) {
        adr070permitView__ = adr070permitView;
    }

    /**
     * <p>adr070permitViewGroup を取得します。
     * @return adr070permitViewGroup
     */
    public String[] getAdr070permitViewGroup() {
        return adr070permitViewGroup__;
    }

    /**
     * <p>adr070permitViewGroup をセットします。
     * @param adr070permitViewGroup adr070permitViewGroup
     */
    public void setAdr070permitViewGroup(String[] adr070permitViewGroup) {
        adr070permitViewGroup__ = adr070permitViewGroup;
    }

    /**
     * <p>adr070permitViewUser を取得します。
     * @return adr070permitViewUser
     */
    public String[] getAdr070permitViewUser() {
        return adr070permitViewUser__;
    }

    /**
     * <p>adr070permitViewUser をセットします。
     * @param adr070permitViewUser adr070permitViewUser
     */
    public void setAdr070permitViewUser(String[] adr070permitViewUser) {
        adr070permitViewUser__ = adr070permitViewUser;
    }

    /**
     * <p>adr070permitViewUserGroup を取得します。
     * @return adr070permitViewUserGroup
     */
    public int getAdr070permitViewUserGroup() {
        return adr070permitViewUserGroup__;
    }

    /**
     * <p>adr070permitViewUserGroup をセットします。
     * @param adr070permitViewUserGroup adr070permitViewUserGroup
     */
    public void setAdr070permitViewUserGroup(int adr070permitViewUserGroup) {
        adr070permitViewUserGroup__ = adr070permitViewUserGroup;
    }

    /**
     * <p>adr070selectCompany を取得します。
     * @return adr070selectCompany
     */
    public int getAdr070selectCompany() {
        return adr070selectCompany__;
    }

    /**
     * <p>adr070selectCompany をセットします。
     * @param adr070selectCompany adr070selectCompany
     */
    public void setAdr070selectCompany(int adr070selectCompany) {
        adr070selectCompany__ = adr070selectCompany;
    }

    /**
     * <p>adr070selectCompanyBase を取得します。
     * @return adr070selectCompanyBase
     */
    public int getAdr070selectCompanyBase() {
        return adr070selectCompanyBase__;
    }

    /**
     * <p>adr070selectCompanyBase をセットします。
     * @param adr070selectCompanyBase adr070selectCompanyBase
     */
    public void setAdr070selectCompanyBase(int adr070selectCompanyBase) {
        adr070selectCompanyBase__ = adr070selectCompanyBase;
    }

    /**
     * <p>adr070selectPermitEditGroup を取得します。
     * @return adr070selectPermitEditGroup
     */
    public String[] getAdr070selectPermitEditGroup() {
        return adr070selectPermitEditGroup__;
    }

    /**
     * <p>adr070selectPermitEditGroup をセットします。
     * @param adr070selectPermitEditGroup adr070selectPermitEditGroup
     */
    public void setAdr070selectPermitEditGroup(String[] adr070selectPermitEditGroup) {
        adr070selectPermitEditGroup__ = adr070selectPermitEditGroup;
    }

    /**
     * <p>adr070selectPermitEditUser を取得します。
     * @return adr070selectPermitEditUser
     */
    public String[] getAdr070selectPermitEditUser() {
        return adr070selectPermitEditUser__;
    }

    /**
     * <p>adr070selectPermitEditUser をセットします。
     * @param adr070selectPermitEditUser adr070selectPermitEditUser
     */
    public void setAdr070selectPermitEditUser(String[] adr070selectPermitEditUser) {
        adr070selectPermitEditUser__ = adr070selectPermitEditUser;
    }

    /**
     * <p>adr070selectPermitViewGroup を取得します。
     * @return adr070selectPermitViewGroup
     */
    public String[] getAdr070selectPermitViewGroup() {
        return adr070selectPermitViewGroup__;
    }

    /**
     * <p>adr070selectPermitViewGroup をセットします。
     * @param adr070selectPermitViewGroup adr070selectPermitViewGroup
     */
    public void setAdr070selectPermitViewGroup(String[] adr070selectPermitViewGroup) {
        adr070selectPermitViewGroup__ = adr070selectPermitViewGroup;
    }

    /**
     * <p>adr070selectPermitViewUser を取得します。
     * @return adr070selectPermitViewUser
     */
    public String[] getAdr070selectPermitViewUser() {
        return adr070selectPermitViewUser__;
    }

    /**
     * <p>adr070selectPermitViewUser をセットします。
     * @param adr070selectPermitViewUser adr070selectPermitViewUser
     */
    public void setAdr070selectPermitViewUser(String[] adr070selectPermitViewUser) {
        adr070selectPermitViewUser__ = adr070selectPermitViewUser;
    }

    /**
     * <p>noSelectPermitEditGroup を取得します。
     * @return noSelectPermitEditGroup
     */
    public List<LabelValueBean> getNoSelectPermitEditGroup() {
        return noSelectPermitEditGroup__;
    }

    /**
     * <p>noSelectPermitEditGroup をセットします。
     * @param noSelectPermitEditGroup noSelectPermitEditGroup
     */
    public void setNoSelectPermitEditGroup(
            List<LabelValueBean> noSelectPermitEditGroup) {
        noSelectPermitEditGroup__ = noSelectPermitEditGroup;
    }

    /**
     * <p>noSelectPermitEditUser を取得します。
     * @return noSelectPermitEditUser
     */
    public List<UsrLabelValueBean> getNoSelectPermitEditUser() {
        return noSelectPermitEditUser__;
    }

    /**
     * <p>noSelectPermitEditUser をセットします。
     * @param noSelectPermitEditUser noSelectPermitEditUser
     */
    public void setNoSelectPermitEditUser(
            List<UsrLabelValueBean> noSelectPermitEditUser) {
        noSelectPermitEditUser__ = noSelectPermitEditUser;
    }

    /**
     * <p>noSelectPermitViewGroup を取得します。
     * @return noSelectPermitViewGroup
     */
    public List<LabelValueBean> getNoSelectPermitViewGroup() {
        return noSelectPermitViewGroup__;
    }

    /**
     * <p>noSelectPermitViewGroup をセットします。
     * @param noSelectPermitViewGroup noSelectPermitViewGroup
     */
    public void setNoSelectPermitViewGroup(
            List<LabelValueBean> noSelectPermitViewGroup) {
        noSelectPermitViewGroup__ = noSelectPermitViewGroup;
    }

    /**
     * <p>noSelectPermitViewUser を取得します。
     * @return noSelectPermitViewUser
     */
    public List<UsrLabelValueBean> getNoSelectPermitViewUser() {
        return noSelectPermitViewUser__;
    }

    /**
     * <p>noSelectPermitViewUser をセットします。
     * @param noSelectPermitViewUser noSelectPermitViewUser
     */
    public void setNoSelectPermitViewUser(
            List<UsrLabelValueBean> noSelectPermitViewUser) {
        noSelectPermitViewUser__ = noSelectPermitViewUser;
    }

    /**
     * <p>selectPermitEditGroup を取得します。
     * @return selectPermitEditGroup
     */
    public List<LabelValueBean> getSelectPermitEditGroup() {
        return selectPermitEditGroup__;
    }

    /**
     * <p>selectPermitEditGroup をセットします。
     * @param selectPermitEditGroup selectPermitEditGroup
     */
    public void setSelectPermitEditGroup(List<LabelValueBean> selectPermitEditGroup) {
        selectPermitEditGroup__ = selectPermitEditGroup;
    }

    /**
     * <p>selectPermitEditUser を取得します。
     * @return selectPermitEditUser
     */
    public List<UsrLabelValueBean> getSelectPermitEditUser() {
        return selectPermitEditUser__;
    }

    /**
     * <p>selectPermitEditUser をセットします。
     * @param selectPermitEditUser selectPermitEditUser
     */
    public void setSelectPermitEditUser(List<UsrLabelValueBean> selectPermitEditUser) {
        selectPermitEditUser__ = selectPermitEditUser;
    }

    /**
     * <p>selectPermitViewGroup を取得します。
     * @return selectPermitViewGroup
     */
    public List<LabelValueBean> getSelectPermitViewGroup() {
        return selectPermitViewGroup__;
    }

    /**
     * <p>selectPermitViewGroup をセットします。
     * @param selectPermitViewGroup selectPermitViewGroup
     */
    public void setSelectPermitViewGroup(List<LabelValueBean> selectPermitViewGroup) {
        selectPermitViewGroup__ = selectPermitViewGroup;
    }

    /**
     * <p>selectPermitViewUser を取得します。
     * @return selectPermitViewUser
     */
    public List<UsrLabelValueBean> getSelectPermitViewUser() {
        return selectPermitViewUser__;
    }

    /**
     * <p>selectPermitViewUser をセットします。
     * @param selectPermitViewUser selectPermitViewUser
     */
    public void setSelectPermitViewUser(List<UsrLabelValueBean> selectPermitViewUser) {
        selectPermitViewUser__ = selectPermitViewUser;
    }

    /**
     * <p>adr070file を取得します。
     * @return adr070file
     */
    public String[] getAdr070file() {
        return adr070file__;
    }

    /**
     * <p>adr070file をセットします。
     * @param adr070file adr070file
     */
    public void setAdr070file(String[] adr070file) {
        adr070file__ = adr070file;
    }

    /**
     * <p>adr070fileCombo を取得します。
     * @return adr070fileCombo
     */
    public List<LabelValueBean> getAdr070fileCombo() {
        return adr070fileCombo__;
    }

    /**
     * <p>adr070fileCombo をセットします。
     * @param adr070fileCombo adr070fileCombo
     */
    public void setAdr070fileCombo(List<LabelValueBean> adr070fileCombo) {
        adr070fileCombo__ = adr070fileCombo;
    }

    /**
     * <p>adr070CompanyCombo を取得します。
     * @return adr070CompanyCombo
     */
    public List<LabelValueBean> getAdr070CompanyCombo() {
        return adr070CompanyCombo__;
    }

    /**
     * <p>adr070CompanyCombo をセットします。
     * @param adr070CompanyCombo adr070CompanyCombo
     */
    public void setAdr070CompanyCombo(List<LabelValueBean> adr070CompanyCombo) {
        adr070CompanyCombo__ = adr070CompanyCombo;
    }

    /**
     * <p>adr070CompanyBaseCombo を取得します。
     * @return adr070CompanyBaseCombo
     */
    public List<LabelValueBean> getAdr070CompanyBaseCombo() {
        return adr070CompanyBaseCombo__;
    }

    /**
     * <p>adr070CompanyBaseCombo をセットします。
     * @param adr070CompanyBaseCombo adr070CompanyBaseCombo
     */
    public void setAdr070CompanyBaseCombo(
            List<LabelValueBean> adr070CompanyBaseCombo) {
        adr070CompanyBaseCombo__ = adr070CompanyBaseCombo;
    }

    /**
     * <p>adr070selectTantoList を取得します。
     * @return adr070selectTantoList
     */
    public String[] getAdr070selectTantoList() {
        return adr070selectTantoList__;
    }

    /**
     * <p>adr070selectTantoList をセットします。
     * @param adr070selectTantoList adr070selectTantoList
     */
    public void setAdr070selectTantoList(String[] adr070selectTantoList) {
        adr070selectTantoList__ = adr070selectTantoList;
    }

    /**
     * <p>adr070NoSelectTantoList を取得します。
     * @return adr070NoSelectTantoList
     */
    public String[] getAdr070NoSelectTantoList() {
        return adr070NoSelectTantoList__;
    }

    /**
     * <p>adr070NoSelectTantoList をセットします。
     * @param adr070NoSelectTantoList adr070NoSelectTantoList
     */
    public void setAdr070NoSelectTantoList(String[] adr070NoSelectTantoList) {
        adr070NoSelectTantoList__ = adr070NoSelectTantoList;
    }

    /**
     * <p>adr070tantoGroup を取得します。
     * @return adr070tantoGroup
     */
    public int getAdr070tantoGroup() {
        return adr070tantoGroup__;
    }

    /**
     * <p>adr070tantoGroup をセットします。
     * @param adr070tantoGroup adr070tantoGroup
     */
    public void setAdr070tantoGroup(int adr070tantoGroup) {
        adr070tantoGroup__ = adr070tantoGroup;
    }

    /**
     * <p>selectTantoCombo を取得します。
     * @return selectTantoCombo
     */
    public List<UsrLabelValueBean> getSelectTantoCombo() {
        return selectTantoCombo__;
    }

    /**
     * <p>selectTantoCombo をセットします。
     * @param selectTantoCombo selectTantoCombo
     */
    public void setSelectTantoCombo(List<UsrLabelValueBean> selectTantoCombo) {
        selectTantoCombo__ = selectTantoCombo;
    }

    /**
     * <p>noSelectTantoCombo を取得します。
     * @return noSelectTantoCombo
     */
    public List<UsrLabelValueBean> getNoSelectTantoCombo() {
        return noSelectTantoCombo__;
    }

    /**
     * <p>noSelectTantoCombo をセットします。
     * @param noSelectTantoCombo noSelectTantoCombo
     */
    public void setNoSelectTantoCombo(List<UsrLabelValueBean> noSelectTantoCombo) {
        noSelectTantoCombo__ = noSelectTantoCombo;
    }

    /**
     * <p>adr070tantoList を取得します。
     * @return adr070tantoList
     */
    public String[] getAdr070tantoList() {
        return adr070tantoList__;
    }

    /**
     * <p>adr070tantoList をセットします。
     * @param adr070tantoList adr070tantoList
     */
    public void setAdr070tantoList(String[] adr070tantoList) {
        adr070tantoList__ = adr070tantoList;
    }

    /**
     * <p>adr070cmdMode を取得します。
     * @return adr070cmdMode
     */
    public int getAdr070cmdMode() {
        return adr070cmdMode__;
    }

    /**
     * <p>adr070cmdMode をセットします。
     * @param adr070cmdMode adr070cmdMode
     */
    public void setAdr070cmdMode(int adr070cmdMode) {
        adr070cmdMode__ = adr070cmdMode;
    }

    /**
     * <p>adr070updateFlg を取得します。
     * @return adr070updateFlg
     */
    public int getAdr070updateFlg() {
        return adr070updateFlg__;
    }

    /**
     * <p>adr070updateFlg をセットします。
     * @param adr070updateFlg adr070updateFlg
     */
    public void setAdr070updateFlg(int adr070updateFlg) {
        adr070updateFlg__ = adr070updateFlg;
    }
    /**
     * <p>adr070init を取得します。
     * @return adr070init
     */
    public int getAdr070init() {
        return adr070init__;
    }

    /**
     * <p>adr070init をセットします。
     * @param adr070init adr070init
     */
    public void setAdr070init(int adr070init) {
        adr070init__ = adr070init;
    }

}