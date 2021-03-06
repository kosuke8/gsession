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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../portal/js/ptl060kn.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>

<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<link rel=stylesheet href='../portal/css/portal.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>

<title>[Group Session] <gsmsg:write key="ptl.1" /> <gsmsg:write key="ptl.ptl060kn.1" /></title>
</head>

<!-- body -->
<body class="body_03" onload="initChgArea();">
<html:form action="/portal/ptl060kn">
<input type="hidden" name="CMD" value="init">
<html:hidden property="ptlPortalSid" />
<html:hidden property="ptl030sortPortal" />
<html:hidden property="ptl060init" />
<html:hidden property="ptl060area1" />
<html:hidden property="ptl060area2" />
<html:hidden property="ptl060area3" />
<html:hidden property="ptl060area4" />
<html:hidden property="ptl060area5" />
<%@ include file="/WEB-INF/plugin/portal/jsp/ptl_hiddenParams.jsp" %>

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>

<table align="center"  cellpadding="5" cellspacing="0" border="0" width="100%">

<tr>

<td width="100%" align="center">

  <table cellpadding="0" cellspacing="0" border="0" width="100%">

  <tr>
  <td>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
    <td width="100%" class="header_ktool_bg_text">[ <gsmsg:write key="ptl.1" /> <gsmsg:write key="ptl.ptl060kn.1" /> ]</td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt=""></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
      <input type="button" value="<gsmsg:write key="cmn.final" />" class="btn_base1" onClick="buttonPush2('ptl060knOk');">
      <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onClick="buttonPush2('ptl060knBack');">
    </td>
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

  </td>
  </tr>
  </table>

  <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

  <logic:messagesPresent message="false">
  <table width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><span class="TXT02"><html:errors/></span></td>
  </tr>
  </table>
  </logic:messagesPresent>
  <!-- 各プラグイン情報レイアウト -->

  <table width="100%" cellspacing="0" cellpadding="0" class="portal_space">

  <!-- 上 -->
  <tr>
  <td width="100%" id="mainScreenListTop">
    <div width="100%" class="portal_area">
    <img src="../common/images/spacer.gif" width="1px" height="90px" border="0">
    </div>
  </td>
  </tr>
  <tr>
  <td height="5" align="center" id="portal_space_Top">
    <img src="../common/images/spacer.gif" width="1px" height="5px" border="0">
  </td>
  </tr>

  <tr>
  <td>
    <table width="100%">
    <tr>
    <!-- 左-->
    <td width="33%" valign="top" id="mainScreenListLeft">
      <div width="100%"class="portal_area">
        <img src="../common/images/spacer.gif" width="1px" height="280px" border="0">
      </div>
    </td>

    <td id="left_space">
      <img src="../common/images/spacer.gif" width="10px" height="1px" border="0">
    </td>

    <!-- 中央 -->
    <td width="33%" valign="top" id="mainScreenListCenter">
      <div width="100%"class="portal_area">
        <img src="../common/images/spacer.gif" width="1px" height="280px" border="0">
      </div>
    </td>

    <td id="right_space">
      <img src="../common/images/spacer.gif" width="10px" height="1px" border="0">
    </td>

    <!-- 右 -->
    <td width="33%" valign="top" id="mainScreenListRight">
      <div width="100%"class="portal_area">
        <img src="../common/images/spacer.gif" width="1px" height="280px" border="0">
      </div>
    </td>
    </tr>
    </table>

  </td>
  </tr>

  <!-- 下 -->
  <tr>
  <td height="5" align="center" id="portal_space_Bottom">
    <img src="../common/images/spacer.gif" width="1px" height="5px" border="0">
  </td>
  </tr>

  <tr>
  <td width="100%" align="center" valign="top" id="mainScreenListBottom">
    <div width="100%" class="portal_area">
    <img src="../common/images/spacer.gif" width="1px" height="90px" border="0">
    </div>
  </td>
  </tr>

  </table>

</td>
</tr>
</table>
</html:form>

<!-- Footer -->
<%@ include file="/WEB-INF/plugin/common/jsp/footer001.jsp" %>


</body>

</html:html>