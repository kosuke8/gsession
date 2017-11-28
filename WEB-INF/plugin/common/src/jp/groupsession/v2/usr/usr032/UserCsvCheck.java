package jp.groupsession.v2.usr.usr032;

import java.io.File;
import java.sql.Connection;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;

import jp.co.sjts.util.Encoding;
import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.StringUtil;
import jp.co.sjts.util.StringUtilKana;
import jp.co.sjts.util.csv.AbstractCsvRecordReader;
import jp.co.sjts.util.csv.CsvTokenizer;
import jp.co.sjts.util.struts.StrutsUtil;
import jp.groupsession.v2.cmn.biz.CommonBiz;
import jp.groupsession.v2.cmn.dao.base.CmnPswdConfDao;
import jp.groupsession.v2.cmn.dao.base.CmnUsrmDao;
import jp.groupsession.v2.cmn.login.ILogin;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.cmn.model.base.CmnPswdConfModel;
import jp.groupsession.v2.cmn.model.base.CmnUsrmModel;
import jp.groupsession.v2.man.GSConstMain;
import jp.groupsession.v2.struts.msg.GsMessage;
import jp.groupsession.v2.usr.GSConstUser;
import jp.groupsession.v2.usr.GSValidateUser;
import jp.groupsession.v2.usr.GSValidateUserCsv;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;

