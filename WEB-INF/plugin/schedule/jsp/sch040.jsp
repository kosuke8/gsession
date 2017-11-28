<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ taglib uri="/WEB-INF/ctag-jsmsg.tld" prefix="gsjsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<% String maxLengthContent = String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.MAX_LENGTH_VALUE); %>
<% String maxLengthBiko = String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.MAX_LENGTH_BIKO); %>

<html:html>
<head>
<logic:equal name="sch040Form" property="cmd" value="add">
<title>[GroupSession] <gsmsg:write key="schedule.3" /></title>
</logic:equal>
<logic:equal name="sch040Form" property="cmd" value="edit">
<title>[GroupSession] <gsmsg:write key="schedule.9" /></title>
</logic:equal>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<gsjsmsg:js filename="gsjsmsg.js"/>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/jquery.selection-min.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='../common/js/jquery.bgiframe.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src='../schedule/jquery_ui/js/jquery-ui-1.8.14.custom.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/selectionSearchText.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/textarea_autoresize.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/calendar.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../schedule/js/sch040.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/reservepopup.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/grouppopup.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/count.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/changestyle.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/popup.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/search.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/jtooltip.js?<%= GSConst.VERSION_PARAM %>"></script>

<% String selectionEvent = ""; %>
<% boolean selectionFlg = false; %>

<logic:equal name="sch040Form" property="searchPluginKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.PLUGIN_USE) %>">
  <% selectionFlg = true; %>
</logic:equal>

<% String closeScript = "calWindowClose();windowClose();"; %>
<logic:equal name="sch040Form" property="addressPluginKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.PLUGIN_USE) %>">
<script language="JavaScript" src="../address/js/adr240.js?<%= GSConst.VERSION_PARAM %>"></script>
<% closeScript += "companyWindowClose();"; %>
</logic:equal>

<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../schedule/css/schedule.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../common/css/selection.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../schedule/jquery/jquery-theme.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../schedule/jquery_ui/css/jquery.ui.dialog.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<logic:notEmpty name="sch040Form" property="sch040SelectUsrLabel" scope="request">
<logic:equal name="sch040Form" property="cmd" value="edit">
<logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
<body class="body_03" onload="setToDay();setBetweenFromToDayCount();setTimeStatus();showLengthId($('#inputstr')[0], <%= maxLengthContent %>, 'inputlength');showLengthId($('#inputstr2')[0], <%= maxLengthBiko %>, 'inputlength2');<%= selectionEvent %>" onunload="setDisabled();<%= closeScript %>">
</logic:notEqual>
<logic:equal name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
<body class="body_03" onunload="setDisabled();<%= closeScript %>">
</logic:equal>

</logic:equal>
<logic:equal name="sch040Form" property="cmd" value="add">
<body class="body_03" onload="setToDay();setBetweenFromToDayCount();setTimeStatus();showLengthId($('#inputstr')[0], <%= maxLengthContent %>, 'inputlength');showLengthId($('#inputstr2')[0], <%= maxLengthBiko %>, 'inputlength2');<%= selectionEvent %>" onunload="<%= closeScript %>">
</logic:equal>
</logic:notEmpty>
<logic:empty name="sch040Form" property="sch040SelectUsrLabel" scope="request">
<body class="body_03" onload="setToDay();setBetweenFromToDayCount();setTimeStatus();showLengthId($('#inputstr')[0], <%= maxLengthContent %>, 'inputlength');showLengthId($('#inputstr2')[0], <%= maxLengthBiko %>, 'inputlength2');<%= selectionEvent %>" onunload="<%= closeScript %>">
</logic:empty>

<html:form action="/schedule/sch040">

