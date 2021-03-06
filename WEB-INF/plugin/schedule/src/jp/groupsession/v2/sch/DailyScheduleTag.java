package jp.groupsession.v2.sch;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import jp.co.sjts.util.NullDefault;
import jp.co.sjts.util.StringUtil;
import jp.co.sjts.util.StringUtilHtml;
import jp.co.sjts.util.date.UDate;
import jp.groupsession.v2.cmn.GSConst;
import jp.groupsession.v2.cmn.GSConstCommon;
import jp.groupsession.v2.cmn.GSConstSchedule;
import jp.groupsession.v2.sch.sch010.Sch010DayOfModel;
import jp.groupsession.v2.sch.sch010.Sch010UsrModel;
import jp.groupsession.v2.sch.sch010.Sch010WeekOfModel;
import jp.groupsession.v2.sch.sch010.SimpleScheduleModel;
import jp.groupsession.v2.sch.sch040.Sch040DailyLineModel;
import jp.groupsession.v2.sch.sch040.Sch040DailyValueModel;
import jp.groupsession.v2.struts.msg.GsMessage;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.taglib.TagUtils;

/**
 * <br>Tag that retrieves the specified property of the specified bean, converts
 * <br>it to a String representation (if necessary), and writes it to the current
 * <br>output stream, optionally filtering characters that are sensitive in HTML.
 * @author JTS
 * @version $Revision: 1.1 $ $Date: 2016/11/04 08:45:42 $
 */
public class DailyScheduleTag extends TagSupport {
    /** ロギングクラス */
    public static Log log__ = LogFactory.getLog(DailyScheduleTag.class);

    /**
     * The key to search default format string for java.sql.Timestamp in resources.
     */
    public static final String SQL_TIMESTAMP_FORMAT_KEY =
        "org.apache.struts.taglib.bean.format.sql.timestamp";

    /**
     * The key to search default format string for java.sql.Date in resources.
     */
    public static final String SQL_DATE_FORMAT_KEY =
        "org.apache.struts.taglib.bean.format.sql.date";

    /**
     * The key to search default format string for java.sql.Time in resources.
     */
    public static final String SQL_TIME_FORMAT_KEY =
        "org.apache.struts.taglib.bean.format.sql.time";

    /**
     * The key to search default format string for java.util.Date in resources.
     */
    public static final String DATE_FORMAT_KEY =
        "org.apache.struts.taglib.bean.format.date";

    /**
     * The key to search default format string for int (byte, short, etc.) in resources.
     */
    public static final String INT_FORMAT_KEY =
        "org.apache.struts.taglib.bean.format.int";

    /**
     * The key to search default format string for float (double, BigDecimal) in
     * resources.
     */
    public static final String FLOAT_FORMAT_KEY =
        "org.apache.struts.taglib.bean.format.float";

    /**
     * Should we ignore missing beans and simply output nothing?
     */
    protected boolean ignore = false;

    /**
     * get ignore
     * @return boolean
     */
    public boolean getIgnore() {
        return (this.ignore);
    }

    /**
     * set ignore
     * @param b ignore
     */
    public void setIgnore(boolean b) {
        this.ignore = b;
    }

    /**
     * Name of the bean that contains the data we will be rendering.
     */
    protected String name = null;

    /**
     * get name
     * @return String
     */
    public String getName() {
        return (this.name);
    }

    /**
     * set name
     * @param string name
     */
    public void setName(String string) {
        this.name = string;
    }

    /**
     * Name of the property to be accessed on the specified bean.
     */
    protected String property = null;

    /**
     * get Property
     * @return String
     */
    public String getProperty() {
        return (this.property);
    }

    /**
     * set Property
     * @param string property
     */
    public void setProperty(String string) {
        this.property = string;
    }

    /**
     * The scope to be searched to retrieve the specified bean.
     */
    protected String scope = null;

    /**
     * get Scope
     * @return String
     */
    public String getScope() {
        return (this.scope);
    }

    /**
     * set Scope
     * @param string scope
     */
    public void setScope(String string) {
        this.scope = string;
    }

    /**
     * The servlet context attribute key for our resources.
     */
    protected String bundle = null;

    /**
     * getBundle
     * @return String
     */
    public String getBundle() {
        return (this.bundle);
    }

    /**
     * setBundle
     * @param string bundle
     */
    public void setBundle(String string) {
        this.bundle = string;
    }

    /**
     * 表示開始時刻
     */
    protected String from = null;

    /**
     * @return from を戻します。
     */
    public String getFrom() {
        return from;
    }

    /**
     * @param string 設定する from。
     */
    public void setFrom(String string) {
        this.from = string;
    }
    /**
     * 表示終了時刻
     */
    protected String to = null;

