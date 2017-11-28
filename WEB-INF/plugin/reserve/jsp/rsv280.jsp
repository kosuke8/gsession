<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>

<html:html>
<head>
<title>[GroupSession] <gsmsg:write key="reserve.src.39" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../reserve/js/rsv280.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>

</head>

<body class="body_03" onload="changeEnableDisable(); changeEnableDisablePeriod(); changeEnableDisablePublic();">
<html:form action="/reserve/rsv280">
<input type="hidden" name="CMD" value="">
<html:hidden property="backScreen" />
<html:hidden property="rsvBackPgId" />
<html:hidden property="rsvDspFrom" />
<html:hidden property="rsvSelectedGrpSid" />
<html:hidden property="rsvSelectedSisetuSid" />

<%@ include file="/WEB-INF/plugin/reserve/jsp/rsvHidden.jsp" %>

<logic:notEmpty name="rsv280Form" property="rsv100CsvOutField" scope="request">
  <logic:iterate id="csvOutField" name="rsv280Form" property="rsv100CsvOutField" scope="request">
    <input type="hidden" name="rsv100CsvOutField" value="<bean:write name="csvOutField"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="rsv280Form" property="rsvIkkatuTorokuKey" scope="request">
  <logic:iterate id="key" name="rsv280Form" property="rsvIkkatuTorokuKey" scope="request">
    <input type="hidden" name="rsvIkkatuTorokuKey" value="<bean:write name="key"/>">
  </logic:iterate>
</logic:notEmpty>

<html:hidden property="rsv280initFlg" />

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>


