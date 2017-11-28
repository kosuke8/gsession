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
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../bulletin/css/bulletin.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<script language="JavaScript" src="../bulletin/js/bbsptl020.js?<%= GSConst.VERSION_PARAM %>"></script>

<title>[Group Session] <gsmsg:write key="bbs.1" /></title>
</head>

<!-- BODY -->
<body class="body_03" onload="closeWindow();">

<html:form action="/bulletin/bbsptl020">

<input type="hidden" name="CMD" value="init">
<html:hidden property="ptlPortalSid" />

<html:hidden property="bbsptl020forumSid" />
<html:hidden property="bbsptl020selectFlg" />
<logic:notEmpty name="bbsptl020Form" property="bbsPtl020createdForumList">
<logic:iterate id="fsid" name="bbsptl020Form" property="bbsPtl020createdForumList">
  <input type="hidden" name="bbsPtl020createdForum" value="<bean:write name="fsid" />">
</logic:iterate>
</logic:notEmpty>

<table align="center"  cellpadding="5" cellspacing="0" border="0" width="100%">
<tr>
<td width="100%" align="center">

  <table cellpadding="0" cellspacing="0" border="0" width="90%">

  <tr>
  <td>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../bulletin/images/header_bulletin_01.gif" border="0" alt=""></td>
    <td width="0%" class="header_white_bg_text" align="right" valign="middle" nowrap><span class="plugin_ttl"><gsmsg:write key="cmn.bulletin" /></span></td>
    <td width="100%" class="header_white_bg_text">[ <gsmsg:write key="bbs.9" /> ]</td>
    <td width="0%" class="header_white_bg">
      <input type="button" value="<gsmsg:write key="cmn.close" />" class="btn_close_n1" onClick="window.close();">
    </td>
    <td width="0%"><img src="../common/images/header_white_end.gif" border="0" alt="<gsmsg:write key="ptl.1" />"></td>
    </tr>
    </table>
  </td>
  </tr>

  <tr>
  <td>
  <img src="../common/images/spacer.gif" width="10px" height="20px" border="0"><br>
  <span class="text_base"><gsmsg:write key="bbs.ptl020.2" /></span>
  </td>
  </tr>

  <tr>
  <td>
    <table class="tl0" cellpadding="5" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="15%" class="td_type25_2" align="center" nowrap><span class="text_todo_head"><gsmsg:write key="ptl.21" /></span></td>
    <td class="td_type1">
      <logic:notEmpty name="bbsptl020Form" property="portletTypeCombo">
      <html:select property="ptl080PluginPortlet" onchange="buttonPush('bbsChangeCombo');">
        <html:optionsCollection property="portletTypeCombo" value="value" label="label" />
      </html:select>
      </logic:notEmpty>
    </td>
    </tr>
    </table>
  </td>
  </tr>

  <tr>
  <td>
    <img src="../common/images/spacer.gif" style="width:100px; height:10px;" border="0" alt="">
  </td>
  </tr>
  <tr>
  <td>

    <table class="tl0" cellpadding="5" cellspacing="0" border="0" width="100%">

    <tr>
    <ul class="none_mark_list">
        <li class="forum_list_header"><gsmsg:write key="bbs.3" /></li>

    <bean:define id="tdColor" value="" />
    <% String[] tdColors = new String[] {"td_type1", "td_type25_2"}; %>

    <logic:notEmpty name="bbsptl020Form" property="forumList">
    <logic:iterate id="forInfModel" name="bbsptl020Form" property="forumList" indexId="idx">

    <% tdColor = tdColors[(idx.intValue() % 2)]; %>
    <bean:define id="fLevel" name="forInfModel" property="bfiLevel" />
    <% int intLevel = ((Integer) fLevel).intValue(); %>
    <% int dep = 36 * intLevel - 36; %>

      <li class="forum_list_content" style="margin-left:<%= dep %>;">
      <div class="forum_li_portal">
        <!-- フォーラム画像default -->
        <logic:equal name="forInfModel" property="binSid" value="0">
          <img class="img_bottom forum_icon_portal" src="../bulletin/images/cate_icon01.gif" alt="<gsmsg:write key="bbs.3" />">
        </logic:equal>

        <!-- フォーラム画像original -->
        <logic:notEqual name="forInfModel" property="binSid" value="0">
          <img class="img_bottom forum_icon_portal" width="30px" height="30px" src="../bulletin/bbsptl020.do?CMD=getImageFile&bbsptl020binSid=<bean:write name="forInfModel" property="binSid" />&bbsptl020forumSid=<bean:write name="forInfModel" property="bfiSid" />" alt="<gsmsg:write key="bbs.3" />">
        </logic:notEqual>

        <a href="javascript:void(0);" id="forum_link<bean:write name="forInfModel" property="bfiSid" />" onClick="return selectForum('<bean:write name="forInfModel" property="bfiSid" />');">
          <span class="text_link"><bean:write name="forInfModel" property="bfiName" /></span>
        </a>

      </div>
      </li>

    </logic:iterate>
    </logic:notEmpty>
    </ul>
    </tr>

    </table>

  </td>
  </tr>

  </table>

</td>
</tr>
</table>

</body>
</html:form>

<!-- Footer -->
<%@ include file="/WEB-INF/plugin/common/jsp/footer001.jsp" %>

</html:html>