    /**
     * @return to を戻します。
     */
    public String getTo() {
        return to;
    }

    /**
     * @param string 設定する to。
     */
    public void setTo(String string) {
        this.to = string;
    }
    /**
     * <br>上段のスケジュールかを設定します
     * <br>0:下段 1:上段
     * <br>上段の場合、全てが公開状態になります
     */
    protected String top = null;

    /**
     * @return mysch を戻します。
     */
    public String getTop() {
        return top;
    }

    /**
     * @param string 設定する top
     */
    public void setTop(String string) {
        this.top = string;
    }

    /**
     * <br>管理者権限有無を設定します
     */
    protected String admin = null;

    /**
     * @return admin を戻します。
     */
    public String getAdmin() {
        return admin;
    }

    /**
     * @param string 設定する admin。
     */
    public void setAdmin(String string) {
        this.admin = string;
    }

    /**
     * <br>１時間あたりの区切り数を設定します
     */
    protected String memCnt = null;
    /**
     * <p>memCnt を取得します。
     * @return memCnt
     */
    public String getMemCnt() {
        return memCnt;
    }

    /**
     * <p>memCnt をセットします。
     * @param string １時間あたりの区切り数
     */
    public void setMemCnt(String string) {
        this.memCnt = string;
    }

    // --------------------------------------------------------- Public Methods


    /**
     * <br>Process the start tag.
     * @return int
     * @exception JspException if a JSP exception has occurred
     */
    public int doStartTag() throws JspException {
        HttpServletRequest req = (HttpServletRequest) pageContext.getRequest();
        // Look up the requested bean (if necessary)
        if (ignore) {
            if (TagUtils.getInstance().lookup(pageContext, name, scope)
                == null) {
                return (SKIP_BODY); // Nothing to output
            }
        }
        // Look up the requested property value
        Object value =
            TagUtils.getInstance().lookup(pageContext, name, property, scope);

        if (value == null) {
            return (SKIP_BODY); // Nothing to output
        }
        //使用する型に置き換える
        log__.debug("<==value==>" + value.getClass());
        if (value instanceof Sch010WeekOfModel) {
            //型が違う場合はエラー
            //            return (SKIP_BODY); // Nothing to output
        }
        Sch010WeekOfModel weekMdl = (Sch010WeekOfModel) value;

        JspWriter writer = pageContext.getOut();
        //      //再起的にHTMLを吐き出す。
        try {

            __writeTag(writer, weekMdl, req);

        } catch (Exception e) {
            throw new JspException("Jsp出力に失敗しました。", e);
        }

        // Continue processing this page
        return (SKIP_BODY);

    }

    /**
     * <br>HTMLをJspへ出力します。
     * @param writer JspWriter
     * @param weekMdl ユーザ別日間スケジュール情報
     * @param req リクエスト
     * @throws Exception 出力エラー
     */
    private void __writeTag(JspWriter writer, Sch010WeekOfModel weekMdl,
            HttpServletRequest req)
        throws Exception {

        log__.debug("-- __writeTag START --");

        Sch010UsrModel usrMdl = weekMdl.getSch010UsrMdl();
        ArrayList < Sch010DayOfModel > dayList = weekMdl.getSch010SchList();
        Sch010DayOfModel dayMdl = dayList.get(0);
        int intFrom = GSConstSchedule.DAY_START_HOUR;
        int intTo = GSConstSchedule.DAY_END_HOUR;
        if (from != null) {
            intFrom = Integer.parseInt(from);
        }
        if (to != null) {
            intTo = Integer.parseInt(to);
        }
        int intTop = 0;
        if (top != null) {
            intTop = Integer.parseInt(top);
        }
        int intAdmin = 0;
        if (admin != null) {
            intAdmin = Integer.parseInt(admin);
        }
        ArrayList < SimpleScheduleModel > schList = dayMdl.getSchDataList();
        //スケジュール情報を画面表示用に格納します
        ArrayList < Sch040DailyLineModel > dailyList =
            __getDspScheduleList(schList, dayMdl.getSchDate(), intFrom, intTo);

        __writeHtmlString(
        writer, usrMdl, dayMdl, dailyList, intTop, intAdmin, req, weekMdl);

        log__.debug("-- __writeTag END --");
    }

