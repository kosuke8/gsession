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
<title>[GroupSession] <gsmsg:write key="user.usr032.3" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../user/css/user.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<body class="body_03">

<html:form action="/user/usr032kn">
<input type="hidden" name="CMD" value="">
<html:hidden property="processMode" />

<html:hidden property="usr030SearchKana" />
<html:hidden property="usr030cmdMode" />
<html:hidden property="usr030SearchFlg" />
<html:hidden property="selectgsid" />
<html:hidden property="usr030userId" />
<html:hidden property="usr030usrUkoFlg" />
<html:hidden property="usr030shainno" />
<html:hidden property="usr030sei" />
<html:hidden property="usr030mei" />
<html:hidden property="usr030seikn" />
<html:hidden property="usr030meikn" />
<html:hidden property="usr030agefrom" />
<html:hidden property="usr030ageto" />
<html:hidden property="usr030yakushoku" />
<html:hidden property="usr030mail" />
<html:hidden property="usr030tdfkCd" />
<html:hidden property="usr030seibetu" />
<html:hidden property="usr030entranceYearFr" />
<html:hidden property="usr030entranceMonthFr" />
<html:hidden property="usr030entranceDayFr" />
<html:hidden property="usr030entranceYearTo" />
<html:hidden property="usr030entranceMonthTo" />
<html:hidden property="usr030entranceDayTo" />
<html:hidden property="selectgsidSave" />
<html:hidden property="usr030userIdSave" />
<html:hidden property="usr030usrUkoFlgSave" />
<html:hidden property="usr030shainnoSave" />
<html:hidden property="usr030seiSave" />
<html:hidden property="usr030meiSave" />
<html:hidden property="usr030seiknSave" />
<html:hidden property="usr030meiknSave" />
<html:hidden property="usr030agefromSave" />
<html:hidden property="usr030agetoSave" />
<html:hidden property="usr030yakushokuSave" />
<html:hidden property="usr030mailSave" />
<html:hidden property="usr030tdfkCdSave" />
<html:hidden property="usr030seibetuSave" />
<html:hidden property="usr030entranceYearFrSave" />
<html:hidden property="usr030entranceMonthFrSave" />
<html:hidden property="usr030entranceDayFrSave" />
<html:hidden property="usr030entranceYearToSave" />
<html:hidden property="usr030entranceMonthToSave" />
<html:hidden property="usr030entranceDayToSave" />

<html:hidden property="selectgroup" />
<html:hidden property="usr031defgroup" />
<html:hidden property="usr032updateFlg" />
<html:hidden property="usr032PswdKbn" />
<html:hidden property="usr032createFlg" />
<html:hidden property="usr032cmdMode" />
<html:hidden property="usr032updatePassFlg" />

<logic:notEmpty name="usr032Form" property="usr030selectusers">
<logic:iterate id="usrSid" name="usr032Form" property="usr030selectusers">
  <input type="hidden" name="usr030selectusers" value="<bean:write name="usrSid" />">
</logic:iterate>
</logic:notEmpty>

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>

<logic:equal name="usr032Form" property="usr032cmdMode" value="<%= String.valueOf(jp.groupsession.v2.usr.GSConstUser.MODE_NORMAL) %>">
  <input type="hidden" name="helpPrm" value="0">
</logic:equal>

<logic:equal name="usr032Form" property="usr032cmdMode" value="<%= String.valueOf(jp.groupsession.v2.usr.GSConstUser.MODE_GROUP_ALL) %>">
  <input type="hidden" name="helpPrm" value="1">
</logic:equal>

<logic:equal name="usr032Form" property="usr032cmdMode" value="<%= String.valueOf(jp.groupsession.v2.usr.GSConstUser.MODE_MULTIPLE_GROUP) %>">
  <input type="hidden" name="helpPrm" value="2">
</logic:equal>

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
    <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="user.usr032kn.8" /> ]</td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
      <input type="button" name="btn_add" class="btn_base1" value="<gsmsg:write key="cmn.run" />" onClick="buttonPush('doImp');">
      <input type="button" name="btn_back" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('Usr032kn_Back');">
    </td>
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">
    <html:errors />
    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table cellpadding="3" cellspacing="0" border="0" width="100%" align="center">
    <tr>
    <td><span class="text_r1"><gsmsg:write key="cmn.capture.file.sure" /></span></td>
    </tr>
    </table>

    <!-- 取込みファイル -->
    <table cellpadding="5" cellspacing="0" border="0" width="100%" class="tl2" align="center">
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" width="0%" nowrap>
      <span class="text_bb1"><gsmsg:write key="cmn.capture.file" /></span>
    </td>
    <td valign="middle" align="left" class="td_nrlb" width="100%">
      <span class="text_base"><bean:write name="usr032knForm" property="usr032knFileName" /></span>
    </td>
    </tr>

    <!-- 取込み件数 -->
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" width="0%" nowrap>
      <span class="text_bb1"><gsmsg:write key="cmn.capture.item.count" /></span>
    </td>

    <td valign="middle" align="left" class="td_nrlb" width="100%">
      <logic:notEmpty name="usr032knForm" property="usr032knImpList" scope="request">
        <bean:size id="count" name="usr032knForm" property="usr032knImpList" scope="request" />
        <span class="text_base"><bean:write name="count" /><gsmsg:write key="cmn.number" /></span><br>
      </logic:notEmpty>
    </td>
    </tr>

    <logic:equal name="usr032Form" property="usr032cmdMode" value="<%= String.valueOf(jp.groupsession.v2.usr.GSConstUser.MODE_NORMAL) %>">
      <%@ include file="/WEB-INF/plugin/user/jsp/usr032kn_sub01.jsp" %>
    </logic:equal>
    <logic:equal name="usr032Form" property="usr032cmdMode" value="<%= String.valueOf(jp.groupsession.v2.usr.GSConstUser.MODE_GROUP_ALL) %>">
      <%@ include file="/WEB-INF/plugin/user/jsp/usr032kn_sub02.jsp" %>
    </logic:equal>
    <logic:equal name="usr032Form" property="usr032cmdMode" value="<%= String.valueOf(jp.groupsession.v2.usr.GSConstUser.MODE_MULTIPLE_GROUP) %>">
      <%@ include file="/WEB-INF/plugin/user/jsp/usr032kn_sub03.jsp" %>
    </logic:equal>

    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table width="100%">
    <tr>
    <td width="100%" align="right" cellpadding="5" cellspacing="0">
      <input type="button" name="btn_add" class="btn_base1" value="<gsmsg:write key="cmn.run" />" onClick="buttonPush('doImp');">
      <input type="button" name="btn_back" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('Usr032kn_Back');">
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