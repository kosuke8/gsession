package jp.groupsession.v2.bbs.bbs030;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.util.LabelValueBean;

import jp.co.sjts.util.StringUtil;
import jp.co.sjts.util.StringUtilHtml;
import jp.co.sjts.util.ValidateUtil;
import jp.co.sjts.util.struts.StrutsUtil;
import jp.groupsession.v2.bbs.BbsBiz;
import jp.groupsession.v2.bbs.GSConstBulletin;
import jp.groupsession.v2.bbs.bbs020.Bbs020Form;
import jp.groupsession.v2.bbs.model.BbsForInfModel;
import jp.groupsession.v2.cmn.GSConstBBS;
import jp.groupsession.v2.cmn.GSValidateUtil;
import jp.groupsession.v2.cmn.ITempDirIdUseable;
import jp.groupsession.v2.struts.msg.GsMessage;
import jp.groupsession.v2.usr.model.UsrLabelValueBean;


/**
 * <br>[機  能] 掲示板 フォーラム登録画面のフォーム
 * <br>[解  説]
 * <br>[備  考]
 *
 * @author JTS
 */
public class Bbs030Form extends Bbs020Form implements ITempDirIdUseable {

    /** 経過年ラベルの選択値 */
    public static final String[] YEAR_VALUE
        = new String[] {"0", "1", "2", "3", "4", "5", "10"};
    /** 経過月ラベルの選択値 */
    public static final String[] MONTH_VALUE
        = new String[] {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"};


    /** プラグインID */
    private String bbs030pluginId__ = GSConstBulletin.PLUGIN_ID_BULLETIN;

    /** 処理モード */
    private int bbs030cmdMode__ = 0;

    /** フォーラム名 */
    private String bbs030forumName__ = null;
    /** コメント */
    private String bbs030comment__ = null;
    /** グループSID */
    private int bbs030groupSid__ = Integer.parseInt(GSConstBulletin.GROUP_COMBO_VALUE);
    /** フォーラム階層レベル */
    private int bbs030ForumLevel__ = GSConstBulletin.BBS_FORUM_MIN_LEVEL;
    /** 選択中の親フォーラムSID */
    private int bbs030ParentForumSid__ = GSConstBulletin.BBS_DEFAULT_PFORUM_SID;
    /** 選択不可の親フォーラムSID */
    private int[] bbs030DisabledForumSid__ = null;
    /** メンバーSID 追加・編集・削除 */
    private String[] bbs030memberSid__ = new String[0];
    /** メンバーSID 閲覧 */
    private String[] bbs030memberSidRead__ = new String[0];


    /** グループ一覧 */
    private List < LabelValueBean > bbs030GroupList__ = null;
    /** 追加済みユーザ一覧 */
    private List < UsrLabelValueBean > bbs030LeftUserList__ = null;
    /** 追加済みユーザ一覧 */
    private List < UsrLabelValueBean > bbs030LeftUserListRead__ = null;
    /** 追加用ユーザ一覧 */
    private List < UsrLabelValueBean > bbs030RightUserList__ = null;

    /** 追加済みメンバー(選択) 追加・編集・削除 */
    private String[] bbs030SelectLeftUser__ = new String[0];
    /** 追加済みメンバー(選択) 閲覧 */
    private String[] bbs030SelectLeftUserRead__ = new String[0];
    /** 追加用メンバー(選択) */
    private String[] bbs030SelectRightUser__ = new String[0];

    /** グループSID 管理者 */
    private int bbs030groupSidAdm__ = Integer.parseInt(GSConstBulletin.GROUP_COMBO_VALUE_USER);
    /** メンバーSID 管理者 */
    private String[] bbs030memberSidAdm__ = new String[0];
    /** グループ一覧 管理者 */
    private List < LabelValueBean > bbs030GroupListAdm__ = null;
    /** 追加済みユーザ一覧 管理者 */
    private List < UsrLabelValueBean > bbs030LeftUserListAdm__ = null;
    /** 追加用ユーザ一覧 管理者 */
    private List < UsrLabelValueBean > bbs030RightUserListAdm__ = null;
    /** 追加済みメンバー(選択) 管理者 */
    private String[] bbs030SelectLeftUserAdm__ = new String[0];
    /** 追加用メンバー(選択) 管理者 */
    private String[] bbs030SelectRightUserAdm__ = new String[0];


    /** 投稿許可 */
    private String bbs030reply__ = String.valueOf(GSConstBulletin.BBS_THRE_REPLY_YES);
    /** 新規ユーザスレッド閲覧状態 */
    private String bbs030read__ = String.valueOf(GSConstBulletin.NEWUSER_THRE_VIEW_NO);
    /** 投稿許可 */
    private String bbs030mread__ = String.valueOf(GSConstBulletin.BBS_FORUM_MREAD_NO);
    /** スレッドテンプレート区分 */
    private int bbs030templateKbn__ = GSConstBulletin.BBS_THRE_TEMPLATE_NO;
    /** スレッドテンプレート */
    private String bbs030template__ = null;
    /** スレッドテンプレート(HTML時) */
    private String bbs030templateHtml__ = null;
    /** スレッドテンプレート 投稿時使用区分 */
    private int bbs030templateWriteKbn__ = GSConstBulletin.BBS_THRE_TEMPLATE_WRITE_NO;
    /** スレッドテンプレート コンテンツタイプ */
    private int bbs030templateType__ = GSConstBulletin.CONTENT_TYPE_TEXT_PLAIN;
    /** ディスク容量 */
    private int bbs030diskSize__ = GSConstBulletin.BFI_DISK_NOLIMIT;
    /** ディスク容量 最大値 */
    private String bbs030diskSizeLimit__ = null;
    /** ディスク容量警告 閾値 */
    private int bbs030warnDisk__ = 0;
    /** ディスク容量警告 閾値 */
    private int bbs030warnDiskThreshold__ = 0;

    /** 掲示期間 有効初期値 */
    private int bbs030LimitDisable__ = GSConstBulletin.THREAD_ENABLE;
    /** 掲示期間 初期値 */
    private int bbs030Limit__ = GSConstBulletin.THREAD_LIMIT_NO;
    /** 掲示期間日数 初期値 */
    private String bbs030LimitDate__ = null;
    /** 時間単位 */
    private int bbs030TimeUnit__ = GSConstBBS.MINUTE_DIVISION5;
    /** スレッド保存期間設定 */
    private int bbs030Keep__ = GSConstBulletin.THREAD_KEEP_NO;
    /** スレッド保存期間 年 */
    private int bbs030KeepDateY__ = -1;
    /** スレッド保存期間 月 */
    private int bbs030KeepDateM__ = -1;
    /** スレッド保存期間 自動削除設定内容表示フラグ */
    private int bbs030DspAtdelFlg__ = GSConstBulletin.AUTO_DELETE_OFF;
    /** スレッド保存期間 表示用 自動削除設定内容 経過年 */
    private int bbs030DspAtdelYear__ = -1;
    /** スレッド保存期間 表示用 自動削除設定内容  経過月 */
    private int bbs030DspAtdelMonth__ = -1;

    /** 経過年ラベル */
    private List < LabelValueBean > bbs030KeepDateYLabel__ = null;
    /** 経過月ラベル */
    private List < LabelValueBean > bbs030KeepDateMLabel__ = null;

    /** 写真ファイル名 */
    private String bbs030ImageName__;
    /** 写真ファイル保存名 */
    private String bbs030ImageSaveName__;
    /** バイナリSID */
    private Long bbs030BinSid__ = new Long(0);

    /** TempDirId*/
    private String tempDirId__ = null;

    /** ディスク容量警告 閾値 選択値 */
    private List<LabelValueBean> warnDiskThresholdList__ = null;

    /** スクロール位置 */
    private String bbs030ScrollPosition__ = null;
    /** 親フォーラム選択フレーム スクロール位置 */
    private String bbs190ScrollPosition__ = null;

    /** 編集ユーザ一覧 登録用 */
    private String[] bbs030UserListWriteReg__ = null;
    /** 閲覧ユーザ一覧 登録用 */
    private String[] bbs030UserListReadReg__ = null;
    /** 管理者ユーザ一覧 登録用 */
    private String[] bbs030UserListAdmReg__ = null;

    /** 選択禁止ユーザ */
    private List<Integer> bbs030BanUserSidList__ = null;
    /** 選択禁止グループ */
    private List<Integer> bbs030BanGroupSidList__ = null;
    /** ユーザ絞り込み選択禁止グループを設定 */
    private List<Integer> bbs030DisableGroupSidList__ = null;

    /** 下位フォーラムへのメンバー反映フラグ */
    private int bbs030AdaptChildMemFlg__ = 0;
    /** 子フォーラムの有無フラグ */
    private int bbs030HaveChildForumFlg__ = GSConstBulletin.FORUM_CHILD_NOTEXIST;
    /** メンバーの親フォーラム準拠フラグ */
    private int bbs030FollowParentMemFlg__ = GSConstBulletin.FOLLOW_PARENT_MEMBER_YES;

    /**
     * <p>bbs030Read を取得します。
     * @return bbs030Read
     */
    public String getBbs030read() {
        return bbs030read__;
    }

    /**
     * <p>bbs030Read をセットします。
     * @param bbs030read bbs030read
     */
    public void setBbs030read(String bbs030read) {
        bbs030read__ = bbs030read;
    }

    /**
     * <p>bbs030Reply を取得します。
     * @return bbs030Reply
     */
    public String getBbs030reply() {
        return bbs030reply__;
    }

    /**
     * <p>bbs030Reply をセットします。
     * @param bbs030reply bbs030reply
     */
    public void setBbs030reply(String bbs030reply) {
        bbs030reply__ = bbs030reply;
    }

    /**
     * @return bbs030cmdMode を戻します。
     */
    public int getBbs030cmdMode() {
        return bbs030cmdMode__;
    }

    /**
     * @param bbs030cmdMode 設定する bbs030cmdMode。
     */
    public void setBbs030cmdMode(int bbs030cmdMode) {
        bbs030cmdMode__ = bbs030cmdMode;
    }

    /**
     * @return bbs030comment を戻します。
     */
    public String getBbs030comment() {
        return bbs030comment__;
    }

    /**
     * @param bbs030comment 設定する bbs030comment。
     */
    public void setBbs030comment(String bbs030comment) {
        bbs030comment__ = bbs030comment;
    }

    /**
     * @return bbs030forumName を戻します。
     */
    public String getBbs030forumName() {
        return bbs030forumName__;
    }

    /**
     * @param bbs030forumName 設定する bbs030forumName。
     */
    public void setBbs030forumName(String bbs030forumName) {
        bbs030forumName__ = bbs030forumName;
    }

    /**
     * @return bbs030GroupList を戻します。
     */
    public List < LabelValueBean > getBbs030GroupList() {
        return bbs030GroupList__;
    }

    /**
     * @param bbs030GroupList 設定する bbs030GroupList。
     */
    public void setBbs030GroupList(List < LabelValueBean > bbs030GroupList) {
        bbs030GroupList__ = bbs030GroupList;
    }

    /**
     * @return bbs030groupSid を戻します。
     */
    public int getBbs030groupSid() {
        return bbs030groupSid__;
    }

    /**
     * @param bbs030groupSid 設定する bbs030groupSid。
     */
    public void setBbs030groupSid(int bbs030groupSid) {
        bbs030groupSid__ = bbs030groupSid;
    }

    /**
     * <p>bbs030ForumLevel を取得します。
     * @return bbs030ForumLevel
     */
    public int getBbs030ForumLevel() {
        return bbs030ForumLevel__;
    }

    /**
     * <p>bbs030ForumLevel をセットします。
     * @param bbs030ForumLevel bbs030ForumLevel
     */
    public void setBbs030ForumLevel(int bbs030ForumLevel) {
        bbs030ForumLevel__ = bbs030ForumLevel;
    }

    /**
     * <p>bbs030ParentForumSid を取得します。
     * @return bbs030ParentForumSid
     */
    public int getBbs030ParentForumSid() {
        return bbs030ParentForumSid__;
    }

    /**
     * <p>bbs030ParentForumSid をセットします。
     * @param bbs030ParentForumSid bbs030ParentForumSid
     */
    public void setBbs030ParentForumSid(int bbs030ParentForumSid) {
        bbs030ParentForumSid__ = bbs030ParentForumSid;
    }

    /**
     * <p>bbs030DisabledForumSid を取得します。
     * @return bbs030DisabledForumSid
     */
    public int[] getBbs030DisabledForumSid() {
        return bbs030DisabledForumSid__;
    }

    /**
     * <p>bbs030DisabledForumSid をセットします。
     * @param bbs030DisabledForumSid bbs030DisabledForumSid
     */
    public void setBbs030DisabledForumSid(int[] bbs030DisabledForumSid) {
        bbs030DisabledForumSid__ = bbs030DisabledForumSid;
    }

    /**
     * @return bbs030LeftUserList を戻します。
     */
    public List < UsrLabelValueBean > getBbs030LeftUserList() {
        return bbs030LeftUserList__;
    }

    /**
     * @param bbs030LeftUserList 設定する bbs030LeftUserList。
     */
    public void setBbs030LeftUserList(List < UsrLabelValueBean > bbs030LeftUserList) {
        bbs030LeftUserList__ = bbs030LeftUserList;
    }

    /**
     * @return bbs030memberSid を戻します。
     */
    public String[] getBbs030memberSid() {
        return bbs030memberSid__;
    }

    /**
     * @param bbs030memberSid 設定する bbs030memberSid。
     */
    public void setBbs030memberSid(String[] bbs030memberSid) {
        bbs030memberSid__ = bbs030memberSid;
    }

    /**
     * @return bbs030RightUserList を戻します。
     */
    public List < UsrLabelValueBean > getBbs030RightUserList() {
        return bbs030RightUserList__;
    }

    /**
     * @param bbs030RightUserList 設定する bbs030RightUserList。
     */
    public void setBbs030RightUserList(List < UsrLabelValueBean > bbs030RightUserList) {
        bbs030RightUserList__ = bbs030RightUserList;
    }

    /**
     * @return bbs030SelectLeftUser を戻します。
     */
    public String[] getBbs030SelectLeftUser() {
        return bbs030SelectLeftUser__;
    }

    /**
     * @param bbs030SelectLeftUser 設定する bbs030SelectLeftUser。
     */
    public void setBbs030SelectLeftUser(String[] bbs030SelectLeftUser) {
        bbs030SelectLeftUser__ = bbs030SelectLeftUser;
    }

    /**
     * @return bbs030SelectRightUser を戻します。
     */
    public String[] getBbs030SelectRightUser() {
        return bbs030SelectRightUser__;
    }

    /**
     * @param bbs030SelectRightUser 設定する bbs030SelectRightUser。
     */
    public void setBbs030SelectRightUser(String[] bbs030SelectRightUser) {
        bbs030SelectRightUser__ = bbs030SelectRightUser;
    }

    /**
     * <p>bbs030pluginId を取得します。
     * @return bbs030pluginId
     */
    public String getBbs030pluginId() {
        return bbs030pluginId__;
    }

    /**
     * <p>bbs030pluginId をセットします。
     * @param bbs030pluginId bbs030pluginId
     */
    public void setBbs030pluginId(String bbs030pluginId) {
        bbs030pluginId__ = bbs030pluginId;
    }

    /**
     * <p>bbs030ImageName を取得します。
     * @return bbs030ImageName
     */
    public String getBbs030ImageName() {
        return bbs030ImageName__;
    }

    /**
     * <p>bbs030ImageName をセットします。
     * @param bbs030ImageName bbs030ImageName
     */
    public void setBbs030ImageName(String bbs030ImageName) {
        bbs030ImageName__ = bbs030ImageName;
    }

    /**
     * <p>bbs030ImageSaveName を取得します。
     * @return bbs030ImageSaveName
     */
    public String getBbs030ImageSaveName() {
        return bbs030ImageSaveName__;
    }

    /**
     * <p>bbs030ImageSaveName をセットします。
     * @param bbs030ImageSaveName bbs030ImageSaveName
     */
    public void setBbs030ImageSaveName(String bbs030ImageSaveName) {
        bbs030ImageSaveName__ = bbs030ImageSaveName;
    }

    /**
     * <br>[機  能] 入力チェックを行う
     * <br>[解  説]
     * <br>[備  考]
     * @param req リクエスト
     * @param con コネクション
     * @return エラー
     * @throws SQLException SQL実行時例外
     */
    public ActionErrors validateCheck(
            HttpServletRequest req, Connection con)
                    throws SQLException {
        ActionErrors errors = new ActionErrors();
        ActionMessage msg = null;

        //-- フォーラム名チェック --
        GsMessage gsMsg = new GsMessage();
        String textForumName = gsMsg.getMessage(req, "bbs.4");
        String textComment = gsMsg.getMessage(req, "cmn.comment");
        String textTemplate = gsMsg.getMessage(req, "bbs.bbs030.6");

        //未入力チェック
        if (StringUtil.isNullZeroString(bbs030forumName__)) {
            msg = new ActionMessage("error.input.required.text",
                    textForumName);
            StrutsUtil.addMessage(errors, msg, "bbs030forumName");

        //桁数チェック
        } else if (bbs030forumName__.length() > GSConstBulletin.MAX_LENGTH_FORUMNAME) {
            msg = new ActionMessage("error.input.length.text",
                                textForumName,
                                String.valueOf(GSConstBulletin.MAX_LENGTH_FORUMNAME));
            StrutsUtil.addMessage(errors, msg, "bbs030forumName");

        //スペースのみチェック
        } else {
            if (ValidateUtil.isSpace(bbs030forumName__)) {
                msg = new ActionMessage("error.input.spase.only", textForumName);
                StrutsUtil.addMessage(errors, msg, "bbs030forumName");
            }
            //先頭スペースチェック
            if (ValidateUtil.isSpaceStart(bbs030forumName__)) {
                msg = new ActionMessage("error.input.spase.start",
                                        textForumName);
                StrutsUtil.addMessage(errors, msg, "bbs030forumName");
            }

            //タブ文字が含まれている
            if (ValidateUtil.isTab(bbs030forumName__)) {
                String msgKey = "error.input.tab.text";
                msg = new ActionMessage(msgKey, textForumName);
                StrutsUtil.addMessage(
                        errors, msg, "bbs030forumName");
            }

            //JIS第2水準チェック
            if (!GSValidateUtil.isGsJapaneaseString(bbs030forumName__)) {
                //利用不可能な文字を入力した場合
                String nstr = GSValidateUtil.getNotGsJapaneaseString(bbs030forumName__);
                msg = new ActionMessage("error.input.njapan.text",
                                        textForumName,
                                        nstr);
                StrutsUtil.addMessage(errors, msg, "bbs030forumName");
            }
        }

        //-- コメントチェック --
        if (!StringUtil.isNullZeroString(bbs030comment__)) {
            //桁数チェック
            if (bbs030comment__.length() > GSConstBulletin.MAX_LENGTH_FORUMCOMMENT) {
                msg = new ActionMessage("error.input.length.textarea",
                                    textComment,
                                    String.valueOf(GSConstBulletin.MAX_LENGTH_FORUMCOMMENT));
                StrutsUtil.addMessage(errors, msg, "bbs030comment");
                return errors;
            }
            //スペース、改行のみチェック
            if (ValidateUtil.isSpaceOrKaigyou(bbs030comment__)) {
                msg = new ActionMessage("error.input.spase.cl.only", textComment);
                StrutsUtil.addMessage(errors, msg, "bbs030comment");
            }

            //JIS第2水準チェック
            if (!GSValidateUtil.isGsJapaneaseStringTextArea(bbs030comment__)) {
                //利用不可能な文字を入力した場合
                String nstr = GSValidateUtil.getNotGsJapaneaseStringTextArea(bbs030comment__);
                msg = new ActionMessage("error.input.njapan.text", textComment, nstr);
                StrutsUtil.addMessage(errors, msg, "bbs030comment");
            }
        }

        //ディスク容量最大値入力チェック
        //制限ありのときエラーチェック
        if (bbs030diskSize__ == 1) {
            String fieldFix = "bbs030diskSizeLimit.";
            String paramNameJpn = gsMsg.getMessage("wml.87");

            if (StringUtil.isNullZeroString(bbs030diskSizeLimit__)) {
                //未入力チェック
                msg = new ActionMessage("error.input.required.text", paramNameJpn);
                StrutsUtil.addMessage(
                        errors, msg, fieldFix + "error.input.required.text");
            } else {

                if (bbs030diskSizeLimit__.length() > GSConstBulletin.MAX_LENGTH_FORUM_DISK) {
                    //MAX桁チェック
                    msg = new ActionMessage("error.input.length.text",
                            paramNameJpn, GSConstBulletin.MAX_LENGTH_FORUM_DISK);
                    StrutsUtil.addMessage(
                            errors, msg, fieldFix + "error.input.length.text");
                }

                if (!GSValidateUtil.isNumber(bbs030diskSizeLimit__)) {
                    //半角数字チェック
                    String msgKey = "error.input.number.hankaku";
                    msg = new ActionMessage(msgKey, paramNameJpn);
                    StrutsUtil.addMessage(
                            errors, msg, fieldFix + msgKey);
                }
            }

        }

        //-- テンプレートチェック --
        if (bbs030templateKbn__ == GSConstBulletin.BBS_THRE_TEMPLATE_YES) {
            if (bbs030templateType__ == GSConstBulletin.CONTENT_TYPE_TEXT_PLAIN
                    && !StringUtil.isNullZeroString(bbs030template__)) {

                //桁数チェック
                if (bbs030template__.length() > GSConstBulletin.MAX_LENGTH_THREVALUE) {
                    msg = new ActionMessage("error.input.length.textarea",
                            textTemplate,
                            String.valueOf(GSConstBulletin.MAX_LENGTH_THREVALUE));
                    StrutsUtil.addMessage(errors, msg, "bbs030template");
                    return errors;
                }

                //スペース、改行のみチェック
                if (ValidateUtil.isSpaceOrKaigyou(bbs030template__)) {
                    msg = new ActionMessage("error.input.spase.cl.only", textTemplate);
                    StrutsUtil.addMessage(errors, msg, "bbs030template");
                }

                //JIS第2水準チェック
                if (!GSValidateUtil.isGsJapaneaseStringTextArea(bbs030template__)) {
                    //利用不可能な文字を入力した場合
                    String nstr = GSValidateUtil.getNotGsJapaneaseStringTextArea(bbs030template__);
                    msg = new ActionMessage("error.input.njapan.text", textTemplate, nstr);
                    StrutsUtil.addMessage(errors, msg, "bbs030template");
                }

            } else if (bbs030templateType__ == GSConstBulletin.CONTENT_TYPE_TEXT_HTML
                    && !StringUtil.isNullZeroString(bbs030templateHtml__)) {

                //桁数チェック
                String plainTemplate = StringUtilHtml.delHTMLTag(
                        StringUtilHtml.transToText(bbs030templateHtml__));
                if (plainTemplate.length() > GSConstBulletin.MAX_LENGTH_THREVALUE) {
                    msg = new ActionMessage("error.input.length.textarea",
                            textTemplate,
                            String.valueOf(GSConstBulletin.MAX_LENGTH_THREVALUE));
                    StrutsUtil.addMessage(errors, msg, "bbs030template");
                    return errors;
                }

                //スペース、改行のみチェック
                if (ValidateUtil.isSpaceOrKaigyou(bbs030templateHtml__)) {
                    msg = new ActionMessage("error.input.spase.cl.only", textTemplate);
                    StrutsUtil.addMessage(errors, msg, "bbs030template");
                }

                //JIS第2水準チェック
                if (!GSValidateUtil.isGsJapaneaseStringTextArea(bbs030templateHtml__)) {
                    //利用不可能な文字を入力した場合
                    String nstr = GSValidateUtil.getNotGsJapaneaseStringTextArea(
                            bbs030templateHtml__);
                    msg = new ActionMessage("error.input.njapan.text", textTemplate, nstr);
                    StrutsUtil.addMessage(errors, msg, "bbs030template");
                }
            }
        }

        //掲示期間 有効
        if (bbs030LimitDisable__ == GSConstBulletin.THREAD_ENABLE) {
            //掲示期間日数 初期値
            if (bbs030Limit__ == GSConstBulletin.THREAD_LIMIT_YES) {

                String fieldFix = "bbs030LimitDate.";
                String paramNameJpn = gsMsg.getMessage("bbs.12");

                if (StringUtil.isNullZeroString(bbs030LimitDate__)) {
                    //未入力チェック
                    msg = new ActionMessage("error.input.required.text", paramNameJpn);
                    StrutsUtil.addMessage(
                            errors, msg, fieldFix + "error.input.required.text");
                } else {

                    if (bbs030LimitDate__.length() > 3) {
                        //MAX桁チェック
                        msg = new ActionMessage("error.input.length.text",
                                paramNameJpn, 3);
                        StrutsUtil.addMessage(
                                errors, msg, fieldFix + "error.input.length.text");
                    }

                    if (!GSValidateUtil.isNumber(bbs030LimitDate__)) {
                        //半角数字チェック
                        String msgKey = "error.input.number.hankaku";
                        msg = new ActionMessage(msgKey, paramNameJpn);
                        StrutsUtil.addMessage(
                                errors, msg, fieldFix + msgKey);
                    }
                }
            }

            //スレッド保存期間
            if (bbs030Keep__ == GSConstBulletin.THREAD_KEEP_YES) {
                //保存気
                boolean yFlg = false;
                for (String sy : YEAR_VALUE) {
                    int iy = Integer.parseInt(sy);
                    if (bbs030KeepDateY__ == iy) {
                        yFlg = true;
                        break;
                    }
                }
                if (yFlg == false) {
                    String year = gsMsg.getMessage(req, "bbs.bbs030.14")
                            + " (" + gsMsg.getMessage(req, "cmn.year2") + ")";
                    String prefix = "bbs030KeepDateY";
                    msg = new ActionMessage("error.input.notvalidate.data", year);
                    errors.add(prefix + "error.input.notvalidate.data", msg);
                }



                //経過月
                boolean mFlg = false;
                for (String sm : MONTH_VALUE) {
                    int im = Integer.parseInt(sm);
                    if (bbs030KeepDateM__ == im) {
                        mFlg = true;
                        break;
                    }
                }

                if (mFlg == false) {
                    String month = gsMsg.getMessage(req, "bbs.bbs030.14")
                            + " (" + gsMsg.getMessage(req, "cmn.month") + ")";

                    String prefix = "bbs030KeepDateM";
                    msg = new ActionMessage("error.input.notvalidate.data", month);
                    errors.add(prefix + "error.input.notvalidate.data", msg);
                }

                //経過年、月
                if (yFlg && mFlg) {
                    //
                    if (bbs030KeepDateY__ == 0 && bbs030KeepDateM__ == 0) {
                        //
                        String yearMonth = gsMsg.getMessage(req, "bbs.bbs030.14");
                        String months = gsMsg.getMessage(req, "cmn.months", "1");
                        String prefix = "bbs030KeepDateYM";
                        msg = new ActionMessage("error.input.range0over.data", yearMonth, months);
                        errors.add(prefix + "error.input.range0over.data", msg);
                    }
                }
            }
        }

        //親フォーラムの階層構造チェック
        BbsBiz bbsBiz = new BbsBiz();
        boolean isExistForum = bbsBiz.isCheckExistForum(con, bbs030ParentForumSid__);
        Bbs030Biz bbs030Biz = new Bbs030Biz();
        if (!isExistForum
                && bbs030ParentForumSid__ != GSConstBulletin.BBS_DEFAULT_PFORUM_SID) {
            //フォーラムが存在せず、親フォーラム未設定でもない
            //「選択したフォーラムが存在しないためフォーラムに設定できません。」
            String prefix = "bbs030ParentForumSid";
            msg = new ActionMessage("error.not.exist.forum.parent");
            errors.add(prefix + "error.not.exist.forum.parent", msg);

        } else {
            String prefix = "bbs030ParentForumSid";
            int parentForumLevel = bbs030Biz.getForumLevel(con, bbs030ParentForumSid__);
            if (parentForumLevel >= GSConstBulletin.BBS_FORUM_MAX_LEVEL) {
                //親フォーラムが階層の上限に達している
                //「フォーラムを作成できる階層の上限である{0}階層を越えてしまうため作成できません。」
                msg = new ActionMessage(
                        "error.last.depth.forum.create", GSConstBulletin.BBS_FORUM_MAX_LEVEL);
                errors.add(prefix + "error.last.depth.forum.create", msg);

            } else if (bbs030cmdMode__ == GSConstBulletin.BBSCMDMODE_EDIT) {
                //更新時
                List<BbsForInfModel> childMdlList = new ArrayList<BbsForInfModel>();
                bbs030Biz.getChildForum(con, childMdlList, getBbs020forumSid());

                //子フォーラムのSIDと、最下層の階層レベルを取得
                List<Integer> childSidList = new ArrayList<Integer>();
                int deepestLevel = GSConstBulletin.BBS_FORUM_MIN_LEVEL;
                for (BbsForInfModel bfiMdl : childMdlList) {
                    childSidList.add(bfiMdl.getBfiSid());
                    if (deepestLevel < bfiMdl.getBfiLevel()) {
                        deepestLevel = bfiMdl.getBfiLevel();
                    }
                }

                if (bbs030ParentForumSid__ == getBbs020forumSid()
                        || childSidList.contains(bbs030ParentForumSid__)) {
                    //自分のフォーラムまたは子フォーラムを親フォーラムに設定しようとしている
                    //「自身または子階層のフォーラムを親フォーラムに設定できません。」
                    msg = new ActionMessage("error.forum.parent.child");
                    errors.add(prefix + "error.forum.parent.child", msg);
                }

                int selfLevel = bbs030Biz.getForumLevel(con, getBbs020forumSid());
                //親の階層レベル + 自フォーラムから子の最大階層までの階層レベル幅(子の最大階層レベル - 自分の階層レベル + 1)
                if (parentForumLevel + deepestLevel - selfLevel + 1
                        > GSConstBulletin.BBS_FORUM_MAX_LEVEL) {
                    //親フォーラムの階層レベルと自フォーラムの子の階層レベルを合わせると最大階層数を超える
                    //「フォーラムを作成できる階層の上限である{0}階層を越えてしまうため移動できません。」
                    msg = new ActionMessage(
                            "error.last.depth.forum.move", GSConstBulletin.BBS_FORUM_MAX_LEVEL);
                    errors.add(prefix + "error.last.depth.forum.move", msg);
                }
            }
        }

        //親フォーラムのメンバー以外のメンバーが、編集メンバーに設定されているか
        List<String> wrongMemWriteList =
                bbs030Biz.checkParentMember(
                        con, bbs030ParentForumSid__, bbs030UserListWriteReg__, false);
        if (wrongMemWriteList.size() > 0) {
            String prefix = "bbs030memberSid";

            List<String> wrongMemberWriteNameList =
                    bbs030Biz.getGroupUserNameList(con, wrongMemWriteList);

            for (String memberName : wrongMemberWriteNameList) {
                msg = new ActionMessage(
                        "error.select.parent.member.write", memberName);
                errors.add(prefix + "error.select.parent.member.write", msg);
            }
        }

        //親フォーラムのメンバー以外のメンバーが、閲覧メンバーに設定されているか
        List<String> wrongParentMemReadList =
                bbs030Biz.checkParentMember(
                        con, bbs030ParentForumSid__, bbs030UserListReadReg__, false);
        if (wrongParentMemReadList.size() > 0) {
            String prefix = "bbs030memberSid";

            List<String> wrongMemberReadNameList =
                    bbs030Biz.getGroupUserNameList(con, wrongParentMemReadList);

            for (String memberName : wrongMemberReadNameList) {
                msg = new ActionMessage("error.select.parent.member.read", memberName);
                errors.add(prefix + "error.select.parent.member.read", msg);
            }
        }

        //編集メンバーと閲覧メンバーに重複があるか
        if (bbs030UserListWriteReg__ != null && bbs030UserListReadReg__ != null
                && bbs030UserListWriteReg__.length > 0 && bbs030UserListReadReg__.length > 0) {
            List<String> dupMemWriteReadList = new ArrayList<String>();
            List<String> bbs030UserListWriteRegList = Arrays.asList(bbs030UserListWriteReg__);
            List<String> bbs030UserListReadRegList = Arrays.asList(bbs030UserListReadReg__);
            for (String writeUser : bbs030UserListWriteRegList) {
                if (bbs030UserListReadRegList.contains(writeUser)) {
                    dupMemWriteReadList.add(writeUser);
                }
            }
            if (dupMemWriteReadList.size() > 0) {
                String prefix = "bbs030memberSid";

                List<String> dupMemWriteReadNameList =
                        bbs030Biz.getGroupUserNameList(con, dupMemWriteReadList);

                for (String memberName : dupMemWriteReadNameList) {
                    msg = new ActionMessage("error.select.dup.member.write.read", memberName);
                    errors.add(prefix + "error.select.dup.member.write.read", msg);
                }
            }
        }

        List<String> wrongMemberAdmList = new ArrayList<String>();
        wrongMemberAdmList =
                bbs030Biz.checkMemberAdm(con, bbs030UserListAdmReg__,
                        bbs030UserListWriteReg__, bbs030UserListReadReg__, false);
        if (wrongMemberAdmList.size() > 0) {
            //編集メンバーまたは閲覧メンバーではないユーザを、フォーラム管理者に設定しようとしている
            String prefix = "bbs030memberSid";

            List<String> wrongMemberAdmNameList =
                    bbs030Biz.getGroupUserNameList(con, wrongMemberAdmList);

            for (String memberName : wrongMemberAdmNameList) {
                msg = new ActionMessage("error.select.forum.admin", memberName);
                errors.add(prefix + "error.select.forum.admin", msg);
            }
        }

        return errors;
    }

    /**
     * <p>bbs030BinSid を取得します。
     * @return bbs030BinSid
     */
    public Long getBbs030BinSid() {
        return bbs030BinSid__;
    }

    /**
     * <p>bbs030BinSid をセットします。
     * @param bbs030BinSid bbs030BinSid
     */
    public void setBbs030BinSid(Long bbs030BinSid) {
        bbs030BinSid__ = bbs030BinSid;
    }

    /**
     * <p>bbs030memberSidRead を取得します。
     * @return bbs030memberSidRead
     */
    public String[] getBbs030memberSidRead() {
        return bbs030memberSidRead__;
    }

    /**
     * <p>bbs030memberSidRead をセットします。
     * @param bbs030memberSidRead bbs030memberSidRead
     */
    public void setBbs030memberSidRead(String[] bbs030memberSidRead) {
        bbs030memberSidRead__ = bbs030memberSidRead;
    }

    /**
     * <p>bbs030SelectLeftUserRead を取得します。
     * @return bbs030SelectLeftUserRead
     */
    public String[] getBbs030SelectLeftUserRead() {
        return bbs030SelectLeftUserRead__;
    }

    /**
     * <p>bbs030SelectLeftUserRead をセットします。
     * @param bbs030SelectLeftUserRead bbs030SelectLeftUserRead
     */
    public void setBbs030SelectLeftUserRead(String[] bbs030SelectLeftUserRead) {
        bbs030SelectLeftUserRead__ = bbs030SelectLeftUserRead;
    }

    /**
     * <p>bbs030groupSidAdm を取得します。
     * @return bbs030groupSidAdm
     */
    public int getBbs030groupSidAdm() {
        return bbs030groupSidAdm__;
    }

    /**
     * <p>bbs030groupSidAdm をセットします。
     * @param bbs030groupSidAdm bbs030groupSidAdm
     */
    public void setBbs030groupSidAdm(int bbs030groupSidAdm) {
        bbs030groupSidAdm__ = bbs030groupSidAdm;
    }

    /**
     * <p>bbs030memberSidAdm を取得します。
     * @return bbs030memberSidAdm
     */
    public String[] getBbs030memberSidAdm() {
        return bbs030memberSidAdm__;
    }

    /**
     * <p>bbs030memberSidAdm をセットします。
     * @param bbs030memberSidAdm bbs030memberSidAdm
     */
    public void setBbs030memberSidAdm(String[] bbs030memberSidAdm) {
        bbs030memberSidAdm__ = bbs030memberSidAdm;
    }

    /**
     * <p>bbs030GroupListAdm を取得します。
     * @return bbs030GroupListAdm
     */
    public List<LabelValueBean> getBbs030GroupListAdm() {
        return bbs030GroupListAdm__;
    }

    /**
     * <p>bbs030GroupListAdm をセットします。
     * @param bbs030GroupListAdm bbs030GroupListAdm
     */
    public void setBbs030GroupListAdm(List<LabelValueBean> bbs030GroupListAdm) {
        bbs030GroupListAdm__ = bbs030GroupListAdm;
    }

    /**
     * <p>bbs030LeftUserListAdm を取得します。
     * @return bbs030LeftUserListAdm
     */
    public List<UsrLabelValueBean> getBbs030LeftUserListAdm() {
        return bbs030LeftUserListAdm__;
    }

    /**
     * <p>bbs030LeftUserListAdm をセットします。
     * @param bbs030LeftUserListAdm bbs030LeftUserListAdm
     */
    public void setBbs030LeftUserListAdm(List<UsrLabelValueBean> bbs030LeftUserListAdm) {
        bbs030LeftUserListAdm__ = bbs030LeftUserListAdm;
    }

    /**
     * <p>bbs030RightUserListAdm を取得します。
     * @return bbs030RightUserListAdm
     */
    public List<UsrLabelValueBean> getBbs030RightUserListAdm() {
        return bbs030RightUserListAdm__;
    }

    /**
     * <p>bbs030RightUserListAdm をセットします。
     * @param bbs030RightUserListAdm bbs030RightUserListAdm
     */
    public void setBbs030RightUserListAdm(
            List<UsrLabelValueBean> bbs030RightUserListAdm) {
        bbs030RightUserListAdm__ = bbs030RightUserListAdm;
    }

    /**
     * <p>bbs030LeftUserListRead を取得します。
     * @return bbs030LeftUserListRead
     */
    public List<UsrLabelValueBean> getBbs030LeftUserListRead() {
        return bbs030LeftUserListRead__;
    }

    /**
     * <p>bbs030LeftUserListRead をセットします。
     * @param bbs030LeftUserListRead bbs030LeftUserListRead
     */
    public void setBbs030LeftUserListRead(
            List<UsrLabelValueBean> bbs030LeftUserListRead) {
        bbs030LeftUserListRead__ = bbs030LeftUserListRead;
    }

    /**
     * <p>bbs030SelectRightUserAdm を取得します。
     * @return bbs030SelectRightUserAdm
     */
    public String[] getBbs030SelectRightUserAdm() {
        return bbs030SelectRightUserAdm__;
    }

    /**
     * <p>bbs030SelectRightUserAdm をセットします。
     * @param bbs030SelectRightUserAdm bbs030SelectRightUserAdm
     */
    public void setBbs030SelectRightUserAdm(String[] bbs030SelectRightUserAdm) {
        bbs030SelectRightUserAdm__ = bbs030SelectRightUserAdm;
    }

    /**
     * <p>bbs030SelectLeftUserAdm を取得します。
     * @return bbs030SelectLeftUserAdm
     */
    public String[] getBbs030SelectLeftUserAdm() {
        return bbs030SelectLeftUserAdm__;
    }

    /**
     * <p>bbs030SelectLeftUserAdm をセットします。
     * @param bbs030SelectLeftUserAdm bbs030SelectLeftUserAdm
     */
    public void setBbs030SelectLeftUserAdm(String[] bbs030SelectLeftUserAdm) {
        bbs030SelectLeftUserAdm__ = bbs030SelectLeftUserAdm;
    }

    /**
     * <p>bbs030mread を取得します。
     * @return bbs030mread
     */
    public String getBbs030mread() {
        return bbs030mread__;
    }

    /**
     * <p>bbs030mread をセットします。
     * @param bbs030mread bbs030mread
     */
    public void setBbs030mread(String bbs030mread) {
        bbs030mread__ = bbs030mread;
    }

    /**
     * <p>bbs030template を取得します。
     * @return bbs030template
     */
    public String getBbs030template() {
        return bbs030template__;
    }

    /**
     * <p>bbs030template をセットします。
     * @param bbs030template bbs030template
     */
    public void setBbs030template(String bbs030template) {
        bbs030template__ = bbs030template;
    }

    /**
     * <p>bbs030templateHtml を取得します。
     * @return bbs030templateHtml
     */
    public String getBbs030templateHtml() {
        return bbs030templateHtml__;
    }

    /**
     * <p>bbs030templateHtml をセットします。
     * @param bbs030templateHtml bbs030templateHtml
     */
    public void setBbs030templateHtml(String bbs030templateHtml) {
        bbs030templateHtml__ = bbs030templateHtml;
    }

    /**
     * <p>bbs030templateWriteKbn を取得します。
     * @return bbs030templateWriteKbn
     */
    public int getBbs030templateWriteKbn() {
        return bbs030templateWriteKbn__;
    }

    /**
     * <p>bbs030templateWriteKbn をセットします。
     * @param bbs030templateWriteKbn bbs030templateWriteKbn
     */
    public void setBbs030templateWriteKbn(int bbs030templateWriteKbn) {
        bbs030templateWriteKbn__ = bbs030templateWriteKbn;
    }

    /**
     * <p>bbs030templateType を取得します。
     * @return bbs030templateType
     */
    public int getBbs030templateType() {
        return bbs030templateType__;
    }

    /**
     * <p>bbs030templateType をセットします。
     * @param bbs030templateType bbs030templateType
     */
    public void setBbs030templateType(int bbs030templateType) {
        bbs030templateType__ = bbs030templateType;
    }

    /**
     * <p>bbs030templateKbn を取得します。
     * @return bbs030templateKbn
     */
    public int getBbs030templateKbn() {
        return bbs030templateKbn__;
    }

    /**
     * <p>bbs030templateKbn をセットします。
     * @param bbs030templateKbn bbs030templateKbn
     */
    public void setBbs030templateKbn(int bbs030templateKbn) {
        bbs030templateKbn__ = bbs030templateKbn;
    }

    /**
     * <p>bbs030diskSize__ を取得します。
     * @return bbs030diskSize
     */
   public int getBbs030diskSize() {
        return bbs030diskSize__;
    }

   /**
    * <p>bbs030diskSize をセットします。
    * @param bbs030diskSize bbs030diskSize
    */
    public void setBbs030diskSize(int bbs030diskSize) {
        bbs030diskSize__ = bbs030diskSize;
    }

    /**
     * <p>bbs030diskSizeLimit を取得します。
     * @return bbs030diskSizeLimit
     */
    public String getBbs030diskSizeLimit() {
        return bbs030diskSizeLimit__;
    }

    /**
     * <p>bbs030diskSizeLimit をセットします。
     * @param bbs030diskSizeLimit bbs030diskSizeLimit
     */
    public void setBbs030diskSizeLimit(String bbs030diskSizeLimit) {
        bbs030diskSizeLimit__ = bbs030diskSizeLimit;
    }

    /**
     * <p>bbs030warnDisk を取得します。
     * @return bbs030warnDisk
     */
    public int getBbs030warnDisk() {
        return bbs030warnDisk__;
    }

    /**
     * <p>bbs030warnDisk をセットします。
     * @param bbs030warnDisk bbs030warnDisk
     */
    public void setBbs030warnDisk(int bbs030warnDisk) {
        bbs030warnDisk__ = bbs030warnDisk;
    }

    /**
     * <p>bbs030warnDiskThreshold を取得します。
     * @return bbs030warnDiskThreshold
     */
    public int getBbs030warnDiskThreshold() {
        return bbs030warnDiskThreshold__;
    }

    /**
     * <p>bbs030warnDiskThreshold をセットします。
     * @param bbs030warnDiskThreshold bbs030warnDiskThreshold
     */
    public void setBbs030warnDiskThreshold(int bbs030warnDiskThreshold) {
        bbs030warnDiskThreshold__ = bbs030warnDiskThreshold;
    }

    /**
     * <p>warnDiskThresholdList を取得します。
     * @return warnDiskThresholdList
     */
    public List<LabelValueBean> getWarnDiskThresholdList() {
        return warnDiskThresholdList__;
    }

    /**
     * <p>warnDiskThresholdList をセットします。
     * @param warnDiskThresholdList warnDiskThresholdList
     */
    public void setWarnDiskThresholdList(List<LabelValueBean> warnDiskThresholdList) {
        warnDiskThresholdList__ = warnDiskThresholdList;
    }

    /**
     * <p>bbs030LimitDisable を取得します。
     * @return bbs030LimitDisable
     */
    public int getBbs030LimitDisable() {
        return bbs030LimitDisable__;
    }

    /**
     * <p>bbs030LimitDisable をセットします。
     * @param bbs030LimitDisable bbs030LimitDisable
     */
    public void setBbs030LimitDisable(int bbs030LimitDisable) {
        bbs030LimitDisable__ = bbs030LimitDisable;
    }

    /**
     * <p>bbs030Limit を取得します。
     * @return bbs030Limit
     */
    public int getBbs030Limit() {
        return bbs030Limit__;
    }

    /**
     * <p>bbs030Limit をセットします。
     * @param bbs030Limit bbs030Limit
     */
    public void setBbs030Limit(int bbs030Limit) {
        bbs030Limit__ = bbs030Limit;
    }

    /**
     * <p>bbs030LimitDate を取得します。
     * @return bbs030LimitDate
     */
    public String getBbs030LimitDate() {
        return bbs030LimitDate__;
    }

    /**
     * <p>bbs030LimitDate をセットします。
     * @param bbs030LimitDate bbs030LimitDate
     */
    public void setBbs030LimitDate(String bbs030LimitDate) {
        bbs030LimitDate__ = bbs030LimitDate;
    }

    /**
     * <p>bbs030TimeUnitを取得します。
     * @return bbs030TimeUnit
     * */
    public int getBbs030TimeUnit() {
        return bbs030TimeUnit__;
    }

    /**
     * <p>bbs030TimeUnitをセットします。
     * @param bbs030TimeUnit bbs030TimeUnit
     * */
    public void setBbs030TimeUnit(int bbs030TimeUnit) {
        bbs030TimeUnit__ = bbs030TimeUnit;
    }

    /**
     * <p>bbs030Keep を取得します。
     * @return bbs030Keep
     */
    public int getBbs030Keep() {
        return bbs030Keep__;
    }

    /**
     * <p>bbs030Keep をセットします。
     * @param bbs030Keep bbs030Keep
     */
    public void setBbs030Keep(int bbs030Keep) {
        bbs030Keep__ = bbs030Keep;
    }

    /**
     * <p>bbs030KeepDateY を取得します。
     * @return bbs030KeepDateY
     */
    public int getBbs030KeepDateY() {
        return bbs030KeepDateY__;
    }

    /**
     * <p>bbs030KeepDateY をセットします。
     * @param bbs030KeepDateY bbs030KeepDateY
     */
    public void setBbs030KeepDateY(int bbs030KeepDateY) {
        bbs030KeepDateY__ = bbs030KeepDateY;
    }

    /**
     * <p>bbs030KeepDateM を取得します。
     * @return bbs030KeepDateM
     */
    public int getBbs030KeepDateM() {
        return bbs030KeepDateM__;
    }

    /**
     * <p>bbs030KeepDateM をセットします。
     * @param bbs030KeepDateM bbs030KeepDateM
     */
    public void setBbs030KeepDateM(int bbs030KeepDateM) {
        bbs030KeepDateM__ = bbs030KeepDateM;
    }

    /**
     * <p>bbs030KeepDateYLabel を取得します。
     * @return bbs030KeepDateYLabel
     */
    public List<LabelValueBean> getBbs030KeepDateYLabel() {
        return bbs030KeepDateYLabel__;
    }

    /**
     * <p>bbs030KeepDateYLabel をセットします。
     * @param bbs030KeepDateYLabel bbs030KeepDateYLabel
     */
    public void setBbs030KeepDateYLabel(List<LabelValueBean> bbs030KeepDateYLabel) {
        bbs030KeepDateYLabel__ = bbs030KeepDateYLabel;
    }

    /**
     * <p>bbs030KeepDateMLabel を取得します。
     * @return bbs030KeepDateMLabel
     */
    public List<LabelValueBean> getBbs030KeepDateMLabel() {
        return bbs030KeepDateMLabel__;
    }

    /**
     * <p>bbs030KeepDateMLabel をセットします。
     * @param bbs030KeepDateMLabel bbs030KeepDateMLabel
     */
    public void setBbs030KeepDateMLabel(List<LabelValueBean> bbs030KeepDateMLabel) {
        bbs030KeepDateMLabel__ = bbs030KeepDateMLabel;
    }

    /**
     * <p>bbs030DspAtdelFlg を取得します。
     * @return bbs030DspAtdelFlg
     */
    public int getBbs030DspAtdelFlg() {
        return bbs030DspAtdelFlg__;
    }

    /**
     * <p>bbs030DspAtdelFlg をセットします。
     * @param bbs030DspAtdelFlg bbs030DspAtdelFlg
     */
    public void setBbs030DspAtdelFlg(int bbs030DspAtdelFlg) {
        bbs030DspAtdelFlg__ = bbs030DspAtdelFlg;
    }

    /**
     * <p>bbs030DspAtdelYear を取得します。
     * @return bbs030DspAtdelYear
     */
    public int getBbs030DspAtdelYear() {
        return bbs030DspAtdelYear__;
    }

    /**
     * <p>bbs030DspAtdelYear をセットします。
     * @param bbs030DspAtdelYear bbs030DspAtdelYear
     */
    public void setBbs030DspAtdelYear(int bbs030DspAtdelYear) {
        bbs030DspAtdelYear__ = bbs030DspAtdelYear;
    }

    /**
     * <p>bbs030DspAtdelMonth を取得します。
     * @return bbs030DspAtdelMonth
     */
    public int getBbs030DspAtdelMonth() {
        return bbs030DspAtdelMonth__;
    }

    /**
     * <p>bbs030DspAtdelMonth をセットします。
     * @param bbs030DspAtdelMonth bbs030DspAtdelMonth
     */
    public void setBbs030DspAtdelMonth(int bbs030DspAtdelMonth) {
        bbs030DspAtdelMonth__ = bbs030DspAtdelMonth;
    }

    /**
     * <p>tempDirId を取得します。
     * @return bbs030TempDirId
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
     * <p>bbs030ScrollPosition を取得します。
     * @return bbs030ScrollPosition
     */
    public String getBbs030ScrollPosition() {
        return bbs030ScrollPosition__;
    }

    /**
     * <p>bbs030ScrollPosition をセットします。
     * @param bbs030ScrollPosition bbs030ScrollPosition
     */
    public void setBbs030ScrollPosition(String bbs030ScrollPosition) {
        bbs030ScrollPosition__ = bbs030ScrollPosition;
    }

    /**
     * <p>bbs190ScrollPosition を取得します。
     * @return bbs190ScrollPosition
     */
    public String getBbs190ScrollPosition() {
        return bbs190ScrollPosition__;
    }

    /**
     * <p>bbs190ScrollPosition をセットします。
     * @param bbs190ScrollPosition bbs190ScrollPosition
     */
    public void setBbs190ScrollPosition(String bbs190ScrollPosition) {
        bbs190ScrollPosition__ = bbs190ScrollPosition;
    }

    /**
     * <p>bbs030UserListWriteReg を取得します。
     * @return bbs030UserListWriteReg
     */
    public String[] getBbs030UserListWriteReg() {
        return bbs030UserListWriteReg__;
    }

    /**
     * <p>bbs030UserListWriteReg をセットします。
     * @param bbs030UserListWriteReg bbs030UserListWriteReg
     */
    public void setBbs030UserListWriteReg(String[] bbs030UserListWriteReg) {
        bbs030UserListWriteReg__ = bbs030UserListWriteReg;
    }

    /**
     * <p>bbs030UserListReadReg を取得します。
     * @return bbs030UserListReadReg
     */
    public String[] getBbs030UserListReadReg() {
        return bbs030UserListReadReg__;
    }

    /**
     * <p>bbs030UserListReadReg をセットします。
     * @param bbs030UserListReadReg bbs030UserListReadReg
     */
    public void setBbs030UserListReadReg(String[] bbs030UserListReadReg) {
        bbs030UserListReadReg__ = bbs030UserListReadReg;
    }

    /**
     * <p>bbs030UserListAdmReg を取得します。
     * @return bbs030UserListAdmReg
     */
    public String[] getBbs030UserListAdmReg() {
        return bbs030UserListAdmReg__;
    }

    /**
     * <p>bbs030UserListAdmReg をセットします。
     * @param bbs030UserListAdmReg bbs030UserListAdmReg
     */
    public void setBbs030UserListAdmReg(String[] bbs030UserListAdmReg) {
        bbs030UserListAdmReg__ = bbs030UserListAdmReg;
    }

    /**
     * <p>bbs030BanUserSidList を取得します。
     * @return bbs030BanUserSidList
     */
    public List<Integer> getBbs030BanUserSidList() {
        return bbs030BanUserSidList__;
    }

    /**
     * <p>bbs030BanUserSidList をセットします。
     * @param bbs030BanUserSidList bbs030BanUserSidList
     */
    public void setBbs030BanUserSidList(List<Integer> bbs030BanUserSidList) {
        bbs030BanUserSidList__ = bbs030BanUserSidList;
    }

    /**
     * <p>bbs030BanGroupSidList を取得します。
     * @return bbs030BanGroupSidList
     */
    public List<Integer> getBbs030BanGroupSidList() {
        return bbs030BanGroupSidList__;
    }

    /**
     * <p>bbs030BanGroupSidList をセットします。
     * @param bbs030BanGroupSidList bbs030BanGroupSidList
     */
    public void setBbs030BanGroupSidList(List<Integer> bbs030BanGroupSidList) {
        bbs030BanGroupSidList__ = bbs030BanGroupSidList;
    }

    /**
     * <p>bbs030DisableGroupSidList を取得します。
     * @return bbs030DisableGroupSidList
     */
    public List<Integer> getBbs030DisableGroupSidList() {
        return bbs030DisableGroupSidList__;
    }

    /**
     * <p>bbs030DisableGroupSidList をセットします。
     * @param bbs030DisableGroupSidList bbs030DisableGroupSidList
     */
    public void setBbs030DisableGroupSidList(List<Integer> bbs030DisableGroupSidList) {
        bbs030DisableGroupSidList__ = bbs030DisableGroupSidList;
    }

    /**
     * <p>bbs030AdaptChildMemFlg を取得します。
     * @return bbs030AdaptChildMemFlg
     */
    public int getBbs030AdaptChildMemFlg() {
        return bbs030AdaptChildMemFlg__;
    }

    /**
     * <p>bbs030AdaptChildMemFlg をセットします。
     * @param bbs030AdaptChildMemFlg bbs030AdaptChildMemFlg
     */
    public void setBbs030AdaptChildMemFlg(int bbs030AdaptChildMemFlg) {
        bbs030AdaptChildMemFlg__ = bbs030AdaptChildMemFlg;
    }

    /**
     * <p>bbs030HaveChildForumFlg を取得します。
     * @return bbs030HaveChildForumFlg
     */
    public int getBbs030HaveChildForumFlg() {
        return bbs030HaveChildForumFlg__;
    }

    /**
     * <p>bbs030HaveChildForumFlg をセットします。
     * @param bbs030HaveChildForumFlg bbs030HaveChildForumFlg
     */
    public void setBbs030HaveChildForumFlg(int bbs030HaveChildForumFlg) {
        bbs030HaveChildForumFlg__ = bbs030HaveChildForumFlg;
    }

    /**
     * <p>bbs030FollowParentMemFlg を取得します。
     * @return bbs030FollowParentMemFlg
     */
    public int getBbs030FollowParentMemFlg() {
        return bbs030FollowParentMemFlg__;
    }

    /**
     * <p>bbs030FollowParentMemFlg をセットします。
     * @param bbs030FollowParentMemFlg bbs030FollowParentMemFlg
     */
    public void setBbs030FollowParentMemFlg(int bbs030FollowParentMemFlg) {
        bbs030FollowParentMemFlg__ = bbs030FollowParentMemFlg;
    }

}
