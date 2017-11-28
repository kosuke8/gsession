<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ taglib uri="/WEB-INF/ctag-jsmsg.tld" prefix="gsjsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%-- 定数値 --%>
<%
  int editConfOwn          = jp.groupsession.v2.cmn.GSConstSchedule.EDIT_CONF_OWN;
  int editConfGroup        = jp.groupsession.v2.cmn.GSConstSchedule.EDIT_CONF_GROUP;
  int dspPublic            = jp.groupsession.v2.cmn.GSConstSchedule.DSP_PUBLIC;
  int dspNotPublic         = jp.groupsession.v2.cmn.GSConstSchedule.DSP_NOT_PUBLIC;
  int dspYoteiari          = jp.groupsession.v2.cmn.GSConstSchedule.DSP_YOTEIARI;
  int dspBelongGroup       = jp.groupsession.v2.cmn.GSConstSchedule.DSP_BELONG_GROUP;
  String project           = jp.groupsession.v2.cmn.GSConstCommon.PLUGIN_ID_PROJECT;
  String nippou            = jp.groupsession.v2.cmn.GSConstCommon.PLUGIN_ID_NIPPOU;
%>

<html:html>
<head>
<title>[GroupSession] <gsmsg:write key="schedule.sch010.1" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<gsjsmsg:js filename="gsjsmsg.js"/>
<script language="JavaScript" src="../common/js/userpopup.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/grouppopup.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src='../schedule/jquery_ui/js/jquery-ui-1.8.14.custom.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../schedule/js/sch010.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/calendar2.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/jtooltip.js?<%= GSConst.VERSION_PARAM %>"></script>

<script type="text/javascript">
<!--
  //自動リロード
  <logic:notEqual name="sch010Form" property="sch010Reload" value="0">
    var reloadinterval = <bean:write name="sch010Form" property="sch010Reload" />;
    setTimeout("buttonPush('reload')",reloadinterval);
  </logic:notEqual>
-->
</script>

<script type="text/javascript">
function getSelVal(className){

    return false;
}
</script>

<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../schedule/css/schedule.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../schedule/jquery/jquery-theme.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../schedule/jquery_ui/css/jquery.ui.dialog.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../common/css/glayer.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<% long schTipCnt = 0; %>
<body class="body_03" onunload="windowClose();calWindowClose();" onkeydown="return keyPress(event.keyCode);">
<html:form action="/schedule/sch010">
<input type="hidden" name="CMD" value="">
<input type="hidden" name="dspMod" value="1">

<input type="hidden" name="sch010SelectUsrSid" value="-1">
<input type="hidden" name="sch010SelectUsrKbn" value="0">

<html:hidden property="cmd" />
<html:hidden property="sch010DspDate" />
<html:hidden property="changeDateFlg" />
<html:hidden property="iniDsp" />
<html:hidden property="sch010CrangeKbn" />
<html:hidden property="sch010SelectDate" />
<html:hidden property="sch010SchSid" />

<logic:notEmpty name="sch010Form" property="schNotAccessGroupList" scope="request">
  <logic:iterate id="notAccessGroup" name="sch010Form" property="schNotAccessGroupList" scope="request">
    <input type="hidden" name="schNotAccessGroup" value="<bean:write name="notAccessGroup"/>">
  </logic:iterate>
</logic:notEmpty>


<jsp:include page="/WEB-INF/plugin/common/jsp/header001.jsp" />

