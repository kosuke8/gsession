package jp.groupsession.v2.fil.fil030;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.util.LabelValueBean;

import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.struts.StrutsUtil;
import jp.groupsession.v2.fil.GSConstFile;
import jp.groupsession.v2.fil.dao.FileAconfDao;
import jp.groupsession.v2.fil.fil020.Fil020Form;
import jp.groupsession.v2.fil.model.FileAconfModel;
import jp.groupsession.v2.fil.util.FilValidateUtil;
import jp.groupsession.v2.struts.msg.GsMessage;
import jp.groupsession.v2.usr.model.UsrLabelValueBean;

/**
 * <br>[機  能] キャビネット登録・編集画面のフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Fil030Form extends Fil020Form {

    /** プラグインID */
    private String fil030pluginId__ = GSConstFile.PLUGIN_ID_FILE;
    //表示用
    /** キャビネット名称 */
    private String fil030CabinetName__;
    /** アクセス制御　有無*/
    private String fil030AccessKbn__;
    /** セーブ フルアクセスユーザ */
    private String[] fil030SvAcFull__ = null;
    /** セーブ 閲覧アクセスユーザ */
    private String[] fil030SvAcRead__ = null;
    /** フルアクセスユーザ */
    private String[] fil030AcFull__ = null;
    /** 閲覧アクセスユーザ */
    private String[] fil030AcRead__ = null;
    /** ユーザリスト（候補）*/
    private String[] fil030AcRight__ = null;

    /** 選択したキャビネットSID */
    private String fil030SelectCabinet__;
    /** 個人キャビネット判定フラグ 0:共有キャビネット 1:個人キャビネット */
    private int fil030PersonalFlg__ = Integer.parseInt(GSConstFile.DSP_CABINET_PUBLIC);
    /** 個人キャビネット所有ユーザ */
    private String ownerSid__;


    /** アクセス候補　グループ*/
    private String fil030AcSltGroup__ = null;
    /** アクセス制限候補選択 checkbox*/
    private String fil030AcAllSlt__ = GSConstFile.DSP_KBN_OFF;

    /** セーブ キャビネット管理者*/
    private String[] fil030SvAdm__ = null;
    /** キャビネット管理者*/
    private String[] fil030Adm__ = null;
    /** キャビネット管理者(候補)*/
    private String[] fil030AdmRight__ = null;
    /** キャビネット候補　グループ*/
    private String fil030AdmSltGroup__ = null;
    /** キャビネット管理者候補選択 checkbox*/
    private String fil030AdmAllSlt__ = GSConstFile.DSP_KBN_OFF;

    /** 容量制限区分*/
    private String fil030CapaKbn__ = null;
    /** 容量サイズ*/
    private String fil030CapaSize__ = null;
    /** 容量警告パーセント*/
    private String fil030CapaWarn__ = null;

    /** バージョン管理区分*/
    private String fil030VerKbn__ = null;
    /** バージョン管理 キャビネットで世代を統一*/
    private String fil030VerAllKbn__ = null;

    /** 備考*/
    private String fil030Biko__ = null;

    /** 添付ファイル(コンボで選択中) */
    private String[] fil030SelectTempFiles__ = null;
    /** ファイルコンボ */
    private List<LabelValueBean> fil030FileLabelList__ = null;

    /** マーク添付ファイル(コンボで選択中) */
    private String[] fil030SelectTempFilesMark__ = null;
    /** マークファイルコンボ */
    private List<LabelValueBean> fil030FileLabelListMark__ = null;

    /** アクセス制限 フルアクセスユーザ・グループリスト */
    private ArrayList<UsrLabelValueBean> fil030AcFullLavel__ = null;
    /** アクセス制限 閲覧ユーザ・グループリスト */
    private ArrayList< UsrLabelValueBean > fil030AcReadLavel__ = null;
    /** アクセス制限 グループリスト */
    private ArrayList< LabelValueBean > fil030AcGroupLavel__ = null;
    /** アクセス制限 候補リスト */
    private ArrayList< UsrLabelValueBean > fil030AcRightLavel__ = null;

    /** キャビネット管理者 ユーザリスト */
    private ArrayList<UsrLabelValueBean> fil030AdmLavel__ = null;
    /** キャビネット管理者 グループリスト */
    private ArrayList< LabelValueBean > fil030AdmGroupLavel__ = null;
    /** キャビネット管理者 候補リスト */
    private ArrayList< UsrLabelValueBean > fil030AdmRightLavel__ = null;

    /** キャビネット使用率コンボ用リスト */
    private ArrayList< LabelValueBean > fil030CapaWarnLavel__ = null;
    /** キャビネット世代管理数コンボ用リスト */
    private ArrayList< LabelValueBean > fil030VerKbnLavel__ = null;

    /** キャビネット管理機能 キャビネット複数選択multibox */
    private String[] fil220sltCheck__ = null;
    /** 個人キャビネット 検索キーワード */
    private String fil280svKeyword__ = null;
    /** 個人キャビネット 検索グループ */
    private int fil280svGroup__ = -1;
    /** 個人キャビネット 検索ユーザ */
    private int fil280svUser__ = -1;

    /** 削除用チェックボックス パラメータ保持用 */
    private String[] fil040SelectDel__;

    /** アイコンSID */
    private String fil030binSid__;
    /** アイコンファイル名 */
    private String fil030ImageName__;
    /** アイコンファイル保存名 */
    private String fil030ImageSaveName__;
    /** アイコン選択時の初期表示フラグ */
    private String fil030InitFlg__ = "0";

    /** 含まれるサブフォルダ・ファイルにも適応*/
    private String file030AdaptIncFile__ = "0";

    /**
     * @return fil030pluginId
     */
    public String getFil030pluginId() {
        return fil030pluginId__;
    }

    /**
     * @param fil030pluginId 設定する fil030pluginId
     */
    public void setFil030pluginId(String fil030pluginId) {
        fil030pluginId__ = fil030pluginId;
    }

    /**
     * @return fil030AcAllSlt
     */
    public String getFil030AcAllSlt() {
        return fil030AcAllSlt__;
    }

    /**
     * @param fil030AcAllSlt 設定する fil030AcAllSlt
     */
    public void setFil030AcAllSlt(String fil030AcAllSlt) {
        fil030AcAllSlt__ = fil030AcAllSlt;
    }

    /**
     * @return fil030AccessKbn
     */
    public String getFil030AccessKbn() {
        return fil030AccessKbn__;
    }

    /**
     * @param fil030AccessKbn 設定する fil030AccessKbn
     */
    public void setFil030AccessKbn(String fil030AccessKbn) {
        fil030AccessKbn__ = fil030AccessKbn;
    }

    /**
     * @return fil030AcFullLavel
     */
    public ArrayList<UsrLabelValueBean> getFil030AcFullLavel() {
        return fil030AcFullLavel__;
    }

    /**
     * @param fil030AcFullLavel 設定する fil030AcFullLavel
     */
    public void setFil030AcFullLavel(ArrayList<UsrLabelValueBean> fil030AcFullLavel) {
        fil030AcFullLavel__ = fil030AcFullLavel;
    }

    /**
     * @return fil030AcGroupLavel
     */
    public ArrayList<LabelValueBean> getFil030AcGroupLavel() {
        return fil030AcGroupLavel__;
    }

    /**
     * @param fil030AcGroupLavel 設定する fil030AcGroupLavel
     */
    public void setFil030AcGroupLavel(ArrayList<LabelValueBean> fil030AcGroupLavel) {
        fil030AcGroupLavel__ = fil030AcGroupLavel;
    }

    /**
     * @return fil030AcReadLavel
     */
    public ArrayList<UsrLabelValueBean> getFil030AcReadLavel() {
        return fil030AcReadLavel__;
    }

    /**
     * @param fil030AcReadLavel 設定する fil030AcReadLavel
     */
    public void setFil030AcReadLavel(ArrayList<UsrLabelValueBean> fil030AcReadLavel) {
        fil030AcReadLavel__ = fil030AcReadLavel;
    }

    /**
     * @return fil030AcRight
     */
    public String[] getFil030AcRight() {
        return fil030AcRight__;
    }

    /**
     * @param fil030AcRight 設定する fil030AcRight
     */
    public void setFil030AcRight(String[] fil030AcRight) {
        fil030AcRight__ = fil030AcRight;
    }

    /**
     * @return fil030AcRightLavel
     */
    public ArrayList<UsrLabelValueBean> getFil030AcRightLavel() {
        return fil030AcRightLavel__;
    }

    /**
     * @param fil030AcRightLavel 設定する fil030AcRightLavel
     */
    public void setFil030AcRightLavel(ArrayList<UsrLabelValueBean> fil030AcRightLavel) {
        fil030AcRightLavel__ = fil030AcRightLavel;
    }

    /**
     * @return fil030AcSltGroup
     */
    public String getFil030AcSltGroup() {
        return fil030AcSltGroup__;
    }

    /**
     * @param fil030AcSltGroup 設定する fil030AcSltGroup
     */
    public void setFil030AcSltGroup(String fil030AcSltGroup) {
        fil030AcSltGroup__ = fil030AcSltGroup;
    }

    /**
     * @return fil030AdmAllSlt
     */
    public String getFil030AdmAllSlt() {
        return fil030AdmAllSlt__;
    }

    /**
     * @param fil030AdmAllSlt 設定する fil030AdmAllSlt
     */
    public void setFil030AdmAllSlt(String fil030AdmAllSlt) {
        fil030AdmAllSlt__ = fil030AdmAllSlt;
    }

    /**
     * @return fil030AdmGroupLavel
     */
    public ArrayList<LabelValueBean> getFil030AdmGroupLavel() {
        return fil030AdmGroupLavel__;
    }

    /**
     * @param fil030AdmGroupLavel 設定する fil030AdmGroupLavel
     */
    public void setFil030AdmGroupLavel(ArrayList<LabelValueBean> fil030AdmGroupLavel) {
        fil030AdmGroupLavel__ = fil030AdmGroupLavel;
    }

    /**
     * @return fil030AdmLavel
     */
    public ArrayList<UsrLabelValueBean> getFil030AdmLavel() {
        return fil030AdmLavel__;
    }

    /**
     * @param fil030AdmLavel 設定する fil030AdmLavel
     */
    public void setFil030AdmLavel(ArrayList<UsrLabelValueBean> fil030AdmLavel) {
        fil030AdmLavel__ = fil030AdmLavel;
    }

    /**
     * @return fil030AdmRight
     */
    public String[] getFil030AdmRight() {
        return fil030AdmRight__;
    }

    /**
     * @param fil030AdmRight 設定する fil030AdmRight
     */
    public void setFil030AdmRight(String[] fil030AdmRight) {
        fil030AdmRight__ = fil030AdmRight;
    }

    /**
     * @return fil030AdmRightLavel
     */
    public ArrayList<UsrLabelValueBean> getFil030AdmRightLavel() {
        return fil030AdmRightLavel__;
    }

    /**
     * @param fil030AdmRightLavel 設定する fil030AdmRightLavel
     */
    public void setFil030AdmRightLavel(ArrayList<UsrLabelValueBean> fil030AdmRightLavel) {
        fil030AdmRightLavel__ = fil030AdmRightLavel;
    }

    /**
     * @return fil030AdmSltGroup
     */
    public String getFil030AdmSltGroup() {
        return fil030AdmSltGroup__;
    }

    /**
     * @param fil030AdmSltGroup 設定する fil030AdmSltGroup
     */
    public void setFil030AdmSltGroup(String fil030AdmSltGroup) {
        fil030AdmSltGroup__ = fil030AdmSltGroup;
    }

    /**
     * @return fil030Biko
     */
    public String getFil030Biko() {
        return fil030Biko__;
    }

    /**
     * @param fil030Biko 設定する fil030Biko
     */
    public void setFil030Biko(String fil030Biko) {
        fil030Biko__ = fil030Biko;
    }

    /**
     * @return fil030CabinetName
     */
    public String getFil030CabinetName() {
        return fil030CabinetName__;
    }

    /**
     * @param fil030CabinetName 設定する fil030CabinetName
     */
    public void setFil030CabinetName(String fil030CabinetName) {
        fil030CabinetName__ = fil030CabinetName;
    }

    /**
     * @return fil030CapaKbn
     */
    public String getFil030CapaKbn() {
        return fil030CapaKbn__;
    }

    /**
     * @param fil030CapaKbn 設定する fil030CapaKbn
     */
    public void setFil030CapaKbn(String fil030CapaKbn) {
        fil030CapaKbn__ = fil030CapaKbn;
    }

    /**
     * @return fil030CapaSize
     */
    public String getFil030CapaSize() {
        return fil030CapaSize__;
    }

    /**
     * @param fil030CapaSize 設定する fil030CapaSize
     */
    public void setFil030CapaSize(String fil030CapaSize) {
        fil030CapaSize__ = fil030CapaSize;
    }

    /**
     * @return fil030CapaWarn
     */
    public String getFil030CapaWarn() {
        return fil030CapaWarn__;
    }

    /**
     * @param fil030CapaWarn 設定する fil030CapaWarn
     */
    public void setFil030CapaWarn(String fil030CapaWarn) {
        fil030CapaWarn__ = fil030CapaWarn;
    }

    /**
     * @return fil030CapaWarnLavel
     */
    public ArrayList<LabelValueBean> getFil030CapaWarnLavel() {
        return fil030CapaWarnLavel__;
    }

    /**
     * @param fil030CapaWarnLavel 設定する fil030CapaWarnLavel
     */
    public void setFil030CapaWarnLavel(ArrayList<LabelValueBean> fil030CapaWarnLavel) {
        fil030CapaWarnLavel__ = fil030CapaWarnLavel;
    }

    /**
     * @return fil030FileLabelList
     */
    public List<LabelValueBean> getFil030FileLabelList() {
        return fil030FileLabelList__;
    }

    /**
     * @param fil030FileLabelList 設定する fil030FileLabelList
     */
    public void setFil030FileLabelList(List<LabelValueBean> fil030FileLabelList) {
        fil030FileLabelList__ = fil030FileLabelList;
    }

    /**
     * @return fil030SelectTempFiles
     */
    public String[] getFil030SelectTempFiles() {
        return fil030SelectTempFiles__;
    }

    /**
     * @param fil030SelectTempFiles 設定する fil030SelectTempFiles
     */
    public void setFil030SelectTempFiles(String[] fil030SelectTempFiles) {
        fil030SelectTempFiles__ = fil030SelectTempFiles;
    }

    /**
     * @return fil030SvAcFull
     */
    public String[] getFil030SvAcFull() {
        return fil030SvAcFull__;
    }

    /**
     * @param fil030SvAcFull 設定する fil030SvAcFull
     */
    public void setFil030SvAcFull(String[] fil030SvAcFull) {
        fil030SvAcFull__ = fil030SvAcFull;
    }

    /**
     * @return fil030SvAcRead
     */
    public String[] getFil030SvAcRead() {
        return fil030SvAcRead__;
    }

    /**
     * @param fil030SvAcRead 設定する fil030SvAcRead
     */
    public void setFil030SvAcRead(String[] fil030SvAcRead) {
        fil030SvAcRead__ = fil030SvAcRead;
    }

    /**
     * @return fil030SvAdm
     */
    public String[] getFil030SvAdm() {
        return fil030SvAdm__;
    }

    /**
     * @param fil030SvAdm 設定する fil030SvAdm
     */
    public void setFil030SvAdm(String[] fil030SvAdm) {
        fil030SvAdm__ = fil030SvAdm;
    }

    /**
     * @return fil030VerAllKbn
     */
    public String getFil030VerAllKbn() {
        return fil030VerAllKbn__;
    }

    /**
     * @param fil030VerAllKbn 設定する fil030VerAllKbn
     */
    public void setFil030VerAllKbn(String fil030VerAllKbn) {
        fil030VerAllKbn__ = fil030VerAllKbn;
    }

    /**
     * @return fil030VerKbn
     */
    public String getFil030VerKbn() {
        return fil030VerKbn__;
    }

    /**
     * @param fil030VerKbn 設定する fil030VerKbn
     */
    public void setFil030VerKbn(String fil030VerKbn) {
        fil030VerKbn__ = fil030VerKbn;
    }

    /**
     * @return fil030VerKbnLavel
     */
    public ArrayList<LabelValueBean> getFil030VerKbnLavel() {
        return fil030VerKbnLavel__;
    }

    /**
     * @param fil030VerKbnLavel 設定する fil030VerKbnLavel
     */
    public void setFil030VerKbnLavel(ArrayList<LabelValueBean> fil030VerKbnLavel) {
        fil030VerKbnLavel__ = fil030VerKbnLavel;
    }

    /**
     * @return fil030AcFull
     */
    public String[] getFil030AcFull() {
        return fil030AcFull__;
    }

    /**
     * @param fil030AcFull 設定する fil030AcFull
     */
    public void setFil030AcFull(String[] fil030AcFull) {
        fil030AcFull__ = fil030AcFull;
    }

    /**
     * @return fil030AcRead
     */
    public String[] getFil030AcRead() {
        return fil030AcRead__;
    }

    /**
     * @param fil030AcRead 設定する fil030AcRead
     */
    public void setFil030AcRead(String[] fil030AcRead) {
        fil030AcRead__ = fil030AcRead;
    }

    /**
     * @return fil030Adm
     */
    public String[] getFil030Adm() {
        return fil030Adm__;
    }

    /**
     * @param fil030Adm 設定する fil030Adm
     */
    public void setFil030Adm(String[] fil030Adm) {
        fil030Adm__ = fil030Adm;
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

        if (fil030PersonalFlg__ == GSConstFile.CABINET_KBN_PRIVATE) {
            //アクセス権限 制限する場合は必須
            int accsessKbn = NullDefault.getInt(fil030AccessKbn__, -1);
            if (accsessKbn == GSConstFile.ACCESS_KBN_ON) {
                //閲覧アクセスユーザを選択チェック
                if ((fil030SvAcRead__ == null || fil030SvAcRead__.length < 1)) {
                    String textCabinetAcFull = gsMsg.getMessage(req, "fil.102");
                    msg = new ActionMessage(
                                    "error.select.required.text", textCabinetAcFull);
                    StrutsUtil.addMessage(errors, msg, "fil030SvAcFull");
                }
            } else if (accsessKbn == GSConstFile.ACCESS_KBN_OFF) {
                // アクセス制限なし
            } else {
                // アクセス制限の値が不正
                String textCabinetAcFull = gsMsg.getMessage(req, "fil.102");
                msg = new ActionMessage(
                                "error.input.format.text", textCabinetAcFull);
                StrutsUtil.addMessage(errors, msg, "fil030AccessKbn");
            }
        } else {
            FileAconfDao aconfDao = new FileAconfDao(con);
            FileAconfModel aconf = aconfDao.select();
            if (aconf == null) {
                aconf = new FileAconfModel();
                aconf.init();
            }

            //キャビネット名称
            if (getCmnMode().equals(GSConstFile.CMN_MODE_MLT) == false
                    && fil030PersonalFlg__ == Integer.parseInt(GSConstFile.DSP_CABINET_PUBLIC)) {
                String textCabinetName = gsMsg.getMessage(req, "fil.13");
                FilValidateUtil.validateTextField(errors, fil030CabinetName__, "fil030CabinetName",
                        textCabinetName,
                        GSConstFile.MAX_LENGTH_NAME, true);
            }

            //アクセス権限 制限する場合は必須
            int accsessKbn = NullDefault.getInt(fil030AccessKbn__, -1);
            if (accsessKbn == GSConstFile.ACCESS_KBN_ON) {
                //フルアクセスユーザを選択チェック
                if ((fil030SvAcFull__ == null || fil030SvAcFull__.length < 1)
                 && (fil030SvAcRead__ == null || fil030SvAcRead__.length < 1)) {
                    String textCabinetAcFull = gsMsg.getMessage(req, "fil.102");
                    msg = new ActionMessage(
                                    "error.select.required.text", textCabinetAcFull);
                    StrutsUtil.addMessage(errors, msg, "fil030SvAcFull");
                }
            } else if (accsessKbn == GSConstFile.ACCESS_KBN_OFF) {
                // アクセス制限なし
            } else {
                // アクセス制限の値が不正
                String textCabinetAcFull = gsMsg.getMessage(req, "fil.102");
                msg = new ActionMessage(
                                "error.input.format.tex", textCabinetAcFull);
                StrutsUtil.addMessage(errors, msg, "fil030AccessKbn");
            }

            //容量設定
            int capaKbn = NullDefault.getInt(fil030CapaKbn__, -1);
            if (capaKbn == GSConstFile.CAPA_KBN_ON) {
                String textCabinetCapaSize = gsMsg.getMessage(req, "fil.4");
                //キャビネット容量上限
                FilValidateUtil.validateTextFieldOfNumber(errors, fil030CapaSize__,
                        "fil030CapaSize",
                        textCabinetCapaSize, GSConstFile.MAX_LENGTH_CAPA, true);

                // キャビネット警告値の不正値チェック
                int warnKbn = NullDefault.getInt(fil030CapaWarn__, -1);
                if (warnKbn < 0 || warnKbn > 100) {
                    String textCabinetAcFull = gsMsg.getMessage(req, "fil.fil030kn.1");
                    msg = new ActionMessage(
                                    "error.input.format.text", textCabinetAcFull);
                    StrutsUtil.addMessage(errors, msg, "fil030CapaWarn");
                }
            } else if (capaKbn == GSConstFile.CAPA_KBN_OFF) {
                // キャビネット容量制限しない
            } else {
                // キャビネット容量制限の値が不正
                String textCabinetAcFull = gsMsg.getMessage(req, "fil.3");
                msg = new ActionMessage(
                                "error.input.format.text", textCabinetAcFull);
                StrutsUtil.addMessage(errors, msg, "fil030CapaKbn");
            }

            // バージョン管理
            if (aconf.getFacVerKbn() == GSConstFile.VERSION_KBN_ON) {
                // バージョン管理数
                int verLvKbn = NullDefault.getInt(fil030VerKbn__, -1);
                if (verLvKbn < 0 && verLvKbn > GSConstFile.MAX_LEVEL) {
                    String textCabinetAcFull = gsMsg.getMessage(req, "fil.68");
                    msg = new ActionMessage(
                                    "error.input.format.text", textCabinetAcFull);
                    StrutsUtil.addMessage(errors, msg, "fil030VerKbn__");
                }
            }
        }

        //備考
        String textBiko = gsMsg.getMessage(req, "cmn.memo");
        FilValidateUtil.validateTextAreaField(errors, fil030Biko__, "fil030Biko__",
                textBiko, GSConstFile.MAX_LENGTH_BIKO, false);

        return errors;
    }

    /**
     * <p>fil220sltCheck を取得します。
     * @return fil220sltCheck
     */
    public String[] getFil220sltCheck() {
        return fil220sltCheck__;
    }

    /**
     * <p>fil220sltCheck をセットします。
     * @param fil220sltCheck fil220sltCheck
     */
    public void setFil220sltCheck(String[] fil220sltCheck) {
        fil220sltCheck__ = fil220sltCheck;
    }

    /**
     * <p>fil280svKeyword を取得します。
     * @return fil280svKeyword
     */
    public String getFil280svKeyword() {
        return fil280svKeyword__;
    }

    /**
     * <p>fil280svKeyword をセットします。
     * @param fil280svKeyword fil280svKeyword
     */
    public void setFil280svKeyword(String fil280svKeyword) {
        fil280svKeyword__ = fil280svKeyword;
    }

    /**
     * <p>fil280svgroup を取得します。
     * @return fil280svGroup
     */
    public int getFil280svGroup() {
        return fil280svGroup__;
    }

    /**
     * <p>fil280svGroup をセットします。
     * @param fil280svGroup fil280svGroup
     */
    public void setFil280svGroup(int fil280svGroup) {
        fil280svGroup__ = fil280svGroup;
    }

    /**
     * <p>fil280svUser を取得します。
     * @return fil280svUser
     */
    public int getFil280svUser() {
        return fil280svUser__;
    }

    /**
     * <p>fil280svUser をセットします。
     * @param fil280svUser fil280svUser
     */
    public void setFil280svUser(int fil280svUser) {
        fil280svUser__ = fil280svUser;
    }

    /**
     * <p>fil030SelectCabinet を取得します。
     * @return fil030SelectCabinet
     */
    public String getFil030SelectCabinet() {
        return fil030SelectCabinet__;
    }

    /**
     * <p>fil030SelectCabinet をセットします。
     * @param fil030SelectCabinet fil030SelectCabinet
     */
    public void setFil030SelectCabinet(String fil030SelectCabinet) {
        fil030SelectCabinet__ = fil030SelectCabinet;
    }

    /**
     * <p> fil030PersonalFlgを取得します。
     * @return fil030PersonalFlg
     * */
    public int getFil030PersonalFlg() {
        return fil030PersonalFlg__;
    }
    /**
     * <p> fil030PersonalFlgをセットします。
     * @param fil030PersonalFlg fil030PersonalFlg
     * */
    public void setFil030PersonalFlg(int fil030PersonalFlg) {
        fil030PersonalFlg__ = fil030PersonalFlg;
    }

    /**
     * <p> ownerSidを取得します。
     * @return ownerSid
     * */
    public String getOwnerSid() {
        return ownerSid__;
    }
    /**
     * <p> ownerSidをセットします。
     * @param ownerSid ownerSid
     * */
    public void setOwnerSid(String ownerSid) {
        ownerSid__ = ownerSid;
    }

    /**
     * <p>fil040SelectDel を取得します。
     * @return fil040SelectDel
     */
    public String[] getFil040SelectDel() {
        return fil040SelectDel__;
    }

    /**
     * <p>fil040SelectDel をセットします。
     * @param fil040SelectDel fil040SelectDel
     */
    public void setFil040SelectDel(String[] fil040SelectDel) {
        fil040SelectDel__ = fil040SelectDel;
    }

    /**
     * <p>fil030SelectTempFilesMark を取得します。
     * @return fil030SelectTempFilesMark
     */
    public String[] getFil030SelectTempFilesMark() {
        return fil030SelectTempFilesMark__;
    }

    /**
     * <p>fil030SelectTempFilesMark をセットします。
     * @param fil030SelectTempFilesMark fil030SelectTempFilesMark
     */
    public void setFil030SelectTempFilesMark(String[] fil030SelectTempFilesMark) {
        fil030SelectTempFilesMark__ = fil030SelectTempFilesMark;
    }

    /**
     * <p>fil030FileLabelListMark を取得します。
     * @return fil030FileLabelListMark
     */
    public List<LabelValueBean> getFil030FileLabelListMark() {
        return fil030FileLabelListMark__;
    }

    /**
     * <p>fil030FileLabelListMark をセットします。
     * @param fil030FileLabelListMark fil030FileLabelListMark
     */
    public void setFil030FileLabelListMark(
            List<LabelValueBean> fil030FileLabelListMark) {
        fil030FileLabelListMark__ = fil030FileLabelListMark;
    }

    /**
     * <p>fil030binSid を取得します。
     * @return fil030binSid
     */
    public String getFil030binSid() {
        return fil030binSid__;
    }

    /**
     * <p>fil030binSid をセットします。
     * @param fil030binSid fil030binSid
     */
    public void setFil030binSid(String fil030binSid) {
        fil030binSid__ = fil030binSid;
    }

    /**
     * <p>fil030ImageName を取得します。
     * @return fil030ImageName
     */
    public String getFil030ImageName() {
        return fil030ImageName__;
    }

    /**
     * <p>fil030ImageName をセットします。
     * @param fil030ImageName fil030ImageName
     */
    public void setFil030ImageName(String fil030ImageName) {
        fil030ImageName__ = fil030ImageName;
    }

    /**
     * <p>fil030ImageSaveName を取得します。
     * @return fil030ImageSaveName
     */
    public String getFil030ImageSaveName() {
        return fil030ImageSaveName__;
    }

    /**
     * <p>fil030ImageSaveName をセットします。
     * @param fil030ImageSaveName fil030ImageSaveName
     */
    public void setFil030ImageSaveName(String fil030ImageSaveName) {
        fil030ImageSaveName__ = fil030ImageSaveName;
    }

    /**
     * <p>fil030InitFlg を取得します。
     * @return fil030InitFlg
     */
    public String getFil030InitFlg() {
        return fil030InitFlg__;
    }

    /**
     * <p>fil030InitFlg をセットします。
     * @param fil030InitFlg fil030InitFlg
     */
    public void setFil030InitFlg(String fil030InitFlg) {
        fil030InitFlg__ = fil030InitFlg;
    }

    /**
     * <p>file030AdaptIncFile を取得します。
     * @return file030AdaptIncFile
     */
    public String getFile030AdaptIncFile() {
        return file030AdaptIncFile__;
    }

    /**
     * <p>file030AdaptIncFile をセットします。
     * @param file030AdaptIncFile file030AdaptIncFile
     */
    public void setFile030AdaptIncFile(String file030AdaptIncFile) {
        this.file030AdaptIncFile__ = file030AdaptIncFile;
    }
}
