package jp.groupsession.v2.enq.enq210;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.StringUtil;
import jp.co.sjts.util.date.UDate;
import jp.co.sjts.util.io.IOToolsException;
import jp.co.sjts.util.struts.StrutsUtil;
import jp.groupsession.v2.cmn.GSConst;
import jp.groupsession.v2.cmn.biz.UserBiz;
import jp.groupsession.v2.cmn.cmn110.Cmn110Biz;
import jp.groupsession.v2.cmn.cmn999.Cmn999Form;
import jp.groupsession.v2.cmn.dao.SltUserPerGroupModel;
import jp.groupsession.v2.cmn.dao.base.CmnUsrmDao;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.enq.EnqValidateUtil;
import jp.groupsession.v2.enq.GSConstEnquete;
import jp.groupsession.v2.enq.enq230.Enq230Form;
import jp.groupsession.v2.struts.msg.GsMessage;
import jp.groupsession.v2.usr.model.UsrLabelValueBean;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.util.LabelValueBean;

/**
 * <br>[機  能] アンケート 設問登録画面のフォームクラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Enq210Form extends Enq230Form {

    /** 編集モード 通常 */
    public static final int EDITMODE_NORMAL = 0;
    /** 編集モード 草稿に保存 */
    public static final int EDITMODE_DRAFT = 1;
    /** 編集モード テンプレート */
    public static final int EDITMODE_TEMPLATE = 2;

    /** 設問番号(自動/手動) 手動 */
    public static final int QUE_SEQTYPE_MANUAL = 0;
    /** 設問番号(自動/手動) 自動 */
    public static final int QUE_SEQTYPE_AUTO = 1;
    /** 対象者グループ グループ一覧 */
    public static final int ANSER_GROUP_GRPLIST = -9;

    /** 公開開始日 */
    public static final int FROM_DATE_FLG = 0;
    /** 回答期限 */
    public static final int ANS_DATE_FLG = 1;
    /** 結果公開 */
    public static final int TO_DATE_FLG = 2;
    /** 結果公開 開始 */
    public static final int ANS_PUB_FROM_DATE_FLG = 4;

    /** 公開期間_終了日 指定なし */
    public static final int TO_DATE_NOLIMIT = 1;

    /** ショートメール通知 通知する */
    public static final int SML_INFO_SEND = 1;

    /** 結果公開アンケート 公開する */
    public static final int ANS_OPEN = 1;

    /** 編集モード */
    private int enq210editMode__ = 0;
    /** データ区分 */
    private int enq210DataKbn__ = -1;
    /** 重要度 */
    private int enq210Juuyou__ = 0;
    /** アンケート種類 */
    private int enq210Syurui__ = 0;
    /** 発信者 */
    private String enq210Send__ = null;
    /** タイトル */
    private String enq210Title__ = null;
    /** 説明 */
    private String enq210Desc__ = null;
    /** 説明(テキストのみ) */
    private String enq210DescText__ = null;
    /** 添付区分 */
    private int enq210AttachKbn__ = 0;
    /** URL */
    private String enq210Url__ = null;
    /** 表示名 */
    private String enq210TempDspName__ = null;

    /** ファイル保存先 */
    private String enq210fileDir__ = null;
    /** 添付ファイル */
    private String[] enq210file__ = null;
    /** 添付ファイル名 */
    private String enq210fileName__ = null;

    /** 添付位置 */
    private int enq210AttachPos__ = 0;
    /** 公開期間_開始年 */
    private int enq210FrYear__ = 0;
    /** 公開期間_開始月 */
    private int enq210FrMonth__ = 0;
    /** 公開期間_開始日 */
    private int enq210FrDay__ = 0;
    /** 公開期間_終了年 */
    private int enq210ToYear__ = 0;
    /** 公開期間_終了月 */
    private int enq210ToMonth__ = 0;
    /** 公開期間_終了日 */
    private int enq210ToDay__ = 0;
    /** 公開期間_終了日 指定なし */
    private int enq210ToKbn__ = 0;
    /** 回答期限_年 */
    private int enq210AnsYear__ = 0;
    /** 回答期限_月 */
    private int enq210AnsMonth__ = 0;
    /** 回答期限_日 */
    private int enq210AnsDay__ = 0;
    /** 結果公開期間_開始年 */
    private int enq210AnsPubFrYear__ = 0;
    /** 結果公開期間_開始月 */
    private int enq210AnsPubFrMonth__ = 0;
    /** 結果公開期間_開始日 */
    private int enq210AnsPubFrDay__ = 0;
    /** 匿名フラグ */
    private int enq210Anony__ = 0;
    /** 回答公開フラグ */
    private int enq210AnsOpen__ = 0;
    /** 設問番号(自動/手動) */
    private int enq210queSeqType__ = 0;
    /** ショートメール通知 */
    private int enq210smailInfo__ = 0;
    /** ショートメールプラグイン使用可能フラグ */
    private int enq210pluginSmailUse__ = GSConst.PLUGIN_NOT_USE;

    /** SEQ */
    private int enq210Seq__ = -1;
    /** 初期表示フラグ */
    private int enq210initFlg__ = 0;
    /** テンプレートID */
    private long enq210templateId__ = 0;
    /** 表示位置移動フラグ */
    private int enq210scrollQuestonFlg__ = 0;

    /** 設問種類 */
    private int enq210queType__ = 0;
    /** 設問Index */
    private int enq210queIndex__ = -1;
    /** 設問Index(編集) */
    private int enq210editQueIndex__ = -1;
    /** 設問リスト */
    private List<Enq210QueModel> ebaList__ = null;

    /** サブリスト */
    //private List<Enq210SubForm> subList__ = null;

    /** アンケート種類リスト */
    private List<LabelValueBean> enqTypeList__ = null;
    /** 発信者リスト */
    private List<UsrLabelValueBean> enqSenderList__ = null;
    /** 年リスト */
    private ArrayList <LabelValueBean> enq210YearLabel__ = null;
    /** 月リスト */
    private ArrayList <LabelValueBean> enq210MonthLabel__ = null;
    /** 日リスト */
    private ArrayList <LabelValueBean> enq210DayLabel__ = null;
    /** ファイルコンボ */
    private List <LabelValueBean> enq210FileLabelList__ = null;
    /** テンプレート一覧 */
    private List <LabelValueBean> enq210TemplatelList__ = null;

    /** 対象者グループ */
    private int enq210answerGroup__ = ANSER_GROUP_GRPLIST;
    /** 対象者 */
    private String[] enq210answerList__ = null;
    /** 対象者(選択用) */
    private String[] enq210selectAnswerList__ = null;
    /** 対象者(未選択 選択用) */
    private String[] enq210NoSelectAnswerList__ = null;
    /** 対象者グループコンボ */
    private List<LabelValueBean> selectAnswerGroup__ = null;
    /** 対象者コンボ */
    private List<UsrLabelValueBean> selectAnswerCombo__ = null;
    /** 対象者(未選択)コンボ */
    private List<UsrLabelValueBean> noSelectAnswerCombo__ = null;

    /** 警告フラグ */
    private int enq210Alert__ = 0;
    /** 回答情報削除フラグ */
    private boolean enq210DelAnsFlg__ = false;

    /** 添付ファイル 添付ボタン又は削除ボタンクリック判断フラグ 0:クリックされていない 1:クリックされた */
    private int tempClickBtn__ = 0;

    /** 回答情報リセットフラグ リセットしない:0 リセットする:1 */
    private int answerDataReset__ = 0;

    /**
     * <br>[機  能] 共通メッセージ画面遷移時に保持するパラメータを設定する
     * <br>[解  説]
     * <br>[備  考]
     * @param msgForm 共通メッセージ画面Form
     */
    public void setHiddenParam(Cmn999Form msgForm) {
        super.setHiddenParam(msgForm);

        msgForm.addHiddenParam("enq210editMode", enq210editMode__);
        msgForm.addHiddenParam("enq210DataKbn", enq210DataKbn__);
        msgForm.addHiddenParam("enq210Juuyou", enq210Juuyou__);
        msgForm.addHiddenParam("enq210Syurui", enq210Syurui__);
        msgForm.addHiddenParam("enq210Send", enq210Send__);
        msgForm.addHiddenParam("enq210Title", enq210Title__);
        msgForm.addHiddenParam("enq210Desc", enq210Desc__);
        msgForm.addHiddenParam("enq210AttachKbn", enq210AttachKbn__);
        msgForm.addHiddenParam("enq210Url", enq210Url__);
        msgForm.addHiddenParam("enq210TempDspName", enq210TempDspName__);
        msgForm.addHiddenParam("enq210file", enq210file__);
        msgForm.addHiddenParam("enq210AttachPos", enq210AttachPos__);
        msgForm.addHiddenParam("enq210FrYear", enq210FrYear__);
        msgForm.addHiddenParam("enq210FrMonth", enq210FrMonth__);
        msgForm.addHiddenParam("enq210FrDay", enq210FrDay__);
        msgForm.addHiddenParam("enq210ToYear", enq210ToYear__);
        msgForm.addHiddenParam("enq210ToMonth", enq210ToMonth__);
        msgForm.addHiddenParam("enq210ToDay", enq210ToDay__);
        msgForm.addHiddenParam("enq210ToKbn", enq210ToKbn__);
        msgForm.addHiddenParam("enq210AnsYear", enq210AnsYear__);
        msgForm.addHiddenParam("enq210AnsMonth", enq210AnsMonth__);
        msgForm.addHiddenParam("enq210AnsDay", enq210AnsDay__);
        msgForm.addHiddenParam("enq210AnsPubFrYear", enq210AnsPubFrYear__);
        msgForm.addHiddenParam("enq210AnsPubFrMonth", enq210AnsPubFrMonth__);
        msgForm.addHiddenParam("enq210AnsPubFrDay", enq210AnsPubFrDay__);
        msgForm.addHiddenParam("enq210Anony", enq210Anony__);
        msgForm.addHiddenParam("enq210AnsOpen", enq210AnsOpen__);
        msgForm.addHiddenParam("enq210smailInfo", enq210smailInfo__);
        msgForm.addHiddenParam("enq210Seq", enq210Seq__);
        msgForm.addHiddenParam("enq210initFlg", enq210initFlg__);
        msgForm.addHiddenParam("enq210queSeqType", enq210queSeqType__);
        msgForm.addHiddenParam("enq210answerGroup", enq210answerGroup__);
        msgForm.addHiddenParam("enq210answerList", enq210answerList__);
    }

    /**
     * <br>[機  能] 入力チェックを行う
     * <br>[解  説]
     * <br>[備  考]
     * @param reqMdl リクエスト情報
     * @param tempDir テンポラリディレクトリパス
     * @param con コネクション
     * @return ActionErrors
     * @throws IOToolsException 添付ファイルの読み込みに失敗
     * @throws SQLException SQL実行例外
     */
    public ActionErrors validateInput(RequestModel reqMdl, String tempDir, Connection con)
    throws IOToolsException, SQLException {
        ActionErrors errors = new ActionErrors();
        GsMessage gsMsg = new GsMessage(reqMdl);

        //タイトル
        EnqValidateUtil.validateTextBoxInput(errors, enq210Title__,
                "enq210Title",
                gsMsg.getMessage("cmn.title"),
                GSConstEnquete.MAX_LEN_EMN_TITLE, true);

        //添付ファイル
        if (getEnq210AttachKbn() == GSConstEnquete.EQM_ATTACH_KBN_IMAGE
        || getEnq210AttachKbn() == GSConstEnquete.EQM_ATTACH_KBN_FILE) {
            Enq210Biz biz = new Enq210Biz();
            String fileName = biz.getTempFileName(reqMdl, tempDir);
            String fieldfix = "enq210attachFile.";
            String msgKey = null;
            if (StringUtil.isNullZeroString(fileName)) {
                msgKey = "error.select.required.text";
                ActionMessage msg = new ActionMessage(msgKey,
                                                    gsMsg.getMessage("cmn.attach.file"));
                StrutsUtil.addMessage(
                        errors, msg, fieldfix + msgKey);
            } else if (getEnq210AttachKbn() == GSConstEnquete.EQM_ATTACH_KBN_IMAGE
            && !Cmn110Biz.isExtensionOk(fileName)) {
                msgKey = "error.select2.required.extent";
                ActionMessage msg = new ActionMessage(msgKey, gsMsg.getMessage("cmn.attach.file"));
                StrutsUtil.addMessage(
                        errors, msg, fieldfix + msgKey);
            }
        }

        if (getEnq210editMode() != Enq210Form.EDITMODE_TEMPLATE) {


            //結果公開開始日 日付論理チェック
            boolean ansOpen = (enq210AnsOpen__ == ANS_OPEN);
            boolean errAnsPubFrDateFlg = false;
            //結果公開終了日 日付論理チェック
            boolean toDateFlg = enq210ToKbn__ == TO_DATE_NOLIMIT;
            int beforeErrCnt = errors.size();
            //公開開始日 日付論理チェック
            EnqValidateUtil.validateDate(reqMdl, errors,
                    "enq210date" + FROM_DATE_FLG,
                    gsMsg.getMessage("enq.53"),
                    enq210FrYear__,
                    enq210FrMonth__,
                    enq210FrDay__,
                    true);

            //回答期限 日付論理チェック
            EnqValidateUtil.validateDate(reqMdl, errors,
                    "enq210date" + ANS_DATE_FLG,
                    gsMsg.getMessage("enq.19"),
                    enq210AnsYear__,
                    enq210AnsMonth__,
                    enq210AnsDay__,
                    true);
            if (ansOpen) {
                EnqValidateUtil.validateDate(reqMdl, errors,
                        "enq210ansPubFrdate",
                        gsMsg.getMessage("enq.74"),
                        enq210AnsPubFrYear__,
                        enq210AnsPubFrMonth__,
                        enq210AnsPubFrDay__,
                        true);
                if (!toDateFlg) {
                    EnqValidateUtil.validateDate(reqMdl, errors,
                            "enq210date" + ANS_DATE_FLG,
                            gsMsg.getMessage("enq.75"),
                            enq210ToYear__,
                            enq210ToMonth__,
                            enq210ToDay__,
                            true);
                }
            }
            errAnsPubFrDateFlg = errors.size() == beforeErrCnt;


            //結果公開開始日 <= 結果公開終了日
            if (errAnsPubFrDateFlg && ansOpen) {
                if (!toDateFlg) {
                    EnqValidateUtil.validateDate(reqMdl, errors,
                            "enq210ansPubDate",
                            gsMsg.getMessage("enq.74"),
                            enq210AnsPubFrYear__,
                            enq210AnsPubFrMonth__,
                            enq210AnsPubFrDay__,
                            enq210ToYear__,
                            enq210ToMonth__,
                            enq210ToDay__,
                            ANS_PUB_FROM_DATE_FLG);
                }

                //公開開始日 <= 結果公開開始日
                EnqValidateUtil.validateDate(reqMdl, errors,
                        "enq210pubDate" + FROM_DATE_FLG,
                        gsMsg.getMessage("enq.53"),
                        enq210FrYear__,
                        enq210FrMonth__,
                        enq210FrDay__,
                        enq210AnsPubFrYear__,
                        enq210AnsPubFrMonth__,
                        enq210AnsPubFrDay__,
                        FROM_DATE_FLG);
                //回答期限 <= 結果公開終了日
                if (!toDateFlg) {
                    EnqValidateUtil.validateDate(reqMdl, errors,
                            "enq210pubDate" + TO_DATE_FLG,
                            gsMsg.getMessage("enq.19"),
                            enq210AnsYear__,
                            enq210AnsMonth__,
                            enq210AnsDay__,
                            enq210ToYear__,
                            enq210ToMonth__,
                            enq210ToDay__,
                            TO_DATE_FLG);
                }

            }

            //公開開始日 <= 回答期限
            int errCnt = errors.size();
            EnqValidateUtil.validateDate(reqMdl, errors,
                    "enq210pubDate" + ANS_DATE_FLG,
                    gsMsg.getMessage("enq.19"),
                    enq210FrYear__,
                    enq210FrMonth__,
                    enq210FrDay__,
                    enq210AnsYear__,
                    enq210AnsMonth__,
                    enq210AnsDay__,
                    ANS_DATE_FLG);
            int dateErrCnt = errors.size() -  errCnt;


            //ショートメール
            if (getEnq210smailInfo() == SML_INFO_SEND
            && dateErrCnt == 0) {
                //現在日が公開開始日 ～ 回答期限日の期間外の場合、ショートメール通知を不可とする
                UDate now = new UDate();
                UDate openFrDate = new UDate();
                openFrDate.setDate(enq210FrYear__, enq210FrMonth__, enq210FrDay__);
                UDate ansLimitDate = new UDate();
                ansLimitDate.setDate(enq210AnsYear__, enq210AnsMonth__, enq210AnsDay__);
                if (now.compareDateYMD(openFrDate) == UDate.LARGE
                || now.compareDateYMD(ansLimitDate) == UDate.SMALL) {
                    String fieldfix = "enq210smailInfo.";
                    String msgKey = "errors.free.msg";
                    ActionMessage msg
                        = new ActionMessage(msgKey, gsMsg.getMessage("enq.enq210.17"));
                    StrutsUtil.addMessage(errors, msg, fieldfix + msgKey);
                }
            }

            //対象者
            boolean existAnswer = false;
            if (enq210answerList__ != null && enq210answerList__.length > 0) {
                Enq210Biz biz = new Enq210Biz();

                int grpCnt = 0;
                CmnUsrmDao usrmDao = new CmnUsrmDao(con);
                for (String answer : enq210answerList__) {

                    //グループ、または対象者に指定可能なユーザかを判定
                    if (answer.startsWith("G")) {
                        // グループに所属ユーザが1人以上存在するかチェック
                        int grpSid = NullDefault.getInt(
                                StringUtil.substitute(answer, "G", ""), -1);
                        existAnswer = __checkCntBelongUser(errors, grpSid, con);
                        grpCnt++;
                    } else if (biz.canAnsUser(answer)) {
                        existAnswer = !usrmDao.isDeleteUserHnt(Integer.parseInt(answer));
                    }

                    //有効ユーザが1人以上存在する場合、チェックを終了する
                    if (existAnswer) {
                        break;
                    }
                }
                if (!existAnswer) {
                    ActionMessage msg = null;
                    String msgKey = null;
                    String fieldfix = "enq210answerList.";
                    if (grpCnt > 0) {
                        msgKey = "error.cant.exist.user";
                        msg = new ActionMessage(msgKey);
                        StrutsUtil.addMessage(errors, msg, fieldfix + msgKey);
                    } else {
                        msgKey = "error.select.required.text";
                        msg = new ActionMessage(msgKey,
                                gsMsg.getMessage("enq.10"));
                        StrutsUtil.addMessage(
                                errors, msg, fieldfix + msgKey);
                    }
                }
            } else {
                String fieldfix = "enq210answerList.";
                String msgKey = "error.select.required.text";
                ActionMessage msg = new ActionMessage(msgKey,
                        gsMsg.getMessage("enq.10"));
                StrutsUtil.addMessage(
                        errors, msg, fieldfix + msgKey);
            }

            //設問情報 入力チェック
            Enq210Biz biz = new Enq210Biz();
            setEbaList(biz.readQueList(tempDir));
            if (getEbaList().size() == 0) {
                String fieldfix = "ebaList__.";
                String msgKey = "error.input.required.text";
                ActionMessage msg = new ActionMessage(msgKey,
                        gsMsg.getMessage("enq.11"));
                StrutsUtil.addMessage(
                        errors, msg, fieldfix + msgKey);
            }
        }

        //コメントのみ
        if (getEnq210editMode() != Enq210Form.EDITMODE_TEMPLATE
                && getEbaList().size() > 0) {
            int flg = 0;
            for (int idx = 0; idx < getEbaList().size(); idx++) {
                int queKbn = getEbaList().get(idx).getEnq210QueKbn();
                if (queKbn == GSConstEnquete.SYURUI_COMMENT) {
                    flg = 0;
                } else {
                    flg = 1;
                    break;
                }
            }

            if (flg == 0) {
                String fieldfix = "ebaList__.";
                String msgKey = "errors.free.msg";
                ActionMessage msg = new ActionMessage(msgKey, gsMsg.getMessage("enq.enq210.13"));
                StrutsUtil.addMessage(
                        errors, msg, fieldfix + msgKey);
            }
        }

        return errors;
    }

    /**
     * <br>[機  能] 草稿保存時入力チェックを行う
     * <br>[解  説]
     * <br>[備  考]
     * @param reqMdl リクエスト情報
     * @param tempDir テンポラリディレクトリパス
     * @return ActionErrors
     * @throws IOToolsException 添付ファイルの読み込みに失敗
     */
    public ActionErrors validateInputDraft(RequestModel reqMdl, String tempDir)
    throws IOToolsException {
        ActionErrors errors = new ActionErrors();
        GsMessage gsMsg = new GsMessage(reqMdl);

        //タイトル
        EnqValidateUtil.validateTextBoxInput(errors, enq210Title__,
                "enq210Title",
                gsMsg.getMessage("cmn.title"),
                GSConstEnquete.MAX_LEN_EMN_TITLE, true);

        //公開開始日 日付論理チェック
        EnqValidateUtil.validateDate(reqMdl, errors,
                "enq210FrDate",
                gsMsg.getMessage("enq.53"),
                enq210FrYear__,
                enq210FrMonth__,
                enq210FrDay__, false);

        //回答期限 日付論理チェック
        EnqValidateUtil.validateDate(reqMdl, errors,
                "enq210AnsDate",
                gsMsg.getMessage("enq.19"),
                enq210AnsYear__,
                enq210AnsMonth__,
                enq210AnsDay__, false);
        boolean ansOpen = (enq210AnsOpen__ == ANS_OPEN);
        if (ansOpen) {
            //結果公開開始日 日付論理チェック
            EnqValidateUtil.validateDate(reqMdl, errors,
                    "enq210ansPubFrdate",
                    gsMsg.getMessage("enq.74"),
                    enq210AnsPubFrYear__,
                    enq210AnsPubFrMonth__,
                    enq210AnsPubFrDay__,
                    false);

            //結果結果公開終了日 日付論理チェック
            boolean toDateFlg = enq210ToKbn__ == TO_DATE_NOLIMIT;
            if (!toDateFlg) {
                EnqValidateUtil.validateDate(reqMdl, errors,
                        "enq210ToDate",
                        gsMsg.getMessage("enq.75"),
                        enq210ToYear__,
                        enq210ToMonth__,
                        enq210ToDay__, false);
            }
        }
        //添付ファイル
        if (getEnq210AttachKbn() == GSConstEnquete.EQM_ATTACH_KBN_IMAGE
        || getEnq210AttachKbn() == GSConstEnquete.EQM_ATTACH_KBN_FILE) {
            Enq210Biz biz = new Enq210Biz();
            String fileName = biz.getTempFileName(reqMdl, tempDir);
            if (StringUtil.isNullZeroString(fileName)) {
                String fieldfix = "enq210attachFile.";
                String msgKey = "error.select.required.text";
                ActionMessage msg = new ActionMessage(msgKey,
                                                    gsMsg.getMessage("cmn.attach.file"));
                StrutsUtil.addMessage(
                        errors, msg, fieldfix + msgKey);
            }
        }
        return errors;
    }

    /**
     * <br>[機  能]
     * <br>[解  説]
     * <br>[備  考]
     * @param errors ActionErrors
     * @param grpSid グループSID
     * @param con コネクション
     * @return true:所属ユーザが存在、false:所属ユーザが存在しない
     * @throws SQLException SQL実行例外
     */
    private boolean __checkCntBelongUser(ActionErrors errors, int grpSid, Connection con)
            throws SQLException {

        boolean ret = false;
        UserBiz userBiz = new UserBiz();
        try {
            //所属ユーザーリストを作成します。
            List<SltUserPerGroupModel> alist
                = userBiz.getUserPerGroupList(con, grpSid, null, true);
            if (alist != null && alist.size() > 0) {
                ret = true;
//                ActionMessage msg = null;
//                CmnGroupmModel mdl = new CmnGroupmModel();
//                CmnGroupmDao dao = new CmnGroupmDao(con);
//                mdl = dao.select(grpSid);
//                msg = new ActionMessage(
//                        "error.cant.exist.user", mdl.getGrpName());
//                StrutsUtil.addMessage(
//                        errors, msg, "error.cant.exist.user " + String.valueOf(grpSid));
            }
        } catch (SQLException e) {
            throw e;
        }

        return ret;
    }

    /**
     * <p>enq210editMode を取得します。
     * @return enq210editMode
     */
    public int getEnq210editMode() {
        return enq210editMode__;
    }

    /**
     * <p>enq210editMode をセットします。
     * @param enq210editMode enq210editMode
     */
    public void setEnq210editMode(int enq210editMode) {
        enq210editMode__ = enq210editMode;
    }

    /**
     * <p>enq210initFlg を取得します。
     * @return enq210initFlg
     */
    public int getEnq210initFlg() {
        return enq210initFlg__;
    }

    /**
     * <p>enq210initFlg をセットします。
     * @param enq210initFlg enq210initFlg
     */
    public void setEnq210initFlg(int enq210initFlg) {
        enq210initFlg__ = enq210initFlg;
    }

    /**
     * <p>enq210templateId を取得します。
     * @return enq210templateId
     */
    public long getEnq210templateId() {
        return enq210templateId__;
    }

    /**
     * <p>enq210templateId をセットします。
     * @param enq210templateId enq210templateId
     */
    public void setEnq210templateId(long enq210templateId) {
        enq210templateId__ = enq210templateId;
    }

    /**
     * <p>enq210scrollQuestonFlg を取得します。
     * @return enq210scrollQuestonFlg
     */
    public int getEnq210scrollQuestonFlg() {
        return enq210scrollQuestonFlg__;
    }

    /**
     * <p>enq210scrollQuestonFlg をセットします。
     * @param enq210scrollQuestonFlg enq210scrollQuestonFlg
     */
    public void setEnq210scrollQuestonFlg(int enq210scrollQuestonFlg) {
        enq210scrollQuestonFlg__ = enq210scrollQuestonFlg;
    }

    /**
     * <p>enq210queType を取得します。
     * @return enq210queType
     */
    public int getEnq210queType() {
        return enq210queType__;
    }

    /**
     * <p>enq210queType をセットします。
     * @param enq210queType enq210queType
     */
    public void setEnq210queType(int enq210queType) {
        enq210queType__ = enq210queType;
    }

    /**
     * <p>enq210queIndex を取得します。
     * @return enq210queIndex
     */
    public int getEnq210queIndex() {
        return enq210queIndex__;
    }

    /**
     * <p>enq210queIndex をセットします。
     * @param enq210queIndex enq210queIndex
     */
    public void setEnq210queIndex(int enq210queIndex) {
        enq210queIndex__ = enq210queIndex;
    }

    /**
     * <p>enq210editQueIndex を取得します。
     * @return enq210editQueIndex
     */
    public int getEnq210editQueIndex() {
        return enq210editQueIndex__;
    }

    /**
     * <p>enq210editQueIndex をセットします。
     * @param enq210editQueIndex enq210editQueIndex
     */
    public void setEnq210editQueIndex(int enq210editQueIndex) {
        enq210editQueIndex__ = enq210editQueIndex;
    }

    /**
     * <p>enq210queSeqType を取得します。
     * @return enq210queSeqType
     */
    public int getEnq210queSeqType() {
        return enq210queSeqType__;
    }

    /**
     * <p>enq210queSeqType をセットします。
     * @param enq210queSeqType enq210queSeqType
     */
    public void setEnq210queSeqType(int enq210queSeqType) {
        enq210queSeqType__ = enq210queSeqType;
    }

    /**
     * <p>enq210DataKbn を取得します。
     * @return enq210DataKbn
     */
    public int getEnq210DataKbn() {
        return enq210DataKbn__;
    }
    /**
     * <p>enq210DataKbn をセットします。
     * @param enq210DataKbn enq210DataKbn
     */
    public void setEnq210DataKbn(int enq210DataKbn) {
        enq210DataKbn__ = enq210DataKbn;
    }
    /**
     * <p>enq210Syurui を取得します。
     * @return enq210Syurui
     */
    public int getEnq210Syurui() {
        return enq210Syurui__;
    }
    /**
     * <p>enq210Syurui をセットします。
     * @param enq210Syurui enq210Syurui
     */
    public void setEnq210Syurui(int enq210Syurui) {
        enq210Syurui__ = enq210Syurui;
    }
    /**
     * <p>enq210Title を取得します。
     * @return enq210Title
     */
    public String getEnq210Title() {
        return enq210Title__;
    }
    /**
     * <p>enq210Title をセットします。
     * @param enq210Title enq210Title
     */
    public void setEnq210Title(String enq210Title) {
        enq210Title__ = enq210Title;
    }
    /**
     * <p>enq210Juuyou を取得します。
     * @return enq210Juuyou
     */
    public int getEnq210Juuyou() {
        return enq210Juuyou__;
    }
    /**
     * <p>enq210Juuyou をセットします。
     * @param enq210Juuyou enq210Juuyou
     */
    public void setEnq210Juuyou(int enq210Juuyou) {
        enq210Juuyou__ = enq210Juuyou;
    }
    /**
     * <p>enq210Desc を取得します。
     * @return enq210Desc
     */
    public String getEnq210Desc() {
        return enq210Desc__;
    }
    /**
     * <p>enq210Desc をセットします。
     * @param enq210Desc enq210Desc
     */
    public void setEnq210Desc(String enq210Desc) {
        enq210Desc__ = enq210Desc;
    }
    /**
     * <p>enq210DescText を取得します。
     * @return enq210DescText
     */
    public String getEnq210DescText() {
        return enq210DescText__;
    }

    /**
     * <p>enq210DescText をセットします。
     * @param enq210DescText enq210DescText
     */
    public void setEnq210DescText(String enq210DescText) {
        enq210DescText__ = enq210DescText;
    }

    /**
     * <p>enq210AttachKbn を取得します。
     * @return enq210AttachKbn
     */
    public int getEnq210AttachKbn() {
        return enq210AttachKbn__;
    }
    /**
     * <p>enq210AttachKbn をセットします。
     * @param enq210AttachKbn enq210AttachKbn
     */
    public void setEnq210AttachKbn(int enq210AttachKbn) {
        enq210AttachKbn__ = enq210AttachKbn;
    }
    /**
     * <p>enq210fileDir を取得します。
     * @return enq210fileDir
     */
    public String getEnq210fileDir() {
        return enq210fileDir__;
    }

    /**
     * <p>enq210fileDir をセットします。
     * @param enq210fileDir enq210fileDir
     */
    public void setEnq210fileDir(String enq210fileDir) {
        enq210fileDir__ = enq210fileDir;
    }

    /**
     * <p>enq210file を取得します。
     * @return enq210file
     */
    public String[] getEnq210file() {
        return enq210file__;
    }
    /**
     * <p>enq210file をセットします。
     * @param enq210file enq210file
     */
    public void setEnq210file(String[] enq210file) {
        enq210file__ = enq210file;
    }
    /**
     * <p>enq210fileName を取得します。
     * @return enq210fileName
     */
    public String getEnq210fileName() {
        return enq210fileName__;
    }

    /**
     * <p>enq210fileName をセットします。
     * @param enq210fileName enq210fileName
     */
    public void setEnq210fileName(String enq210fileName) {
        enq210fileName__ = enq210fileName;
    }

    /**
     * <p>enq210AttachPos を取得します。
     * @return enq210AttachPos
     */
    public int getEnq210AttachPos() {
        return enq210AttachPos__;
    }
    /**
     * <p>enq210AttachPos をセットします。
     * @param enq210AttachPos enq210AttachPos
     */
    public void setEnq210AttachPos(int enq210AttachPos) {
        enq210AttachPos__ = enq210AttachPos;
    }
    /**
     * <p>enq210FrYear を取得します。
     * @return enq210FrYear
     */
    public int getEnq210FrYear() {
        return enq210FrYear__;
    }

    /**
     * <p>enq210FrYear をセットします。
     * @param enq210FrYear enq210FrYear
     */
    public void setEnq210FrYear(int enq210FrYear) {
        enq210FrYear__ = enq210FrYear;
    }

    /**
     * <p>enq210FrMonth を取得します。
     * @return enq210FrMonth
     */
    public int getEnq210FrMonth() {
        return enq210FrMonth__;
    }

    /**
     * <p>enq210FrMonth をセットします。
     * @param enq210FrMonth enq210FrMonth
     */
    public void setEnq210FrMonth(int enq210FrMonth) {
        enq210FrMonth__ = enq210FrMonth;
    }

    /**
     * <p>enq210FrDay を取得します。
     * @return enq210FrDay
     */
    public int getEnq210FrDay() {
        return enq210FrDay__;
    }

    /**
     * <p>enq210FrDay をセットします。
     * @param enq210FrDay enq210FrDay
     */
    public void setEnq210FrDay(int enq210FrDay) {
        enq210FrDay__ = enq210FrDay;
    }

    /**
     * <p>enq210ToYear を取得します。
     * @return enq210ToYear
     */
    public int getEnq210ToYear() {
        return enq210ToYear__;
    }

    /**
     * <p>enq210ToYear をセットします。
     * @param enq210ToYear enq210ToYear
     */
    public void setEnq210ToYear(int enq210ToYear) {
        enq210ToYear__ = enq210ToYear;
    }

    /**
     * <p>enq210ToMonth を取得します。
     * @return enq210ToMonth
     */
    public int getEnq210ToMonth() {
        return enq210ToMonth__;
    }

    /**
     * <p>enq210ToMonth をセットします。
     * @param enq210ToMonth enq210ToMonth
     */
    public void setEnq210ToMonth(int enq210ToMonth) {
        enq210ToMonth__ = enq210ToMonth;
    }

    /**
     * <p>enq210ToDay を取得します。
     * @return enq210ToDay
     */
    public int getEnq210ToDay() {
        return enq210ToDay__;
    }

    /**
     * <p>enq210ToDay をセットします。
     * @param enq210ToDay enq210ToDay
     */
    public void setEnq210ToDay(int enq210ToDay) {
        enq210ToDay__ = enq210ToDay;
    }

    /**
     * <p>enq210ToKbn を取得します。
     * @return enq210ToKbn
     */
    public int getEnq210ToKbn() {
        return enq210ToKbn__;
    }

    /**
     * <p>enq210ToKbn をセットします。
     * @param enq210ToKbn enq210ToKbn
     */
    public void setEnq210ToKbn(int enq210ToKbn) {
        enq210ToKbn__ = enq210ToKbn;
    }

    /**
     * <p>enq210AnsYear を取得します。
     * @return enq210AnsYear
     */
    public int getEnq210AnsYear() {
        return enq210AnsYear__;
    }

    /**
     * <p>enq210AnsYear をセットします。
     * @param enq210AnsYear enq210AnsYear
     */
    public void setEnq210AnsYear(int enq210AnsYear) {
        enq210AnsYear__ = enq210AnsYear;
    }

    /**
     * <p>enq210AnsMonth を取得します。
     * @return enq210AnsMonth
     */
    public int getEnq210AnsMonth() {
        return enq210AnsMonth__;
    }

    /**
     * <p>enq210AnsMonth をセットします。
     * @param enq210AnsMonth enq210AnsMonth
     */
    public void setEnq210AnsMonth(int enq210AnsMonth) {
        enq210AnsMonth__ = enq210AnsMonth;
    }

    /**
     * <p>enq210AnsDay を取得します。
     * @return enq210AnsDay
     */
    public int getEnq210AnsDay() {
        return enq210AnsDay__;
    }

    /**
     * <p>enq210AnsDay をセットします。
     * @param enq210AnsDay enq210AnsDay
     */
    public void setEnq210AnsDay(int enq210AnsDay) {
        enq210AnsDay__ = enq210AnsDay;
    }

    /**
     * <p>enq210AnsPubFrYear を取得します。
     * @return enq210AnsPubFrYear
     */
    public int getEnq210AnsPubFrYear() {
        return enq210AnsPubFrYear__;
    }

    /**
     * <p>enq210AnsPubFrYear をセットします。
     * @param enq210AnsPubFrYear enq210AnsPubFrYear
     */
    public void setEnq210AnsPubFrYear(int enq210AnsPubFrYear) {
        enq210AnsPubFrYear__ = enq210AnsPubFrYear;
    }

    /**
     * <p>enq210AnsPubFrMonth を取得します。
     * @return enq210AnsPubFrMonth
     */
    public int getEnq210AnsPubFrMonth() {
        return enq210AnsPubFrMonth__;
    }

    /**
     * <p>enq210AnsPubFrMonth をセットします。
     * @param enq210AnsPubFrMonth enq210AnsPubFrMonth
     */
    public void setEnq210AnsPubFrMonth(int enq210AnsPubFrMonth) {
        enq210AnsPubFrMonth__ = enq210AnsPubFrMonth;
    }

    /**
     * <p>enq210AnsPubFrDay を取得します。
     * @return enq210AnsPubFrDay
     */
    public int getEnq210AnsPubFrDay() {
        return enq210AnsPubFrDay__;
    }

    /**
     * <p>enq210AnsPubFrDay をセットします。
     * @param enq210AnsPubFrDay enq210AnsPubFrDay
     */
    public void setEnq210AnsPubFrDay(int enq210AnsPubFrDay) {
        enq210AnsPubFrDay__ = enq210AnsPubFrDay;
    }

    /**
     * <p>enq210Anony を取得します。
     * @return enq210Anony
     */
    public int getEnq210Anony() {
        return enq210Anony__;
    }
    /**
     * <p>enq210Anony をセットします。
     * @param enq210Anony enq210Anony
     */
    public void setEnq210Anony(int enq210Anony) {
        enq210Anony__ = enq210Anony;
    }
    /**
     * <p>enq210AnsOpen を取得します。
     * @return enq210AnsOpen
     */
    public int getEnq210AnsOpen() {
        return enq210AnsOpen__;
    }
    /**
     * <p>enq210AnsOpen をセットします。
     * @param enq210AnsOpen enq210AnsOpen
     */
    public void setEnq210AnsOpen(int enq210AnsOpen) {
        enq210AnsOpen__ = enq210AnsOpen;
    }
    /**
     * <p>enq210Url を取得します。
     * @return enq210Url
     */
    public String getEnq210Url() {
        return enq210Url__;
    }

    /**
     * <p>enq210Url をセットします。
     * @param enq210Url enq210Url
     */
    public void setEnq210Url(String enq210Url) {
        enq210Url__ = enq210Url;
    }

    /**
     * <p>enq210TempDspName を取得します。
     * @return enq210TempDspName
     */
    public String getEnq210TempDspName() {
        return enq210TempDspName__;
    }

    /**
     * <p>enq210TempDspName をセットします。
     * @param enq210TempDspName enq210TempDspName
     */
    public void setEnq210TempDspName(String enq210TempDspName) {
        enq210TempDspName__ = enq210TempDspName;
    }

    /**
     * <p>enq210Send を取得します。
     * @return enq210Send
     */
    public String getEnq210Send() {
        return enq210Send__;
    }

    /**
     * <p>enq210Send をセットします。
     * @param enq210Send enq210Send
     */
    public void setEnq210Send(String enq210Send) {
        enq210Send__ = enq210Send;
    }
    /**
     * <p>enq210smailInfo を取得します。
     * @return enq210smailInfo
     */
    public int getEnq210smailInfo() {
        return enq210smailInfo__;
    }

    /**
     * <p>enq210smailInfo をセットします。
     * @param enq210smailInfo enq210smailInfo
     */
    public void setEnq210smailInfo(int enq210smailInfo) {
        enq210smailInfo__ = enq210smailInfo;
    }

    /**
     * <p>enq210pluginSmailUse を取得します。
     * @return enq210pluginSmailUse
     */
    public int getEnq210pluginSmailUse() {
        return enq210pluginSmailUse__;
    }

    /**
     * <p>enq210pluginSmailUse をセットします。
     * @param enq210pluginSmailUse enq210pluginSmailUse
     */
    public void setEnq210pluginSmailUse(int enq210pluginSmailUse) {
        enq210pluginSmailUse__ = enq210pluginSmailUse;
    }

    /**
     * <p>enq210Alert を取得します。
     * @return enq210Alert
     */
    public int getEnq210Alert() {
        return enq210Alert__;
    }

    /**
     * <p>enq210Alert をセットします。
     * @param enq210Alert enq210Alert
     */
    public void setEnq210Alert(int enq210Alert) {
        enq210Alert__ = enq210Alert;
    }

    /**
     * <p>tempClickBtn を取得します。
     * @return tempClickBtn
     */
    public int getTempClickBtn() {
        return tempClickBtn__;
    }

    /**
     * <p>tempClickBtn をセットします。
     * @param tempClickBtn tempClickBtn
     */
    public void setTempClickBtn(int tempClickBtn) {
        tempClickBtn__ = tempClickBtn;
    }

    /**
     * <p>answerDataReset を取得します。
     * @return answerDataReset
     */
    public int getAnswerDataReset() {
        return answerDataReset__;
    }

    /**
     * <p>answerDataReset をセットします。
     * @param answerDataReset answerDataReset
     */
    public void setAnswerDataReset(int answerDataReset) {
        answerDataReset__ = answerDataReset;
    }

    /**
     * <p>enq210DelAnsFlg を取得します。
     * @return enq210DelAnsFlg
     */
    public boolean isEnq210DelAnsFlg() {
        return enq210DelAnsFlg__;
    }

    /**
     * <p>enq210DelAnsFlg をセットします。
     * @param enq210DelAnsFlg enq210DelAnsFlg
     */
    public void setEnq210DelAnsFlg(boolean enq210DelAnsFlg) {
        enq210DelAnsFlg__ = enq210DelAnsFlg;
    }

    /**
     * <p>enqSenderList を取得します。
     * @return enqSenderList
     */
    public List<UsrLabelValueBean> getEnqSenderList() {
        return enqSenderList__;
    }

    /**
     * <p>enqSenderList をセットします。
     * @param enqSenderList enqSenderList
     */
    public void setEnqSenderList(List<UsrLabelValueBean> enqSenderList) {
        enqSenderList__ = enqSenderList;
    }

    /**
     * <p>enq210YearLabel を取得します。
     * @return enq210YearLabel
     */
    public ArrayList<LabelValueBean> getEnq210YearLabel() {
        return enq210YearLabel__;
    }
    /**
     * <p>enq210YearLabel をセットします。
     * @param enq210YearLabel enq210YearLabel
     */
    public void setEnq210YearLabel(ArrayList<LabelValueBean> enq210YearLabel) {
        enq210YearLabel__ = enq210YearLabel;
    }
    /**
     * <p>enq210MonthLabel を取得します。
     * @return enq210MonthLabel
     */
    public ArrayList<LabelValueBean> getEnq210MonthLabel() {
        return enq210MonthLabel__;
    }
    /**
     * <p>enq210MonthLabel をセットします。
     * @param enq210MonthLabel enq210MonthLabel
     */
    public void setEnq210MonthLabel(ArrayList<LabelValueBean> enq210MonthLabel) {
        enq210MonthLabel__ = enq210MonthLabel;
    }
    /**
     * <p>enq210DayLabel を取得します。
     * @return enq210DayLabel
     */
    public ArrayList<LabelValueBean> getEnq210DayLabel() {
        return enq210DayLabel__;
    }
    /**
     * <p>enq210DayLabel をセットします。
     * @param enq210DayLabel enq210DayLabel
     */
    public void setEnq210DayLabel(ArrayList<LabelValueBean> enq210DayLabel) {
        enq210DayLabel__ = enq210DayLabel;
    }
    /**
     * <p>enq210FileLabelList を取得します。
     * @return enq210FileLabelList
     */
    public List<LabelValueBean> getEnq210FileLabelList() {
        return enq210FileLabelList__;
    }
    /**
     * <p>enq210FileLabelList をセットします。
     * @param enq210FileLabelList enq210FileLabelList
     */
    public void setEnq210FileLabelList(List<LabelValueBean> enq210FileLabelList) {
        enq210FileLabelList__ = enq210FileLabelList;
    }
    /**
     * <p>enq210TemplatelList を取得します。
     * @return enq210TemplatelList
     */
    public List<LabelValueBean> getEnq210TemplatelList() {
        return enq210TemplatelList__;
    }

    /**
     * <p>enq210TemplatelList をセットします。
     * @param enq210TemplatelList enq210TemplatelList
     */
    public void setEnq210TemplatelList(List<LabelValueBean> enq210TemplatelList) {
        enq210TemplatelList__ = enq210TemplatelList;
    }

    /**
     * <p>enqTypeList を取得します。
     * @return enqTypeList
     */
    public List<LabelValueBean> getEnqTypeList() {
        return enqTypeList__;
    }

    /**
     * <p>enqTypeList をセットします。
     * @param enqTypeList enqTypeList
     */
    public void setEnqTypeList(List<LabelValueBean> enqTypeList) {
        enqTypeList__ = enqTypeList;
    }

    /**
     * <p>enq210Seq を取得します。
     * @return enq210Seq
     */
    public int getEnq210Seq() {
        return enq210Seq__;
    }
    /**
     * <p>enq210Seq をセットします。
     * @param enq210Seq enq210Seq
     */
    public void setEnq210Seq(int enq210Seq) {
        enq210Seq__ = enq210Seq;
    }
    /**
     * <p>ebaList を取得します。
     * @return ebaList
     */
    public List<Enq210QueModel> getEbaList() {
        return ebaList__;
    }
    /**
     * <p>ebaList をセットします。
     * @param ebaList ebaList
     */
    public void setEbaList(List<Enq210QueModel> ebaList) {
        ebaList__ = ebaList;
    }

    /**
     * <p>enq210answerGroup を取得します。
     * @return enq210answerGroup
     */
    public int getEnq210answerGroup() {
        return enq210answerGroup__;
    }

    /**
     * <p>enq210answerGroup をセットします。
     * @param enq210answerGroup enq210answerGroup
     */
    public void setEnq210answerGroup(int enq210answerGroup) {
        enq210answerGroup__ = enq210answerGroup;
    }

    /**
     * <p>enq210answerList を取得します。
     * @return enq210answerList
     */
    public String[] getEnq210answerList() {
        return enq210answerList__;
    }

    /**
     * <p>enq210answerList をセットします。
     * @param enq210answerList enq210answerList
     */
    public void setEnq210answerList(String[] enq210answerList) {
        enq210answerList__ = enq210answerList;
    }

    /**
     * <p>enq210selectAnswerList を取得します。
     * @return enq210selectAnswerList
     */
    public String[] getEnq210selectAnswerList() {
        return enq210selectAnswerList__;
    }

    /**
     * <p>enq210selectAnswerList をセットします。
     * @param enq210selectAnswerList enq210selectAnswerList
     */
    public void setEnq210selectAnswerList(String[] enq210selectAnswerList) {
        enq210selectAnswerList__ = enq210selectAnswerList;
    }

    /**
     * <p>enq210NoSelectAnswerList を取得します。
     * @return enq210NoSelectAnswerList
     */
    public String[] getEnq210NoSelectAnswerList() {
        return enq210NoSelectAnswerList__;
    }

    /**
     * <p>enq210NoSelectAnswerList をセットします。
     * @param enq210NoSelectAnswerList enq210NoSelectAnswerList
     */
    public void setEnq210NoSelectAnswerList(String[] enq210NoSelectAnswerList) {
        enq210NoSelectAnswerList__ = enq210NoSelectAnswerList;
    }

    /**
     * <p>selectAnswerGroup を取得します。
     * @return selectAnswerGroup
     */
    public List<LabelValueBean> getSelectAnswerGroup() {
        return selectAnswerGroup__;
    }

    /**
     * <p>selectAnswerGroup をセットします。
     * @param selectAnswerGroup selectAnswerGroup
     */
    public void setSelectAnswerGroup(List<LabelValueBean> selectAnswerGroup) {
        selectAnswerGroup__ = selectAnswerGroup;
    }

    /**
     * <p>selectAnswerCombo を取得します。
     * @return selectAnswerCombo
     */
    public List<UsrLabelValueBean> getSelectAnswerCombo() {
        return selectAnswerCombo__;
    }

    /**
     * <p>selectAnswerCombo をセットします。
     * @param selectAnswerCombo selectAnswerCombo
     */
    public void setSelectAnswerCombo(List<UsrLabelValueBean> selectAnswerCombo) {
        selectAnswerCombo__ = selectAnswerCombo;
    }

    /**
     * <p>noSelectAnswerCombo を取得します。
     * @return noSelectAnswerCombo
     */
    public List<UsrLabelValueBean> getNoSelectAnswerCombo() {
        return noSelectAnswerCombo__;
    }

    /**
     * <p>noSelectAnswerCombo をセットします。
     * @param noSelectAnswerCombo noSelectAnswerCombo
     */
    public void setNoSelectAnswerCombo(List<UsrLabelValueBean> noSelectAnswerCombo) {
        noSelectAnswerCombo__ = noSelectAnswerCombo;
    }

    /**
     * <br>[機  能] 設問リストの件数を取得する
     * <br>[解  説]
     * <br>[備  考]
     * @return 設問リストの件数
     */
    public int getEbaListSize() {
        if (ebaList__ == null) {
            return 0;
        }
        return ebaList__.size();
    }
}
