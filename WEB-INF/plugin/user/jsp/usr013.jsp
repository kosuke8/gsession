<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html:html>
<head>
<title>[GroupSession] <gsmsg:write key="user.usr013.1" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../user/js/usr013.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/cmn110.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../user/css/user.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<body class="body_03" onunload="windowClose();">

<html:form action="/user/usr013">
<input type="hidden" name="CMD" value="">

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>
<!-- BODY -->
<table width="100%">
<tr>
<td width="100%" align="center" cellpadding="5" cellspacing="0">
  <table width="70%" cellpadding="0" cellspacing="0">
  <tr>
  <td align="left">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
    <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="user.usr013.1" /> ]</td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
      <input type="button" name="btn_add" class="btn_csv_n1" value="<gsmsg:write key="cmn.import" />" onClick="buttonPush('Usr013_groupImp');">
      <input type="button" name="btn_back" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('Usr013_Back');">
    </td>
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">
    <html:errors />
    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <!-- 取込みファイル -->
    <table cellpadding="5" cellspacing="0" border="0" width="100%" class="tl_u2">
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" width="0%" nowrap>
      <span class="text_bb1"><gsmsg:write key="cmn.capture.file" /></span><span class="text_r2">※</span>
    </td>
    <td valign="middle" align="left" class="td_wt6" width="0%" colspan="1">

      <input type="button" class="btn_attach" value="<gsmsg:write key="cmn.attached" />" name="attacheBtn" onClick="opnTemp('usr013selectFiles', '<bean:write name="usr013Form" property="usr013pluginId" />', '1', '0');">
      &nbsp;<input type="button" class="btn_delete" value="<gsmsg:write key="cmn.delete" />" name="dellBtn" onClick="buttonPush('delete');"><br>
      <html:select property="usr013selectFiles" styleClass="select01" multiple="false" size="1">
        <html:optionsCollection name="usr013Form" property="usr013FileLabelList" value="value" label="label" />
      </html:select>
    </td>
    <td valign="middle" align="left" class="td_wt7" width="100%" colspan="1">
      <% jp.groupsession.v2.struts.msg.GsMessage gsMsg = new jp.groupsession.v2.struts.msg.GsMessage(); %>
      <% String csvFileMsg = "<a href=\"../user/usr013.do?CMD=Usr013_sample&sample=1\">" + gsMsg.getMessage(request, "user.141") + "</a>"; %>
      &nbsp;<span class="text_base">*<gsmsg:write key="cmn.plz.specify2" arg0="<%= csvFileMsg %>" /></span>
      <br>&nbsp;<span class="text_base">*<gsmsg:write key="user.91" />⇒<a href="../user/usr013.do?CMD=Usr013_sample&sample=1">【<gsmsg:write key="cmn.download" />】</a></span>
    </td>
    </tr>

    <!--  上書き -->
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" nowrap>
      <span class="text_bb1"><gsmsg:write key="cmn.overwrite" /></span>
    </td>
    <td valign="middle" align="left" class="td_wt" colspan="2">
    <html:checkbox name="usr013Form" property="usr013updateFlg" value="1" styleId="updateFlg" /><label for="updateFlg" class="text_base"><gsmsg:write key="user.24" /></label>
    </td>
    </tr>

    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table width="100%">
    <tr>
    <td width="100%" align="right" cellpadding="5" cellspacing="0">
      <input type="button" name="btn_add" class="btn_csv_n1" value="<gsmsg:write key="cmn.import" />" onClick="buttonPush('Usr013_groupImp');">
      <input type="button" name="btn_back" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('Usr013_Back');">
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

<%@ include file="/WEB-INF/plugin/common/jsp/footer001.jsp" %>
</body>
</html:html>