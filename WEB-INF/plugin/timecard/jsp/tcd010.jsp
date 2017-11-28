<%@page import="jp.groupsession.v2.usr.model.UsrLabelValueBean"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ taglib uri="/WEB-INF/ctag-jsmsg.tld" prefix="gsjsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<gsjsmsg:js filename="gsjsmsg.js"/>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../timecard/js/tcd010.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/check.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/calendar2.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/grouppopup.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../timecard/css/timecard.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<title>[Group Session] <gsmsg:write key="tcd.tcd010.17" /></title>
</head>

<body class="body_03">

<html:form action="/timecard/tcd010">
<html:hidden property="year" />
<html:hidden property="month" />
<html:hidden property="tcdDspFrom" />

<html:hidden property="editDay" />
<html:hidden property="dakokuStrSetFlg" />
<html:hidden property="dakokuEndSetFlg" />
<input type="hidden" name="CMD" value="init">

<logic:equal name="tcd010Form" property="usrKbn" value="0">
<html:hidden property="sltGroupSid" />
<html:hidden property="usrSid" />
</logic:equal>

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>

<table cellpadding="5" cellspacing="0" border="0">
<tr>
<td width="" align="center" colspan="2">

  <table cellpadding="0" cellspacing="0" border="0" width="">
  <tr>
  <td width=""><img src="../timecard/images/header_timecard_01.gif" border="0" alt="<gsmsg:write key="tcd.50" />"></td>
  <td width="" class="header_white_bg_text" align="right" valign="middle" nowrap><span class="plugin_ttl"><gsmsg:write key="tcd.50" /></span></td>
  <td width="" class="header_white_bg_text" nowrap>[ <gsmsg:write key="tcd.tcd010.18" /> ]</td>
  <td width="" class="header_white_bg">
  <logic:notEqual name="tcd010Form" property="usrKbn" value="0">
    <input type="button" name="btn_admin_tool" class="btn_setting_admin_n1" value="<gsmsg:write key="cmn.admin.setting" />" onClick="buttonPush('admtool');">
  </logic:notEqual>
    <input type="button" name="btn_pri_tool" class="btn_setting_n1" value="<gsmsg:write key="cmn.preferences2" />" onClick="buttonPush('pritool');">
  </td>
  <td width=""><img src="../common/images/header_white_end.gif" border="0" alt="<gsmsg:write key="tcd.50" />"></td>
  </tr>
  </table>

</td>
</tr>

