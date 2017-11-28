<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ taglib uri="/WEB-INF/ctag-jsmsg.tld" prefix="gsjsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<%@ page import="jp.groupsession.v2.ntp.ntp010.Ntp010Form"%>
<%@ page import="jp.groupsession.v2.ntp.ntp010.Ntp010WeekOfModel"%>
<% String chkClass = "ntp_chk"; %>
<% long ntpTipCnt = 0; %>

<logic:iterate id="gpWeekMdl" name="ntp010Form" property="ntp010BottomList" scope="request" indexId="cnt">
  <bean:define id="ret" value="<%= String.valueOf(cnt.intValue() % 5) %>" />
  <logic:notEqual name="cnt" value="0" scope="page">
  <logic:equal name="ret" value="0">

  <%-- 5行毎にタイトル(氏名,日付) --%>
  <tr>
  <th width="16%" class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.name" /></span></th>
  <logic:notEmpty name="ntp010Form" property="ntp010CalendarList" scope="request">
  <logic:iterate id="calBean" name="ntp010Form" property="ntp010CalendarList" scope="request">

  <bean:define id="tdColor" value="" />
  <bean:define id="fontColorSun" value="" />
  <bean:define id="fontColorSat" value="" />
  <bean:define id="fontColorDef" value="" />
  <% String[] tdColors = new String[] {"td_calnot_today", "td_cal_today"}; %>
  <% String[] fontColorsSun = new String[] {"sc_ttl_sun", "sc_ttl_sun"}; %>
  <% String[] fontColorsSat = new String[] {"sc_ttl_sat", "sc_ttl_sat"}; %>
  <% String[] fontColorsDef = new String[] {"sc_ttl_def", "sc_ttl_def_today"}; %>

  <logic:equal name="calBean" property="todayKbn" value="1">
  <% tdColor = tdColors[1]; %>
  <% fontColorSun = fontColorsSun[1]; %>
  <% fontColorSat = fontColorsSat[1]; %>
  <% fontColorDef = fontColorsDef[1]; %>
  </logic:equal>
  <logic:notEqual name="calBean" property="todayKbn" value="1">
  <% tdColor = tdColors[0]; %>
  <% fontColorSun = fontColorsSun[0]; %>
  <% fontColorSat = fontColorsSat[0]; %>
  <% fontColorDef = fontColorsDef[0]; %>
  </logic:notEqual>

  <logic:equal name="calBean" property="holidayKbn" value="1">
  <th width="12%" nowrap class="<%= tdColor %>">
  <span class="<%= fontColorSun %>"><bean:write name="calBean" property="dspDayString" /></span></th>
  </logic:equal>

  <logic:notEqual name="calBean" property="holidayKbn" value="1">
  <logic:equal name="calBean" property="weekKbn" value="1">
  <th width="12%" nowrap class="<%= tdColor %>">
  <span class="<%= fontColorSun %>"><bean:write name="calBean" property="dspDayString" /></span></th>
  </logic:equal>

  <logic:equal name="calBean" property="weekKbn" value="7">
  <th width="12%" nowrap class="<%= tdColor %>">
  <span class="<%= fontColorSat %>"><bean:write name="calBean" property="dspDayString" /></span></th>
  </logic:equal>

  <logic:notEqual name="calBean" property="weekKbn" value="1">
  <logic:notEqual name="calBean" property="weekKbn" value="7">
  <th width="12%" nowrap class="<%= tdColor %>">
  <span class="<%= fontColorDef %>"><bean:write name="calBean" property="dspDayString" /></span></th>
  </logic:notEqual>
  </logic:notEqual>
  </logic:notEqual>
  </logic:iterate>
  </logic:notEmpty>
  </tr>
  </logic:equal>
  </logic:notEqual>

  <tr align="left" valign="top">
  <%-- ユーザ欄 --%>
  <bean:define id="usrMdl" name="gpWeekMdl" property="ntp010UsrMdl"/>

  <%-- ユーザ氏名 --%>
  <logic:equal name="ntp010Form" property="zaisekiUseOk" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.PLUGIN_USE) %>">
  <logic:equal name="usrMdl" property="zaisekiKbn" value="1">
  <td class="td_type1 break">
  </logic:equal>
  <logic:equal name="usrMdl" property="zaisekiKbn" value="2">
  <td class="td_type_gaisyutu break">
  </logic:equal>
  <logic:equal name="usrMdl" property="zaisekiKbn" value="0">
  <td class="td_type_kekkin break">
  </logic:equal>
  </logic:equal>
  <logic:notEqual name="ntp010Form" property="zaisekiUseOk" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.PLUGIN_USE) %>">
  <td class="td_type1">
  </logic:notEqual>
  <bean:define id="mukouserClass" value=""/>
  <logic:equal name="usrMdl" property="usrUkoFlg" value="1"><bean:define id="mukouserClass" value="mukouser"/></logic:equal>
  <span class="<%= mukouserClass %>">
  <a href="javaScript:void(0);" id="USR_AREA_<bean:write name="usrMdl" property="usrSid" />" onClick="openUserInfoWindow(<bean:write name="usrMdl" property="usrSid" />);"><bean:write name="usrMdl" property="usrName" /></a>
  </span>
  <span class="sc_link_5"><bean:write name="usrMdl" property="zaisekiMsg" /></span><br>

  <span>
    <a href="#" onClick="moveMonthNippou('month', <bean:write name="usrMdl" property="usrSid" />, <bean:write name="usrMdl" property="usrKbn" />);"><img src="../common/images/btn_gekkan_bg.gif" width="35" height="18" alt="" border="0">
    <span class="sc_link_6"><gsmsg:write key="cmn.monthly" /></span>
    </a><br>
    <a href="#" onClick="moveListNippou('list', <bean:write name="usrMdl" property="usrSid" />, <bean:write name="usrMdl" property="usrKbn" />);"><img src="../common/images/btn_ichiran_bg.gif" width="35" height="18" alt="" border="0">
    <span class="sc_link_6"><gsmsg:write key="cmn.list" /></span>
    </a><br>
    <logic:equal name="ntp010Form" property="smailUseOk" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.PLUGIN_USE) %>">
    <logic:equal name="usrMdl" property="smlAble" value="1">
    <a href="#" class="sml_send_link" id="<bean:write name="usrMdl" property="usrSid" />"><img src="../common/images/btn_smail_bg.gif" width="35" height="18" alt="" border="0">
    <span class="sc_link_6"><gsmsg:write key="cmn.shortmail" /></span>
    </a>
    <br>
    </logic:equal>
    </logic:equal>
    <%-- 在席 --%>
    <logic:equal name="ntp010Form" property="zaisekiUseOk" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.PLUGIN_USE) %>">
    <logic:equal name="usrMdl" property="zaisekiKbn" value="1">
    <input type="button" onClick="setFuzai(<bean:write name="usrMdl" property="usrSid" />);" style="border:0px;color:#417984;font-size:10px;font-weight:bold;width:55px;height:17px;" class="btn_fuzai" value="<gsmsg:write key="cmn.absence" />">
    <input type="button" onClick="setSonota(<bean:write name="usrMdl" property="usrSid" />);" style="border:0px;color:#47a370;font-size:10px;font-weight:bold;width:55px;height:17px;" class="btn_sonota" value="<gsmsg:write key="cmn.other" />">
    </logic:equal>
    <logic:notEqual name="usrMdl" property="zaisekiKbn" value="1">
    <%-- 不在、その他 --%>
    <input type="button" onClick="setZaiseki(<bean:write name="usrMdl" property="usrSid" />);" style="border:0px;color:#47a370;font-size:10px;font-weight:bold;width:55px;height:17px;" class="btn_zaiseki" value="<gsmsg:write key="cmn.zaiseki" />">
    <img src="../common/images/damy.gif" width="35" height="18" alt="<gsmsg:write key="cmn.space" />" >
    </logic:notEqual>
    </logic:equal>
    <logic:notEqual name="ntp010Form" property="zaisekiUseOk" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.PLUGIN_USE) %>">
    <img src="../common/images/damy.gif" width="35" height="18" alt="<gsmsg:write key="cmn.space" />" >
    <img src="../common/images/damy.gif" width="35" height="18" alt="<gsmsg:write key="cmn.space" />" >
    </logic:notEqual>

  </span>
