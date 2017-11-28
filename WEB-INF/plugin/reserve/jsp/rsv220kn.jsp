<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>

<html:html>
<head>
<title>[GroupSession] <gsmsg:write key="reserve.rsv220kn.1" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>

</head>

<body class="body_03">
<html:form action="/reserve/rsv220kn">
<input type="hidden" name="CMD" value="">
<html:hidden property="backScreen" />
<html:hidden property="rsvBackPgId" />
<html:hidden property="rsvDspFrom" />
<html:hidden property="rsvSelectedGrpSid" />
<html:hidden property="rsvSelectedSisetuSid" />

<html:hidden property="rsv220AmFrHour" />
<html:hidden property="rsv220AmFrMin" />
<html:hidden property="rsv220AmToHour" />
<html:hidden property="rsv220AmToMin" />
<html:hidden property="rsv220PmFrHour" />
<html:hidden property="rsv220PmFrMin" />
<html:hidden property="rsv220PmToHour" />
<html:hidden property="rsv220PmToMin" />
<html:hidden property="rsv220AllDayFrHour" />
<html:hidden property="rsv220AllDayFrMin" />
<html:hidden property="rsv220AllDayToHour" />
<html:hidden property="rsv220AllDayToMin" />
<html:hidden property="rsv220AmTime" />
<html:hidden property="rsv220PmTime" />
<html:hidden property="rsv220AllTime" />

<%@ include file="/WEB-INF/plugin/reserve/jsp/rsvHidden.jsp" %>

<logic:notEmpty name="rsv220knForm" property="rsv100CsvOutField" scope="request">
  <logic:iterate id="csvOutField" name="rsv220knForm" property="rsv100CsvOutField" scope="request">
    <input type="hidden" name="rsv100CsvOutField" value="<bean:write name="csvOutField"/>">
  </logic:iterate>
</logic:notEmpty>
<html:hidden property="rsv220HourDiv" />

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
    <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="reserve.rsv220kn.1" /> ]</td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
      <input type="button" value="<gsmsg:write key="cmn.final" />" class="btn_base1" onClick="buttonPush('rsv220knkakutei');">
      <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('rsv220knback');"></td>
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>
    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table class="tl0" width="100%" cellpadding="5">

    <tr>
    <td class="table_bg_A5B4E1" width="15%"><span class="text_bb1"><gsmsg:write key="reserve.123" /></span></td>
    <td class="td_type20">

      <span class="text_base">
      <logic:equal name="rsv220Form" property="rsv220HourDiv" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.HOUR_DIVISION5) %>">
        <gsmsg:write key="reserve.rsv220.3" />
      </logic:equal>
      <logic:equal name="rsv220Form" property="rsv220HourDiv" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.DF_HOUR_DIVISION) %>">
        <gsmsg:write key="reserve.rsv220.4" />
      </logic:equal>
      <logic:equal name="rsv220Form" property="rsv220HourDiv" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.HOUR_DIVISION15) %>">
        <gsmsg:write key="reserve.rsv220.5" />
      </logic:equal>
      </span>

    </td>
    </tr>

    <tr>
    <td class="table_bg_A5B4E1" width="15%"><span class="text_bb1"><gsmsg:write key="cmn.time.master" /></span></td>
    <td class="td_type20">
      <div>
        <span class="text_base"><bean:write name="rsv220knForm" property="rsv220AmTime"/></span>
      </div>
      <div>
        <span class="text_base"><bean:write name="rsv220knForm" property="rsv220PmTime"/></span>
      </div>
      <div>
        <span class="text_base"><bean:write name="rsv220knForm" property="rsv220AllTime"/> </span>
      </div>
    </td>
    </tr>

    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table width="100%">
    <tr>
    <td width="100%" align="right" cellpadding="5" cellspacing="0">
      <input type="button" value="<gsmsg:write key="cmn.final" />" class="btn_base1" onClick="buttonPush('rsv220knkakutei');">
      <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('rsv220knback');">
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
