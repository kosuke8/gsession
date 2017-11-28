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
<title>[GroupSession] <gsmsg:write key="cmn.bulletin" /> <gsmsg:write key="bbs.bbs200.1" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../bulletin/css/bulletin.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<body class="body_03">

<html:form action="/bulletin/bbs210">

<input type="hidden" name="CMD" value="">
<html:hidden name="bbs210Form" property="backScreen" />
<html:hidden name="bbs210Form" property="s_key" />
<html:hidden name="bbs210Form" property="bbs010page1" />
<html:hidden name="bbs210Form" property="bbs210Init" />

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>
<!-- BODY -->
<table align="center"  cellpadding="5" cellspacing="0" border="0" width="100%">
<tr>
<td width="100%" align="center">

  <table cellpadding="0" cellspacing="0" border="0" width="70%">
  <tr>
  <td>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
      <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt=""></td>
      <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.preferences2" /></span></td>
      <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="bbs.bbs200.1" /> ]</td>
      <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt=""></td>
      </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td width="50%"></td>
        <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
        <td class="header_glay_bg" width="50%">
          <input type="button" value="<gsmsg:write key="cmn.setting" />" class="btn_setting_n1" onClick="buttonPush('bbs210Decision');">
          <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onClick="buttonPush('backBBSList');">
        <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
      </tr>
    </table>

    <table width="100%" class="tl0" border="0" cellpadding="5" style="margin-top: 10px">
      <tr>
        <td valign="middle" align="left" class="table_bg_A5B4E1" width="20%" nowrap rowspan="2">
          <span class="text_bb1"><gsmsg:write key="bbs.37" /></span>
        </td>
        <td valign="middle" align="left" class="td_wt" style="border-collapse: collapse;" id="iniPostTypeArea">
          <html:radio name="bbs210Form" styleId="iniPostType_01" property="bbs210IniPostType" value="<%= String.valueOf(jp.groupsession.v2.bbs.GSConstBulletin.CONTENT_TYPE_TEXT_PLAIN) %>" /><label for="iniPostType_01"><span class="text_base"><gsmsg:write key="wml.js.12" /></span></label>&nbsp;
          <html:radio name="bbs210Form" styleId="iniPostType_02" property="bbs210IniPostType" value="<%= String.valueOf(jp.groupsession.v2.bbs.GSConstBulletin.CONTENT_TYPE_TEXT_HTML) %>" /><label for="iniPostType_02"><span class="text_base"><gsmsg:write key="wml.109" /></span></label>
        </td>
      </tr>


    </table>

    <table cellpadding="0" cellspacing="0" width="100%" style="margin-top: 10px">
      <tr>
      <td align="right">
        <input type="button" value="<gsmsg:write key="cmn.setting" />" class="btn_setting_n1" onClick="buttonPush('bbs210Decision');">
        <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onClick="buttonPush('backBBSList');">
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
