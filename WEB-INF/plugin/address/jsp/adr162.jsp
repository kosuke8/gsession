<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>

<% String close = String.valueOf(jp.groupsession.v2.usr.GSConstUser.INDIVIDUAL_INFO_CLOSE); %>

<% String markOther    = String.valueOf(jp.groupsession.v2.cmn.GSConst.CONTYP_OTHER); %>
<% String markTel      = String.valueOf(jp.groupsession.v2.cmn.GSConst.CONTYP_TEL); %>
<% String markMail     = String.valueOf(jp.groupsession.v2.cmn.GSConst.CONTYP_MAIL); %>
<% String markWeb      = String.valueOf(jp.groupsession.v2.cmn.GSConst.CONTYP_WEB);  %>
<% String markMeeting  = String.valueOf(jp.groupsession.v2.cmn.GSConst.CONTYP_MEETING);   %>

<%-- <gsmsg:write key="adr.mark.image" /> --%>
<%
  java.util.HashMap imgMap = new java.util.HashMap();
  jp.groupsession.v2.struts.msg.GsMessage gsMsg = new jp.groupsession.v2.struts.msg.GsMessage();
  String msgTel = gsMsg.getMessage(request, "cmn.phone");
  String msgMail = gsMsg.getMessage(request, "cmn.mail");
  String msgMeeting = gsMsg.getMessage(request, "address.28");
  String msgOther = gsMsg.getMessage(request, "cmn.other");

  imgMap.put(markTel, "<img src=\"../address/images/call.gif\" alt=" + "\"" + msgTel + "\"" + " border=\"0\" class=\"img_bottom\">");
  imgMap.put(markMail, "<img src=\"../address/images/mail.gif\" alt=" + "\"" + msgMail + "\"" + " border=\"0\" class=\"img_bottom\">");
  imgMap.put(markWeb, "<img src=\"../address/images/web.gif\" alt=\"Web\" border=\"0\" class=\"img_bottom\">");
  imgMap.put(markMeeting, "<img src=\"../address/images/uchiawase.gif\" alt=" + "\"" + msgMeeting + "\"" + " border=\"0\" class=\"img_bottom\">");

  imgMap.put("none", "&nbsp;");
%>

<%
  java.util.HashMap imgTextMap = new java.util.HashMap();
  imgTextMap.put(markTel, msgTel);
  imgTextMap.put(markMail, msgMail);
  imgTextMap.put(markWeb, "Web");
  imgTextMap.put(markMeeting, msgMeeting);
  imgTextMap.put(markOther, msgOther);

  imgTextMap.put("none", "&nbsp;");
%>

<html:html>
<head>
<title>[Group Session] <gsmsg:write key="address.6" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../address/js/adr161.js?<%= GSConst.VERSION_PARAM %>"></script>
</head>

<body class="body_03">
<html:form action="/address/adr162">

<input type="hidden" name="CMD" value="">
<input type="hidden" name="adr161TmpFileId" value="">
<html:hidden property="seniFlg" />
<html:hidden property="adr160ProcMode" />
<html:hidden property="adr160EditSid" />
<html:hidden property="adr160pageNum1" />
<html:hidden property="adr160pageNum2" />


<%@ include file="/WEB-INF/plugin/address/jsp/adr010_hiddenParams.jsp" %>

<!--　BODY -->
<table width="100%" cellpadding="5" cellspacing="0">
<tr>
<td width="100%" align="center">

  <table width="80%" cellpadding="0" cellspacing="0">
  <tr>
  <td align="left">

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../address/images/header_address_01.gif" border="0" alt="<gsmsg:write key="cmn.addressbook" />"></td>
    <td width="0%" class="header_white_bg_text" align="right" valign="middle" nowrap><span class="plugin_ttl"><gsmsg:write key="cmn.addressbook" /></span></td>

    <td width="100%" class="header_white_bg_text">[ <gsmsg:write key="address.6" /> ]</td>
    <td width="0%"><img src="../common/images/header_white_end.gif" border="0" alt="<gsmsg:write key="cmn.addressbook" />"></td>
    </tr>
    </table>

  <logic:messagesPresent message="false">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tl0">
    <tr>
    <td align="left"><html:errors/><br></td>
    </tr>
    </table>
  </logic:messagesPresent>

  </td>
  </tr>

  <tr>
  <td>
  <img src="../common/images/spacer.gif" width="10" height="10" border="0" alt="">
  </td>
  </tr>

  <tr>
  <td>

    <table cellpadding="5" cellspacing="0" border="0" width="100%" class="tl_u2">

    <!-- <gsmsg:write key="cmn.target" /> -->
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" width="20%" nowrap>
    <span class="text_bb1"><gsmsg:write key="cmn.target" /></span>
    </td>
    <td valign="middle" align="left" class="td_wt">
      <span class="text_base">
        <bean:write name="adr162Form" property="adr161ContactUserComName" />
        <logic:notEmpty name="adr162Form" property="adr161ContactUserComName">&nbsp;&nbsp;</logic:notEmpty>
        <bean:write name="adr162Form" property="adr161ContactUserName" />
      </span>
    </td>
    </tr>

    <!--  <gsmsg:write key="cmn.title" /> -->
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" width="20%" nowrap>
    <span class="text_bb1"><gsmsg:write key="cmn.title" /></span>
    </td>
    <td valign="middle" align="left" class="td_wt">
      <span class="text_base"><bean:write name="adr162Form" property="adr161title" /></span>
    </td>
    </tr>

    <!--  <gsmsg:write key="cmn.type" /> -->
    <bean:define id="imgMark"><bean:write name="adr162Form" property="adr161Mark" /></bean:define>
    <tr>
    <td class="table_bg_A5B4E1" colspan="2" nowrap><span class="text_bb1"><gsmsg:write key="cmn.type" /></span></td>
    <td align="left" class="td_wt">
      <span class="text_base">
      <%-- <gsmsg:write key="cmn.mark" /> --%><% java.lang.String key = "none";  if (imgMap.containsKey(imgMark)) { key = imgMark; } %> <%= (java.lang.String) imgMap.get(key) %>
      <%-- <gsmsg:write key="cmn.text" /> --%><% java.lang.String txtkey = "none";  if (imgTextMap.containsKey(imgMark)) { txtkey = imgMark; } %> <%= (java.lang.String) imgTextMap.get(txtkey) %>
      </span>
    </td>
    </tr>

    <!--  <gsmsg:write key="address.114" /> -->
    <tr>
    <td class="table_bg_A5B4E1" colspan="2" nowrap><span class="text_bb1"><gsmsg:write key="address.114" /></span></td>
    <td align="left" class="td_wt">
    <span class="text_base">
    <bean:write name="adr162Form" property="adr161ContactFrom" />