<html:hidden property="cmd" />
<html:hidden property="dspMod" />
<html:hidden property="listMod" />
<html:hidden property="sch040InitFlg" />
<html:hidden property="sch040CopyFlg" />
<html:hidden property="sch040ScrollFlg" />
<html:hidden property="sch040CrangeKbn" />
<html:hidden property="sch040EditDspMode" />
<html:hidden property="sch040EditMailSendKbn" />
<html:hidden property="sch010DspDate" />
<html:hidden property="changeDateFlg" />
<html:hidden property="iniDsp" />
<html:hidden property="sch010SelectUsrSid" />
<html:hidden property="sch010SelectUsrKbn" />
<html:hidden property="sch010SelectDate" />
<html:hidden property="sch010SchSid" />
<html:hidden property="sch010DspGpSid" />
<html:hidden property="sch010searchWord" />
<html:hidden property="sch020SelectUsrSid" />
<html:hidden property="sch030FromHour" />
<html:hidden property="schWeekDate" />
<html:hidden property="schDailyDate" />
<html:hidden property="sch100SelectUsrSid" />
<html:hidden property="sch100PageNum" />
<html:hidden property="sch100Slt_page1" />
<html:hidden property="sch100Slt_page2" />
<html:hidden property="sch100OrderKey1" />
<html:hidden property="sch100SortKey1" />
<html:hidden property="sch100OrderKey2" />
<html:hidden property="sch100SortKey2" />
<html:hidden property="sch100SvSltGroup" />
<html:hidden property="sch100SvSltUser" />
<html:hidden property="sch100SvSltStartYearFr" />
<html:hidden property="sch100SvSltStartMonthFr" />
<html:hidden property="sch100SvSltStartDayFr" />
<html:hidden property="sch100SvSltStartYearTo" />
<html:hidden property="sch100SvSltStartMonthTo" />
<html:hidden property="sch100SvSltStartDayTo" />
<html:hidden property="sch100SvSltEndYearFr" />
<html:hidden property="sch100SvSltEndMonthFr" />
<html:hidden property="sch100SvSltEndDayFr" />
<html:hidden property="sch100SvSltEndYearTo" />
<html:hidden property="sch100SvSltEndMonthTo" />
<html:hidden property="sch100SvSltEndDayTo" />
<html:hidden property="sch100SvKeyWordkbn" />
<html:hidden property="sch100SvKeyValue" />
<html:hidden property="sch100SvOrderKey1" />
<html:hidden property="sch100SvSortKey1" />
<html:hidden property="sch100SvOrderKey2" />
<html:hidden property="sch100SvSortKey2" />
<html:hidden property="sch100SltGroup" />
<html:hidden property="sch100SltUser" />
<html:hidden property="sch100SltStartYearFr" />
<html:hidden property="sch100SltStartMonthFr" />
<html:hidden property="sch100SltStartDayFr" />
<html:hidden property="sch100SltStartYearTo" />
<html:hidden property="sch100SltStartMonthTo" />
<html:hidden property="sch100SltStartDayTo" />
<html:hidden property="sch100SltEndYearFr" />
<html:hidden property="sch100SltEndMonthFr" />
<html:hidden property="sch100SltEndDayFr" />
<html:hidden property="sch100SltEndYearTo" />
<html:hidden property="sch100SltEndMonthTo" />
<html:hidden property="sch100SltEndDayTo" />
<html:hidden property="sch100KeyWordkbn" />
<html:hidden property="sch041ExtSid" />
<html:hidden property="sch041ExtKbn" />
<html:hidden property="sch041Week" />
<html:hidden property="sch041Day" />
<html:hidden property="sch041DayOfYearly" />
<html:hidden property="sch041MonthOfYearly" />
<html:hidden property="sch041TranKbn" />
<html:hidden property="sch041FrYear" />
<html:hidden property="sch041FrMonth" />
<html:hidden property="sch041FrDay" />
<html:hidden property="sch041ToYear" />
<html:hidden property="sch041ToMonth" />
<html:hidden property="sch041ToDay" />
<html:hidden property="sch041FrHour" />
<html:hidden property="sch041FrMin" />
<html:hidden property="sch041ToHour" />
<html:hidden property="sch041ToMin" />
<html:hidden property="sch041Bgcolor" />
<html:hidden property="sch041Title" />
<html:hidden property="sch041Value" />
<html:hidden property="sch041Biko" />
<html:hidden property="sch041Public" />
<html:hidden property="sch041Edit" />
<html:hidden property="sch041BatchRef" />
<html:hidden property="sch041GroupSid" />
<html:hidden property="sch041ReserveGroupSid" />
<html:hidden property="sch041TimeKbn" />
<html:hidden property="sch040AmFrHour"/>
<html:hidden property="sch040AmFrMin"/>
<html:hidden property="sch040AmToHour"/>
<html:hidden property="sch040AmToMin"/>
<html:hidden property="sch040PmFrHour"/>
<html:hidden property="sch040PmFrMin"/>
<html:hidden property="sch040PmToHour"/>
<html:hidden property="sch040PmToMin"/>
<html:hidden property="sch040AllDayFrHour"/>
<html:hidden property="sch040AllDayFrMin"/>
<html:hidden property="sch040AllDayToHour"/>
<html:hidden property="sch040AllDayToMin"/>

<logic:notEmpty name="sch040Form" property="schNotAccessGroupList" scope="request">
  <logic:iterate id="notAccessGroup" name="sch040Form" property="schNotAccessGroupList" scope="request">
    <input type="hidden" name="schNotAccessGroup" value="<bean:write name="notAccessGroup"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="sch040Form" property="schNotAccessUserList" scope="request">
  <logic:iterate id="notAccessUser" name="sch040Form" property="schNotAccessUserList" scope="request">
    <input type="hidden" name="schNotAccessUser" value="<bean:write name="notAccessUser"/>">
  </logic:iterate>
</logic:notEmpty>

<input type="hidden" name="sch040delCompanyId" value="">
<input type="hidden" name="sch040delCompanyBaseId" value="">
<html:hidden property="sch041contact" />

<div id="sch040CompanyIdArea">
<logic:notEmpty name="sch040Form" property="sch040CompanySid">
  <logic:iterate id="coId" name="sch040Form" property="sch040CompanySid">
    <input type="hidden" name="sch040CompanySid" value="<bean:write name="coId"/>">
  </logic:iterate>
</logic:notEmpty>
</div>

<div id="sch040CompanyBaseIdArea">
<logic:notEmpty name="sch040Form" property="sch040CompanyBaseSid">
  <logic:iterate id="coId" name="sch040Form" property="sch040CompanyBaseSid">
    <input type="hidden" name="sch040CompanyBaseSid" value="<bean:write name="coId"/>">
  </logic:iterate>
</logic:notEmpty>
</div>

<div id="sch040AddressIdArea">
<logic:notEmpty name="sch040Form" property="sch040AddressId">
  <logic:iterate id="addressId" name="sch040Form" property="sch040AddressId">
    <input type="hidden" name="sch040AddressId" value="<bean:write name="addressId"/>">
  </logic:iterate>
</logic:notEmpty>
</div>

<logic:notEmpty name="sch040Form" property="sch041CompanySid">
  <logic:iterate id="coId" name="sch040Form" property="sch041CompanySid">
    <input type="hidden" name="sch041CompanySid" value="<bean:write name="coId"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="sch040Form" property="sch041CompanyBaseSid">
  <logic:iterate id="coId" name="sch040Form" property="sch041CompanyBaseSid">
    <input type="hidden" name="sch041CompanyBaseSid" value="<bean:write name="coId"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="sch040Form" property="sch041AddressId">
  <logic:iterate id="addressId" name="sch040Form" property="sch041AddressId">
    <input type="hidden" name="sch041AddressId" value="<bean:write name="addressId"/>">
  </logic:iterate>