<%--　BODY --%>
<table width="100%" cellpadding="5" cellspacing="0">
<tr>
<td width="100%" align="center">

  <table width="70%" cellpadding="0" cellspacing="0">
  <tr>
  <td align="left">

    <%-- <gsmsg:write key="cmn.title" /> --%>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
    <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="reserve.src.39" /> ]</td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt=""></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
      <input type="button" value="OK" class="btn_ok1" onClick="buttonPush('rsv280ok');">
      <input type="button" value="<gsmsg:write key="cmn.back.admin.setting" />" class="btn_back_n3" onClick="buttonPush('rsv280back');"></td>
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table cellpadding="10" cellspacing="0" border="0" width="100%" class="tl_u2">

    <%-- 期間 --%>
     <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" width="20%" nowrap id="rsvPeriodArea1" rowspan="2">
      <span class="text_bb1"><gsmsg:write key="cmn.period" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span>
    </td>
    <td valign="middle" align="left" class="td_wt">
      <html:radio name="rsv280Form" styleId="rsv280PeriodKbn_01" property="rsv280PeriodKbn" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.RAC_INIPERIODKBN_ADM) %>" onclick="changeEnableDisablePeriod();" /><label for="rsv280PeriodKbn_01"><span class="text_base6_2"><gsmsg:write key="cmn.set.the.admin" /></span></label>&nbsp;
      <html:radio name="rsv280Form" styleId="rsv280PeriodKbn_02" property="rsv280PeriodKbn" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.RAC_INIPERIODKBN_USER) %>" onclick="changeEnableDisablePeriod();" /><label for="rsv280PeriodKbn_02"><span class="text_base6_2"><gsmsg:write key="cmn.set.eachuser" /></span></label>
    </td>
    </tr>

     <tr>
    <td valign="middle" align="left" class="td_wt" width="100%" id="rsvPeriodArea2">
      <span class="text_bb1"><gsmsg:write key="cmn.starttime" />：</span>
      <html:select property="rsv280DefFrH">
        <html:optionsCollection name="rsv280Form" property="rsv280HourLabel" value="value" label="label" />
      </html:select>
      <gsmsg:write key="cmn.hour.input" />
      <html:select property="rsv280DefFrM">
        <html:optionsCollection name="rsv280Form" property="rsv280MinuteLabel" value="value" label="label" />
      </html:select>
      <gsmsg:write key="cmn.minute.input" />

    <br>
      <span class="text_bb1"><gsmsg:write key="cmn.endtime" />：</span>
      <html:select property="rsv280DefToH">
        <html:optionsCollection name="rsv280Form" property="rsv280HourLabel" value="value" label="label" />
      </html:select>
      <gsmsg:write key="cmn.hour.input" />
      <html:select property="rsv280DefToM">
        <html:optionsCollection name="rsv280Form" property="rsv280MinuteLabel" value="value" label="label" />
      </html:select>
      <gsmsg:write key="cmn.minute.input" />
    </td>
    </tr>

    <%-- 編集権限 --%>
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" width="20%" nowrap id="rsvEditArea1" rowspan="2">
      <span class="text_bb1"><gsmsg:write key="cmn.edit.permissions" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span>
    </td>
    <td valign="middle" align="left" class="td_wt">
      <html:radio name="rsv280Form" styleId="rsv280EditKbn_01" property="rsv280EditKbn" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.RAC_INIEDITKBN_ADM) %>" onclick="changeEnableDisable();" /><label for="rsv280EditKbn_01"><span class="text_base6_2"><gsmsg:write key="cmn.set.the.admin" /></span></label>&nbsp;
      <html:radio name="rsv280Form" styleId="rsv280EditKbn_02" property="rsv280EditKbn" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.RAC_INIEDITKBN_USER) %>" onclick="changeEnableDisable();" /><label for="rsv280EditKbn_02"><span class="text_base6_2"><gsmsg:write key="cmn.set.eachuser" /></span></label>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="td_wt" id="rsvEditArea2">
      <html:radio name="rsv280Form" property="rsv280Edit" styleId="rsv280Edit0" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.EDIT_AUTH_NONE) %>" /><span class="text_base"><label for="rsv280Edit0"><gsmsg:write key="cmn.nolimit" /></label></span>&nbsp;
      <html:radio name="rsv280Form" property="rsv280Edit" styleId="rsv280Edit1" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.EDIT_AUTH_PER_AND_ADU) %>" /><span class="text_base"><label for="rsv280Edit1"><gsmsg:write key="cmn.only.principal.or.registant" /></label>&nbsp;</span>
      <html:radio name="rsv280Form" property="rsv280Edit" styleId="rsv280Edit2" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.EDIT_AUTH_GRP_AND_ADU) %>" /><span class="text_base"><label for="rsv280Edit2"><gsmsg:write key="cmn.only.affiliation.group.membership" /></label>&nbsp;</span>
    </td>
    </tr>

    <%-- 公開区分 --%>
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" width="20%" nowrap id="rsvPublicArea1" rowspan="2">
      <span class="text_bb1"><gsmsg:write key="cmn.public.kbn" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span>
    </td>
    <td valign="middle" align="left" class="td_wt">
      <html:radio name="rsv280Form" styleId="rsv280PublicKbn_01" property="rsv280PublicKbn" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.RAC_INIPUBLICKBN_ADM) %>" onclick="changeEnableDisablePublic();" /><label for="rsv280PublicKbn_01"><span class="text_base6_2"><gsmsg:write key="cmn.set.the.admin" /></span></label>&nbsp;
      <html:radio name="rsv280Form" styleId="rsv280PublicKbn_02" property="rsv280PublicKbn" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.RAC_INIPUBLICKBN_USER) %>" onclick="changeEnableDisablePublic();" /><label for="rsv280PublicKbn_02"><span class="text_base6_2"><gsmsg:write key="cmn.set.eachuser" /></span></label>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="td_wt" id="rsvPublicArea2">
      <html:radio name="rsv280Form" property="rsv280Public" styleId="rsv280Public0" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PUBLIC_KBN_ALL) %>" /><span class="text_base"><label for="rsv280Public0"><gsmsg:write key="cmn.public" /></label></span>&nbsp;
      <html:radio name="rsv280Form" property="rsv280Public" styleId="rsv280Public1" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PUBLIC_KBN_PLANS) %>" /><span class="text_base"><label for="rsv280Public1"><gsmsg:write key="reserve.175" /></label>&nbsp;</span>
      <html:radio name="rsv280Form" property="rsv280Public" styleId="rsv280Public2" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PUBLIC_KBN_GROUP) %>" /><span class="text_base"><label for="rsv280Public2"><gsmsg:write key="reserve.176" /></label>&nbsp;</span>
    </td>
    </tr>

    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table width="100%">
    <tr>
    <td width="100%" align="right" cellpadding="5" cellspacing="0">
      <input type="button" value="OK" class="btn_ok1" onClick="buttonPush('rsv280ok');">
      <input type="button" value="<gsmsg:write key="cmn.back.admin.setting" />" class="btn_back_n3" onClick="buttonPush('rsv280back');">
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