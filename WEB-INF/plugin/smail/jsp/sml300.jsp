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
<title>[Group Session] <gsmsg:write key="cmn.entry.label" /></title>
  <meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
  <theme:css filename="theme.css"/>
  <link rel="stylesheet" href="../common/css/default.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
  <script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
</head>

<body class="body_03">

<html:form action="/smail/sml300">


<input type="hidden" name="CMD" value="">
<html:hidden property="backScreen" />

<html:hidden property="smlViewAccount" />
<html:hidden property="smlLabelCmdMode" />
<html:hidden property="smlEditLabelId" />
<html:hidden property="smlAccountMode" />
<html:hidden property="smlAccountSid" />
<html:hidden property="sml300initKbn" />
<html:hidden property="sml290SortRadio" />
<html:hidden property="dspCount" />
<html:hidden property="sml240keyword" />
<html:hidden property="sml240group" />
<html:hidden property="sml240user" />
<html:hidden property="sml240svKeyword" />
<html:hidden property="sml240svGroup" />
<html:hidden property="sml240svUser" />
<html:hidden property="sml240sortKey" />
<html:hidden property="sml240order" />
<html:hidden property="sml240searchFlg" />

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>

<table align="center"  cellpadding="5" cellspacing="0" border="0" width="100%">
<tr>
<td width="100%" align="center">

  <table cellpadding="0" cellspacing="0" border="0" width="50%">
  <tr>
  <td>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt=""></td>
        <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
        <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="cmn.entry.label" /> ]</td>
        <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt=""></td>
      </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td width="50%"></td>
        <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
        <td class="header_glay_bg" width="50%">
          <input type="button" value="OK" class="btn_ok1" onClick="buttonPush('confirm');">
          <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onClick="buttonPush('labelList');">
        </td>
        <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
      </tr>
    </table>

  </td>
  </tr>
  <tr>
  <td>
    <img src="../common/images/spacer.gif" width="10" height="10" border="0" alt="">
  </td>
  </tr>

  <logic:messagesPresent message="false">
    <tr>
    <td>
    <table width="100%">
      <tr><td align="left"><html:errors/></td></tr>
    </table>
    </td>
    </tr>
  </logic:messagesPresent>

  <tr>
  <td>

    <table class="tl0" cellpadding="5" cellspacing="0" border="0" width="100%">
    <tr>
    <td class="table_bg_A5B4E1" width="30%" nowrap><span class="text_bb1"><gsmsg:write key="wml.102" /></span></td>
    <td align="left" class="td_wt" width="70%">
      <bean:write name="sml300Form" property="sml290accountName" />
    </td>
    </tr>
    <tr>
    <td class="table_bg_A5B4E1" width="30%" nowrap><span class="text_bb1"><gsmsg:write key="wml.74" /></span></td>
    <td align="left" class="td_wt" width="70%">
      <html:text name="sml300Form" property="sml300LabelName" maxlength="100" style="width:100%;" />
    </td>
    </tr>
    </table>

  </td>
  </tr>

  <tr>
  <td>
    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0" alt="<gsmsg:write key="cmn.space" />">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td width="100%" align="right">
          <input type="button" value="OK" class="btn_ok1" onClick="buttonPush('confirm');">
          <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onClick="buttonPush('labelList');">
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