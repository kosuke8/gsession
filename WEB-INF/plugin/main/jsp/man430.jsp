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
<script language="JavaScript" src="../main/js/man430.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/jquery-1.6.4.min.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../main/css/main.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<body class="body_03" onload="hideExtDomainArea();">
<html:form action="/main/man430">
<input type="hidden" name="CMD" value="">
<html:hidden property="man430InitFlg" />

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
      <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="main.man430.1" /> ]</td>
      <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
      <td width="50%"></td>
      <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
      <td class="header_glay_bg" width="50%">
        <input type="button" value="OK" class="btn_ok1" onClick="buttonPush('OK');">
        <input type="button" value="<gsmsg:write key="cmn.back2" />" class="btn_back_n1" onClick="buttonPush('430_back');">
      </td>
      <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>
    <logic:messagesPresent message="false">
      <table width="100%">
      <tr>
        <td align="left"><span class="TXT02"><html:errors/></span></td>
      </tr>
      </table>
    </logic:messagesPresent>

    <div>
    <span class="text_base8"><gsmsg:write key="main.man430.3" /></span><br>
    <span class="text_base8"><gsmsg:write key="main.man430.4" /></span>
    </div>

    <table width="100%" class="tl0" border="0" cellpadding="5">
    <%-- 外部ページ表示制限 --%>
    <tr>
      <td class="table_bg_A5B4E1 td_wt2" width="0%" nowrap id="outerSet">
        <span class="text_bb1"><gsmsg:write key="main.man430.2" /></span>
      </td>
      <td align="left" class="td_wt2" width="90%"  >
        <html:radio styleId="extPageDspNoLimit" name="man430Form" property="man430ExtPageDspKbn" value="<%= String.valueOf(GSConstMain.DSP_EXT_PAGE_NO_LIMIT) %>" onclick="hideExtDomainArea();" />
          <label for="extPageDspNoLimit"><gsmsg:write key="cmn.not.limit" /></label>&nbsp;&nbsp;
        <html:radio styleId="extPageDspLimited" name="man430Form" property="man430ExtPageDspKbn" value="<%= String.valueOf(GSConstMain.DSP_EXT_PAGE_LIMITED) %>" onclick="hideExtDomainArea();" />
          <label for="extPageDspLimited"><gsmsg:write key="cmn.do.limit" /></label><br>
      </td>
      </tr>

      <%-- ページの表示を許可する外部ドメインを指定 --%>
      <tr id="extDomainArea">
      <td class="table_bg_A5B4E1" width="0%" nowrap id="outerSet">
        <span class="text_bb1"><gsmsg:write key="main.man430.12" /></span>
      </td>
      <td class="td_wt2">
      <div>
        <span class="text_base2"><gsmsg:write key="main.man430.5" /></span>
        <div>
           <html:textarea name="man430Form" property="man430ExtDomainArea" style="width:500px;" rows="6"/>
        </div>
        <span class="sc_ttl_sun"><gsmsg:write key="main.man430.7" /></span><br>
        <span class="sc_ttl_sun"><gsmsg:write key="main.man430.8" /></span><br>
      </div>
      </td>
      </tr>

    </table>

    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">

      <table width="100%">
        <tr>
        <td width="100%" align="right" cellpadding="5" cellspacing="0">
          <input type="button" value="OK" class="btn_ok1" onClick="buttonPush('OK');">
          <input type="button" value="<gsmsg:write key="cmn.back2" />" class="btn_back_n1" onClick="buttonPush('430_back');">
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