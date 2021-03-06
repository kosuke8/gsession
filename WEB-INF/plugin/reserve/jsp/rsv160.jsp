<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>

<html:html>
<head>
<title>[GroupSession] <gsmsg:write key="cmn.preferences2" />[<gsmsg:write key="cmn.show.timezone.days.setting" />]</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../reserve/js/rsv160.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../reserve/css/reserve.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<body class="body_03">
<html:form action="/reserve/rsv160">
<input type="hidden" name="CMD" value="">
<html:hidden property="backScreen" />
<html:hidden property="rsvBackPgId" />
<html:hidden property="rsvDspFrom" />
<html:hidden property="rsvSelectedGrpSid" />
<html:hidden property="rsvSelectedSisetuSid" />
<html:hidden property="rsv160initDspFlg" />

<%@ include file="/WEB-INF/plugin/reserve/jsp/rsvHidden.jsp" %>

<logic:notEmpty name="rsv160Form" property="rsv100CsvOutField" scope="request">
  <logic:iterate id="csvOutField" name="rsv160Form" property="rsv100CsvOutField" scope="request">
    <input type="hidden" name="rsv100CsvOutField" value="<bean:write name="csvOutField"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="rsv160Form" property="rsvIkkatuTorokuKey" scope="request">
  <logic:iterate id="key" name="rsv160Form" property="rsvIkkatuTorokuKey" scope="request">
    <input type="hidden" name="rsvIkkatuTorokuKey" value="<bean:write name="key"/>">
  </logic:iterate>
</logic:notEmpty>

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>

<table width="100%">
<tr>
<td width="100%" align="center">

  <table width="70%" class="tl0">
  <tr>
  <td align="left">

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../common/images/header_pset_01.gif" border="0" alt="<gsmsg:write key="cmn.preferences2" />"></td>
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.preferences2" /></span></td>
    <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="cmn.show.timezone.days.setting" /> ]</td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt=""></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="./images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
      <input type="button" name="btn_add" class="btn_ok1" value="OK" onclick="buttonPush('zikantai_settei_kakunin');">
      <input type="button" value="<gsmsg:write key="cmn.back.preferences" />" class="btn_back_n3" onclick="buttonPush('back_to_kojn_menu');">
    </td>
    <td width="0%"><img src="./images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>
<logic:messagesPresent message="false">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
         <td align="left"><html:errors/></td>
      </tr>
    </table>
</logic:messagesPresent>
    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table cellpadding="10" cellspacing="0" border="0" width="100%" class="tl_u2">
    <tr>
    <td width="10%" valign="middle" align="left" class="table_bg_A5B4E1" nowrap>
      <span class="text_bb1"><gsmsg:write key="cmn.show.timezone.days.setting" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span>
    </td>
    <td valign="middle" align="left" class="td_wt" >
      <span class="text_r1"><gsmsg:write key="cmn.comments" /><gsmsg:write key="reserve.rsv160.1" /></span><br>
      <span class="text_bb1"><gsmsg:write key="cmn.starttime" />：</span>
      <html:select property="rsv160SelectedFromSid">
        <html:optionsCollection name="rsv160Form" property="rsv160ourLabelList" value="value" label="label" />
      </html:select>
      <br>
      <span class="text_bb1"><gsmsg:write key="cmn.endtime" />：</span>
      <html:select property="rsv160SelectedToSid">
        <html:optionsCollection name="rsv160Form" property="rsv160ourLabelList" value="value" label="label" />
      </html:select>

    </td>
    </tr>
    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
    <td align="right">
      <input type="button" name="btn_add" class="btn_ok1" value="OK" onclick="buttonPush('zikantai_settei_kakunin');">
      <input type="button" value="<gsmsg:write key="cmn.back.preferences" />" class="btn_back_n3" onclick="buttonPush('back_to_kojn_menu');">
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