</logic:notEmpty>

<html:hidden property="reservePluginKbn" />
<html:hidden property="addressPluginKbn" />
<html:hidden property="searchPluginKbn" />
<logic:notEmpty name="sch040Form" property="sch041Dweek" scope="request">
<logic:iterate id="selectWeek" name="sch040Form" property="sch041Dweek" scope="request">
  <input type="hidden" name="sch041Dweek" value="<bean:write name="selectWeek" />">
</logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="sch040Form" property="sch100SvSearchTarget" scope="request">
  <logic:iterate id="svTarget" name="sch040Form" property="sch100SvSearchTarget" scope="request">
    <input type="hidden" name="sch100SvSearchTarget" value="<bean:write name="svTarget"/>">
  </logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="sch040Form" property="sch100SearchTarget" scope="request">
  <logic:iterate id="target" name="sch040Form" property="sch100SearchTarget" scope="request">
    <input type="hidden" name="sch100SearchTarget" value="<bean:write name="target"/>">
  </logic:iterate>
</logic:notEmpty>

<jsp:include page="/WEB-INF/plugin/common/jsp/header001.jsp"/>
<logic:equal name="sch040Form" property="sch010SelectUsrKbn" value="1">
    <input type="hidden" name="helpPrm" value="<bean:write name="sch040Form" property="sch010SelectUsrKbn" /><bean:write name="sch040Form" property="cmd" />">
</logic:equal>
<logic:equal name="sch040Form" property="sch010SelectUsrKbn" value="0">
    <logic:equal name="sch040Form" property="sch040EditDspMode" value="0">
        <input type="hidden" name="helpPrm" value="<bean:write name="sch040Form" property="sch010SelectUsrKbn" /><bean:write name="sch040Form" property="cmd" />">
    </logic:equal>
    <logic:equal name="sch040Form" property="sch040EditDspMode" value="1">
        <input type="hidden" name="helpPrm" value="2<bean:write name="sch040Form" property="cmd" />">
    </logic:equal>
    <logic:equal name="sch040Form" property="sch040EditDspMode" value="2">
        <input type="hidden" name="helpPrm" value="3<bean:write name="sch040Form" property="cmd" />">
    </logic:equal>
</logic:equal>

<%--　BODY --%>
<logic:notEmpty name="sch040Form" property="sv_users" scope="request">
<logic:iterate id="ulBean" name="sch040Form" property="sv_users" scope="request">
<input type="hidden" name="sv_users" value="<bean:write name="ulBean" />">
</logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="sch040Form" property="svReserveUsers" scope="request">
<logic:iterate id="resBean" name="sch040Form" property="svReserveUsers" scope="request">
<input type="hidden" name="svReserveUsers" value="<bean:write name="resBean" />">
</logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="sch040Form" property="sch041SvUsers" scope="request">
<logic:iterate id="eulBean" name="sch040Form" property="sch041SvUsers" scope="request">
<input type="hidden" name="sch041SvUsers" value="<bean:write name="eulBean" />">
</logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="sch040Form" property="sch041SvReserve" scope="request">
<logic:iterate id="exresBean" name="sch040Form" property="sch041SvReserve" scope="request">
<input type="hidden" name="sch041SvReserve" value="<bean:write name="exresBean" />">
</logic:iterate>
</logic:notEmpty>


<logic:equal name="sch040Form" property="sch010SelectUsrKbn" value="1">
<html:hidden property="sch040GroupSid" />
</logic:equal>

<logic:notEmpty name="sch040Form" property="sch100SvBgcolor" scope="request">
  <logic:iterate id="svBgcolor" name="sch040Form" property="sch100SvBgcolor" scope="request">
    <input type="hidden" name="sch100SvBgcolor" value="<bean:write name="svBgcolor"/>">
  </logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="sch040Form" property="sch100Bgcolor" scope="request">
  <logic:iterate id="bgcolor" name="sch040Form" property="sch100Bgcolor" scope="request">
    <input type="hidden" name="sch100Bgcolor" value="<bean:write name="bgcolor"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="sch040Form" property="sch100CsvOutField" scope="request">
  <logic:iterate id="csvOutField" name="sch040Form" property="sch100CsvOutField" scope="request">
    <input type="hidden" name="sch100CsvOutField" value="<bean:write name="csvOutField"/>">
  </logic:iterate>
</logic:notEmpty>

