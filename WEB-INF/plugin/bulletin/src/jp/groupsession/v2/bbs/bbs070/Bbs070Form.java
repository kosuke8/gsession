package jp.groupsession.v2.bbs.bbs070;

import java.sql.Connection;
import java.util.List;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.util.LabelValueBean;

import jp.co.sjts.util.StringUtilHtml;
import jp.co.sjts.util.date.UDate;
import jp.co.sjts.util.struts.StrutsUtil;
import jp.groupsession.v2.bbs.BbsBiz;
import jp.groupsession.v2.bbs.GSConstBulletin;
import jp.groupsession.v2.bbs.GSValidateBulletin;
import jp.groupsession.v2.bbs.bbs170.Bbs170Form;
import jp.groupsession.v2.bbs.model.BulletinDspModel;
import jp.groupsession.v2.bbs.model.BulletinForumDiskModel;
import jp.groupsession.v2.cmn.ITempDirIdUseable;
import jp.groupsession.v2.cmn.model.RequestModel;
import jp.groupsession.v2.struts.msg.GsMessage;
import jp.groupsession.v2.usr.GSConstUser;
import jp.groupsession.v2.usr.model.UsrLabelValueBean;

/**
 * <br>[機  能] 掲示板 スレッド登録画面のフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Bbs070Form extends Bbs170Form implements ITempDirIdUseable {

    /** 処理モード */
    private int bbs070cmdMode__ = 0;

    /** タイトル */
    private String bbs070title__ = null;
    /** 内容 */
    private String bbs070value__ = null;
    /** 内容(HTML) */
    private String bbs070valueHtml__ = null;
    /** 添付ファイル */
    private String[] bbs070files__ = null;
    /** 掲載期限 無効初期値 */
    private int bbs070limitDisable__ = GSConstBulletin.THREAD_DISABLE;
    /** 掲載期限 例外(無効+掲載期限有り) */
    private int bbs070limitException__ = GSConstBulletin.THREAD_NOEXCEPTION;
    /** 掲載期限の有無 */
    private int bbs070limit__ = GSConstBulletin.THREAD_LIMIT_NO;
    /** 掲載開始 年 */
    private int bbs070limitFrYear__ = -1;
    /** 掲載開始 月 */
    private int bbs070limitFrMonth__ = 1;
    /** 掲載開始 日 */
    private int bbs070limitFrDay__ = 1;
    /** 掲載開始 時 */
    private int bbs070limitFrHour__ = -1;
    /** 掲載開始 分 */
    private int bbs070limitFrMinute__ = -1;
    /** 掲載終了 年 */
    private int bbs070limitYear__ = -1;
    /** 掲載終了 月 */
    private int bbs070limitMonth__ = 1;
    /** 掲載終了 日 */
    private int bbs070limitDay__ = 1;
    /** 掲載終了 時 */
    private int bbs070limitHour__ = -1;
    /** 掲載終了 分 */
    private int bbs070limitMinute__ = -1;

    /** 投稿者 */
    private int bbs070contributor__ = 0;
    /** 投稿者コンボ */
    private List <UsrLabelValueBean> bbs070contributorList__ = null;
    /** 投稿者変更権限 */
    private int bbs070contributorEditKbn__ = 1;
    /** 投稿者削除区分 */
    private int bbs070contributorJKbn__ = GSConstUser.USER_JTKBN_ACTIVE;

    /** フォーラム名 */
    private String bbs070forumName__ = null;
    /** ファイルコンボ */
    private List <LabelValueBean> bbs070FileLabelList__ = null;

    /** 開始年コンボ */
    private List <LabelValueBean> bbs070FrYearList__ = null;
    /** 開始月コンボ */
    private List <LabelValueBean> bbs070FrMonthList__ = null;
    /** 開始日コンボ */
    private List <LabelValueBean> bbs070FrDayList__ = null;
    /** 開始時コンボ */
    private List<LabelValueBean> bbs070FrHourList__ = null;
    /** 開始分コンボ */
    private List<LabelValueBean> bbs070FrMinuteList__ = null;
    /** 終了年コンボ */
    private List <LabelValueBean> bbs070yearList__ = null;
    /** 終了月コンボ */
    private List <LabelValueBean> bbs070monthList__ = null;
    /** 終了日コンボ */
    private List <LabelValueBean> bbs070dayList__ = null;
    /** 終了時コンボ */
    private List<LabelValueBean> bbs070HourList__ = null;
    /** 終了分コンボ */
    private List<LabelValueBean> bbs070MinuteList__ = null;

    /** 掲示予定遷移フラグ */
    private String bbs070BackID__ = null;

    /** TempDirId*/
    private String tempDirId__ = null;

    /** 重要度 */
    private int bbs070Importance__ = 0;

    /** 本文ファイルの一時保存ディレクトリID */
    private String bbs070TempSaveId__ = null;

    /** 投稿本文のタイプ */
    private int bbs070valueType__ = GSConstBulletin.CONTENT_TYPE_TEXT_PLAIN;

    /**
     * @return bbs070cmdMode を戻します。
     */
    public int getBbs070cmdMode() {
        return bbs070cmdMode__;
    }
    /**
     * @param bbs070cmdMode 設定する bbs070cmdMode。
     */
    public void setBbs070cmdMode(int bbs070cmdMode) {
        bbs070cmdMode__ = bbs070cmdMode;
    }
    /**
     * @return bbs070files を戻します。
     */
    public String[] getBbs070files() {
        return bbs070files__;
    }
    /**
     * @param bbs070files 設定する bbs070files。
     */
    public void setBbs070files(String[] bbs070files) {
        bbs070files__ = bbs070files;
    }
    /**
     * <p>bbs070limitDisable を取得します。
     * @return bbs070limitDisable
     */
    public int getBbs070limitDisable() {
        return bbs070limitDisable__;
    }
    /**
     * <p>bbs070limitDisable をセットします。
     * @param bbs070limitDisable bbs070limitDisable
     */
    public void setBbs070limitDisable(int bbs070limitDisable) {
        bbs070limitDisable__ = bbs070limitDisable;
    }
    /**
     * <p>bbs070limitException を取得します。
     * @return bbs070limitException
     */
    public int getBbs070limitException() {
        return bbs070limitException__;
    }
    /**
     * <p>bbs070limitException をセットします。
     * @param bbs070limitException bbs070limitException
     */
    public void setBbs070limitException(int bbs070limitException) {
        bbs070limitException__ = bbs070limitException;
    }
    /**
     * @return bbs070title を戻します。
     */
    public String getBbs070title() {
        return bbs070title__;
    }
    /**
     * @param bbs070title 設定する bbs070title。
     */
    public void setBbs070title(String bbs070title) {
        bbs070title__ = bbs070title;
    }
    /**
     * @return bbs070value を戻します。
     */
    public String getBbs070value() {
        return bbs070value__;
    }
    /**
     * @param bbs070value 設定する bbs070value。
     */
    public void setBbs070value(String bbs070value) {
        bbs070value__ = bbs070value;
    }
    /**
     * <p>bbs070valueHtml を取得します。
     * @return bbs070valueHtml
     */
    public String getBbs070valueHtml() {
        return bbs070valueHtml__;
    }
    /**
     * <p>bbs070valueHtml をセットします。
     * @param bbs070valueHtml bbs070valueHtml
     */
    public void setBbs070valueHtml(String bbs070valueHtml) {
        bbs070valueHtml__ = bbs070valueHtml;
    }
    /**
     * @return bbs070forumName を戻します。
     */
    public String getBbs070forumName() {
        return bbs070forumName__;
    }
    /**
     * @param bbs070forumName 設定する bbs070forumName。
     */
    public void setBbs070forumName(String bbs070forumName) {
        bbs070forumName__ = bbs070forumName;
    }
    /**
     * <p>bbs070limit を取得します。
     * @return bbs070limit
     */
    public int getBbs070limit() {
        return bbs070limit__;
    }
    /**
     * <p>bbs070limit をセットします。
     * @param bbs070limit bbs070limit
     */
    public void setBbs070limit(int bbs070limit) {
        bbs070limit__ = bbs070limit;
    }
    /**
     * <p>bbs070limitDay を取得します。
     * @return bbs070limitDay
     */
    public int getBbs070limitDay() {
        return bbs070limitDay__;
    }
    /**
     * <p>bbs070limitDay をセットします。
     * @param bbs070limitDay bbs070limitDay
     */
    public void setBbs070limitDay(int bbs070limitDay) {
        bbs070limitDay__ = bbs070limitDay;
    }
    /**
     * <p>bbs070limitMonth を取得します。
     * @return bbs070limitMonth
     */
    public int getBbs070limitMonth() {
        return bbs070limitMonth__;
    }
    /**
     * <p>bbs070limitMonth をセットします。
     * @param bbs070limitMonth bbs070limitMonth
     */
    public void setBbs070limitMonth(int bbs070limitMonth) {
        bbs070limitMonth__ = bbs070limitMonth;
    }
    /**
     * <p>bbs070limitYear を取得します。
     * @return bbs070limitYear
     */
    public int getBbs070limitYear() {
        return bbs070limitYear__;
    }
    /**
     * <p>bbs070limitYear をセットします。
     * @param bbs070limitYear bbs070limitYear
     */
    public void setBbs070limitYear(int bbs070limitYear) {
        bbs070limitYear__ = bbs070limitYear;
    }
    /**
    * <p>bbs070limitHourを取得します。
    * @return  bbs070limitHour
    * */
   public int getBbs070limitHour() {
       return bbs070limitHour__;
   }
   /**
    * <p>bbs070limitHourをセットします。
    * @param bbs070limitHour bbs070limitHour
    * */
   public void setBbs070limitHour(int bbs070limitHour) {
       bbs070limitHour__ = bbs070limitHour;
   }
   /**
    * <p>bbs070limitMinuteを取得します。
    * @return  bbs070limitMinute
    * */
   public int getBbs070limitMinute() {
       return bbs070limitMinute__;
   }
   /**
    * <p>bbs070limitMinuteをセットします。
    * @param bbs070limitMinute bbs070limitMinute
    * */
   public void setBbs070limitMinute(int bbs070limitMinute) {
       bbs070limitMinute__ = bbs070limitMinute;
   }
    /**
     * @return bbs070FileLabelList を戻します。
     */
    public List < LabelValueBean > getBbs070FileLabelList() {
        return bbs070FileLabelList__;
    }
    /**
     * @param bbs070FileLabelList 設定する bbs070FileLabelList。
     */
    public void setBbs070FileLabelList(List < LabelValueBean > bbs070FileLabelList) {
        bbs070FileLabelList__ = bbs070FileLabelList;
    }
    /**
     * <p>bbs070dayList を取得します。
     * @return bbs070dayList
     */
    public List<LabelValueBean> getBbs070dayList() {
        return bbs070dayList__;
    }
    /**
     * <p>bbs070dayList をセットします。
     * @param bbs070dayList bbs070dayList
     */
    public void setBbs070dayList(List<LabelValueBean> bbs070dayList) {
        bbs070dayList__ = bbs070dayList;
    }
    /**
     * <p>bbs070monthList を取得します。
     * @return bbs070monthList
     */
    public List<LabelValueBean> getBbs070monthList() {
        return bbs070monthList__;
    }
    /**
     * <p>bbs070monthList をセットします。
     * @param bbs070monthList bbs070monthList
     */
    public void setBbs070monthList(List<LabelValueBean> bbs070monthList) {
        bbs070monthList__ = bbs070monthList;
    }
    /**
     * <p>bbs070yearList を取得します。
     * @return bbs070yearList
     */
    public List<LabelValueBean> getBbs070yearList() {
        return bbs070yearList__;
    }
    /**
     * <p>bbs070yearList をセットします。
     * @param bbs070yearList bbs070yearList
     */
    public void setBbs070yearList(List<LabelValueBean> bbs070yearList) {
        bbs070yearList__ = bbs070yearList;
    }
    /**
     * <p>bbs070HourListを取得します。
     * @return bbs070HourList
     * */
    public List<LabelValueBean> getBbs070HourList() {
        return bbs070HourList__;
    }
    /**
     * <p>bbs070HourListをセットします。
     * @param bbs070HourList bbs070HourList
     * */
    public void setBbs070HourList(List<LabelValueBean> bbs070HourList) {
        bbs070HourList__ = bbs070HourList;
    }
    /**
     * <p>bbs070MinuteListを取得します。
     * @return bbs070MinuteList
     * */
    public List<LabelValueBean> getBbs070MinuteList() {
        return bbs070MinuteList__;
    }
    /**
     * <p>bbs070MinuteListをセットします。
     * @param bbs070MinuteList bbs070MinuteList
     * */
    public void setBbs070MinuteList(List<LabelValueBean> bbs070MinuteList) {
        bbs070MinuteList__ = bbs070MinuteList;
    }
    /**
     * <p>bbs070contributor を取得します。
     * @return bbs070contributor
     */
    public int getBbs070contributor() {
        return bbs070contributor__;
    }
    /**
     * <p>bbs070contributor をセットします。
     * @param bbs070contributor bbs070contributor
     */
    public void setBbs070contributor(int bbs070contributor) {
        bbs070contributor__ = bbs070contributor;
    }
    /**
     * <p>bbs070contributorList を取得します。
     * @return bbs070contributorList
     */
    public List<UsrLabelValueBean> getBbs070contributorList() {
        return bbs070contributorList__;
    }
    /**
     * <p>bbs070contributorList をセットします。
     * @param bbs070contributorList bbs070contributorList
     */
    public void setBbs070contributorList(List<UsrLabelValueBean> bbs070contributorList) {
        bbs070contributorList__ = bbs070contributorList;
    }
    /**
     * <p>bbs070contributorEditKbn を取得します。
     * @return bbs070contributorEditKbn
     */
    public int getBbs070contributorEditKbn() {
        return bbs070contributorEditKbn__;
    }
    /**
     * <p>bbs070contributorEditKbn をセットします。
     * @param bbs070contributorEditKbn bbs070contributorEditKbn
     */
    public void setBbs070contributorEditKbn(int bbs070contributorEditKbn) {
        bbs070contributorEditKbn__ = bbs070contributorEditKbn;
    }
    /**
     * <p>bbs070contributorJKbn を取得します。
     * @return bbs070contributorJKbn
     */
    public int getBbs070contributorJKbn() {
        return bbs070contributorJKbn__;
    }
    /**
     * <p>bbs070contributorJKbn をセットします。
     * @param bbs070contributorJKbn bbs070contributorJKbn
     */
    public void setBbs070contributorJKbn(int bbs070contributorJKbn) {
        bbs070contributorJKbn__ = bbs070contributorJKbn;
    }
    /**
     * <br>[機  能] 入力チェックを行う
     * <br>[解  説]
     * <br>[備  考]
     * @param con コネクション
     * @param reqMdl リクエスト情報
     * @param tempDir テンポラリディレクトリ
     * @return エラー
     * @throws Exception 実行時例外
     */
    public ActionErrors validateCheck(Connection con, RequestModel reqMdl, String tempDir)
            throws Exception {
        ActionErrors errors = new ActionErrors();

        GsMessage gsMsg = new GsMessage(reqMdl);
        String textTitle = gsMsg.getMessage("cmn.title");
        String textContent = gsMsg.getMessage("cmn.content");
        String textFrKigen = gsMsg.getMessage("bbs.bbs070.5");
        String textToKigen = gsMsg.getMessage("bbs.bbs070.6");

        //タイトル
        GSValidateBulletin.validateTitle(errors,
                                         bbs070title__,
                                         textTitle,
                                         GSConstBulletin.MAX_LENGTH_THRETITLE);
        //内容
        if (bbs070valueType__ == GSConstBulletin.CONTENT_TYPE_TEXT_PLAIN) {
            GSValidateBulletin.validateValue(errors,
                    bbs070value__,
                    textContent,
                    GSConstBulletin.MAX_LENGTH_THREVALUE);
        } else {
            GSValidateBulletin.validateValueHtml(errors,
                    bbs070valueHtml__,
                    textContent,
                    GSConstBulletin.MAX_LENGTH_THREVALUE);
        }

        //掲示期限
        if (bbs070limit__ == GSConstBulletin.THREAD_LIMIT_YES) {

            UDate limitFrDate = new UDate();
            limitFrDate.setTime(0);
            limitFrDate.setDate(bbs070limitFrYear__, bbs070limitFrMonth__, bbs070limitFrDay__);
            limitFrDate.setHour(bbs070limitFrHour__);
            limitFrDate.setMinute(bbs070limitFrMinute__);
            UDate limitToDate = new UDate();
            limitToDate.setTime(0);
            limitToDate.setDate(bbs070limitYear__, bbs070limitMonth__, bbs070limitDay__);
            limitToDate.setHour(bbs070limitHour__);
            limitToDate.setMinute(bbs070limitMinute__);

            boolean fromOk = true;
            boolean toOk = true;

            //From単体チェック 日付
            if (limitFrDate.getYear() != bbs070limitFrYear__
            || limitFrDate.getMonth() != bbs070limitFrMonth__
            || limitFrDate.getIntDay() != bbs070limitFrDay__) {
                //存在チェック
                ActionMessage msg = new ActionMessage("error.input.notfound.date", textFrKigen);
                StrutsUtil.addMessage(errors, msg, "bbs070limitFrYear");
                fromOk = false;
            //From単体チェック 時間
            } else if (limitFrDate.getIntHour() != bbs070limitFrHour__
                      || limitFrDate.getIntMinute() != bbs070limitFrMinute__) {
                //存在チェック
                ActionMessage msg = new ActionMessage("error.input.notfound.time", textFrKigen);
                StrutsUtil.addMessage(errors, msg, "bbs070limitFrHour");
                fromOk = false;
            }

            //To単体チェック 日付
            if (limitToDate.getYear() != bbs070limitYear__
            || limitToDate.getMonth() != bbs070limitMonth__
            || limitToDate.getIntDay() != bbs070limitDay__) {
                //存在チェック
                ActionMessage msg = new ActionMessage("error.input.notfound.date", textToKigen);
                StrutsUtil.addMessage(errors, msg, "bbs070limitYear");
                toOk = false;
            //To単体チェック 時間
            } else if (limitToDate.getIntHour() != bbs070limitHour__
                     || limitToDate.getIntMinute() != bbs070limitMinute__) {
                //存在チェック
                ActionMessage msg = new ActionMessage("error.input.past.time", textToKigen);
                StrutsUtil.addMessage(errors, msg, "bbs070limitHour");
                toOk = false;
            //過去日付チェック
            } else if (limitToDate.compareDateYMDHM(new UDate()) == UDate.LARGE) {
                ActionMessage msg = new ActionMessage("error.input.past.date", textToKigen);
                StrutsUtil.addMessage(errors, msg, "bbs070limitYear");
                toOk = false;
            }

            if (fromOk && toOk) {
                //From~Toチェック
                if (limitToDate.compareDateYMDHM(limitFrDate) == UDate.LARGE ||
                        limitToDate.compareDateYMDHM(limitFrDate) == UDate.EQUAL) {
                    ActionMessage msg = new ActionMessage("error.input.comp.text",
                            gsMsg.getMessage("bbs.12"),
                            textFrKigen + " < " + textToKigen);
                    StrutsUtil.addMessage(errors, msg, "bbs070limit");
                }
            }


        }

        //ディスク容量チェック
        if (errors.isEmpty()) {
            BbsBiz bbsBiz = new BbsBiz();
            BulletinForumDiskModel diskData = bbsBiz.getForumDiskData(con, getBbs010forumSid());
            if (diskData.getBfiDisk() == GSConstBulletin.BFI_DISK_LIMITED) {
                long limitSize = diskData.getBfiDiskSize() * 1024 * 1024;
                long diskSize = diskData.getBfsSize();
                diskSize += bbsBiz.getThreadSize(getBbs070title());
                if (getBbs070valueType() == GSConstBulletin.CONTENT_TYPE_TEXT_PLAIN) {
                    diskSize += bbsBiz.getWriteSize(getBbs070value());
                } else {
                    diskSize += bbsBiz.getWriteSize(getBbs070valueHtml());
                    //検索用文字列分
                    diskSize += bbsBiz.getWriteSize(
                            StringUtilHtml.delHTMLTag(
                                    StringUtilHtml.transToText(getBbs070valueHtml())));

                    //本文添付ファイル分
                    Bbs070Biz bbs070Biz = new Bbs070Biz();
                    diskSize += bbs070Biz.getBodyFileSize(
                            getBbs060postSid(), getBbs070valueHtml(), tempDir);
                }

                diskSize += bbsBiz.getWriteTempFileSize(tempDir);

                if (getBbs070cmdMode() == GSConstBulletin.BBSCMDMODE_EDIT) {
                    //変更前の投稿サイズを差し引く
                    BulletinDspModel bbsMdl = bbsBiz.getThreadData(con, getThreadSid());
                    diskSize -= bbsBiz.getThreadSize(bbsMdl.getBtiTitle());
                    diskSize -= bbsBiz.getWriteSize(con, getBbs060postSid());
                }

                if (diskSize > limitSize) {
                    ActionMessage msg
                        = new ActionMessage("error.over.limitsize.bbsdata",
                                                        gsMsg.getMessage("bbs.2"));
                    StrutsUtil.addMessage(errors, msg, "bbs070limitSize");
                }
            }
        }
        return errors;
    }
    /**
     * <p>bbs070limitFrYear を取得します。
     * @return bbs070limitFrYear
     */
    public int getBbs070limitFrYear() {
        return bbs070limitFrYear__;
    }
    /**
     * <p>bbs070limitFrYear をセットします。
     * @param bbs070limitFrYear bbs070limitFrYear
     */
    public void setBbs070limitFrYear(int bbs070limitFrYear) {
        bbs070limitFrYear__ = bbs070limitFrYear;
    }
    /**
     * <p>bbs070limitFrMonth を取得します。
     * @return bbs070limitFrMonth
     */
    public int getBbs070limitFrMonth() {
        return bbs070limitFrMonth__;
    }
    /**
     * <p>bbs070limitFrMonth をセットします。
     * @param bbs070limitFrMonth bbs070limitFrMonth
     */
    public void setBbs070limitFrMonth(int bbs070limitFrMonth) {
        bbs070limitFrMonth__ = bbs070limitFrMonth;
    }
    /**
     * <p>bbs070limitFrDay を取得します。
     * @return bbs070limitFrDay
     */
    public int getBbs070limitFrDay() {
        return bbs070limitFrDay__;
    }
    /**
     * <p>bbs070limitFrDay をセットします。
     * @param bbs070limitFrDay bbs070limitFrDay
     */
    public void setBbs070limitFrDay(int bbs070limitFrDay) {
        bbs070limitFrDay__ = bbs070limitFrDay;
    }
    /**
     * <p>bbs070limitFrHourを取得します。
     * @return  bbs070limitFrHour
     * */
    public int getBbs070limitFrHour() {
        return bbs070limitFrHour__;
    }
    /**
     * <p>bbs070limitFrHourをセットします。
     * @param bbs070limitFrHour bbs070limitFrHour
     * */
    public void setBbs070limitFrHour(int bbs070limitFrHour) {
        bbs070limitFrHour__ = bbs070limitFrHour;
    }
    /**
     * <p>bbs070limitFrMinuteを取得します。
     * @return  bbs070limitFrMinute
     * */
    public int getBbs070limitFrMinute() {
        return bbs070limitFrMinute__;
    }
    /**
     * <p>bbs070limitFrMinuteをセットします。
     * @param bbs070limitFrMinute bbs070limitFrMinute
     * */
    public void setBbs070limitFrMinute(int bbs070limitFrMinute) {
        bbs070limitFrMinute__ = bbs070limitFrMinute;
    }
    /**
     * <p>bbs070FrYearList を取得します。
     * @return bbs070FrYearList
     */
    public List<LabelValueBean> getBbs070FrYearList() {
        return bbs070FrYearList__;
    }
    /**
     * <p>bbs070FrYearList をセットします。
     * @param bbs070FrYearList bbs070FrYearList
     */
    public void setBbs070FrYearList(List<LabelValueBean> bbs070FrYearList) {
        bbs070FrYearList__ = bbs070FrYearList;
    }
    /**
     * <p>bbs070FrMonthList を取得します。
     * @return bbs070FrMonthList
     */
    public List<LabelValueBean> getBbs070FrMonthList() {
        return bbs070FrMonthList__;
    }
    /**
     * <p>bbs070FrMonthList をセットします。
     * @param bbs070FrMonthList bbs070FrMonthList
     */
    public void setBbs070FrMonthList(List<LabelValueBean> bbs070FrMonthList) {
        bbs070FrMonthList__ = bbs070FrMonthList;
    }
    /**
     * <p>bbs070FrDayList を取得します。
     * @return bbs070FrDayList
     */
    public List<LabelValueBean> getBbs070FrDayList() {
        return bbs070FrDayList__;
    }
    /**
     * <p>bbs070FrDayList をセットします。
     * @param bbs070FrDayList bbs070FrDayList
     */
    public void setBbs070FrDayList(List<LabelValueBean> bbs070FrDayList) {
        bbs070FrDayList__ = bbs070FrDayList;
    }
    /**
     * <p>bbs070FrHourListを取得します。
     * @return bbs070FrHourList
     * */
    public List<LabelValueBean> getBbs070FrHourList() {
        return bbs070FrHourList__;
    }
    /**
     * <p>bbs070FrHourListをセットします。
     * @param bbs070FrHourList bbs070FrHourList
     * */
    public void setBbs070FrHourList(List<LabelValueBean> bbs070FrHourList) {
        bbs070FrHourList__ = bbs070FrHourList;
    }
    /**
     * <p>bbs070FrMinuteListを取得します。
     * @return bbs070FrMinuteList
     * */
    public List<LabelValueBean> getBbs070FrMinuteList() {
        return bbs070FrMinuteList__;
    }
    /**
     * <p>bbs070FrMinuteListをセットします。
     * @param bbs070FrMinuteList bbs070FrMinuteList
     * */
    public void setBbs070FrMinuteList(List<LabelValueBean> bbs070FrMinuteList) {
        bbs070FrMinuteList__ = bbs070FrMinuteList;
    }
    /**
     * <p>bbs070BackID を取得します。
     * @return bbs070BackID
     */
    public String getBbs070BackID() {
        return bbs070BackID__;
    }
    /**
     * <p>bbs070BackID をセットします。
     * @param bbs070BackID bbs070BackID
     */
    public void setBbs070BackID(String bbs070BackID) {
        bbs070BackID__ = bbs070BackID;
    }
    /**
     * <p>tempDirId を取得します。
     * @return tempDirId
     */
    public String getTempDirId() {
        return tempDirId__;
    }
    /**
     * <p>tempDirId をセットします。
     * @param tempDirId tempDirId
     */
    public void setTempDirId(String tempDirId) {
        tempDirId__ = tempDirId;
    }
    /**
     * <p>bbs070Importance を取得します。
     * @return bbs070Importance
     */
    public int getBbs070Importance() {
        return bbs070Importance__;
    }
    /**
     * <p>bbs070Importance をセットします。
     * @param bbs070Importance bbs070Importance
     */
    public void setBbs070Importance(int bbs070Importance) {
        bbs070Importance__ = bbs070Importance;
    }
    /**
     * <p>bbs070TempSaveId を取得します。
     * @return bbs070TempSaveId
     */
    public String getBbs070TempSaveId() {
        return bbs070TempSaveId__;
    }
    /**
     * <p>bbs070TempSaveId をセットします。
     * @param bbs070TempSaveId bbs070TempSaveId
     */
    public void setBbs070TempSaveId(String bbs070TempSaveId) {
        bbs070TempSaveId__ = bbs070TempSaveId;
    }
    /**
     * <p>bbs070valueType を取得します。
     * @return bbs070valueType
     */
    public int getBbs070valueType() {
        return bbs070valueType__;
    }
    /**
     * <p>bbs070valueType をセットします。
     * @param bbs070valueType bbs070valueType
     */
    public void setBbs070valueType(int bbs070valueType) {
        bbs070valueType__ = bbs070valueType;
    }
}