<tr>
<td width="" align="left">

  <html:messages id="msg" message="false" >
  <span class="text_error">
  <bean:write name="msg" ignore="true" />
  </span>
  </html:messages>

  <table width="" class="tl0" border="0">

  <logic:notEqual name="tcd010Form" property="usrKbn" value="0">
  <tr>
  <td colspan="2" width="" align="left" nowrap>
    <span class="text_tlw_black"><gsmsg:write key="cmn.show.group" /></span>
    <html:select property="sltGroupSid" styleClass="select01" onchange="changeGroupCombo();">
      <html:optionsCollection name="tcd010Form" property="tcd010GpLabelList" value="value" label="label" />
    </html:select>
    <input type="button" onclick="openGroupWindow(this.form.sltGroupSid, 'sltGroupSid', '0')" class="group_btn" value="&nbsp;&nbsp;" id="tcd010GroupBtn">
    <html:select property="usrSid" styleClass="select01" onchange="changeUserCombo();">
    <logic:iterate id="user" name="tcd010Form" property="tcd010UsrLabelList" type="UsrLabelValueBean">
      <html:option value="<%=user.getValue() %>" styleClass="<%=user.getCSSClassNameOption() %>"><bean:write name="user" property="label"/></html:option>
    </logic:iterate>
    </html:select>
  </td>
  </tr>
  </logic:notEqual>

  <logic:notEmpty name="tcd010Form" property="tcd010UsrLabelList">
  <tr>
  <td align="left" nowrap>
    <logic:equal name="tcd010Form" property="tcd010LockFlg" value="0">
    <logic:equal name="tcd010Form" property="tcd010FailFlg" value="0">
    <input type="button" value="<gsmsg:write key="cmn.store" />" class="btn_dell_n1" onClick="buttonPush('store');">
    <input type="button" class="btn_edits" onClick="multiEditButton();" value="<gsmsg:write key="cmn.multiple.edit" />">
    <input type="button" value="<gsmsg:write key="cmn.delete" />" class="btn_dell_n1" onClick="buttonPush('del');">
    </logic:equal>
    </logic:equal>
    <logic:equal name="tcd010Form" property="tcd010FailFlg" value="0">

    <logic:equal name="tcd010Form" property="kinmuOut" value="0">
    <input type="button" value="<gsmsg:write key="tcd.tcd010.12" />" class="btn_excel_n2" onClick="buttonPush('xls');">
    </logic:equal>
    <logic:equal name="tcd010Form" property="kinmuOut" value="1">
    <input type="button" value="<gsmsg:write key="tcd.tcd010.12" />" class="btn_pdf_n2" onClick="buttonPush('pdf');">
    </logic:equal>

    <input type="button" value="<gsmsg:write key="cmn.export" />" class="btn_csv_n2" onClick="buttonPush('csv');">
    </logic:equal>
  </td>


  <td align="right" nowrap>

    <input type="button" class="btn_arrow_l" value="&nbsp;" onclick="buttonPush('move_last');">
    <input type="button" class="btn_today" value="<gsmsg:write key="cmn.thismonth3" />" onClick="buttonPush('move_now');">
    <input type="button" class="btn_arrow_r" value="&nbsp;" onclick="buttonPush('move_next');">


  </td>
  <td valign="top">
  <input type="button" value="Cal" onclick="wrtCalendarByBtn(this.form.tcdDspFrom, 'sch200Btn')" class="calendar_btn2", id="sch200Btn">
  </td>
  </tr>
  </logic:notEmpty>
  </table>

</td>
</tr>

<logic:notEmpty name="tcd010Form" property="tcd010UsrLabelList">
<tr>

<!--一覧表-->
<td class="t_top">

  <table cellpadding="5" cellspacing="0" width="" class="tl0 table_td_border">
  <tr>
  <td colspan="18" class="table_bg_7D91BD" align="left">
  <bean:define id="yr2" name="tcd010Form" property="year" type="java.lang.String" />
  <span class="text_tl1"><gsmsg:write key="cmn.year" arg0="<%= yr2 %>" /><bean:write name="tcd010Form" property="month" /><gsmsg:write key="cmn.month" /></span>
  </td>
  </tr>

  <% String[] tdCols = new String[] {"1", "2"}; %>
  <% String tddayCols = ""; %>
  <% String tdbikoCols = ""; %>

  <% tdbikoCols = tdCols[0]; %>

  <logic:equal name="tcd010Form" property="tcd010FailFlg" value="0">
  <% tddayCols = tdCols[0]; %>
  </logic:equal>
  <logic:equal name="tcd010Form" property="tcd010FailFlg" value="1">
  <% tddayCols = tdCols[1]; %>
  </logic:equal>


  <bean:define id="dayCols" value="<%= tddayCols %>" />
  <bean:define id="bikoCols" value="<%= tdbikoCols %>" />

  <tr>
  <logic:equal name="dayCols" value="1" scope="page">
  <th width="" class="td_type3" colspan="1" nowrap><input type="checkbox" name="allChk" onClick="changeChk();"></th>
  <th width="" class="td_type3" colspan="1" nowrap><gsmsg:write key="cmn.date2" /></th>
  </logic:equal>
  <logic:equal name="dayCols" value="2" scope="page">
  <th width="" class="td_type3" colspan="2" nowrap><gsmsg:write key="cmn.date2" /></th>
  </logic:equal>

  <th width="" class="td_type3" ><gsmsg:write key="tcd.28" /></th>
  <th width="" class="td_type3" ><gsmsg:write key="tcd.24" /></th>
  <th width="" class="td_type3" ><gsmsg:write key="tcd.185" /></th>
  <th width="" class="td_type3" ><gsmsg:write key="tcd.186" /></th>
  <th width="" class="td_type3" ><gsmsg:write key="tcd.187" /></th>
  <th width="" class="td_type3" ><gsmsg:write key="tcd.188" /></th>
  <th width="" class="td_type3" ><gsmsg:write key="tcd.189" /></th>
  <th width="" class="td_type3" ><gsmsg:write key="tcd.190" /></th>
  <th width="" class="td_type3" ><gsmsg:write key="tcd.191" /></th>
  <th width="" class="td_type3" ><gsmsg:write key="tcd.192" /></th>
  <th width="" class="td_type3" ><gsmsg:write key="tcd.193" /></th>
  <th width="" class="td_type3" ><gsmsg:write key="tcd.194" /></th>
  <th width="" class="td_type3" ><gsmsg:write key="tcd.195" /></th>
  <th width="" class="td_type3" ><gsmsg:write key="tcd.196" /></th>
  <th width="1000px" class="td_type3" ><gsmsg:write key="cmn.memo" /></th>
  <th width="" class="td_type3" ></th>
  </tr>

  <logic:notEmpty name="tcd010Form" property="tcd010List" scope="request">
  <logic:iterate id="tdMdl" name="tcd010Form" property="tcd010List" scope="request" indexId="cnt">

  <bean:define id="tdColor" value="" />
  <bean:define id="week" name="tdMdl" property="tcd010Week" type="java.lang.Integer" />
  <% String[] tdColors = new String[] {"td_type9", "td_type1", "td_type1", "td_type1", "td_type1", "td_type1", "td_type8"}; %>
  <% tdColor = tdColors[(week.intValue()-1)]; %>
  <tr>

  <logic:equal name="dayCols" value="1" scope="page">
  <td class="<%= tdColor %>" width="" align="center">
  <bean:define id="day" name="tdMdl" property="tcd010Day" type="java.lang.Integer" />
    <html:multibox property="selectDay" value="<%= Integer.toString(day.intValue()) %>"/>
  </td>
  </logic:equal>