    /**
     * <br>Sch010DayOfModelからHTML文字列を取得します。
     * <br>１ユーザの日間スケジュール
     * @param writer ライター
     * @param usrMdl ユーザ情報
     * @param dayModel Sch010DayOfModel
     * @param dailyList 画面表示用スケジュール
     * @param topKbn 上段表示スケジュール区分
     * @param adminKbn 管理者区分 1:権限有り 2:権限無し
     * @param req リクエスト
     * @param weekMdl ユーザ別日間スケジュール情報
     * @throws Exception IOエラー時にスロー
     */
    private static void __writeHtmlString(
        JspWriter writer,
        Sch010UsrModel usrMdl,
        Sch010DayOfModel dayModel,
        ArrayList < Sch040DailyLineModel > dailyList,
        int topKbn,
        int adminKbn,
        HttpServletRequest req,
        Sch010WeekOfModel weekMdl)
        throws Exception {

        int userSid = dayModel.getUsrSid();
        int userKbn = dayModel.getUsrKbn();
        int zaisekiKbn = usrMdl.getZaisekiKbn();
        String zaisekiMsg = StringUtilHtml.transToHTmlPlusAmparsant(
                NullDefault.getString(usrMdl.getZaisekiMsg(), ""));
        int rowspan = dailyList.size();
        GsMessage gsMsg = new GsMessage();
        //グループ
        String textGroup = gsMsg.getMessage(req, "cmn.group");
        //月間
        String textMonthly = gsMsg.getMessage(req, "cmn.monthly");
        //一覧
        String textList = gsMsg.getMessage(req, "cmn.list");
        //追加
        String textAdd = gsMsg.getMessage(req, "cmn.add");
        //スペース
        String textSpace = gsMsg.getMessage(req, "cmn.space");
        //ショートメール
        String textSml = gsMsg.getMessage(req, "cmn.shortmail");

        //ユーザ欄
        String userName = StringUtilHtml.transToHTmlPlusAmparsant(usrMdl.getUsrName());
        if (userKbn == GSConstSchedule.USER_KBN_GROUP) {

            writer.println("<td class=\"td_type1\" rowspan=\"" + rowspan + "\">");
            writer.println("  <span id=\"lt\">");
            writer.println("  <img src=\"../common/images/groupicon.gif\""
                    + " alt=\"" + textGroup + "\" border=\"0\">");
            writer.println("  </span>");
            writer.println("  <span id=\"lt\" class=\"text_bb1\">" + userName + "</span>");
            writer.println("  <br>");
            writer.println("  <span  class=\"nameframe_grp\">");

            writer.println("  <a href=\"#\" "
                    + "onClick=\"moveMonthSchedule('month', " + userSid + ", " + userKbn + ");\">"
                    + "<img src=\"../common/images/btn_gekkan_bg.gif\" "
                    + "width=\"35\" height=\"18\" alt=\"" + textMonthly + "\" border=\"0\">"
                    + "<span class=\"sc_link_1_vargin_top\">" + textMonthly + "</span>"
                    + "</a>");

            writer.println("<br>");

            writer.println("  <a href=\"#\" "
                    + "onClick=\"moveListSchedule('list', " + userSid + ", " + userKbn + ");\">"
                    + "<img src=\"../common/images/btn_ichiran_bg.gif\" "
                    + "width=\"35\" height=\"18\" alt=\"" + textList + "\" border=\"0\">"
                    + "<span class=\"sc_link_1_vargin_top\">" + textList + "</span>"
                    + "</a>");

            writer.println("  </span>");
            writer.println("</td>");
            writer.println("<td class=\"td_type1\" align=\"center\" valign=\"middle\""
            +  " rowspan=\"" + rowspan + "\">");

            writer.println("  <a href=\"#\" target=\"_self\">");

            if (usrMdl.isSchRegistFlg()) {
                writer.println("  <a href=\"#\" "
                        + "onClick=\"addSchedule('add',"
                        + " " + dayModel.getSchDate() + ","
                        + " " + dayModel.getUsrSid() + ","
                        + " " + dayModel.getUsrKbn() + ");\">"
                        + "<img src=\"../schedule/images/scadd.gif\" alt=\"" + textAdd + "\" "
                        + "width=\"16\" height=\"16\" border=\"0\"></a>");
            }

            writer.println("</td>");
        } else {
            String zaisekiCss = "";
            if (weekMdl.getZaisekiUseOk() == GSConstSchedule.PLUGIN_USE) {
                if (zaisekiKbn == GSConst.UIOSTS_IN) {
                    zaisekiCss = "td_type1";
                } else if (zaisekiKbn == GSConst.UIOSTS_LEAVE) {
                    zaisekiCss = "td_type_gaisyutu";
                } else if (zaisekiKbn == GSConst.UIOSTS_ETC) {
                    zaisekiCss = "td_type_kekkin";
                }
            } else {
                zaisekiCss = "td_type1";
            }
            if (usrMdl.getSchUkoFlg() == 1) {
                writer.println("<td width=\"131\" class=\""
                        + zaisekiCss + " break\" rowspan=\"" + rowspan + "\">");
                        writer.println("  <span class=\"mukouser\">"
                        + "<a href=\"javaScript:void(0);\""
                        + "onClick=\"openUserInfoWindow(" + userSid + ");\">"
                        + userName + "</a></span>");
            } else {
                writer.println("<td width=\"131\" class=\""
                        + zaisekiCss + " break\" rowspan=\"" + rowspan + "\">");
                        writer.println("  <span>"
                        + "<a href=\"javaScript:void(0);\""
                        + "onClick=\"openUserInfoWindow(" + userSid + ");\">"
                        + userName + "</a></span>");
            }

            writer.println("  <span class=\"sc_link_5\">" + zaisekiMsg + "</span><br>");
            //
            writer.println("  <span class=\"nameframe_usr\">");
            writer.println("  <a href=\"#\" "
                    + "onClick=\"moveMonthSchedule('month',"
                    + " " + userSid + ","
                    + " " + userKbn + ");\">"
                    + "<img src=\"../common/images/btn_gekkan_bg.gif\" width=\"35\" height=\"18\""
                    + " alt=\"" + textMonthly + "\" border=\"0\" style=\"padding: 0 5 5 0\">"
                    + "<span class=\"sc_link_1_vargin_top\">"
                    + textMonthly + "</span></a><br>");

            writer.println("  <a href=\"#\" "
                    + "onClick=\"moveListSchedule('list',"
                    + " " + userSid + ","
                    + " " + userKbn + ");\">"
                    + "<img src=\"../common/images/btn_ichiran_bg.gif\" width=\"35\" height=\"18\""
                    + " alt=\"" + textList + "\" border=\"0\" style=\"padding: 0 5 5 0\">"
                    + "<span class=\"sc_link_1_vargin_top\">"
                    + textList + "</span></a><br>");
            if (weekMdl.getSmailUseOk() == GSConstSchedule.PLUGIN_USE
                    && usrMdl.getSmlAble() == 1) {
                writer.println("  <a href=\"#\" "
                        + "class=\"sml_send_link\" id=\""
                        + userSid
                        + "\">"
                        + "<img src=\"../common/images/btn_smail_bg.gif\" width=\"35\""
                        + " height=\"18\""
                        + " alt=\"" + textSml + "\" border=\"0\" style=\"padding: 0 5 5 0\">"
                        + "<span class=\"sc_link_1_vargin_top\">"
                        + textSml + "</span></a><br>");

            }
            writer.println("<!-- 在席 -->");
            if (weekMdl.getZaisekiUseOk() == GSConstSchedule.PLUGIN_USE) {
                if (zaisekiKbn == GSConst.UIOSTS_IN) {
                    writer.println("<input type=\"button\""
                  + " onClick=\"setFuzai(" + userSid + ");\""
                  + " style=\"border:0px;color:#417984;"
                  + "font-size:10px;font-weight:bold;width:55px;height:17px;\""
                  + " class=\"btn_fuzai\" value=\""
                  + gsMsg.getMessage(req, "cmn.absence") + "\">");

                    writer.println("<input type=\"button\" onClick=\"setSonota(" + userSid + ");\""
                  + " style=\"border:0px;color:#47a370;"
                  + "font-size:10px;font-weight:bold;width:55px;height:17px;\""
                  + " class=\"btn_sonota\" value=\"" + gsMsg.getMessage(req, "cmn.other") + "\">");

                } else {
                    writer.println("<!-- 不在、その他 -->");
                    writer.println(" <input type=\"button\" onClick=\"setZaiseki("
                  + userSid + ");\" style=\"border:0px;color:#47a370;font-size:10px;"
                  + "font-weight:bold;width:55px;height:17px;\" class=\"btn_zaiseki\""
                  + " value=\"" + gsMsg.getMessage(req, "cmn.zaiseki") + "\">");
                }
            } else {
                writer.println("<img src=\"../common/images/damy.gif\""
                        + " width=\"35\" height=\"18\" alt=\"" + textSpace + "\" >");
                writer.println("<img src=\"../common/images/damy.gif\""
                        + " width=\"35\" height=\"18\" alt=\"" + textSpace + "\" >");
            }


            writer.println("  </span>");
            writer.println("</td>");

            writer.println("<td class=\"td_type1\" align=\"center\" valign=\"middle\""
            + " rowspan=\"" + rowspan + "\">");

            if (usrMdl.isSchRegistFlg()) {
                writer.println("  <a href=\"#\" "
                        + " onClick=\"addSchedule('add',"
                        + " " + dayModel.getSchDate() + ","
                        + " " + dayModel.getUsrSid() + ","
                        + " " + dayModel.getUsrKbn() + ");\">"
                        + "<img src=\"../schedule/images/scadd.gif\" alt=\"" + textAdd + "\""
                        + " width=\"16\" height=\"16\" border=\"0\"></a>");
            }
            writer.println("</td>");
        }

        //タイムチャート部分出力
        Sch040DailyLineModel dailyLineMdl = null;
        ArrayList < Sch040DailyValueModel > valueList = null;
        Sch040DailyValueModel valueMdl = null;
        int editConfOwn = 0;
        int editConfGroup = 0;

        //縦
        for (int i = 0; i < dailyList.size(); i++) {
            dailyLineMdl = dailyList.get(i);
            valueList = dailyLineMdl.getLineList();

            if (i > 0) {
                writer.println("<tr>");
            }
            //横
            for (int j = 0; j < valueList.size(); j++) {
                valueMdl = valueList.get(j);
                int cols = valueMdl.getCols();
                SimpleScheduleModel schMdl = valueMdl.getScheduleMdl();
                if (schMdl != null) {
                    String title = null;
                    if (StringUtil.isNullZeroStringSpace(schMdl.getSchAppendUrl())) {
                        //スケジュールのタイトル
                        title = StringUtilHtml.transToHTmlPlusAmparsant(schMdl.getTitle());
                    } else {
                        //スケジュール以外のタイトル

                        //日報アクション表示のみエスケープ処理
                        if (schMdl.getUserKbn()
                                .equals(String.valueOf(GSConstCommon.PLUGIN_ID_NIPPOU))) {
                            title = StringUtilHtml.transToHTmlPlusAmparsant(schMdl.getTitle());
                        } else {
                            title = schMdl.getTitle();
                        }
                    }
                    String content = StringUtilHtml.transToHTmlPlusAmparsant(schMdl.getValueStr());
                    String color = null;
                    if (StringUtil.isNullZeroStringSpace(schMdl.getSchAppendUrl())) {
                        //スケジュール
                        color = __getStyleBgColor(schMdl.getBgColor());
                    } else {
                        //スケジュール以外のデータ
                        color = "td_type_nikkan_1";
                    }

                    writer.println("<td colspan=\"" + cols + "\""
                    + " align=\"center\" valign=\"middle\""
                    + " class=\"" + color + "\">");

                    editConfOwn = schMdl.getKjnEdKbn();
                    editConfGroup = schMdl.getGrpEdKbn();
                    //公開パターン
                    if ((schMdl.getPublic() == GSConstSchedule.DSP_PUBLIC
                            || schMdl.getPublic() == GSConstSchedule.DSP_BELONG_GROUP)
                       || (editConfOwn == GSConstSchedule.EDIT_CONF_OWN
                            || editConfGroup == GSConstSchedule.EDIT_CONF_GROUP)) {

                        String usrKbn = String.valueOf(GSConstSchedule.USER_KBN_GROUP);
                        String usrSid = null;
                        if (schMdl.getUserKbn() != null) {
                            usrKbn = schMdl.getUserKbn();
                        } else {
                            usrKbn = String.valueOf(dayModel.getUsrKbn());
                        }
                        if (usrKbn.equals(String.valueOf(GSConstSchedule.USER_KBN_USER))) {
                            usrSid = String.valueOf(dayModel.getUsrSid());
                        } else {
                            if (schMdl.getUserSid() != null) {
                                usrSid = String.valueOf(schMdl.getUserSid());
                            } else {
                                usrSid = String.valueOf(dayModel.getUsrSid());
                            }
                        }
                        //スケジュールAタグ
                        if (StringUtil.isNullZeroStringSpace(schMdl.getSchAppendUrl())) {
                            //スケジュールのデータ
                            if (schMdl.getValueStr() != null
                                    && schMdl.getValueStr().trim().length() > 0) {
                                //内容あり
                                writer.println("<a href=\"#\""
                                                            + " onClick=\"editSchedule('edit',"
                                                            + " " + dayModel.getSchDate() + ","
                                                            + " " + schMdl.getSchSid() + ","
                                                            + " " + usrSid + ","
                                                            + " " + usrKbn + ");\""
                                                            + ">"
                                                            + "<span class=\"tooltips\">"
                                                            + gsMsg.getMessage(req, "cmn.content")
                                                            + "：" + content
                                                            + "</span>");
                            } else {
                                //内容なし
                                writer.println("<a href=\"#\""
                                        + " onClick=\"editSchedule('edit',"
                                                            + " " + dayModel.getSchDate() + ","
                                                            + " " + schMdl.getSchSid() + ","
                                                            + " " + usrSid + ","
                                                            + " " + usrKbn + ");\""
                                                            + ">"
                                                            + "<span class=\"tooltips\">"
                                                            + title
                                                            + "</span>"
                                        );
                            }
                        } else {
                            //スケジュール以外のデータ
                            if (schMdl.getValueStr() != null
                                    && schMdl.getValueStr().trim().length() > 0) {
                                //内容あり
                                writer.println("<a href=\"" + schMdl.getSchAppendUrl() + "\">"
                                                            + "<span class=\"tooltips\">"
                                                            + gsMsg.getMessage(req, "cmn.content")
                                                            + "：" + content
                                                            + "</span>");
                            } else {
                                //内容なし
                                writer.println("<a href=\"" + schMdl.getSchAppendUrl()
                                                            + "\">"
                                                            + "<span class=\"tooltips\">"
                                                            + title
                                                            + "</span>");
                            }
                        }

                        switch (schMdl.getBgColor()) {
                        case 1:
                            writer.println("<span class=\"sc_link_1\">");
                            break;
                        case 2:
                            writer.println("<span class=\"sc_link_2\">");
                            break;
                        case 3:
                            writer.println("<span class=\"sc_link_3\">");
                            break;
                        case 4:
                            writer.println("<span class=\"sc_link_4\">");
                            break;
                        case 5:
                            writer.println("<span class=\"sc_link_5\">");
                            break;
                        case 6:
                            writer.println("<span class=\"sc_link_6\">");
                            break;
                        case 7:
                            writer.println("<span class=\"sc_link_7\">");
                            break;
                        case 8:
                            writer.println("<span class=\"sc_link_8\">");
                            break;
                        case 9:
                            writer.println("<span class=\"sc_link_9\">");
                            break;
                        case 10:
                            writer.println("<span class=\"sc_link_10\">");
                            break;
                        default:
                            writer.println("<span class=\"sc_link\">");
                            break;
                        }
                        if (schMdl.getUserKbn() != null) {
                            if (schMdl.getUserKbn()
                                    .equals(String.valueOf(GSConstSchedule.USER_KBN_GROUP))) {
                                writer.println("<span class=\"sc_link_g\">G</span>");
                            } else if (schMdl.getUserKbn()
                                    .equals(String.valueOf(GSConstCommon.PLUGIN_ID_PROJECT))) {
                                writer.println("<span class=\"sc_link_g\">TODO</span>");
                            } else if (schMdl.getUserKbn()
                                    .equals(String.valueOf(GSConstCommon.PLUGIN_ID_NIPPOU))) {
                                writer.println("<span class=\"sc_link_g\">アクション</span>");
                            }
                        }
                        if (!StringUtil.isNullZeroStringSpace(schMdl.getTime())) {
                            writer.println("<font size=\"-2\">" + schMdl.getTime() + "</font><br>");
                        }
                        writer.println("" + title + "");
                        writer.println("</span>");
                        writer.println("</a>");

                    } else {
                        //非公開パターン
                        if (schMdl.getUserKbn() != null) {
                            if (schMdl.getUserKbn()
                                    .equals(String.valueOf(GSConstSchedule.USER_KBN_GROUP))) {
                                writer.println("<span class=\"sc_link_g\">G</span>");
                            }
                        }
                        writer.println("<span class=\"sc_nolink\">");
                        if (!StringUtil.isNullZeroStringSpace(schMdl.getTime())) {
                            writer.println("<font size=\"-2\">" + schMdl.getTime() + "</font><br>");
                        }
                        writer.println("" + title + "");
                        writer.println("</span>");
                    }

                    writer.println("</td>");
                } else {
                    writer.println("<td colspan=\"" + cols + "\" align=\"center\""
                    + " valign=\"middle\" class=\"td_type1\">");
                    writer.println("&nbsp;");
                    writer.println("</td>");
                }

            }

            if (i > 0) {
                writer.println("</tr>");
            }

        }
    }