/**
 * <br>[機  能] ユーザインポート 取込みファイル(CSV)のチェックを行うクラス
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class UserCsvCheck extends AbstractCsvRecordReader {

    /** Logging インスタンス */
    private static Log log__ = LogFactory.getLog(UserCsvCheck.class);

    /** エラー行存在フラグ */
    private boolean errorFlg__ = false;
    /** コネクション */
    private Connection con__ = null;
    /** リクエスト情報 */
    private RequestModel reqMdl__ = null;
    /** アクションエラー */
    private ActionErrors errors__ = null;
    /** 有効データカウント */
    private int mode__ = 0;
    /** 有効データカウント */
    private int count__ = 0;
    /** グループID重複チェック用MAP */
    private HashMap<String, String> groupIdMap__;
    /** ログインID重複チェック用MAP */
    private HashMap<String, String> loginIdMap__;
    /** 既存のユーザ情報更新フラグ */
    private int updateFlg__ = 0;
    /** グループ作成フラグ */
    private int insertFlg__ = 0;

    /** 重複したユーザ数 */
    private int overlabCount__ = 0;

    /** パスワード変更区分 */
    private boolean canChangePassword__ = true;

    /** CSV列定義    */
    public enum COLNO {
       /** インポート区分 */
      IMPORTKBN,
      /** グループID*/
      GROUPID,
      /** グループID2 */
      GROUPID2,
      /** グループID3 */
      GROUPID3,
      /** グループID4 */
      GROUPID4,
      /** グループID5 */
      GROUPID5,
      /** グループID6 */
      GROUPID6,
      /** グループID7 */
      GROUPID7,
      /** グループID8 */
      GROUPID8,
      /** グループID9 */
      GROUPID9,
      /** グループID10 */
      GROUPID10,
      /** グループ名*/
      GROUPNAME,
      /** ユーザID*/
      USERID,
      /** パスワード*/
      PASSWD,
      /**社員/職員番号*/
      CODE,
      /** 姓*/
      SEI,
      /** 名*/
      MEI,
      /** 姓カナ*/
      SEIKN,
      /** 名カナ*/
      MEIKN,
      /** ログイン停止*/
      LOGINMUKO,
      /** 所属*/
      SYOZOKU,
      /** 役職*/
      YAKUSYOKU,
      /** ソートキー1*/
      SORT1,
      /** ソートキー2*/
      SORT2,
      /** 性別*/
      SEX,
      /** 入社年月日*/
      NYUSYADAY,
      /** 生年月日*/
      BARTHDAY,
      /** 生年月日公開フラグ*/
      BARTHDAY_OPN,
      /** メールアドレス１*/
      MAIL1,
      /** メールアドレスコメント１*/
      MAIL1COME,
      /** メールアドレス１公開フラグ*/
      MAIL1OPN,
      /** メールアドレス２*/
      MAIL2,
      /** メールアドレスコメント２*/
      MAIL2COME,
      /** メールアドレス２公開フラグ*/
      MAIL2OPN,
      /** メールアドレス３*/
      MAIL3,
      /** メールアドレスコメント３*/
      MAIL3COME,
      /** メールアドレス３公開フラグ*/
      MAIL3OPN,
      /** 郵便番号*/
      YBNCODE,
      /** 郵便番号公開フラグ*/
      YBNCODEOPN,
      /** 都道府県コード*/
      TDFKCODE,
      /** 都道府県公開フラグ*/
      TDFKCODEOPN,
      /** 住所１*/
      JUSYO1,
      /** 住所１公開フラグ*/
      JUSYO1OPN,
      /** 住所２*/
      JUSYO2,
      /** 住所２公開フラグ*/
      JUSYO2OPN,
      /** 電話番号１*/
      TEL1,
      /** 電話番号内線１*/
      TEL1NAISEN,
      /** 電話番号コメント１*/
      TEL1COME,
      /** 電話番号１公開フラグ*/
      TEL1OPN,
      /** 電話番号2*/
      TEL2,
      /** 電話番号内線2*/
      TEL2NAISEN,
      /** 電話番号コメント2*/
      TEL2COME,
      /** 電話番号2公開フラグ*/
      TEL2OPN,
      /** 電話番号3*/
      TEL3,
      /** 電話番号内線3*/
      TEL3NAISEN,
      /** 電話番号コメント3*/
      TEL3COME,
      /** 電話番号3公開フラグ*/
      TEL3OPN,
      /** ＦＡＸ１*/
      FAX1,
      /** ＦＡＸコメント１*/
      FAX1COME,
      /** ＦＡＸ１公開フラグ*/
      FAX1OPN,
      /** ＦＡＸ２*/
      FAX2,
      /** ＦＡＸコメント２*/
      FAX2COME,
      /** ＦＡＸ２公開フラグ*/
      FAX2OPN,
      /** ＦＡＸ３*/
      FAX3,
      /** ＦＡＸコメント３*/
      FAX3COME,
      /** ＦＡＸ３公開フラグ*/
      FAX3OPN,
      /** 備考*/
      BIKO
    }

    /** csv列定義実態 モードごとの列の違いが反映された配列*/
    private COLNO[] colArr__;

    /**
     * @return errors を戻します。
     */
    public ActionErrors getErrors() {
        return errors__;
    }

    /**
     * @param errors 設定する errors。
     */
    public void setErrors(ActionErrors errors) {
        errors__ = errors;
    }

    /**
     * @return con を戻します。
     */
    public Connection getCon() {
        return con__;
    }

    /**
     * @param con 設定する con。
     */
    public void setCon(Connection con) {
        con__ = con;
    }

    /**
     * @return errorFlg を戻します。
     */
    public boolean isErrorFlg() {
        return errorFlg__;
    }

    /**
     * @param errorFlg 設定する errorFlg。
     */
    public void setErrorFlg(boolean errorFlg) {
        errorFlg__ = errorFlg;
    }

    /**
     * @return mode を戻します。
     */
    public int getMode() {
        return mode__;
    }

    /**
     * @param mode 設定する mode。
     */
    public void setMode(int mode) {
        mode__ = mode;
    }
    /**
     * @return count を戻します。
     */
    public int getCount() {
        return count__;
    }

    /**
     * @param count 設定する count。
     */
    public void setCount(int count) {
        count__ = count;
    }

    /**
     * <p>groupIdMap を取得します。
     * @return groupIdMap
     */
    public HashMap<String, String> getGroupIdMap() {
        return groupIdMap__;
    }

    /**
     * <p>groupIdMap をセットします。
     * @param groupIdMap groupIdMap
     */
    public void setGroupIdMap(HashMap<String, String> groupIdMap) {
        groupIdMap__ = groupIdMap;
    }

    /**
     * <p>loginIdMap を取得します。
     * @return loginIdMap
     */
    public HashMap<String, String> getLoginIdMap() {
        return loginIdMap__;
    }

    /**
     * <p>loginIdMap をセットします。
     * @param loginIdMap loginIdMap
     */
    public void setLoginIdMap(HashMap<String, String> loginIdMap) {
        loginIdMap__ = loginIdMap;
    }

    /**
     * コンストラクタ
     * @param error アクションエラー
     * @param con コネクション
     * @param updateFlg 上書きモード
     * @param mode 取り込みモード
     * @param insertFlg 作成モード
     * @param reqMdl RequestModel
     * @param canChangePassword パスワード変更区分
     */
     public UserCsvCheck(ActionErrors error,
                         int mode,
                         Connection con,
                         int updateFlg,
                         int insertFlg,
                         RequestModel reqMdl,
                         boolean canChangePassword
                         ) {
        setErrors(error);
        setMode(mode);
        setCon(con);
        setGroupIdMap(new HashMap<String, String>());
        setLoginIdMap(new HashMap<String, String>());
        setUpdateFlg(updateFlg);
        setinsertFlg(insertFlg);
        setReqMdl(reqMdl);
        canChangePassword__ = canChangePassword;
        EnumSet<COLNO> eset = getEnumSet(mode);
        setColArr(eset.toArray(new COLNO[eset.size()]));
    }

    /**
     * <br>[機　能] CSVファイルのチェックを行なう
     * <br>[解　説]
     * <br>[備  考]
     *
     * @param csvFile 入力ファイル名
     * @return ture:エラー有 false:エラー無し
     * @throws Exception 実行時例外
     */
     public boolean isCsvDataOk(String csvFile) throws Exception {

         boolean ret = false;
         GsMessage gsMsg = new GsMessage(reqMdl__);
         //取込みファイル
         String textCaptureFile = gsMsg.getMessage("cmn.capture.file");
         File file = new File(csvFile);

         if (isOverRowCount(file, Encoding.WINDOWS_31J, AbstractCsvRecordReader.MAX_ROW_COUNT_X5)) {
             String eprefix = "inputFile.";
             ActionMessage msg =
                 new ActionMessage("error.over.row.csvdata",
                         textCaptureFile,
                         String.valueOf(AbstractCsvRecordReader.MAX_ROW_COUNT_X5));
             StrutsUtil.addMessage(errors__, msg, eprefix + "search.notfound.data");
             ret = true;
             return ret;
         }
         //ファイル読込み
         readFile(file, Encoding.WINDOWS_31J);
         log__.debug("有効データ件数==" + getCount());

         ret = isErrorFlg();

         //有効データ無し
         if (getCount() == 0) {

             String eprefix = "inputFile.";
             ActionMessage msg =
                 new ActionMessage("search.notfound.data", textCaptureFile);
             StrutsUtil.addMessage(errors__, msg, eprefix + "search.notfound.data");
             ret = true;
         }
         return ret;
     }


   /**
    * <br>[機  能] csvファイル一行の処理
    * <br>[解  説]
    * <br>[備  考]
    *
    * @param num 行番号
    * @param lineStr 行データ
    * @throws Exception csv読込時例外
    * @see jp.co.sjts.util.csv.AbstractCsvRecordReader#processedLine(long, java.lang.String)
    */
    protected void processedLine(
                     long num,
                     String lineStr) throws Exception {
        GSValidateUser gsValidateUser = new GSValidateUser(reqMdl__);
        GsMessage gsMsg = new GsMessage(reqMdl__);
        //ユーザID
        String textUserId = gsMsg.getMessage("cmn.user.id");
        //取込みファイル
        String textCaptureFile = gsMsg.getMessage("cmn.capture.file");
        //CSV項目数
        String textCsvitems = gsMsg.getMessage("cmn.csv.number.items");

        //ログイン停止
        String loginStopConf = gsMsg.getMessage("user.usr030.3");

        //メールアドレスコメント１
        String textMailAdrComment1 = gsMsg.getMessage("cmn.mailaddress1.comment");
        //メールアドレスコメント2
        String textMailAdrComment2 = gsMsg.getMessage("mailaddress2.comment");
        //メールアドレスコメント3
        String textMailAdrComment3 = gsMsg.getMessage("mailaddress3.comment");
        //メールアドレス１公開フラグ
        String textMailPublicFlg1 = gsMsg.getMessage("user.src.21");
        //メールアドレス２公開フラグ
        String textMailPublicFlg2 = gsMsg.getMessage("user.src.22");
        //メールアドレス３公開フラグ
        String textMailPublicFlg3 = gsMsg.getMessage("user.src.23");
        //電話番号内線１
        String textTelNai1 = gsMsg.getMessage("user.src.39");
        //電話番号内線２
        String textTelNai2 = gsMsg.getMessage("user.src.40");
        //電話番号内線３
        String textTelNai3 = gsMsg.getMessage("user.src.41");
        //電話番号１公開フラグ
        String textTelPubFlg1 = gsMsg.getMessage("user.src.42");
        //電話番号２公開フラグ
        String textTelPubFlg2 = gsMsg.getMessage("user.src.43");
        //電話番号３公開フラグ
        String textTelPubFlg3 = gsMsg.getMessage("user.src.44");
        //電話番号コメント１
        String textTelComment1 = gsMsg.getMessage("user.src.36");
        //電話番号コメント２
        String textTelComment2 = gsMsg.getMessage("user.src.37");
        //電話番号コメント３
        String textTelComment3 = gsMsg.getMessage("user.src.38");
        //ＦＡＸ１公開フラグ
        String textFaxPubFlg1 = gsMsg.getMessage("user.src.13");
        //ＦＡＸ２公開フラグ
        String textFaxPubFlg2 = gsMsg.getMessage("user.src.14");
        //ＦＡＸ３公開フラグ
        String textFaxPubFlg3 = gsMsg.getMessage("user.src.15");
        //ＦＡＸコメント１
        String textFaxComment1 = gsMsg.getMessage("cmn.fax.comment1");
        //ＦＡＸコメント２
        String textFaxComment2 = gsMsg.getMessage("cmn.fax.comment2");
        //ＦＡＸコメント３
        String textFaxComment3 = gsMsg.getMessage("cmn.fax.comment3");
        //郵便番号公開フラグ
        String textPostPubFlg = gsMsg.getMessage("user.src.32");
        //都道府県公開フラグ
        String textTdfkPubFlg = gsMsg.getMessage("user.src.35");
        //住所１公開フラグ
        String textAddressPubFlg = gsMsg.getMessage("user.src.6");
        //住所２公開フラグ
        String textAddress2Open = gsMsg.getMessage("user.src.7");
        //生年月日公開フラグ
        String textBirthDdayFlg = gsMsg.getMessage("user.src.8");
        //行目
        String textLine = gsMsg.getMessage("cmn.line", new String[] {String.valueOf(num)});
        //行目の
        String textLine2 = gsMsg.getMessage("cmn.line2", new String[] {String.valueOf(num)});

        //ヘッダ文字列読み飛ばし
        if (num == 1) {
            return;
        }

        try {

            int j = 0;
            //インポート区分(1:登録 2:編集 3:削除)
            int importKbn = 0;

            String buff = "";
            String eprefix = "inputFile.";
            int ecnt = errors__.size();
            CsvTokenizer stringTokenizer = new CsvTokenizer(lineStr, ",");

            log__.debug("項目数=" + stringTokenizer.length());
            COLNO[] colArr = colArr__;
            //通常モードの場合は50項目か49項目(備考はなくても良い)である必要がある
            //グループ一括モードの場合は56項目か55項目(備考はなくても良い)である必要がある
            //複数グループモードの場合は65項目か64項目(備考はなくても良い)である必要がある
            //複数グループモードの場合は66項目か65項目(備考はなくても良い)である必要がある
            if (stringTokenizer.length() != colArr.length
                    && stringTokenizer.length() != colArr.length - 1) {
                ActionMessage msg =
                new ActionMessage(
                        "error.input.format.file",
                        textCaptureFile,
                        textCsvitems + "(" + textLine + ")");
                StrutsUtil.addMessage(errors__, msg, eprefix + num + "error.input.format.file");
            } else {
                // パスワードルール設定取得
                int coe = GSConstMain.PWC_COEKBN_OFF;
                int digit = GSConstMain.DEFAULT_DIGIT;
                int uidPswdKbn = GSConstMain.PWC_UIDPSWDKBN_OFF;

                CmnPswdConfDao dao = new CmnPswdConfDao(con__);
                CmnPswdConfModel model = dao.select();

                if (model != null) {
                    coe = model.getPwcCoe();
                    digit = model.getPwcDigit();
                    uidPswdKbn = model.getPwcUidPswd();
                }
                // ユーザログインID
                String usrLgid = "";
                //ユーザ削除時のcsvチェックに用いる
                boolean delFlg = false;

                CmnUsrmDao usrmDao = new CmnUsrmDao(con__);
                GSValidateUserCsv gsValidateUserCsv = new GSValidateUserCsv(reqMdl__);
                Map<String , Integer> rowGroups = new HashMap<String , Integer>();
                while (stringTokenizer.hasMoreTokens()) {

                    //削除時じゃない、またはインポート区分判定の時は次の判定へ移る(削除時はスイッチ文後にまとめて終わらせる)
                    if (importKbn != GSConstUser.AUTO_IMP_DELETE || j == 0) {
                        buff = stringTokenizer.nextToken();
                    }
                    switch (colArr[j]) {
                        //インポート区分(1:登録2:編集3:削除)
                        case IMPORTKBN:
                            int errorSize = errors__.size();
                            importKbn = NullDefault.getInt(buff, -1);
                            if (importKbn != GSConstUser.AUTO_IMP_INSERT
                                    && importKbn != GSConstUser.AUTO_IMP_EDIT
                                    && importKbn != GSConstUser.AUTO_IMP_DELETE) {
                                //インポート区分
                                String textZokusei = gsMsg.getMessage("cmn.import.kbn");
                                eprefix = String.valueOf(num) + "importKbn";
                                ActionMessage msg = new ActionMessage("error.input.format.text",
                                        textLine + textZokusei);
                                StrutsUtil.addMessage(errors__, msg,
                                        eprefix + "error.input.required.text");
                            }
                            //インポート区分によって上書きモード、登録モードへ変更
                            if (importKbn == GSConstUser.AUTO_IMP_EDIT) {
                                setUpdateFlg(GSConstUser.IMPORT_MODE_UPDATE);

                            } else if (importKbn == GSConstUser.AUTO_IMP_INSERT) {
                                setUpdateFlg(GSConstUser.IMPORT_MODE_INSERT);

                                //ユーザ削除時はユーザログインIDのみを確認する
                            } else if (importKbn == GSConstUser.AUTO_IMP_DELETE) {

                                //ユーザログインID項目までスキップ
                                while (j <= colArr.length) {
                                    if (colArr[j] == COLNO.USERID) {
                                        break;
                                    } else {
                                        buff = stringTokenizer.nextToken();
                                        j++;
                                     }
                                }

                            }
                            break;
                        //グループID
                        case GROUPID:
                            errorSize = errors__.size();
                            //グループID2～10とは違いナンバーは用いない
                            String groupIdNum = "";
                            gsValidateUserCsv.validateCsvGroupId(
                                    errors__, buff, num, true, groupIdNum);
                            if (errorSize == errors__.size()) {
                                if (getinsertFlg() != GSConstUser.IMPORT_MODE_CREATE
                                   || buff.equals(GSConstUser.USER_KANRI_ID)) {
                                    gsValidateUserCsv.validateCsvGroupExist(errors__,
                                                                                buff,
                                                                                num,
                                                                               con__,
                                                                               groupIdNum);
                                }
                            }
                            if (buff.length() > 0) {
                                rowGroups.put(buff, j);
                            }
                            break;
                        case GROUPID2:
                        case GROUPID3:
                        case GROUPID4:
                        case GROUPID5:
                        case GROUPID6:
                        case GROUPID7:
                        case GROUPID8:
                        case GROUPID9:
                        case GROUPID10:
                            errorSize = errors__.size();
                            //グループIDの2～10部分を取得
                            groupIdNum = String.valueOf(colArr[j]).substring("GROUPID".length());
                            gsValidateUserCsv.validateCsvGroupId(
                                    errors__, buff, num, false, groupIdNum);
                            if (errorSize == errors__.size() && buff.length() > 0) {
                                if (getinsertFlg() != GSConstUser.IMPORT_MODE_CREATE
                                   || buff.equals(GSConstUser.USER_KANRI_ID)) {
                                    gsValidateUserCsv.validateCsvGroupExist(errors__,
                                                                                buff,
                                                                                num,
                                                                               con__,
                                                                               groupIdNum);
                                }
                            }
                            if (rowGroups.containsKey(buff)) {
                                //1行内でのグループ重複
                                String dupIndex = (String) String.valueOf(rowGroups.get(buff) + 1);
                                String textGroupId1 = gsMsg.getMessage("cmn.group.id") + groupIdNum;
                                String textGroupId2 = gsMsg.getMessage("cmn.group.id") + dupIndex;


                                ActionMessage msg = new ActionMessage(
                                    "error.select.dup.list2",
                                    textLine2 + textGroupId1,
                                    textGroupId2);
                                StrutsUtil.addMessage(
                                    errors__,
                                    msg,
                                    "groupid." + num + "." + j + "error.select.dup.list2");


                            }
                            if (buff.length() > 0) {
                                rowGroups.put(buff, j);
                            }
                            break;
                            //グループ名
                        case GROUPNAME:
                            gsValidateUserCsv.validateCsvGroupName(errors__, buff, num);
                            break;
                        //ユーザID
                        case USERID:
                            //CSVファイル内重複チェック
                            if (!StringUtil.isNullZeroString(buff)) {
                                if (loginIdMap__.containsKey(buff)) {
                                    String dupIndex = (String) loginIdMap__.get(buff);
                                    //行目の
                                    String dupLine = gsMsg.getMessage("cmn.line2",
                                            new String[] {dupIndex});

                                    ActionMessage msg = new ActionMessage(
                                        "error.select.dup.list2",
                                        textLine2 + textUserId,
                                        dupLine + textUserId);
                                    StrutsUtil.addMessage(
                                        errors__,
                                        msg,
                                        "userid." + num + "error.select.dup.list2");
                                } else {
                                    loginIdMap__.put(buff, String.valueOf(num));
                                }
                            }
                            usrLgid = buff;

                            //ユーザ削除時且つ指定ユーザが存在しないときはエラー
                            if (importKbn == GSConstUser.AUTO_IMP_DELETE) {
                                    if (!usrmDao.existLoginidEdit(-1, buff)) {
                                        ActionMessage msg =
                                                new ActionMessage("error.edit.no.userid", textLine);
                                        StrutsUtil.addMessage(errors__, msg,
                                                eprefix + "error.edit.no.userid");
                                    }
                                    delFlg = true;
                            } else {
                                //パスワード更新区分を再設定(パスワード項目より先に行うこと)
                                CmnUsrmModel cuMdl = usrmDao.select(buff);
                                CommonBiz cmnBiz = new CommonBiz();
                                ILogin logBiz = cmnBiz.getLoginInstance();
                                int userSid = 0;
                                if (cuMdl != null) {
                                    userSid = cuMdl.getUsrSid();
                                }
                                canChangePassword__
                                = logBiz.canChangePassword(con__, userSid);
                                //削除ではない場合ユーザIDの入力チェックを行う
                                gsValidateUserCsv.validateCsvUserId(errors__, buff, num);

                                //上書きじゃない場合はログインIDの重複チェック
                                if (getUpdateFlg() != GSConstUser.IMPORT_MODE_UPDATE) {
                                    gsValidateUserCsv.validateCsvUserIdDouble(
                                             errors__, -1, buff, num, con__);
                                //上書きの場合はログインIDの存在チェックを行う
                                } else if (usrmDao.existLoginidEdit(-1, buff)) {
                                    overlabCount__++;
                                }
                            }
                            break;
                        //パスワード
                        case PASSWD:
                            if (canChangePassword__) {
                                gsValidateUserCsv.validatePassword(errors__, buff, usrLgid,
                                        num, coe, digit, uidPswdKbn);
                            }
                            break;
                        //社員・職員番号
                        case CODE:
                            gsValidateUserCsv.validateCsvShainNo(errors__, buff, num);
                            break;
                        //姓
                        case SEI:
                            gsValidateUserCsv.validateCsvUserNameSei(errors__, buff, num);
                            break;
                        //名
                        case MEI:
                            gsValidateUserCsv.validateCsvUserNameMei(errors__, buff, num);
                            break;
                        //姓カナ
                        case SEIKN:
                            //半角の場合は全角へ変換する
                            buff =
                            StringUtilKana.katakanaHalf2Full(NullDefault.getString(buff, ""));
                            gsValidateUserCsv.validateCsvUserNameSeiKana(
                                                                    errors__, buff, num);
                            break;
                        //名カナ
                        case MEIKN:
                            buff =
                            StringUtilKana.katakanaHalf2Full(NullDefault.getString(buff, ""));
                            gsValidateUserCsv.validateCsvUserNameMeiKana(errors__, buff, num);
                            break;
                        //ログイン停止
                        case LOGINMUKO:
                            gsValidateUserCsv.validateCsvKoukaiFlg(
                                    errors__, buff, loginStopConf, num);
                            break;
                        //所属
                        case SYOZOKU:
                            gsValidateUserCsv.validateCsvSyozoku(errors__, buff, num);
                            break;
                        //役職
                        case YAKUSYOKU:
                            //役職
                            gsValidateUserCsv.validateCsvYakushoku(errors__, buff, num, getCon());
                            break;
                        //ソートキー1
                        case SORT1:
                            //ソートキー1
                            gsValidateUserCsv.validateCsvSortKey1(errors__, buff, num);
                            break;
                        //ソートキー2
                        case SORT2:
                            //ソートキー2
                            gsValidateUserCsv.validateCsvSortKey2(errors__, buff, num);
                            break;
                        //性別
                        case SEX:
                            //性別
                            gsValidateUserCsv.validateCsvSeibetu(errors__, buff, num);
                            break;
                        //入社年月日
                        case NYUSYADAY:
                            //入社年月日
                            gsValidateUserCsv.validateCsvEntranceDate(
                                                                    errors__, buff, num);
                            break;
                        //生年月日
                        case BARTHDAY:
                            gsValidateUserCsv.validateCsvBirthDate(errors__, buff, num);
                            break;
                        //生年月日公開フラグ
                        case BARTHDAY_OPN:
                            gsValidateUserCsv.validateCsvKoukaiFlg(
                                    errors__, String.valueOf(NullDefault.getInt(buff, 0)),
                                    textBirthDdayFlg, num);
                            break;
                        //メールアドレス１
                        case MAIL1:
                            gsValidateUserCsv.validateCsvMail(errors__, buff, 1, num);
                            break;
                        //メールアドレスコメント１
                        case MAIL1COME:
                            gsValidateUserCsv.validateCmt(
                                    errors__, buff, textMailAdrComment1, num);
                            break;
                        //メールアドレス１公開フラグ
                        case MAIL1OPN:
                            gsValidateUserCsv.validateCsvKoukaiFlg(
                                    errors__, String.valueOf(NullDefault.getInt(buff, 0)),
                                    textMailPublicFlg1, num);
                            break;
                        //メールアドレス２
                        case MAIL2:
                            gsValidateUserCsv.validateCsvMail(errors__, buff, 2, num);
                            break;
                        //メールアドレスコメント２
                        case MAIL2COME:
                            gsValidateUserCsv.validateCmt(
                                    errors__, buff, textMailAdrComment2, num);
                            break;
                        //メールアドレス２公開フラグ
                        case MAIL2OPN:
                            gsValidateUserCsv.validateCsvKoukaiFlg(
                                    errors__, String.valueOf(NullDefault.getInt(buff, 0)),
                                    textMailPublicFlg2, num);
                            break;
                        //メールアドレス３
                        case MAIL3:
                            gsValidateUserCsv.validateCsvMail(errors__, buff, 3, num);
                            break;
                        //メールアドレスコメント３
                        case MAIL3COME:
                            gsValidateUserCsv.validateCmt(
                                    errors__, buff, textMailAdrComment3, num);
                            break;
                        //メールアドレス３公開フラグ
                        case MAIL3OPN:
                            gsValidateUserCsv.validateCsvKoukaiFlg(
                                    errors__, String.valueOf(NullDefault.getInt(buff, 0)),
                                    textMailPublicFlg3, num);
                            break;
                        //郵便番号
                        case YBNCODE:
                            gsValidateUser.validateCsvPostNum(errors__, buff, num);
                            break;
                        //郵便番号公開フラグ
                        case YBNCODEOPN:
                            gsValidateUserCsv.validateCsvKoukaiFlg(
                                errors__, String.valueOf(NullDefault.getInt(buff, 0)),
                                textPostPubFlg, num);
                            break;
                        //都道府県コード
                        case TDFKCODE:
                            gsValidateUserCsv.validateCsvTdfk(errors__, buff, num, con__);
                            break;
                        //都道府県公開フラグ
                        case TDFKCODEOPN:
                            gsValidateUserCsv.validateCsvKoukaiFlg(
                                errors__, String.valueOf(NullDefault.getInt(buff, 0)),
                                textTdfkPubFlg, num);
                            break;
                        //住所１
                        case JUSYO1:
                            gsValidateUserCsv.validateCsvAddress(errors__, buff, 1, num);
                            break;
                        //住所１公開フラグ
                        case JUSYO1OPN:
                            gsValidateUserCsv.validateCsvKoukaiFlg(
                                errors__, String.valueOf(NullDefault.getInt(buff, 0)),
                                textAddressPubFlg, num);
                            break;
                        //住所２
                        case JUSYO2:
                            gsValidateUserCsv.validateCsvAddress(errors__, buff, 2, num);
                            break;
                        //住所２公開フラグ
                        case JUSYO2OPN:
                            gsValidateUserCsv.validateCsvKoukaiFlg(
                                errors__, String.valueOf(NullDefault.getInt(buff, 0)),
                                textAddress2Open, num);
                            break;
                        //電話番号１
                        case TEL1:
                            gsValidateUserCsv.validateCsvTel(errors__, buff, 1, num);
                            break;
                        //電話番号内線１
                        case TEL1NAISEN:
                            gsValidateUserCsv.validateNaisen(
                                errors__, buff, textTelNai1, num);
                            break;
                        //電話番号コメント１
                        case TEL1COME:
                            gsValidateUserCsv.validateCmt(
                                errors__, buff, textTelComment1, num);
                            break;
                        //電話番号１公開フラグ
                        case TEL1OPN:
                            gsValidateUserCsv.validateCsvKoukaiFlg(
                                errors__, String.valueOf(NullDefault.getInt(buff, 0)),
                                textTelPubFlg1, num);
                            break;
                        //電話番号２
                        case TEL2:
                            gsValidateUserCsv.validateCsvTel(errors__, buff, 2, num);
                            break;
                        //電話番号内線２
                        case TEL2NAISEN:
                            gsValidateUserCsv.validateNaisen(
                                errors__, buff, textTelNai2, num);
                            break;
                        //電話番号コメント２
                        case TEL2COME:
                            gsValidateUserCsv.validateCmt(
                                errors__, buff, textTelComment2, num);
                            break;
                        //電話番号２公開フラグ
                        case TEL2OPN:
                            gsValidateUserCsv.validateCsvKoukaiFlg(
                                errors__, String.valueOf(NullDefault.getInt(buff, 0)),
                                textTelPubFlg2, num);
                            break;
                        //電話番号３
                        case TEL3:
                            gsValidateUserCsv.validateCsvTel(errors__, buff, 3, num);
                            break;
                        //電話番号内線３
                        case TEL3NAISEN:
                            gsValidateUserCsv.validateNaisen(
                                errors__, buff, textTelNai3, num);
                            break;
                        //電話番号コメント３
                        case TEL3COME:
                            gsValidateUserCsv.validateCmt(
                                errors__, buff, textTelComment3, num);
                            break;
                        //電話番号３公開フラグ
                        case TEL3OPN:
                            gsValidateUserCsv.validateCsvKoukaiFlg(
                                errors__, String.valueOf(NullDefault.getInt(buff, 0)),
                                textTelPubFlg3, num);
                            break;
                        //FAX１
                        case FAX1:
                            gsValidateUserCsv.validateCsvTel(errors__, buff, 4, num);
                            break;
                        //ＦＡＸコメント１
                        case FAX1COME:
                            gsValidateUserCsv.validateCmt(
                                errors__, buff, textFaxComment1, num);
                            break;
                        //FAX１公開フラグ
                        case FAX1OPN:
                            gsValidateUserCsv.validateCsvKoukaiFlg(
                                errors__, String.valueOf(NullDefault.getInt(buff, 0)),
                                textFaxPubFlg1, num);
                            break;
                        //FAX２
                        case FAX2:
                            gsValidateUserCsv.validateCsvTel(errors__, buff, 5, num);
                            break;
                        //ＦＡＸコメント２
                        case FAX2COME:
                            gsValidateUserCsv.validateCmt(
                                errors__, buff, textFaxComment2, num);
                            break;
                        //FAX２公開フラグ
                        case FAX2OPN:
                            gsValidateUserCsv.validateCsvKoukaiFlg(
                                errors__, String.valueOf(NullDefault.getInt(buff, 0)),
                                textFaxPubFlg2, num);
                            break;
                        //FAX３
                        case FAX3:
                            gsValidateUserCsv.validateCsvTel(errors__, buff, 6, num);
                            break;
                        //ＦＡＸコメント３
                        case FAX3COME:
                            gsValidateUserCsv.validateCmt(
                                errors__, buff, textFaxComment3, num);
                            break;
                        //FAX３公開フラグ
                        case FAX3OPN:
                            gsValidateUserCsv.validateCsvKoukaiFlg(
                                errors__, String.valueOf(NullDefault.getInt(buff, 0)),
                                textFaxPubFlg3, num);
                            break;
                        //備考
                        case BIKO:
                            //備考
                            gsValidateUserCsv.validateCsvUserComment(errors__, buff, num);
                            break;
                        default:
                            break;
                    }
                    //インポート区分が削除の時は比較項目の移動をcaseインポート区分でのみ行う
                    if (importKbn != GSConstUser.AUTO_IMP_DELETE) {
                        j++;
                    //もしも削除モードでユーザIDをチェックしたときはその時点でチェックを終了する。
                    } else if (delFlg) {
                        break;
                    }
                }
            }

            //エラー有り
            if (ecnt < errors__.size()) {
                //エラー存在フラグON
                setErrorFlg(true);
            } else {
                //明細データ以降
                if (num >= 2) {
                    //有効データ件数カウントアップ
                    int cnt = getCount();
                    cnt += 1;
                    setCount(cnt);
                }
            }

        } catch (Exception e) {
            log__.error("CSVファイル読込み時例外");
            throw e;
        }
    }

    /**
     * <p>updateFlg を取得します。
     * @return updateFlg
     */
    public int getUpdateFlg() {
        return updateFlg__;
    }

    /**
     * <p>updateFlg をセットします。
     * @param updateFlg updateFlg
     */
    public void setUpdateFlg(int updateFlg) {
        updateFlg__ = updateFlg;
    }
    /**
     * <p>insertFlg を取得します。
     * @return insertFlg
     */
    public int getinsertFlg() {
        return insertFlg__;
    }

    /**
     * <p>insertFlg をセットします。
     * @param insertFlg insertFlg
     */
    public void setinsertFlg(int insertFlg) {
        insertFlg__ = insertFlg;
    }

    /**
     * @return overlabCount
     */
    public int getOverlabCount() {
        return overlabCount__;
    }

    /**
     * @param overlabCount 設定する overlabCount
     */
    public void setOverlabCount(int overlabCount) {
        overlabCount__ = overlabCount;
    }

    /**
     * <p>reqMdl を取得します。
     * @return reqMdl
     */
    public RequestModel getReqMdl() {
        return reqMdl__;
    }

    /**
     * <p>reqMdl をセットします。
     * @param reqMdl reqMdl
     */
    public void setReqMdl(RequestModel reqMdl) {
        reqMdl__ = reqMdl;
    }
    /**
     *
     * <br>[機  能] CSV列定義実態を返します
     * <br>[解  説] CSVの列定義順に並びます。
     * <br>[備  考]
     * @param mode CSVモード 4:通常モード 6:複数グループ同時登録モード
     *                       7:自動インポートモード その他:グループ登録モード
     * @return CSV列定義セット
     */
    public static EnumSet<COLNO> getEnumSet(int mode) {
        EnumSet<COLNO> ret = EnumSet.allOf(COLNO.class);
        if (mode == GSConstUser.MODE_NORMAL) {
            //通常時はグループ関連列がありません。
            ret.remove(COLNO.GROUPID);
            ret.remove(COLNO.GROUPNAME);
        }
        if (mode == GSConstUser.MODE_MULTIPLE_GROUP
                || mode == GSConstUser.MODE_AUTO_IMPORT) {
            ret.remove(COLNO.GROUPNAME);
        } else {
            ret.remove(COLNO.GROUPID2);
            ret.remove(COLNO.GROUPID3);
            ret.remove(COLNO.GROUPID4);
            ret.remove(COLNO.GROUPID5);
            ret.remove(COLNO.GROUPID6);
            ret.remove(COLNO.GROUPID7);
            ret.remove(COLNO.GROUPID8);
            ret.remove(COLNO.GROUPID9);
            ret.remove(COLNO.GROUPID10);
        }

        if (mode != GSConstUser.MODE_AUTO_IMPORT) {
            ret.remove(COLNO.IMPORTKBN);
        }
        return ret;
        }

    /**
     * <p>colArr を取得します。
     * @return colArr
     */
    public COLNO[] getColArr() {
        return colArr__;
    }

    /**
     * <p>colArr をセットします。
     * @param colArr colArr
     */
    public void setColArr(COLNO[] colArr) {
        colArr__ = colArr;
    }

}