<!--休日以外-->
  <logic:equal name="tdMdl" property="holKbn" value="0">
  <logic:equal name="tdMdl" property="tcd010Week" value="1">
  <th class="<%= tdColor %>" width="" align="center" colspan="<%= dayCols %>">
  <span class="sc_ttl_sun"><bean:write name="tdMdl" property="tcd010Day" /><gsmsg:write key="cmn.day" />(<bean:write name="tdMdl" property="tcd010WeekStr" />) </span></th>
  </logic:equal>
  <logic:equal name="tdMdl" property="tcd010Week" value="7">
  <th class="<%= tdColor %>" width="" align="center" colspan="<%= dayCols %>">
  <span class="sc_ttl_sat"><bean:write name="tdMdl" property="tcd010Day" /><gsmsg:write key="cmn.day" />(<bean:write name="tdMdl" property="tcd010WeekStr" />) </span></th>
  </logic:equal>
  <logic:notEqual name="tdMdl" property="tcd010Week" value="1">
  <logic:notEqual name="tdMdl" property="tcd010Week" value="7">
  <th class="<%= tdColor %>" width="" align="center" colspan="<%= dayCols %>">
  <span class="sc_ttl_def"><bean:write name="tdMdl" property="tcd010Day" /><gsmsg:write key="cmn.day" />(<bean:write name="tdMdl" property="tcd010WeekStr" />) </span></th>
  </logic:notEqual>
  </logic:notEqual>
  </logic:equal>