<table cellpadding="5" cellspacing="0" width="100%">
<tr>
<td width="100%" align="center">

  <table cellpadding="0" width="70%" class="tl0">
  <tr>
  <td align="center">

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../schedule/images/header_schedule_01.gif" border="0" alt="<gsmsg:write key="schedule.108" />"></td>
    <td width="0%" class="header_white_bg_text" align="right" valign="middle" nowrap><span class="plugin_ttl"><gsmsg:write key="schedule.108" /></span></td>
    <td width="100%" class="header_white_bg_text">

    <%-- タイトル --%>
    <logic:equal name="sch040Form" property="cmd" value="add">[ <gsmsg:write key="schedule.3" /> ]</td></logic:equal>
    <logic:equal name="sch040Form" property="cmd" value="edit">[ <gsmsg:write key="schedule.8" /> ]</td></logic:equal>
    <td width="0%"><img src="../common/images/header_white_end.gif" border="0" alt="<gsmsg:write key="schedule.108" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%">
    <logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
    <input type="button" value="<gsmsg:write key="cmn.for.repert" />" class="btn_base1" onClick="buttonPush('040_extend', '<bean:write name="sch040Form" property="cmd" />');">
    </logic:notEqual>

    <logic:equal name="sch040Form" property="cmd" value="edit">
      <input type="button" value="<gsmsg:write key="cmn.register.copy" />" class="btn_base1" onClick="buttonPush('040_copy', 'add');">
    </logic:equal>
    <logic:equal name="sch040Form" property="cmd" value="edit">
      <input type="button" value="<gsmsg:write key="cmn.pdf" />" class="btn_pdf_n1" onClick="buttonPush2('pdf');">
    </logic:equal>

    </td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">

        <logic:equal name="sch040Form" property="cmd" value="add">
        <input type="hidden" name="CMD" value="040_ok">

          <input type="submit" value="<gsmsg:write key="cmn.entry.2" />" class="btn_add_n1">
          <input type="button" value="<gsmsg:write key="cmn.back2" />" class="btn_back_n1" onClick="buttonPush('040_back', '<bean:write name="sch040Form" property="cmd" />');">
        </logic:equal>

        <logic:equal name="sch040Form" property="cmd" value="edit">
        <input type="hidden" name="CMD" value="040_ok">