</td>

<%-- 日報情報 --%>
<logic:notEmpty name="gpWeekMdl" property="ntp010NtpList">
<logic:iterate id="gpDayMdl" name="gpWeekMdl" property="ntp010NtpList">

<logic:equal name="gpDayMdl" property="weekKbn" value="1">
  <td align="left" valign="top" class="td_type9">
</logic:equal>
<logic:equal name="gpDayMdl" property="weekKbn" value="7">
  <td align="left" valign="top" class="td_type8">
</logic:equal>

<logic:notEqual name="gpDayMdl" property="weekKbn" value="1">
<logic:notEqual name="gpDayMdl" property="weekKbn" value="7">
  <td align="left" valign="top" class="td_type1">
</logic:notEqual>
</logic:notEqual>

  <logic:equal name="ntp010Form" property="adminKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.USER_ADMIN) %>">
  <a href="#" onClick="return addNippou('add', <bean:write name="gpDayMdl" property="ntpDate" />, <bean:write name="gpDayMdl" property="usrSid" />, <bean:write name="gpDayMdl" property="usrKbn" />);"><img src="../nippou/images/add_nippou.gif" alt="<gsmsg:write key="cmn.add" />" width="16" height="16" border="0"></a>
  </logic:equal><br>

  <logic:notEmpty name="gpDayMdl" property="ntpDataList">

  <logic:iterate id="gpNtpMdl" name="gpDayMdl" property="ntpDataList">

    <bean:define id="chkKbn" name="gpNtpMdl" property="ntp_chkKbn" type="java.lang.Integer" />

    <% chkClass = "ntp_chk"; %>
    <% if (chkKbn == 1) { %>
    <%    chkClass = ""; %>
    <% } %>

    <div onClick="editNippou('edit', <bean:write name="gpDayMdl" property="ntpDate" />, <bean:write name="gpNtpMdl" property="ntpSid" />, <bean:write name="usrMdl" property="usrSid" />, 0);" class="<%= chkClass %>" style="padding-top:5px;">

    <bean:define id="u_usrsid" name="gpDayMdl" property="usrSid" type="java.lang.Integer" />
    <bean:define id="u_nipsid" name="gpNtpMdl" property="ntpSid" type="java.lang.Integer" />
    <bean:define id="u_date" name="gpDayMdl" property="ntpDate"  type="java.lang.String" />

    <%
      String tipskey1 = ((Integer)pageContext.getAttribute("u_usrsid",PageContext.PAGE_SCOPE)).toString();
      String tipskey2 = ((Integer)pageContext.getAttribute("u_nipsid",PageContext.PAGE_SCOPE)).toString();
      String tipskey3 = ((String)pageContext.getAttribute("u_date",PageContext.PAGE_SCOPE));
      String tipskey = tipskey1 + '_' + tipskey2 + '_' + tipskey3;
    %>

    <%-- コメントアイコン表示  --%>
    <logic:notEqual name="gpNtpMdl" property="ntp_cmtCnt" value="0">
        <logic:equal name="gpNtpMdl" property="ntp_cmtkbn" value="0">
          <span id="lt" style="height:16px;width:19px" class="comment_bg"><a href="#" class="comment_icon_str2"><bean:write name="gpNtpMdl" property="ntp_cmtCnt" /></a></span>
        </logic:equal>
        <logic:equal name="gpNtpMdl" property="ntp_cmtkbn" value="1">
          <span id="lt" style="height:16px;width:19px" class="comment_bg"><a href="#" class="comment_icon_str"><bean:write name="gpNtpMdl" property="ntp_cmtCnt" /></a></span>
        </logic:equal>
        <logic:equal name="gpNtpMdl" property="ntp_cmtkbn" value="2">
          <span id="lt" style="height:16px;width:19px" class="comment_bg"><a href="#" class="comment_icon_str"><bean:write name="gpNtpMdl" property="ntp_cmtCnt" /></a></span>
        </logic:equal>

        <logic:equal name="gpNtpMdl" property="ntp_goodCnt" value="0">
          <br style="clear:both;line-height:1px;">
        </logic:equal>
    </logic:notEqual>

    <%-- いいねアイコン表示  --%>
    <logic:notEqual name="gpNtpMdl" property="ntp_goodCnt" value="0">
        <logic:equal name="gpNtpMdl" property="ntp_goodkbn" value="0">
          <span id="lt" style="height:16px;width:19px" class="good_bg"><a href="#" class="good_icon_str2"><bean:write name="gpNtpMdl" property="ntp_goodCnt" /></a></span>
        </logic:equal>
        <logic:equal name="gpNtpMdl" property="ntp_goodkbn" value="1">
          <span id="lt" style="height:16px;width:19px" class="good_bg"><a href="#" class="good_icon_str"><bean:write name="gpNtpMdl" property="ntp_goodCnt" /></a></span>
        </logic:equal>
        <logic:equal name="gpNtpMdl" property="ntp_goodkbn" value="2">
          <span id="lt" style="height:16px;width:19px" class="good_bg"><a href="#" class="good_icon_str"><bean:write name="gpNtpMdl" property="ntp_goodCnt" /></a></span>
        </logic:equal>
        <br style="clear:both;line-height:1px;">
    </logic:notEqual>

    <logic:empty name="gpNtpMdl" property="detail">
    <a href="#" id="tooltips_ntp<%= String.valueOf(ntpTipCnt++) %>"><span class="tooltips"><bean:write name="gpNtpMdl" property="title" /></span>
    </logic:empty>
    <logic:notEmpty name="gpNtpMdl" property="detail">
    <bean:define id="ntpdetail2" name="gpNtpMdl" property="detail" />
    <%
      String tmpText3 = (String)pageContext.getAttribute("ntpdetail2",PageContext.PAGE_SCOPE);
      String tmpText4 = jp.co.sjts.util.StringUtilHtml.transToHTml(tmpText3);
    %>
    <a href="#" id="tooltips_ntp<%= String.valueOf(ntpTipCnt++) %>"><span class="tooltips"><gsmsg:write key="cmn.content" />:<%= tmpText4 %></span>
    </logic:notEmpty>

    <%--タイトルカラー設定--%>
    <logic:equal name="gpNtpMdl" property="titleColor" value="0">
    <span class="sc_link_1">
    </logic:equal>
    <logic:equal name="gpNtpMdl" property="titleColor" value="1">
    <span class="sc_link_1">
    </logic:equal>
    <logic:equal name="gpNtpMdl" property="titleColor" value="2">
    <span class="sc_link_2">
    </logic:equal>
    <logic:equal name="gpNtpMdl" property="titleColor" value="3">
    <span class="sc_link_3">
    </logic:equal>
    <logic:equal name="gpNtpMdl" property="titleColor" value="4">
    <span class="sc_link_4">
    </logic:equal>
    <logic:equal name="gpNtpMdl" property="titleColor" value="5">
    <span class="sc_link_5">
    </logic:equal>

      <logic:notEmpty name="gpNtpMdl" property="time">
      <font size="-2" class="time_line_height"><bean:write name="gpNtpMdl" property="time" /><br></font>
      </logic:notEmpty>
      <bean:write name="gpNtpMdl" property="title" />
    </span>
    </a>
    </div>
  </logic:iterate>
  </logic:notEmpty>
</td>
</logic:iterate>
</logic:notEmpty>
</tr>
</logic:iterate>