<!--休日-->
  <logic:notEqual name="tdMdl" property="holKbn" value="0">
  <th class="<%= tdColor %>" width="" align="center" colspan="<%= dayCols %>">
  <span class="sc_ttl_sun"><bean:write name="tdMdl" property="tcd010Day" /><gsmsg:write key="cmn.day" />(<bean:write name="tdMdl" property="tcd010WeekStr" />) </span></th>
  </logic:notEqual>

  <td class="<%= tdColor %>" width="" align="center">
    <bean:write name="tdMdl" property="tcd010ShigyouStr" />
  </td>
  <td class="<%= tdColor %>" width="" align="center">
    <bean:write name="tdMdl" property="tcd010SyugyouStr" />
  </td>
  <td class="<%= tdColor %>" width="" align="center">
  </td>
  <td class="<%= tdColor %>" width="" align="center">
  </td>
  <td class="<%= tdColor %>" width="" ></td>
  <td class="<%= tdColor %>" width="" ></td>
  <td class="<%= tdColor %>" width="" ></td>
  <td class="<%= tdColor %>" width="" align="center">
    <bean:write name="tdMdl" property="tcd010Kyujitsu" />
  </td>
  <td class="<%= tdColor %>" width="" ></td>
  <td class="<%= tdColor %>" width="" >
    <bean:write name="tdMdl" property="tcd010ProjectAStr" />
  </td>
  <td class="<%= tdColor %>" width="" ></td>
  <td class="<%= tdColor %>" width="" ></td>
  <td class="<%= tdColor %>" width="" ></td>
  <td class="<%= tdColor %>" width="" ></td>

  <td class="<%= tdColor %>" width="" align="left" colspan="<%= bikoCols %>">
  <logic:notEmpty name="tdMdl" property="holName">
  <span class="text_baser"><bean:write name="tdMdl" property="holName" /></span>
  </logic:notEmpty>
  <span class="text_gray"><bean:write name="tdMdl" property="tcd010Bikou" /></span>
  </td>

  <td class="<%= tdColor %>" width="" align="center">
  <logic:equal name="tcd010Form" property="tcd010FailFlg" value="0">
  <input type="button" class="btn_change" name="btnChange" value="<gsmsg:write key="cmn.change" />" onClick="editButton('<bean:write name="tdMdl" property="tcd010Day" />');">
  </logic:equal>

  <logic:notEqual name="tcd010Form" property="tcd010FailFlg" value="0">
  <logic:equal name="tdMdl" property="failFlg" value="1">
  <input type="button" class="btn_change" name="btnChange" value="<gsmsg:write key="cmn.change" />" onClick="editButton('<bean:write name="tdMdl" property="tcd010Day" />');">
  </logic:equal>
  </logic:notEqual>

  </td>

  </tr>

  </logic:iterate>
  </logic:notEmpty>
  </table>

</td>
</tr>

<tr>

<td width="" align="center">
  <table width="" class="tl0" border="0">
  <tr>
  <td align="left" nowrap>
  <logic:equal name="tcd010Form" property="tcd010LockFlg" value="0">
  <logic:equal name="tcd010Form" property="tcd010FailFlg" value="0">
  <input type="button" class="btn_edits" onClick="multiEditButton();" value="<gsmsg:write key="cmn.multiple.edit" />">
  <input type="button" value="<gsmsg:write key="cmn.delete" />" class="btn_dell_n1" onClick="buttonPush('del');">
  </logic:equal>
  </logic:equal>
  <logic:equal name="tcd010Form" property="tcd010FailFlg" value="0">
      <logic:equal name="tcd010Form" property="kinmuOut" value="0">
    <input type="button" value="<gsmsg:write key="tcd.tcd010.12" />" class="btn_excel_n2" onClick="buttonPush('xls');">
    </logic:equal>
    <logic:equal name="tcd010Form" property="kinmuOut" value="1">
    <input type="button" value="<gsmsg:write key="tcd.tcd010.12" />" class="btn_pdf_n2" onClick="buttonPush('pdf');">
    </logic:equal>
  <input type="button" value="<gsmsg:write key="cmn.export" />" class="btn_csv_n2" onClick="buttonPush('csv');">
  </logic:equal>
  </td>
  <td align="right" nowrap>

  <input type="button" class="btn_arrow_l" value="&nbsp;" onClick="buttonPush('move_last');">
  <input type="button" class="btn_today" value="<gsmsg:write key="cmn.thismonth3" />" onClick="buttonPush('move_now');">
  <input type="button" class="btn_arrow_r" value="&nbsp;" onclick="buttonPush('move_next');">

  </td>
  <td valign="top">
  <input type="button" value="Cal" onclick="wrtCalendarByBtn(this.form.tcdDspFrom, 'sch200Btn')" class="calendar_btn2", id="sch200Btn">
  </td>
  </tr>
  </table>
</td>
</tr>
</logic:notEmpty>

</table>

</html:form>

<%@ include file="/WEB-INF/plugin/common/jsp/footer001.jsp" %>

</body>
</html:html>