<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>

<html:html>
<head>
<title>[GroupSession] <gsmsg:write key="reserve.rsv220.1" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>

</head>

<body class="body_03">
<html:form action="/reserve/rsv220">
<input type="hidden" name="CMD" value="">
<html:hidden property="backScreen" />
<html:hidden property="rsvBackPgId" />
<html:hidden property="rsvDspFrom" />
<html:hidden property="rsvSelectedGrpSid" />
<html:hidden property="rsvSelectedSisetuSid" />
<html:hidden property="rsv220AmTime" />
<html:hidden property="rsv220PmTime" />
<html:hidden property="rsv220AllTime" />

<%@ include file="/WEB-INF/plugin/reserve/jsp/rsvHidden.jsp" %>

<logic:notEmpty name="rsv220Form" property="rsv100CsvOutField" scope="request">
  <logic:iterate id="csvOutField" name="rsv220Form" property="rsv100CsvOutField" scope="request">
    <input type="hidden" name="rsv100CsvOutField" value="<bean:write name="csvOutField"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="rsv220Form" property="rsvIkkatuTorokuKey" scope="request">
  <logic:iterate id="key" name="rsv220Form" property="rsvIkkatuTorokuKey" scope="request">
    <input type="hidden" name="rsvIkkatuTorokuKey" value="<bean:write name="key"/>">
  </logic:iterate>
</logic:notEmpty>

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>

<!--　BODY -->
<table width="100%" cellpadding="5" cellspacing="0">
<tr>
<td width="100%" align="center">

  <table width="70%" cellpadding="0" cellspacing="0">
  <tr>
  <td align="left">

    <!-- <gsmsg:write key="cmn.title" /> -->
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
    <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="reserve.rsv220.1" /> ]</td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
      <input type="button" value="OK" class="btn_ok1" onClick="buttonPush('rsv220ok');">
      <input type="button" class="btn_back_n3" value="<gsmsg:write key="cmn.back.admin.setting" />" onClick="buttonPush('rsv220back');"></td>
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
    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table class="tl0" width="100%" cellpadding="5">

    <tr>
    <td class="table_bg_A5B4E1" width="15%"><span class="text_bb1"><gsmsg:write key="reserve.123" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span></td>
    <td class="td_type1">
      <span class="text_base"><gsmsg:write key="reserve.rsv220.2" /></span><br><br>
      <html:radio name="rsv220Form" property="rsv220HourDiv" styleId="rsv220HourDiv0" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.HOUR_DIVISION5) %>" /><span class="text_base7"><label for="rsv220HourDiv0"><gsmsg:write key="reserve.rsv220.3" /></label></span>&nbsp;
      <html:radio name="rsv220Form" property="rsv220HourDiv" styleId="rsv220HourDiv1" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.DF_HOUR_DIVISION) %>" /><span class="text_base7"><label for="rsv220HourDiv1"><gsmsg:write key="reserve.rsv220.4" /></label></span>&nbsp;
      <html:radio name="rsv220Form" property="rsv220HourDiv" styleId="rsv220HourDiv2" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.HOUR_DIVISION15) %>" /><span class="text_base7"><label for="rsv220HourDiv2"><gsmsg:write key="reserve.rsv220.5" /></label>&nbsp;</span>
    </td>
    </tr>

    <!-- 時間マスタ -->
    <tr>
    <td class="table_bg_A5B4E1" width="15%"><span class="text_bb1"><gsmsg:write key="cmn.time.master" /></span></td>
    <td class="td_type1">
      <span class="text_base"><gsmsg:write key="reserve.rsv220.6" /></span><br><br>
        <div>
          <gsmsg:write key="cmn.am" />：
          <html:select property="rsv220AmFrHour">
            <html:optionsCollection name="rsv220Form" property="rsv220AmFrHourLabel" value="value" label="label" />
          </html:select>
          <gsmsg:write key="cmn.hour.input" />
          <html:select property="rsv220AmFrMin">
            <html:optionsCollection name="rsv220Form" property="rsv220AmFrMinuteLabel" value="value" label="label" />
          </html:select>
          <gsmsg:write key="cmn.minute.input" />
          <gsmsg:write key="tcd.153" />
          <html:select property="rsv220AmToHour">
            <html:optionsCollection name="rsv220Form" property="rsv220AmToHourLabel" value="value" label="label" />
          </html:select>
           <gsmsg:write key="cmn.hour.input" />
          <html:select property="rsv220AmToMin">
            <html:optionsCollection name="rsv220Form" property="rsv220AmToMinuteLabel" value="value" label="label" />
          </html:select>
          <gsmsg:write key="cmn.minute.input" />
        </div>
        <div>
          <gsmsg:write key="cmn.pm" />：
          <html:select property="rsv220PmFrHour">
            <html:optionsCollection name="rsv220Form" property="rsv220PmFrHourLabel" value="value" label="label" />
          </html:select>
           <gsmsg:write key="cmn.hour.input" />
          <html:select property="rsv220PmFrMin">
            <html:optionsCollection name="rsv220Form" property="rsv220PmFrMinuteLabel" value="value" label="label" />
          </html:select>
          <gsmsg:write key="cmn.minute.input" />
          <gsmsg:write key="tcd.153" />
          <html:select property="rsv220PmToHour">
            <html:optionsCollection name="rsv220Form" property="rsv220PmToHourLabel" value="value" label="label" />
          </html:select>
          <gsmsg:write key="cmn.hour.input" />
          <html:select property="rsv220PmToMin">
            <html:optionsCollection name="rsv220Form" property="rsv220PmFrMinuteLabel" value="value" label="label" />
          </html:select>
          <gsmsg:write key="cmn.minute.input" />
        </div>
        <div>
          <gsmsg:write key="cmn.allday" />：
          <html:select property="rsv220AllDayFrHour">
            <html:optionsCollection name="rsv220Form" property="rsv220AllDayFrHourLabel" value="value" label="label" />
          </html:select>
          <gsmsg:write key="cmn.hour.input" />
          <html:select property="rsv220AllDayFrMin">
            <html:optionsCollection name="rsv220Form" property="rsv220AllDayFrMinuteLabel" value="value" label="label" />
          </html:select>
          <gsmsg:write key="cmn.minute.input" />
          <gsmsg:write key="tcd.153" />
          <html:select property="rsv220AllDayToHour">
            <html:optionsCollection name="rsv220Form" property="rsv220AllDayToHourLabel" value="value" label="label" />
          </html:select>
          <gsmsg:write key="cmn.hour.input" />
          <html:select property="rsv220AllDayToMin">
            <html:optionsCollection name="rsv220Form" property="rsv220AllDayToMinuteLabel" value="value" label="label" />
          </html:select>
          <gsmsg:write key="cmn.minute.input" />
        </div>
    </td>

    </tr>

    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table width="100%">
    <tr>
    <td width="100%" align="right" cellpadding="5" cellspacing="0">
      <input type="button" value="OK" class="btn_ok1" onClick="buttonPush('rsv220ok');">
      <input type="button" class="btn_back_n3" value="<gsmsg:write key="cmn.back.admin.setting" />" onClick="buttonPush('rsv220back');">
    </td>
    </tr>
    </table>

  </td>
  </tr>
  </table>

</td>
</tr>
</table>

<%@ include file="/WEB-INF/plugin/common/jsp/footer001.jsp" %>

</html:form>
</body>
</html:html>
