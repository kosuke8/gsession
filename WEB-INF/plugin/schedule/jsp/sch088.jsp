<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-dailyScheduleRow.tld" prefix="dailyScheduleRow" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html:html>
<head>

<title>[GroupSession] <gsmsg:write key="schedule.108" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../schedule/js/sch088.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../schedule/css/schedule.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>

</head>

<body class="body_03">
<html:form action="/schedule/sch088">

<input type="hidden" name="CMD" value="">

<html:hidden property="backScreen" />
<html:hidden property="dspMod" />
<html:hidden property="listMod" />
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
<logic:notEmpty name="sch088Form" property="sch100SvSearchTarget" scope="request">
  <logic:iterate id="svTarget" name="sch088Form" property="sch100SvSearchTarget" scope="request">
    <input type="hidden" name="sch100SvSearchTarget" value="<bean:write name="svTarget"/>">
  </logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="sch088Form" property="sch100SearchTarget" scope="request">
  <logic:iterate id="target" name="sch088Form" property="sch100SearchTarget" scope="request">
    <input type="hidden" name="sch100SearchTarget" value="<bean:write name="target"/>">
  </logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="sch088Form" property="sch100SvBgcolor" scope="request">
  <logic:iterate id="svBgcolor" name="sch088Form" property="sch100SvBgcolor" scope="request">
    <input type="hidden" name="sch100SvBgcolor" value="<bean:write name="svBgcolor"/>">
  </logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="sch088Form" property="sch100Bgcolor" scope="request">
  <logic:iterate id="bgcolor" name="sch088Form" property="sch100Bgcolor" scope="request">
    <input type="hidden" name="sch100Bgcolor" value="<bean:write name="bgcolor"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="sch088Form" property="sch100CsvOutField" scope="request">
  <logic:iterate id="csvOutField" name="sch088Form" property="sch100CsvOutField" scope="request">
    <input type="hidden" name="sch100CsvOutField" value="<bean:write name="csvOutField"/>">
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

    <!-- タイトル -->
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../common/images/header_pset_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
    <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="schedule.108" />　<gsmsg:write key="cmn.sml.notification.setting" /> ]</td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
      <input type="button" value="OK" class="btn_ok1" onClick="buttonPush('sch088kakunin');">
      <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('sch088back');"></td>
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

    <table cellpadding="10" cellspacing="0" border="0" width="100%" class="tl_u2">

    <tr>
    <td width="0%" rowspan="2" valign="middle" align="left" class="table_bg_A5B4E1" style="padding: 10px;" nowrap>
      <span class="text_bb1"><gsmsg:write key="shortmail.notification" /></span><span class="text_r2">※</span>
    </td>

    <td align="left" class="td_wt" width="100%">
      <html:radio name="sch088Form" styleId="smailSendKbn_01" property="sch088smlSendKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.SMAIL_SEND_KBN_ADMIN) %>" /><label for="smailSendKbn_01"><span class="text_base"><gsmsg:write key="cmn.set.the.admin" /></span></label>&nbsp;
      <html:radio name="sch088Form" styleId="smailSendKbn_02" property="sch088smlSendKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.SMAIL_SEND_KBN_USER) %>" /><label for="smailSendKbn_02"><span class="text_base"><gsmsg:write key="cmn.set.eachuser" /></span></label>
    </td>

    </tr>

    <tr id="smlNoticeKbnArea">

    <td align="left" class="td_type20" width="100%">

      <table width="100%" cellpadding="0" cellspacing="0" border="0">

      <tr>
      <td align="left" width="100%">
      <div class="text_base">
      &nbsp;&nbsp;<gsmsg:write key="schedule.sch095.3" />
      </div>
      &nbsp;&nbsp;<html:radio name="sch088Form" styleId="sch088Smail_02" property="sch088Smail" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.SMAIL_NOT_USE) %>" /><label for="sch088Smail_02"><span class="text_base"><gsmsg:write key="cmn.dont.notify" /></span></label>&nbsp;
      &nbsp;&nbsp;<html:radio name="sch088Form" styleId="sch088Smail_01" property="sch088Smail" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.SMAIL_USE) %>" /><label for="sch088Smail_01"><span class="text_base"><gsmsg:write key="cmn.notify" /></span></label>
      <hr style="border-color:#cccccc;">
      </td>
      </tr>
      <tr>
      <td align="left" width="100%">
      <div class="text_base">
      &nbsp;&nbsp;<gsmsg:write key="schedule.sch095.2" />
      </div>
      &nbsp;&nbsp;<html:radio name="sch088Form" styleId="sch088SmailGroup_02" property="sch088SmailGroup" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.SMAIL_NOT_USE) %>" /><label for="sch088SmailGroup_02"><span class="text_base"><gsmsg:write key="cmn.dont.notify" /></span></label>&nbsp;
      &nbsp;&nbsp;<html:radio name="sch088Form" styleId="sch088SmailGroup_01" property="sch088SmailGroup" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.SMAIL_USE) %>" /><label for="sch088SmailGroup_01"><span class="text_base"><gsmsg:write key="cmn.notify" /></span></label>
      <hr style="border-color:#cccccc;">
      </td>
      </tr>
      <tr>
      <td align="left" width="100%">
      <div class="text_base">
      &nbsp;&nbsp;<gsmsg:write key="schedule.sch095.4" />
      </div>
      &nbsp;&nbsp;<html:radio name="sch088Form" styleId="sch088SmailAttend_02" property="sch088SmailAttend" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.SMAIL_NOT_USE) %>" /><label for="sch088SmailAttend_02"><span class="text_base"><gsmsg:write key="cmn.dont.notify" /></span></label>&nbsp;
      &nbsp;&nbsp;<html:radio name="sch088Form" styleId="sch088SmailAttend_01" property="sch088SmailAttend" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.SMAIL_USE) %>" /><label for="sch088SmailAttend_01"><span class="text_base"><gsmsg:write key="cmn.notify" /></span></label>
      </td>
      </tr>
      </table>
    </td>
    </tr>

    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table width="100%">
    <tr>
    <td width="100%" align="right" cellpadding="5" cellspacing="0">
      <input type="button" value="OK" class="btn_ok1" onClick="buttonPush('sch088kakunin');">
      <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('sch088back');">
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