    /**
     * <br>背景色区分から対応するCSSクラスの文字列を取得します
     * @param bgColor 背景色区分
     * @return String CSSクラスの文字列
     */
    private static String __getStyleBgColor(int bgColor) {
        StringBuilder buf = new StringBuilder();
        buf.append("td_type_nikkan_");
        buf.append(bgColor);

        return buf.toString();
    }

    /**
     * Release all allocated resources.
     */
    public void release() {

        super.release();
        ignore = false;
        name = null;
        property = null;
        scope = null;
        bundle = null;

    }

    /**
     * <br>スケジュール情報を画面表示用に格納します
     * @param schList スケジュールリスト
     * @param dspDate 表示日付
     * @param frHour 表示開始時間
     * @param toHour 表示終了時間
     * @return ArrayList < Sch040DailyLineModel >
     */
    private ArrayList<Sch040DailyLineModel> __getDspScheduleList(
            ArrayList<SimpleScheduleModel> schList,
            String dspDate,
            int frHour,
            int toHour
            ) {

        //ユーザ別スケジュール一式(lineを格納)
        ArrayList<Sch040DailyLineModel> dailyList = new ArrayList<Sch040DailyLineModel>();

        //1行分のスケジュール
        Sch040DailyLineModel lineMdl = new Sch040DailyLineModel();
        ArrayList<Sch040DailyValueModel> lineList = new ArrayList<Sch040DailyValueModel>();

        //1スケジュール
        Sch040DailyValueModel valueMdl = null;

        //スケジュール情報無し
        if (schList.size() == 0) {
            valueMdl = new Sch040DailyValueModel();
            valueMdl.setScheduleMdl(null);
            valueMdl.setCols(__getColsTotal(frHour, toHour));
            lineList.add(valueMdl);
            lineMdl.setLineList(lineList);
            dailyList.add(lineMdl);
            return dailyList;
        }

        //出力済情報の格納用
        HashMap<Integer, SimpleScheduleModel> map
        = new HashMap<Integer, SimpleScheduleModel>();

        while (schList.size() != map.size()) {
            //１行分を作成する
            lineMdl = __getDailyLineMdl(schList, map, dspDate, frHour, toHour);
            dailyList.add(lineMdl);
        }

        return dailyList;
    }

