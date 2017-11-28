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
<title>[GroupSession] <gsmsg:write key="main.man040.1" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../main/js/man420.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/jquery-1.6.4.min.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<body class="body_03" onLoad="initLoad()">
<html:form action="/main/man420">
<input type="hidden" name="CMD" value="">
<html:hidden property="man420InitFlg"/>
<html:hidden property="man420ImportFolder"/>
<html:hidden property="man420ImpSuccessFolder"/>
<html:hidden property="man420ImpFailedFolder"/>

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>
<!--　BODY -->
<table width="100%">
<tr>
<td width="100%" align="center" cellpadding="5" cellspacing="0">

  <table width="70%" cellpadding="0" cellspacing="0">
  <tr>
  <td>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
    <td width="50%" class="header_ktool_bg_text2">[ <gsmsg:write key="main.man420.2" /> ]</td>
    <td width="50%" class="header_ktool_bg" align="right"></td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt=""></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
      <input type="button" value="<gsmsg:write key="cmn.setting2" />" class="btn_setting_n1" onClick="buttonPush('setting');">
      <input type="button" value="<gsmsg:write key="cmn.back2" />" class="btn_back_n1" onClick="buttonPush('420_back');">
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

    <img src="../common/images/spacer.gif" border="0" height="10px" width="1px">

    <span class="TXT02"><html:errors/></span>

    <table width="100%" class="tl0" border="0" cellpadding="5">
    <tr>
    <td class="table_bg_A5B4E1" width="0%" nowrap><span class="text_bb1"><gsmsg:write key="main.man420.1" /></span></td>

    <td align="left" class="td_wt2" width="90%" style="border-right-style:none;" >

      <div>
        <label>
          <html:radio styleId="usrNotImpRadio" name="man420Form" property="man420UsrImpFlg" value="0" onclick="hideUsrTimeSelect()"/>
          <gsmsg:write key="main.man420.7" />
        </label>
        <label>
          <html:radio styleId="usrImpRadio" name="man420Form" property="man420UsrImpFlg" value="1" onclick="hideUsrTimeSelect()"/>
          <gsmsg:write key="main.man420.8" />
        </label>
        <% jp.groupsession.v2.struts.msg.GsMessage gsMsg = new jp.groupsession.v2.struts.msg.GsMessage(); %>
        &nbsp;<span class="text_base"><a href="../main/man420.do?CMD=man420_sample01&sample=1"><gsmsg:write key="user.91" /></a></span>
      </div>

      <img src="../common/images/spacer.gif" border="0" height="10px" width="1px">

      <div>
        <b><gsmsg:write key="main.man420.10" /></b><br>
        <bean:write name="man420Form" property="man420ImportFolder" filter="true"/>
      </div>
      <div>
        <b><gsmsg:write key="main.man420.11" /></b><br>
        <bean:write name="man420Form" property="man420ImpSuccessFolder" filter="true"/>
      </div>
      <div>
        <b><gsmsg:write key="main.man420.12" /></b><br>
        <bean:write name="man420Form" property="man420ImpFailedFolder" filter="true"/>
      </div>

    </td>

    <td align="right" class="td_wt2" width="10%" style="border-left-style:none;">
      <input type="button" value="<gsmsg:write key="main.man040.2" />" class="btn_base1" onClick="buttonPush('usrExeConf');">
    </td>

    </tr>

    <tr id="usrStartTimeSelect">
    <td class="table_bg_A5B4E1" width="0%" nowrap><span class="text_bb1"><gsmsg:write key="cmn.import" /><gsmsg:write key="main.man080.1" /></span></td>
    <td align="left" class="td_wt2" width="100%" colspan="2">

      <label>
        <html:radio styleId="usrImpFiveRadio" name="man420Form" property="man420UsrImpTimeSelect" value="0" onclick="hideUsrStartTime()"/>
        <gsmsg:write key="main.man420.4" />
      </label>
      <label>
        <html:radio styleId="usrImpHourRadio" name="man420Form" property="man420UsrImpTimeSelect" value="1" onclick="hideUsrStartTime()"/>
        <gsmsg:write key="main.man420.5" />
      </label>
      <label>
        <html:radio styleId="usrImpPointRadio" name="man420Form" property="man420UsrImpTimeSelect" value="2" onclick="hideUsrStartTime()"/>
        <gsmsg:write key="main.man420.6" />
      </label>

    </td>
    </tr>

    <tr id="usrStartTime">
    <td class="table_bg_A5B4E1" width="0%" nowrap><span class="text_bb1"><gsmsg:write key="cmn.starttime" /></span></td>
    <td align="left" class="td_wt2" width="100%" colspan="2">
      <html:select name="man420Form" property="man420UsrFrHour">
        <html:optionsCollection name="man420Form" property="man420UsrHourLabel" value="value" label="label" />
      </html:select>&nbsp;<gsmsg:write key="cmn.hour.input" /><gsmsg:write key="main.man040.3" />
    </td>
    </tr>

    </table>

    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table width="100%">
    <tr>
    <td width="100%" align="right" cellpadding="5" cellspacing="0">
      <input type="button" value="<gsmsg:write key="cmn.setting2" />" class="btn_setting_n1" onClick="buttonPush('setting');">
      <input type="button" value="<gsmsg:write key="cmn.back2" />" class="btn_back_n1" onClick="buttonPush('420_back');">
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