<input type="button" value="<gsmsg:write key="schedule.43" />" id="editbtn" class="btn_edit_n1">
          <logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
          <input type="button" value="<gsmsg:write key="cmn.delete2" />" class="btn_dell_n1" onClick="buttonPush('040_del', '<bean:write name="sch040Form" property="cmd" />');">
          </logic:notEqual>
          <logic:equal name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
          <logic:equal name="sch040Form" property="sch040AttendDelFlg" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.ATTEND_SCH_DEL_YES) %>">
          <input type="button" value="<gsmsg:write key="cmn.delete2" />" class="btn_dell_n1" onClick="buttonPush('040_del', '<bean:write name="sch040Form" property="cmd" />');">
          </logic:equal>
          </logic:equal>
          <input type="button" value="<gsmsg:write key="cmn.back2" />" class="btn_back_n1" onClick="buttonPush('040_back', '<bean:write name="sch040Form" property="sch040BtnCmd" />');">
        </logic:equal>

    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

    <logic:messagesPresent message="false">
      <table width="100%">
      <tr>
        <td align="left"><span class="TXT02"><html:errors/></span></td>
      </tr>
      </table>
    </logic:messagesPresent>

    <logic:equal name="sch040Form" property="sch040ExTextDspFlg" value="false">
      <img src="../schedule/images/spacer.gif" width="1px" height="10px" border="0">
    </logic:equal>

    <bean:define id="tdColor" value="" />
    <% String[] tdColors = new String[] {"td_wt", "td_sch_type2"}; %>
    <logic:notEqual name="sch040Form" property="sch010SelectUsrKbn" value="0">
    <% tdColor = tdColors[1]; %>
    </logic:notEqual>
    <logic:equal name="sch040Form" property="sch010SelectUsrKbn" value="0">
    <% tdColor = tdColors[0]; %>
    </logic:equal>

    <logic:equal name="sch040Form" property="sch010SelectUsrKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.USER_KBN_USER) %>">
    <logic:equal name="sch040Form" property="cmd" value="edit">
    <logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_NORMAL) %>">

    <table width="100%" class="tl0" border="0" cellpadding="5">
    <tr>
    <td class="table_bg_A5B4E1" width="20%" nowrap><span class="text_bb1">出欠確認</span><span class="text_r2">※</span></td>
    <td align="left" class="<%= tdColor %>">
    <logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
      <div style="padding-top:10px;padding-bottom:10px;">
      <html:radio name="sch040Form" property="sch040AttendKbn" styleId="sch040AttendKbn0" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.ATTEND_KBN_NO) %>" /><span class="text_base2"><label for="sch040AttendKbn0">確認しない</label></span>&nbsp;
      <html:radio name="sch040Form" property="sch040AttendKbn" styleId="sch040AttendKbn1" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.ATTEND_KBN_YES) %>" /><span class="text_base2"><label for="sch040AttendKbn1">確認する</label></span>
      </div>
    </logic:notEqual>

    <logic:equal name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
    <div style="padding-top:10px;padding-bottom:10px;">
    <html:radio name="sch040Form" property="sch040AttendAnsKbn" styleId="sch040AttendAnsKbn0" value="0" /><span class="text_base2"><label for="sch040AttendAnsKbn0">未回答</label></span>&nbsp;
    <html:radio name="sch040Form" property="sch040AttendAnsKbn" styleId="sch040AttendAnsKbn1" value="1" /><span class="text_base2"><label for="sch040AttendAnsKbn1">出席</label></span>&nbsp;
    <html:radio name="sch040Form" property="sch040AttendAnsKbn" styleId="sch040AttendAnsKbn2" value="2" /><span class="text_base2"><label for="sch040AttendAnsKbn2">欠席</label></span>
    </div>
    <html:hidden property="sch040AttendKbn"/>
    </logic:equal>
    <div>
    <table class="tl0 table_td_border" width="50%" cellpadding="0" cellspacing="0">
      <tr class="table_bg_7D91BD">
      <th width="40%" class="table_bg_7D91BD" nowrap>回答日時</th>
      <th width="30%" class="table_bg_7D91BD" nowrap>氏名</th>
      <th width="30%" class="table_bg_7D91BD" nowrap>回答内容</th>
      </tr>

      <logic:notEmpty name="sch040Form" property="sch040AttendAnsList">
      <logic:iterate id="attendMdl" name="sch040Form" property="sch040AttendAnsList" indexId="idx">
        <% String[] typeClass = new String[] {"td_type1", "td_type_usr"}; %>
        <% String tdType = typeClass[(idx.intValue() % 2)]; %>
        <tr class="<%= tdType %>">
        <td align="center" nowrap>
        <logic:equal name="attendMdl" property="attendAnsKbn" value="0">
        －
        </logic:equal>
        <logic:notEqual name="attendMdl" property="attendAnsKbn" value="0">
          <bean:write name="attendMdl" property="attendAnsDate" />
        </logic:notEqual>
        </td>
        <td align="left" nowrap>

          <logic:equal name="attendMdl" property="attendAnsUsrUkoFlg" value="1">
            <span class="mukouser"><bean:write name="attendMdl" property="attendAnsUsrName" /></span>
          </logic:equal>

          <logic:notEqual name="attendMdl" property="attendAnsUsrUkoFlg" value="1">
            <bean:write name="attendMdl" property="attendAnsUsrName" />
          </logic:notEqual>

        </td>
        <td align="center" nowrap>
          <logic:equal name="attendMdl" property="attendAnsKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.ATTEND_ANS_NONE) %>">未回答</logic:equal>
          <logic:equal name="attendMdl" property="attendAnsKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.ATTEND_ANS_YES) %>"><span class="attend_text_yes">出席</span></logic:equal>
          <logic:equal name="attendMdl" property="attendAnsKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.ATTEND_ANS_NO) %>"><span class="attend_text_no">欠席</span></logic:equal>
        </td>
        </tr>
      </logic:iterate>
      </logic:notEmpty>
    </table>
    <logic:equal name="sch040Form" property="sch040AttendLinkFlg" value="1">
    <span class="all_disp_txt" id="all_disp">全て表示する</span>
    </logic:equal>
    </div>
    </td>
    </tr>
    </table>
    </logic:notEqual>
    </logic:equal>
    </logic:equal>

    <table width="100%" class="tl0" border="0" cellpadding="5">
      <logic:equal name="sch040Form" property="sch040ExTextDspFlg" value="true">
      <tr>
      <td align="left" width="100%" colspan="2" nowrap>
        <span class="text_base"><gsmsg:write key="schedule.149" /></span>
      </td>
      </tr>
    </logic:equal>

    <tr>
    <td class="table_bg_A5B4E1" width="20%" nowrap><span class="text_bb1"><gsmsg:write key="schedule.4" /></span></td>
    <td class="<%= tdColor %>" align="left" width="80%">
    <logic:notEqual name="sch040Form" property="sch010SelectUsrKbn" value="0">
    <span id="lt"><img src="../common/images/groupicon.gif" alt="<gsmsg:write key="cmn.group" />" border="0"></span>
    </logic:notEqual>
    <logic:equal name="sch040Form" property="sch040UsrUkoFlg" value="1">
      <span class="text_base mukouser"><bean:write name="sch040Form" property="sch040UsrName" /></span>
    </logic:equal>
    <logic:notEqual name="sch040Form" property="sch040UsrUkoFlg" value="1">
      <span class="text_base"><bean:write name="sch040Form" property="sch040UsrName" /></span>
    </logic:notEqual>
    </td>
    </tr>

    <tr>
    <td class="table_bg_A5B4E1" nowrap>
    <span class="text_bb1"><gsmsg:write key="schedule.16" /></span>
    <logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
    <span class="text_r2">※</span>
    </logic:notEqual>
    </td>
    <td align="left" class="<%= tdColor %>" nowrap>
    <div>
    <logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
     <html:select property="sch040FrYear" styleId="selYear" onchange="setBetweenFromToDayCount();setToDay();">
        <html:optionsCollection name="sch040Form" property="sch040YearLabel" value="value" label="label" />
     </html:select>
     <html:select property="sch040FrMonth" styleId="selMonth" onchange="setBetweenFromToDayCount();setToDay();">
        <html:optionsCollection name="sch040Form" property="sch040MonthLabel" value="value" label="label" />
     </html:select>
     <html:select property="sch040FrDay" styleId="selDay" onchange="setBetweenFromToDayCount();setToDay();">
        <html:optionsCollection name="sch040Form" property="sch040DayLabel" value="value" label="label" />
     </html:select>
      <input type="button" value="Cal" onclick="wrtCalendarByBtn(this.form.selDay, this.form.selMonth, this.form.sch040FrYear, 'sch040FrCalBtn')" onfocus="setBetweenFromToDayCount();setToDay();" class="calendar_btn" id="sch040FrCalBtn">
      <input type="button" class="btn_arrow_l" value="&nbsp;" onclick="return moveFromDay($('#selYear')[0], $('#selMonth')[0], $('#selDay')[0], 1)">
      <input type="button" class="btn_today" value="<gsmsg:write key="cmn.today" />" onClick="return moveFromDay($('#selYear')[0], $('#selMonth')[0], $('#selDay')[0], 2)">
      <input type="button" class="btn_arrow_r" value="&nbsp;" onclick="return moveFromDay($('#selYear')[0], $('#selMonth')[0], $('#selDay')[0], 3)">
     </div>

     <div class="text_time">
       <html:select styleId="sch040FrHour" property="sch040FrHour" onchange="setToDay();">
          <html:optionsCollection name="sch040Form" property="sch040HourLabel" value="value" label="label" />
       </html:select>
       <gsmsg:write key="cmn.hour.input" />
       <html:select styleId="sch040FrMin" property="sch040FrMin" onchange="setToDay();">
          <html:optionsCollection name="sch040Form" property="sch040MinuteLabel" value="value" label="label" />
       </html:select>
       <gsmsg:write key="cmn.minute.input" />
       <span class="text_base"><html:checkbox name="sch040Form" property="sch040TimeKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.TIME_NOT_EXIST) %>" styleId="num_seigyo" onclick="return changeTimeStatus();" /><label for="num_seigyo"><gsmsg:write key="schedule.7" /></label></span>
      </logic:notEqual>
      <logic:equal name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
         <span class="text_base"><bean:write name="sch040Form" property="sch040DspFromDate" /></span>
         <html:hidden property="sch040FrYear" />
         <html:hidden property="sch040FrMonth" />
         <html:hidden property="sch040FrDay" />
         <html:hidden property="sch040FrHour" />
         <html:hidden property="sch040FrMin" />
         <html:hidden property="sch040TimeKbn"/>
      </logic:equal>
      <logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
      <span class="text_base time_master">
        &nbsp;&nbsp;
        <a href="javaScript:void(0);" onclick="setAmTime();"><gsmsg:write key="cmn.am" />
        <span class="tooltips">
          <bean:write name="sch040Form" property="sch040AmFrHour" format="00" />:<bean:write name="sch040Form" property="sch040AmFrMin" format="00" />～<bean:write name="sch040Form" property="sch040AmToHour" format="00" />:<bean:write name="sch040Form" property="sch040AmToMin" format="00" />
        </span>
        </a>
      </span>
      <span class="text_base time_master">
        &nbsp;&nbsp;
        <a href="javaScript:void(0);" onclick="setPmTime();"><gsmsg:write key="cmn.pm" />
        <span class="tooltips">
          <bean:write name="sch040Form" property="sch040PmFrHour" format="00" />:<bean:write name="sch040Form" property="sch040PmFrMin" format="00" />～<bean:write name="sch040Form" property="sch040PmToHour" format="00" />:<bean:write name="sch040Form" property="sch040PmToMin" format="00" />
        </span>
        </a>
      </span>
      <span class="text_base time_master">
        &nbsp;&nbsp;
        <a href="javaScript:void(0);" onclick="setAllTime();"><gsmsg:write key="cmn.allday" />
        <span class="tooltips">
          <bean:write name="sch040Form" property="sch040AllDayFrHour" format="00" />:<bean:write name="sch040Form" property="sch040AllDayFrMin" format="00" />～<bean:write name="sch040Form" property="sch040AllDayToHour" format="00" />:<bean:write name="sch040Form" property="sch040AllDayToMin" format="00" />
        </span>
        </a>
      </span>
      </logic:notEqual>
    </div>
    </td>
    </tr>

    <tr>
    <td class="table_bg_A5B4E1" nowrap>
    <span class="text_bb1"><gsmsg:write key="schedule.27" /></span>
    <logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
    <span class="text_r2">※</span>
    </logic:notEqual>
    </td>
    <td align="left" class="<%= tdColor %>" >
    <div>
    <logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">

     <html:select property="sch040ToYear" styleId="seleYear" onchange="setBetweenFromToDayCount();setFromDay();">
        <html:optionsCollection name="sch040Form" property="sch040YearLabel" value="value" label="label" />
     </html:select>
     <html:select property="sch040ToMonth" styleId="seleMonth" onchange="setBetweenFromToDayCount();setFromDay();">
        <html:optionsCollection name="sch040Form" property="sch040MonthLabel" value="value" label="label" />
     </html:select>
     <html:select property="sch040ToDay" styleId="seleDay" onchange="setBetweenFromToDayCount();setFromDay();">
        <html:optionsCollection name="sch040Form" property="sch040DayLabel" value="value" label="label" />
     </html:select>
     <input type="button" value="Cal" onclick="wrtCalendarByBtn(this.form.seleDay, this.form.seleMonth, this.form.seleYear, 'wml040ToCalBtn')" onfocus="setBetweenFromToDayCount();setFromDay();" class="calendar_btn" id="wml040ToCalBtn">

      <input type="button" class="btn_arrow_l" value="&nbsp;" onclick="return moveToDay($('#seleYear')[0], $('#seleMonth')[0], $('#seleDay')[0], 1)">
      <input type="button" class="btn_today" value="<gsmsg:write key="cmn.today" />" onClick="return moveToDay($('#seleYear')[0], $('#seleMonth')[0], $('#seleDay')[0], 2)">
      <input type="button" class="btn_arrow_r" value="&nbsp;" onclick="return moveToDay($('#seleYear')[0], $('#seleMonth')[0], $('#seleDay')[0], 3)">
    </div>
     <div class="text_time">
     <html:select styleId="sch040ToHour" property="sch040ToHour" onchange="setFromDay();">
        <html:optionsCollection name="sch040Form" property="sch040HourLabel" value="value" label="label" />
     </html:select>
     <gsmsg:write key="cmn.hour.input" />
     <html:select styleId="sch040ToMin" property="sch040ToMin" onchange="setFromDay();">
        <html:optionsCollection name="sch040Form" property="sch040MinuteLabel" value="value" label="label" />
     </html:select>
     <gsmsg:write key="cmn.minute.input" />
     <span id="betWeenDays" class="text_base"></span>
    </logic:notEqual>
    <logic:equal name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
       <span class="text_base"><bean:write name="sch040Form" property="sch040DspToDate" /></span>
       <html:hidden property="sch040ToYear" />
       <html:hidden property="sch040ToMonth" />
       <html:hidden property="sch040ToDay" />
       <html:hidden property="sch040ToHour" />
       <html:hidden property="sch040ToMin" />
    </logic:equal>
    </div>
    </td>
    </tr>

    <logic:equal name="sch040Form" property="addressPluginKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.PLUGIN_USE) %>">
    <logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
    <tr>
    <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="schedule.14" /></span></td>
    <td align="left" class="<%= tdColor %>">
      <logic:empty name="sch040Form" property="sch040CompanyList">
      <input type="button" class="btn_address_n1" value="<gsmsg:write key="addressbook" />" onclick="return openCompanyWindow('sch040')" />
      </logic:empty>

      <logic:notEmpty name="sch040Form" property="sch040CompanyList">
      <table class="tl0" width="100%">
      <tr>
      <td>
        <logic:notEmpty name="sch040Form" property="sch040AddressId">
        <span class="text_base">
        <html:checkbox name="sch040Form" property="sch040contact" value="1" styleId="contactCheck" /><label for="contactCheck"><gsmsg:write key="schedule.23" /></label>
        </span>
        </logic:notEmpty>
      </td>
      <td style="text-align:right; padding-left:10px; vertical-align:middle;">
        <input type="button" class="btn_address_n1" value="<gsmsg:write key="addressbook" />" onclick="return openCompanyWindow('sch040')" />
      </td>
      </tr>
      <tr>
      <td colspan="2">
        <table width="100%" class="tl0 text_base">
        <logic:notEmpty name="sch040Form" property="sch040CompanyList">
        <logic:iterate id="companyData" name="sch040Form" property="sch040CompanyList">
          <tr><td colspan="3">&nbsp</td></tr>
          <tr>
          <td width="0%" style="vertical-valign:middle;">
          <a href="#" onClick="deleteCompany(<bean:write name="companyData" property="companySid" />, <bean:write name="companyData" property="companyBaseSid" />);"><img src="../common/images/delete.gif" class="img_bottom" width="15" alt="<gsmsg:write key="cmn.delete.company" />"></a>
          </td>
          <td width="70%" style="text-align:left!important;text-valign:center">
          &nbsp;<span class="text_company">
          <logic:equal name="companyData" property="companySid" value="0">
          <bean:write name="companyData" property="companyName" />
          </logic:equal>
          <logic:notEqual name="companyData" property="companySid" value="0">
          <a href="javascript:void(0);" onclick="return openSubWindow('../address/adr250.do?adr250AcoSid=<bean:write name="companyData" property="companySid" />')" class="text_blue_100"><bean:write name="companyData" property="companyName" /></a>
          </logic:notEqual>
          </span>
          </td>
          <td width="30%" nowrap>
          <logic:equal name="sch040Form" property="searchPluginKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.PLUGIN_USE) %>">
            <logic:notEqual name="companyData" property="companySid" value="0">
            &nbsp;&nbsp;<a href="javascript:void(0);" onClick="webSearch('<bean:write name="companyData" property="companyNameSearch" />');" style="padding-top:2px;"><span class="search_normal text_blue_100"><gsmsg:write key="schedule.15" /></span></a>
            <logic:notEmpty name="companyData" property="companyAddress">
            &nbsp;<a href="javascript:void(0);" onClick="webSearch('<bean:write name="companyData" property="companyAddress" />');" style="padding-top:2px;"><span class="search_map text_blue_100"><gsmsg:write key="cmn.search.map" /></span></a>
            </logic:notEmpty>
            </logic:notEqual>
          </logic:equal>
          </td>
          </tr>
          <tr>
          <td>&nbsp;</td>
          <td colspan="2">
          <logic:notEmpty name="companyData" property="addressDataList">
          <logic:iterate id="addressData" name="companyData" property="addressDataList">
            <span class="text_tantou"><bean:write name="addressData" property="adrName" /></span><br>
          </logic:iterate>
          </logic:notEmpty>
          </td>
          </tr>
        </logic:iterate>
        </logic:notEmpty>
        </table>
      </td>
      </tr>
      </table>
      </logic:notEmpty>
    </td>
    </tr>
    </logic:notEqual>
    </logic:equal>

    <tr>
    <td class="table_bg_A5B4E1" nowrap>
    <span class="text_bb1"><gsmsg:write key="cmn.title" /></span>
    <logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
    <span class="text_r2">※</span>
    </logic:notEqual>
    </td>
    <td align="left" class="<%= tdColor %>">
    <logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
    <% if (selectionFlg) { %>
    <html:text name="sch040Form" maxlength="50" property="sch040Title" styleClass="text_base" styleId="selectionSearchArea" style="width:421px;" />
    <% } else { %>
    <html:text name="sch040Form" maxlength="50" property="sch040Title" styleClass="text_base" styleId="selectionSearchArea" style="width:421px;" />
    <% } %>
    </logic:notEqual>
    <logic:equal name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
        <span class="text_base"><bean:write name="sch040Form" property="sch040Title" /></span>
        <html:hidden property="sch040Title" />
    </logic:equal>
    </td>
    </tr>

    <jsp:include page="/WEB-INF/plugin/schedule/jsp/sch040_sub1.jsp" >
    <jsp:param value="<%= tdColor %>" name="tdColor"/>
    </jsp:include>

    <%-- グループスケジュール 非表示部分(同時登録部分) START --%>
    <jsp:include page="/WEB-INF/plugin/schedule/jsp/sch040_atOnce.jsp">
      <jsp:param value="<%= tdColor %>" name="tdColor"/>
    </jsp:include>
    <%-- グループスケジュール 非表示部分(同時登録部分) END --%>

    <%-- 施設予約使用　有無判定 --%>
    <jsp:include page="/WEB-INF/plugin/schedule/jsp/sch040_rsv.jsp">
      <jsp:param value="<%= tdColor %>" name="tdColor"/>
    </jsp:include>
    <%-- 施設予約使用　有無判定 END --%>

    <logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
    <tr>
    <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="schedule.18" /></span></td>
    <td align="left" class="<%= tdColor %>">
      <table class="tl0" width="100%">
      <tr>
      <td width="50%" nowrap>      <span class="text_base">※<gsmsg:write key="schedule.35" /></span>
      </span>
      </td>
      <td width="50%" align="left" nowrap><input type="button" value="<gsmsg:write key="schedule.17" />" class="btn_base1" onClick="openScheduleReserveWindow('<bean:write name="sch040Form" property="sch040GroupSid" />', '<bean:write name="sch040Form" property="sch040ReserveGroupSid" />','<bean:write name="sch040Form" property="sch010SelectDate" />');">
      </td>
      </tr>
      </table>
    </td>
    </tr>
    </logic:notEqual>

    <logic:notEqual name="sch040Form" property="reservePluginKbn" value="0">
    <html:hidden property="sch040ReserveGroupSid" />
    </logic:notEqual>

    <tr>
    <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.registant" /></span></td>
    <td align="left" class="<%= tdColor %>">
      <table class="tl0" width="100%">
      <tr>
      <td width="60%" nowrap>
      <span class="text_base">
      <logic:notEqual name="sch040Form" property="sch040AddUsrJkbn" value="9">

        <logic:equal name="sch040Form" property="sch040AddUsrUkoFlg" value="1">
          <span class="mukouser">
            <bean:write name="sch040Form" property="sch040AddUsrName" />
          </span>
        </logic:equal>

        <logic:notEqual name="sch040Form" property="sch040AddUsrUkoFlg" value="1">
          <bean:write name="sch040Form" property="sch040AddUsrName" />
        </logic:notEqual>

      </logic:notEqual>

      <logic:equal name="sch040Form" property="sch040AddUsrJkbn" value="9">
      <del>
      <bean:write name="sch040Form" property="sch040AddUsrName" />
      </del>
      </logic:equal>

      </span>
      </td>
      <td width="40%" align="left" nowrap>
      <span class="text_base"><bean:write name="sch040Form" property="sch040AddDate" /></span>
      </td>
      </tr>
      </table>
    </td>
    </tr>

    <img src="../schedule/images/spacer.gif" width="1px" border="0" height="10px">


    <table cellpadding="0" width="100%">
    <img src="../schedule/images/spacer.gif" width="1px" border="0" height="10px">
  <tr>
  <td align="left">
  <logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
  <input type="button" value="<gsmsg:write key="cmn.for.repert" />" class="btn_base1" onClick="buttonPush('040_extend', '<bean:write name="sch040Form" property="sch040BtnCmd" />');">
  </logic:notEqual>

    <logic:equal name="sch040Form" property="cmd" value="edit">
      <input type="button" value="<gsmsg:write key="cmn.register.copy" />" class="btn_base1" onClick="buttonPush('040_copy', 'add');">
    </logic:equal>
    <logic:equal name="sch040Form" property="cmd" value="edit">
    <input type="button" value="<gsmsg:write key="cmn.pdf" />" class="btn_pdf_n1" onClick="buttonPush2('pdf');">
    </logic:equal>
    </td>
    <td align="right">

        <logic:equal name="sch040Form" property="cmd" value="add">
          <input type="submit" value="<gsmsg:write key="cmn.entry.2" />" class="btn_add_n1">
          <input type="button" value="<gsmsg:write key="cmn.back2" />" class="btn_back_n1" onClick="buttonPush('040_back', '<bean:write name="sch040Form" property="sch040BtnCmd" />');">
        </logic:equal>

        <logic:equal name="sch040Form" property="cmd" value="edit">
          <input type="button" value="<gsmsg:write key="schedule.43" />" id="editbtn" class="btn_edit_n1">