    /**
     * 開始時間～終了時間のColsを取得します
     * <br>[機  能]
     * <br>[解  説]
     * <br>[備  考]
     * @param frHour 開始時間(HH)
     * @param toHour 終了時間(HH)
     * @return int cols
     */
    private int __getColsTotal(int frHour, int toHour) {
        int ret = 0;
        int hour = toHour - frHour + 1;
        ret = hour * Integer.parseInt(memCnt);
        return ret;
    }
    /**
     * <br>１行分のスケジュールモデルを生成する
     * <br>[備考]出力済みのスケジュール情報はHashMapに格納します
     * @param schList スケジュール情報
     * @param map 出力済みのスケジュール情報
     * @param dspDate 表示日付
     * @param frHour 出力開始時刻
     * @param toHour 出力終了時刻
     * @return Sch040DailyLineModel
     */
    private Sch040DailyLineModel __getDailyLineMdl(
            ArrayList<SimpleScheduleModel> schList,
            HashMap<Integer, SimpleScheduleModel> map,
            String dspDate,
            int frHour,
            int toHour) {

        log__.debug("-- __getDailyLineMdl START --");
        Sch040DailyLineModel lineMdl = new Sch040DailyLineModel();
        ArrayList<Sch040DailyValueModel> lineList = new ArrayList<Sch040DailyValueModel>();
        Sch040DailyValueModel valueMdl = null;

        SimpleScheduleModel schMdl = null;
        int endIndex = 1;

        for (int i = 0; i < schList.size(); i++) {

            schMdl = schList.get(i);
            if (map.containsKey(i)) {
                //出力済みは除外
                continue;
            }

            //格納可能か判定し可能であれば格納する
            if (__isStorage(schMdl, dspDate, frHour, endIndex)) {

                //空白部分を設定
                valueMdl = __getBlankSchedule(schMdl, dspDate, frHour, endIndex);
                if (valueMdl != null) {

                    lineList.add(valueMdl);
                    endIndex = endIndex + valueMdl.getCols();

                }
                //スケジュール部分を設定
                int cols = __getCols(schMdl, dspDate, frHour, toHour, endIndex);
                valueMdl = new Sch040DailyValueModel();
                valueMdl.setCols(cols);
                valueMdl.setScheduleMdl(schMdl);
                lineList.add(valueMdl);
                endIndex = endIndex + cols;
                map.put(i, schMdl);
            }

            //格納先インデックスがMAXの場合breakする
            if (endIndex == __getColsTotal(frHour, toHour)) {
                break;
            }
        }

        //表示終了時刻までの空白を設定
        valueMdl = __getEndBlankSchedule(schMdl, dspDate, frHour, toHour, endIndex);
        if (valueMdl != null) {
            lineList.add(valueMdl);
            endIndex = endIndex + valueMdl.getCols();
        }


        lineMdl.setLineList(lineList);
        log__.debug("-- __getDailyLineMdl END --");
        return lineMdl;
    }

