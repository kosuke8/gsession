<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<%@ page import="jp.groupsession.v2.man.GSConstMain" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html:html>
<head>
<title>[GroupSession] <gsmsg:write key="main.man430.1" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/jquery-1.6.4.min.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../main/css/main.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<body class="body_03">
<html:form action="/main/man430kn">
<input type="hidden" name="CMD" value="">
<html:hidden property="man430ExtPageDspKbn" />
<html:hidden property="man430ExtDomainArea" />
<html:hidden property="man430InitFlg" />
<logic:notEmpty name="man430knForm" property="man430knPermittedDomains">
<logic:iterate id="permittedDomain" name="man430knForm" property="man430knPermittedDomains">
  <input type="hidden" name="man430knPermittedDomains" value="<bean:write name="permittedDomain" />">
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

    <!-- タイトル -->
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
      <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
      <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
      <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="main.man430.9" /> ]</td>
      <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
      <td width="50%"></td>
      <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
      <td class="header_glay_bg" width="50%">
        <input type="button" value="<gsmsg:write key="cmn.final" />" class="btn_setting_n1" onClick="buttonPush('confirm');">
        <input type="button" value="<gsmsg:write key="cmn.back2" />" class="btn_back_n1" onClick="buttonPush('back');">
      </td>
      <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

    <img src="../common/images/spacer.gif" border="0" height="10px" width="1px">
    <span class="TXT02"><html:errors/></span>
    <table width="100%" class="tl0" border="0" cellpadding="5">
    <%-- 外部ページ表示制限 --%>
    <tr>
      <td class="table_bg_A5B4E1" width="0%" nowrap>
        <span class="text_bb1"><gsmsg:write key="main.man430.2" /></span>
      </td>
      <td align="left" class="td_wt2" width="90%"  >
        <logic:equal name="man430knForm" property="man430ExtPageDspKbn" value="<%= String.valueOf(GSConstMain.DSP_EXT_PAGE_NO_LIMIT) %>">
          <gsmsg:write key="cmn.not.limit"/>
        </logic:equal>
        <logic:equal name="man430knForm" property="man430ExtPageDspKbn" value="<%= String.valueOf(GSConstMain.DSP_EXT_PAGE_LIMITED) %>">
          <gsmsg:write key="cmn.do.limit"/>
      </td>
    </tr>
    <tr id="extDomainArea">
      <td class="table_bg_A5B4E1" width="0%" nowrap id="outerSet">
        <span class="text_bb1"><gsmsg:write key="main.man430.12" /></span>
      </td>
      <td class="td_wt2">

        <logic:notEmpty name="man430knForm" property="man430knPermittedDomains">
          <logic:iterate id="man430knPermittedDomains" name="man430knForm" property="man430knPermittedDomains" scope="request">
            <gsmsg:write key="wml.231" /><bean:write name="man430knPermittedDomains" /><br>
          </logic:iterate>
        </logic:notEmpty>

        <logic:empty name="man430knForm" property="man430knPermittedDomains">
         <gsmsg:write key="main.man430.13" />
        </logic:empty>
        </logic:equal>
      </td>
    </tr>
    </table>

    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">

      <table width="100%">
        <tr>
        <td width="100%" align="right" cellpadding="5" cellspacing="0">
          <input type="button" value="<gsmsg:write  key="cmn.final" />" class="btn_setting_n1" onClick="buttonPush('confirm');">
          <input type="button" value="<gsmsg:write key="cmn.back2" />" class="btn_back_n1" onClick="buttonPush('back');">
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