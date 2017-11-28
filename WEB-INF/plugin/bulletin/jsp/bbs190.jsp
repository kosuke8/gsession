<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-groupTree.tld" prefix="groupTree" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html:html>
<head>
<title>[GroupSession] <gsmsg:write key="cmn.grouplist" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../bulletin/js/bbs190.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../common/css/tree.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<body class="body_03" onload="checkedForum(); setParentForumDisabled(); doScrollForumFrame();" style="overflow:auto;">
<html:form action="/bulletin/bbs190">

<html:hidden property="parentName" />

<!-- BODY 通常時 -->
<table>
<tr>
<td width="100%">

  <div class="dep1">
    <input id="parentForumSid0" type=radio name="forumSid" value="0" onchange="onParentForumSubmit('0')">
    <label for="parentForumSid0">
      <font class="text_r1">※<gsmsg:write key="user.145" /></font>
    </label>
  </div>

  <logic:notEmpty name="bbs190Form" property="forumList">
  <logic:iterate id="fList" name="bbs190Form" property="forumList">

  <bean:define id="cLevel" name="fList" property="classLevel" />
  <% int intLevel = ((Integer) cLevel).intValue(); %>
  <% int dep = 27 * intLevel - 17; %>
  <div style="padding-left:<%= dep %>;">

    <input id="parentForumSid<bean:write name="fList" property="forumSid"/>"
      type="radio" name="forumSid" value="<bean:write name="fList" property="forumSid"/>"
      onchange="onParentForumSubmit(<bean:write name="fList" property="forumSid"/>)">

    <label for="parentForumSid<bean:write name="fList" property="forumSid"/>">

    <%-- フォーラム画像default --%>
    <logic:equal name="fList" property="binSid" value="0">
      <img width="20" height="20" src="../bulletin/images/cate_icon01.gif" alt="<gsmsg:write key="bbs.3" />">
    </logic:equal>

    <%-- フォーラム画像original --%>
    <logic:notEqual name="fList" property="binSid" value="0">
      <img width="20" height="20" alt="<gsmsg:write key="bbs.3" />"
       src="../bulletin/bbs010.do?CMD=getImageFile&bbs010BinSid=<bean:write name="fList" property="binSid" />&bbs010ForSid=<bean:write name="fList" property="forumSid" />">
    </logic:notEqual>

    <font class="text_link1" id="parentForumSid<bean:write name="fList" property="forumSid"/>">
      <bean:write name="fList" property="forumName"/>
    </font>

    </label>

  </div>
  </logic:iterate>
  </logic:notEmpty>

</td>
</tr>

</table>

</html:form>
</body>

</html:html>