    /**
     * <br>スケジュール情報が格納可能か判定する
     * @param schMdl スケジュール情報
     * @param dspDate 表示日付
     * @param frHour 画面表示開始時刻
     * @param endIndex 出力済みポインタ
     * @return true:格納可能 false:格納不可
     */
    private boolean __isStorage(
            SimpleScheduleModel schMdl,
            String dspDate,
            int frHour,
            int endIndex) {
        int index = 0;

        //表示開始インデックスを取得
        index = __getIndex(schMdl, dspDate, frHour);
        if (index >= endIndex) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * <br>表示開始時刻とスケジュール情報からスケジュール開始時刻のインデックスを取得する
     * @param schMdl スケジュール情報
     * @param strDate 表示日付
     * @param dspHour 表示開始時刻
     * @return int 開始時刻のインデックス
     */
    private int __getIndex(SimpleScheduleModel schMdl, String strDate, int dspHour) {
        int index = 1;
        UDate dspDate = new UDate();
        dspDate.setDate(strDate);
        dspDate.setHour(dspHour);
        dspDate.setMinute(GSConstSchedule.DAY_START_MINUTES);
        dspDate.setSecond(GSConstSchedule.DAY_START_SECOND);

        UDate frDate = schMdl.getFromDate();
        if (dspDate.compareDateYMDHM(frDate) != UDate.LARGE) {
            index = 1;
        } else {
            int hour = frDate.getIntHour();
            int min = frDate.getIntMinute();
            int ans1 = index + ((hour - dspHour) * Integer.parseInt(memCnt));
            int hourMemCount = 60 / Integer.parseInt(memCnt);
            int ans2 = min / hourMemCount;
            index = ans1 + ans2;
        }

        return index;
    }

    /**
     * <br>表示開始時刻とスケジュール情報からスケジュール終了時刻のインデックスを取得する
     * @param schMdl スケジュール情報
     * @param strDate 表示日付
     * @param dspHour 表示開始時刻
     * @param toHour 表示終了時刻
     * @return int 開始時刻のインデックス
     */
    private int __getEndIndex(SimpleScheduleModel schMdl, String strDate, int dspHour, int toHour) {
        int index = 1;
        UDate dspDate = new UDate();
        dspDate.setDate(strDate);
        dspDate.setHour(toHour);
        dspDate.setMinute(GSConstSchedule.DAY_END_MINUTES);
        dspDate.setSecond(GSConstSchedule.DAY_END_SECOND);

        UDate toDate = schMdl.getToDate();

        if (dspDate.compareDateYMDHM(toDate) == UDate.LARGE
                || schMdl.getTimeKbn() == GSConstSchedule.TIME_NOT_EXIST) {
            index = __getColsTotal(dspHour, toHour);
        } else {
            int hour = toDate.getIntHour();
            int min = toDate.getIntMinute();
            int ans1 = (hour - dspHour) * Integer.parseInt(memCnt);
            int hourMemCount = 60 / Integer.parseInt(memCnt);
            int ans2 = min / hourMemCount;
            index = ans1 + ans2;
        }

        return index;
    }

    /**
     * <br>スケジュール情報と出力済みポインタから空スケジュールを必要に応じて生成する
     * @param schMdl スケジュール情報
     * @param dspDate 表示日付
     * @param frHour 表示開始時刻
     * @param endIndex 出力済みポインタ
     * @return Sch040DailyValueModel
     */
    private Sch040DailyValueModel __getBlankSchedule(
            SimpleScheduleModel schMdl,
            String dspDate,
            int frHour,
            int endIndex) {
        Sch040DailyValueModel valueMdl = null;
        int index = __getIndex(schMdl, dspDate, frHour);
        int cols = index - endIndex;
        if (cols > 0) {
            //空スケジュールを生成する
            valueMdl = new Sch040DailyValueModel();
            valueMdl.setCols(cols);
            valueMdl.setScheduleMdl(null);

        }

        return valueMdl;
    }

    /**
     * <br>表示終了時刻と出力済みポインタから空スケジュールを必要に応じて生成する
     * @param schMdl スケジュール情報
     * @param dspDate 表示日付
     * @param frHour 表示開始時刻
     * @param toHour 表示終了時刻
     * @param endIndex 出力済みポインタ
     * @return Sch040DailyValueModel
     */
    private Sch040DailyValueModel __getEndBlankSchedule(
            SimpleScheduleModel schMdl,
            String dspDate,
            int frHour,
            int toHour,
            int endIndex) {

        Sch040DailyValueModel valueMdl = null;
        int index = __getColsTotal(frHour, toHour) + 1;
        int cols = index - endIndex;
        if (cols > 0) {
            //空スケジュールを生成する
            valueMdl = new Sch040DailyValueModel();
            valueMdl.setCols(cols);
            valueMdl.setScheduleMdl(null);

        }

        return valueMdl;
    }

    /**
     * <br>スケジュールの開始・終了からCOLSを取得する
     * @param schMdl スケジュール情報
     * @param dspDate 表示日付
     * @param frHour 表示開始時刻
     * @param toHour 表示終了時刻
     * @param endIndex 出力済みポインタ
     * @return スケジュールの横幅(cols)
     */
    private int __getCols(
            SimpleScheduleModel schMdl,
            String dspDate,
            int frHour,
            int toHour,
            int endIndex) {
        int cols = 0;
        int frIndex = __getIndex(schMdl, dspDate, frHour);
        int toIndex = __getEndIndex(schMdl, dspDate, frHour, toHour);
        cols = toIndex - frIndex + 1;

        return cols;
    }
}