&nbsp;<gsmsg:write key="tcd.153" />&nbsp;
    <bean:write name="adr162Form" property="adr161ContactTo" />
    </span>
    </td>
    </tr>

    <logic:equal name="adr162Form" property="projectPluginKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.PLUGIN_USE) %>">
    <!-- <gsmsg:write key="cmn.project" /> -->
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap><span class="text_bb1"><gsmsg:write key="cmn.project" /></span></td>
    <td valign="middle" align="left" class="td_wt">

      <span class="text_base">
      <logic:notEmpty name="adr162Form" property="adr161ProjectList">
      <logic:iterate id="prjData" name="adr162Form" property="adr161ProjectList">
        <bean:write name="prjData" property="label" /><br>
      </logic:iterate>
      </logic:notEmpty>
      </span>

    </td>
    </tr>
    </logic:equal>

    <!-- <gsmsg:write key="cmn.memo" /> -->
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap><span class="text_bb1"><gsmsg:write key="cmn.memo" /></span></td>
    <td valign="middle" align="left" class="td_wt">
    <span class="text_base">
    <bean:write name="adr162Form" property="adr161biko" filter="false" />
    </span>
    </td>
    </tr>

    <!-- <gsmsg:write key="schedule.117" /> -->
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap><span class="text_bb1"><gsmsg:write key="schedule.117" /></span></td>
    <td valign="middle" align="left" class="td_wt">
      <logic:notEmpty name="adr162Form" property="adr161DoujiUser">
        <logic:iterate id="doziUser" name="adr162Form" property="adr161DoujiUser" scope="request">
          <span class="text_base"><bean:write name="doziUser" property="adrSei" />&nbsp;&nbsp;<bean:write name="doziUser" property="adrMei" /></span><br>
        </logic:iterate>
      </logic:notEmpty>
    </td>
    </tr>

    <!-- <gsmsg:write key="cmn.attached" /> -->
    <tr>
    <td class="table_bg_A5B4E1" colspan="2" nowrap><span class="text_bb1"><gsmsg:write key="cmn.attached" /></span></td>
    <td align="left" class="td_wt">
    <logic:empty name="adr162Form" property="tmpFileList" scope="request">&nbsp;</logic:empty>
    <logic:notEmpty name="adr162Form" property="tmpFileList" scope="request">
      <table cellpadding="0" cellpadding="0" border="0">
      <logic:iterate id="fileMdl" name="adr162Form" property="tmpFileList" scope="request">
          <tr>
          <td width="0"><img src="../common/images/file_icon.gif" alt="<gsmsg:write key="cmn.file" />"></td>
          <td class="menu_bun"><a href="javascript:void(0);" onClick="return fileLinkClick('<bean:write name="fileMdl" property="binSid" />');"><span class="text_link"><bean:write name="fileMdl" property="binFileName" /><bean:write name="fileMdl" property="binFileSizeDsp" /></span></a></td>
          </tr>
      </logic:iterate>
      </table>
    </logic:notEmpty>
    </td>
    </tr>

    </table>
  </td>
  </tr>
  </table>
</td>
</tr>
</table>

<IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">

<table width="100%" class="tl0" border="0" cellpadding="0">
<tr>
  <td align="center">
    <input type="button" value="<gsmsg:write key="cmn.close" />" class="btn_close_n1" onClick="return window.close();">
  </td>
</tr>
</table>

</html:form>
<iframe type="hidden" src="../common/html/damy.html" style="display: none" name="navframe"></iframe>
</body>
</html:html>