<%--           <input type="submit" value="<gsmsg:write key="schedule.43" />" class="btn_edit_n1"> --%>
          <logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
          <input type="button" value="<gsmsg:write key="cmn.delete2" />" class="btn_dell_n1" onClick="buttonPush('040_del', '<bean:write name="sch040Form" property="sch040BtnCmd" />');">
          </logic:notEqual>
          <logic:equal name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
          <logic:equal name="sch040Form" property="sch040AttendDelFlg" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.ATTEND_SCH_DEL_YES) %>">
          <input type="button" value="<gsmsg:write key="cmn.delete2" />" class="btn_dell_n1" onClick="buttonPush('040_del', '<bean:write name="sch040Form" property="cmd" />');">
          </logic:equal>
          </logic:equal>
          <input type="button" value="<gsmsg:write key="cmn.back2" />" class="btn_back_n1" onClick="buttonPush('040_back', '<bean:write name="sch040Form" property="sch040BtnCmd" />');">
        </logic:equal>
    </td>
    </tr>
    </table>

  </td>
  </tr>

  </table>

</td>
</tr>
</table>


</html:form>

<div id="schEditMail" title="出欠確認更新" style="display:none;">
  <p>
    <div>
       <span class="ui-icon ui-icon-info" style="float:left; margin:0 7px 20px 0;"></span>
       <b>スケジュールを更新します。よろしいですか？</b><br><br>
       <input type="checkbox" id="sch040EditMailSendKbn" value="1" /><label for="sch040EditMailSendKbn" class="text_base"><span class="dialog_checkbox">出欠確認 再通知メールを送信する</span></label>&nbsp;
    </div>
  </p>
</div>


<% if (selectionFlg) { %>
<span id="tooltip_search" class="tooltip_search"></span>
<span id="damy"></span>
<% } %>
<jsp:include page="/WEB-INF/plugin/common/jsp/footer001.jsp"/>
</body>
</html:html>