<table cellpadding="5" cellspacing="0" width="100%">
<tr>
<td width="100%" align="center">

  <table cellpadding="0" cellspacing="0" border="0" width="100%">
  <tr>
  <td width="0%"><img src="../schedule/images/header_schedule_01.gif" border="0" alt="<gsmsg:write key="schedule.108" />"></td>
  <td width="0%" class="header_white_bg_text" align="right" valign="middle" nowrap><span class="plugin_ttl"><gsmsg:write key="schedule.108" /></span></td>
  <td width="0%" class="header_white_bg_text" nowrap>[ <gsmsg:write key="cmn.weeks" /> ]</td>
  <td width="100%" class="header_white_bg">
  <input type="button" value="<gsmsg:write key="cmn.reload" />" class="btn_reload_n1" onClick="buttonPush('reload');">
  <input type="button" value="<gsmsg:write key="cmn.pdf" />" class="btn_pdf_n1" onClick="buttonPush('pdf');">
  <input type="button" value="<gsmsg:write key="cmn.import" />" class="btn_csv_n1" onclick="buttonPush('import');">
  <logic:equal name="sch010Form" property="adminKbn" value="1">
    <input type="button" name="btn_admin_tool" class="btn_setting_admin_n1" value="<gsmsg:write key="cmn.admin.setting" />" onClick="buttonPush('ktool');">
  </logic:equal>
    <input type="button" name="btn_user_tool" class="btn_setting_n1" value="<gsmsg:write key="cmn.preferences2" />" onClick="buttonPush('pset');">
  </td>
  <td width="0%"><img src="../common/images/header_white_end.gif" border="0" alt="<gsmsg:write key="schedule.108" />"></td>
  </tr>
  </table>

  <table cellpadding="5" width="100%" class="tl0">
  <tr>
  <td colspan="8" class="td_type0">
    <table cellspacing="0" width="100%" border="0">

    <tr>
    <td width="75%" align="right" nowrap>

    <bean:size id="topSize" name="sch010Form" property="sch010TopList" scope="request" />
    <logic:equal name="topSize" value="2">
    <logic:iterate id="weekBean" name="sch010Form" property="sch010TopList" scope="request" offset="1"/>
    </logic:equal>
    <logic:notEqual name="topSize" value="2">
    <logic:iterate id="weekBean" name="sch010Form" property="sch010TopList" scope="request" offset="0"/>
    </logic:notEqual>

    <bean:define id="usrBean" name="weekBean" property="sch010UsrMdl"/>
      <input type="button" value="<gsmsg:write key="schedule.19" />" class="btn_week_kojin" onClick="moveKojinSchedule('kojin', <bean:write name="sch010Form" property="sch010DspDate" />, <bean:write name="usrBean" property="usrSid" />, <bean:write name="usrBean" property="usrKbn" />);">
      <input type="button" value="<gsmsg:write key="cmn.days" />" class="btn_day" onClick="moveDailySchedule('day', <bean:write name="sch010Form" property="sch010DspDate" />, <bean:write name="usrBean" property="usrSid" />, <bean:write name="usrBean" property="usrKbn" />);">
      <input type="button" value="<gsmsg:write key="cmn.weekly" />" class="btn_week" onClick="buttonPush('reload');">
      <input type="button" value="<gsmsg:write key="cmn.between.mon" />" class="btn_month" onClick="moveMonthSchedule('month', <bean:write name="usrBean" property="usrSid" />, <bean:write name="usrBean" property="usrKbn" />);">
      <input type="button" value="<gsmsg:write key="cmn.listof" />" class="btn_schedule_search" onClick="moveListSchedule('list', <bean:write name="usrBean" property="usrSid" />, <bean:write name="usrBean" property="usrKbn" />);">
    </td>

    <td width="0%" align="right" valign="top" nowrap>
      <input type="button" class="btn_arrow1_l" value="&nbsp;" onclick="buttonPush('move_lw');">
      <input type="button" class="btn_arrow_l" value="&nbsp;" onclick="buttonPush('move_ld');">
      <input type="button" class="btn_today" value="<gsmsg:write key="cmn.today" />" onClick="buttonPush('today');">
      <input type="button" class="btn_arrow_r" value="&nbsp;" onclick="buttonPush('move_rd');">
      <input type="button" class="btn_arrow1_r" value="&nbsp;" onclick="buttonPush('move_rw');">
    </td>

    <td width="0%" align="right" nowrap>
      <input type="button" value="Cal" onclick="resetCmd();sch010OpenCalendar();wrtCalendarByBtn(this.form.sch010DspDate, 'sch010CalBtn')" class="calendar_btn2" id="sch010CalBtn">
    </td>

    </tr>
    </table>
  </td>
  </tr>

  <tr>
  <td colspan="8" class="table_bg_7D91BD" align="center">
    <table width="100%" class="tl0">
      <tr>
      <td width="15%" align="left">
        <span class="text_tl1"><bean:write name="sch010Form" property="sch010StrDspDate" /></span>
      </td>

      <td width="60%" align="left" nowrap>
        <span class="text_tlw"><gsmsg:write key="cmn.show.group" /></span>

      <html:select property="sch010DspGpSid" styleClass="select01" onchange="changeGroupCombo();getSelVal('select01');">
        <logic:notEmpty name="sch010Form" property="sch010GpLabelList" scope="request">
        <logic:iterate id="gpBean" name="sch010Form" property="sch010GpLabelList" scope="request">

        <% boolean gpDisabled = false; %>
        <logic:equal name="gpBean" property="viewKbn" value="false">
        <% gpDisabled = true; %>
        </logic:equal>

        <bean:define id="gpValue" name="gpBean" property="value" type="java.lang.String" />
        <logic:equal name="gpBean" property="styleClass" value="0">
        <html:option value="<%= gpValue %>" disabled="<%= gpDisabled %>"><bean:write name="gpBean" property="label" /></html:option>
        </logic:equal>

        <logic:notEqual name="gpBean" property="styleClass" value="0">
        <html:option styleClass="select03" value="<%= gpValue %>" disabled="<%= gpDisabled %>"><bean:write name="gpBean" property="label" /></html:option>
        </logic:notEqual>

        </logic:iterate>
        </logic:notEmpty>


      </html:select>
      <logic:equal name="sch010Form" property="sch010CrangeKbn" value="0">
        <input type="button" onclick="openGroupWindow(this.form.sch010DspGpSid, 'sch010DspGpSid', '1', '', 0, '', 'schNotAccessGroup');" class="group_btn" value="&nbsp;&nbsp;" id="sch010GroupBtn">
      </logic:equal>
      </td>

      <td width="0%" align="right">
      <img src="../common/images/search.gif" alt="<gsmsg:write key="cmn.search" />" class="img_bottom">
      <html:text property="sch010searchWord" styleClass="text_base" maxlength="50" style="width:155px;" />
      <input type="button" value="<gsmsg:write key="cmn.search" />" class="btn_base0" onClick="buttonPush('search');">
      </td>
      </tr>
    </table>
  </td>
  </tr>

  <% String grpHeight = "105"; %>
  <logic:notEqual name="sch010Form" property="smailUseOk" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.PLUGIN_USE) %>">
  <% grpHeight = "85"; %>
  </logic:notEqual>


  <!-- タイトル(氏名,日付) -->
  <tr>
  <th width="16%" class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.name" /></span></th>
  <logic:notEmpty name="sch010Form" property="sch010CalendarList" scope="request">
  <logic:iterate id="calBean" name="sch010Form" property="sch010CalendarList" scope="request">

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
  <th width="12%" nowrap class="<%= tdColor %>"><a href="#" onClick="moveDailySchedule('day', <bean:write name="calBean" property="dspDate" />, <bean:write name="usrBean" property="usrSid" />, <bean:write name="usrBean" property="usrKbn" />);">
  <span class="<%= fontColorSun %>"><bean:write name="calBean" property="dspDayString" /></span></a></th>
  </logic:equal>

  <logic:notEqual name="calBean" property="holidayKbn" value="1">
  <logic:equal name="calBean" property="weekKbn" value="1">
  <th width="12%" nowrap class="<%= tdColor %>"><a href="#" onClick="moveDailySchedule('day', <bean:write name="calBean" property="dspDate" />, <bean:write name="usrBean" property="usrSid" />, <bean:write name="usrBean" property="usrKbn" />);">
  <span class="<%= fontColorSun %>"><bean:write name="calBean" property="dspDayString" /></span></a></th>
  </logic:equal>

  <logic:equal name="calBean" property="weekKbn" value="7">
  <th width="12%" nowrap class="<%= tdColor %>"><a href="#" onClick="moveDailySchedule('day', <bean:write name="calBean" property="dspDate" />, <bean:write name="usrBean" property="usrSid" />, <bean:write name="usrBean" property="usrKbn" />);">
  <span class="<%= fontColorSat %>"><bean:write name="calBean" property="dspDayString" /></span></a></th>
  </logic:equal>

  <logic:notEqual name="calBean" property="weekKbn" value="1">
  <logic:notEqual name="calBean" property="weekKbn" value="7">
  <th width="12%" nowrap class="<%= tdColor %>"><a href="#" onClick="moveDailySchedule('day', <bean:write name="calBean" property="dspDate" />, <bean:write name="usrBean" property="usrSid" />, <bean:write name="usrBean" property="usrKbn" />);">
  <span class="<%= fontColorDef %>"><bean:write name="calBean" property="dspDayString" /></span></a></th>
  </logic:notEqual>
  </logic:notEqual>
  </logic:notEqual>

  </logic:iterate>
  </logic:notEmpty>
  </tr>



  <!-- グループ,本人 -->
  <logic:notEmpty name="sch010Form" property="sch010TopList" scope="request">
  <jsp:include page="/WEB-INF/plugin/schedule/jsp/sch010_mySelf.jsp" >
  <jsp:param value="<%= editConfOwn %>" name="editConfOwn"/>
  <jsp:param value="<%= editConfGroup %>" name="editConfGroup"/>
  <jsp:param value="<%= dspPublic %>" name="dspPublic"/>
  <jsp:param value="<%= project %>" name="project"/>
  <jsp:param value="<%= nippou %>" name="nippou"/>
  <jsp:param value="<%= grpHeight %>" name="grpHeight"/>
  <jsp:param value="<%= schTipCnt %>" name="schTipCnt"/>
  </jsp:include>
  </logic:notEmpty>


  <!-- グループメンバー -->
  <tr>
  <td colspan="8" class="table_bg_7D91BD" align="left">
    <span class="text_tlwn">&nbsp;<gsmsg:write key="schedule.74" /></span>
  </td>
  </tr>

  <!-- タイトル(氏名,日付) -->
  <tr>
  <th width="16%" class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.name" /></span></th>
  <logic:notEmpty name="sch010Form" property="sch010CalendarList" scope="request">
  <logic:iterate id="calBean" name="sch010Form" property="sch010CalendarList" scope="request">

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
  <th width="12%" nowrap class="<%= tdColor %>"><a href="#" onClick="moveDailySchedule('day', <bean:write name="calBean" property="dspDate" />, <bean:write name="usrBean" property="usrSid" />, <bean:write name="usrBean" property="usrKbn" />);">
  <span class="<%= fontColorSun %>"><bean:write name="calBean" property="dspDayString" /></span></a></th>
  </logic:equal>

  <logic:notEqual name="calBean" property="holidayKbn" value="1">
  <logic:equal name="calBean" property="weekKbn" value="1">
  <th width="12%" nowrap class="<%= tdColor %>"><a href="#" onClick="moveDailySchedule('day', <bean:write name="calBean" property="dspDate" />, <bean:write name="usrBean" property="usrSid" />, <bean:write name="usrBean" property="usrKbn" />);">
  <span class="<%= fontColorSun %>"><bean:write name="calBean" property="dspDayString" /></span></a></th>
  </logic:equal>

  <logic:equal name="calBean" property="weekKbn" value="7">
  <th width="12%" nowrap class="<%= tdColor %>"><a href="#" onClick="moveDailySchedule('day', <bean:write name="calBean" property="dspDate" />, <bean:write name="usrBean" property="usrSid" />, <bean:write name="usrBean" property="usrKbn" />);">
  <span class="<%= fontColorSat %>"><bean:write name="calBean" property="dspDayString" /></span></a></th>
  </logic:equal>

  <logic:notEqual name="calBean" property="weekKbn" value="1">
  <logic:notEqual name="calBean" property="weekKbn" value="7">
  <th width="12%" nowrap class="<%= tdColor %>"><a href="#" onClick="moveDailySchedule('day', <bean:write name="calBean" property="dspDate" />, <bean:write name="usrBean" property="usrSid" />, <bean:write name="usrBean" property="usrKbn" />);">
  <span class="<%= fontColorDef %>"><bean:write name="calBean" property="dspDayString" /></span></a></th>
  </logic:notEqual>
  </logic:notEqual>
  </logic:notEqual>

  </logic:iterate>
  </logic:notEmpty>
  </tr>


  <!-- グループメンバースケジュール表示 -->
  <!-- グループメンバー -->
  <logic:notEmpty name="sch010Form" property="sch010BottomList" scope="request">
  <jsp:include page="/WEB-INF/plugin/schedule/jsp/sch010_gpMember.jsp">
  <jsp:param value="<%= editConfOwn %>" name="editConfOwn"/>
  <jsp:param value="<%= editConfGroup %>" name="editConfGroup"/>
  <jsp:param value="<%= dspPublic %>" name="dspPublic"/>
  <jsp:param value="<%= dspBelongGroup %>" name="dspBelongGroup"/>
  <jsp:param value="<%= project %>" name="project"/>
  <jsp:param value="<%= nippou %>" name="nippou"/>
  <jsp:param value="<%= grpHeight %>" name="grpHeight"/>
  <jsp:param value="<%= schTipCnt %>" name="schTipCnt"/>
  </jsp:include>

  </logic:notEmpty>
  </table>

  <br>
  <div align="left">
  <table width="0%">
      <tr>
      <logic:equal name="sch010Form" property="zaisekiUseOk" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.PLUGIN_USE) %>">
        <td class="td_type1" nowrap><span class="text_base2"><gsmsg:write key="cmn.zaiseki2" /></span></td>
        <td>&nbsp;</td>
        <td class="td_type_gaisyutu" nowrap><span class="text_base2"><gsmsg:write key="cmn.absence2" /></span></td>
        <td>&nbsp;</td>
        <td class="td_type_kekkin" nowrap><span class="text_base2"><gsmsg:write key="cmn.other" /></span></td>
      </logic:equal>
      <logic:notEqual name="sch010Form" property="zaisekiUseOk" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.PLUGIN_USE) %>">
      <td></td>
      </logic:notEqual>
      </tr>
  </table>
  </div>

</td>
</tr>
</table>
</html:form>

<div id="smlPop" title="" style="display:none">
  <div id="smlCreateArea" width="100%" height="100%"></div>
</div>

<script type="text/javascript">
<% for (long schIdCnt = 0; schIdCnt < schTipCnt; schIdCnt++) { }%>
</script>

<jsp:include page="/WEB-INF/plugin/common/jsp/footer001.jsp" />
</body>
</html:html>