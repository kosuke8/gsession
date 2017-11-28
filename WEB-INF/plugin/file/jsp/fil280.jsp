<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>

<%
   String accessOff = String.valueOf(jp.groupsession.v2.fil.GSConstFile.ACCESS_KBN_OFF);
   String accessOn = String.valueOf(jp.groupsession.v2.fil.GSConstFile.ACCESS_KBN_ON);
%>

<html:html>
<head>
<title>[GroupSession] <gsmsg:write key="cmn.filekanri" /> <gsmsg:write key="fil.143" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<theme:css filename="theme.css"/>
<link rel=stylesheet href="../common/css/default.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
<link rel=stylesheet href="../file/css/file.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
<link rel=stylesheet href="../file/css/dtree.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../file/js/file.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/check.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/grouppopup.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../file/js/fil280.js?<%= GSConst.VERSION_PARAM %>"></script>
</head>

<body class="body_03">

<html:form styleId="fil280Form" action="/file/fil280">
<input type="hidden" name="CMD" value="">
<input type="hidden" name="cmnMode" value="">
<html:hidden property="backScreen" />
<html:hidden property="backDsp" />
<html:hidden property="fil010SelectCabinet" />
<html:hidden property="fil030SelectCabinet" />
<html:hidden property="fil010SelectDirSid" />
<html:hidden property="fil010DspCabinetKbn" />
<html:hidden property="filSearchWd" />

<html:hidden property="fil280svKeyword" />
<html:hidden property="fil280svGroup" />
<html:hidden property="fil280svUser" />
<html:hidden property="fil280searchFlg" />

<logic:notEmpty name="fil280Form" property="fil040SelectDel" scope="request">
  <logic:iterate id="del" name="fil280Form" property="fil040SelectDel" scope="request">
    <input type="hidden" name="fil040SelectDel" value="<bean:write name="del"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="fil280Form" property="fil010SelectDelLink" scope="request">
  <logic:iterate id="del" name="fil280Form" property="fil010SelectDelLink" scope="request">
    <input type="hidden" name="fil010SelectDelLink" value="<bean:write name="del"/>">
  </logic:iterate>
</logic:notEmpty>

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>
<!-- BODY -->


<table align="center"  cellpadding="5" cellspacing="0" border="0" width="100%">
<tr>
<td align="center">

  <table cellpadding="0" cellspacing="0" border="0" width="70%">
  <tr>
  <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
  <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
  <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="cmn.filekanri" />　<gsmsg:write key="fil.143" /> ]</td>
  <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
  </tr>
  </table>

  <table cellpadding="0" cellspacing="0" border="0" width="70%">
  <tr>
  <td width="50%">
  </td>
  <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>

  <td class="header_glay_bg" width="50%">
  <logic:notEmpty name="fil280Form" property="fil280cabinetList">
  <input type="button" class="btn_base1" value="<gsmsg:write key="fil.fil220.1" />" onclick="CabinetDetailMulti();">
  </logic:notEmpty>
  <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onclick="buttonPush('fil280back');">
  </td>
  <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
  </tr>
  </table>

  <table cellpadding="0" cellspacing="0" border="0" width="70%">
  <tr>
  <td align="left">
    <p class="type_p">
    <html:text name="fil280Form" property="fil280keyword" maxlength="50" style="width:183px;" />
    <input type="button" onclick="buttonPush('fil280search');" class="btn_base0" value="<gsmsg:write key="cmn.search" />">
    &nbsp;
    <small><gsmsg:write key="cmn.group" /></small>
    <html:select name="fil280Form" property="fil280group" onchange="buttonPush('init');">
    <html:optionsCollection name="fil280Form" property="groupCombo" value="value" label="label" />
    </html:select>
    <input type="button" onclick="openGroupWindow(this.form.fil280group, 'fil280group', '0', 'init')" class="group_btn" value="&nbsp;&nbsp;" id="fil280GroupBtn">

    <small><gsmsg:write key="cmn.user" /></small>
    <html:select name="fil280Form" property="fil280user">
    <logic:iterate id="user" name="fil280Form" property="userCombo">
        <bean:define id="usrSidVal" name="user" property="value" />
        <logic:equal name="user" property="usrUkoFlg" value="1">
            <html:option styleClass="mukouser_option" value="<%=String.valueOf(usrSidVal) %>"><bean:write name="user" property="label" /></html:option>
        </logic:equal>
        <logic:notEqual name="user" property="usrUkoFlg" value="1">
            <html:option value="<%=String.valueOf(usrSidVal) %>"><bean:write name="user" property="label" /></html:option>
        </logic:notEqual>
    </logic:iterate>
    </html:select>
    </p>

    <logic:notEmpty name="fil280Form" property="fil280cabinetList">
    <dif>
      <input type="button" class="btn_base0" value="<gsmsg:write key="cmn.up" />" onclick="buttonPush('fil280up');">
      <input type="button" class="btn_base0" value="<gsmsg:write key="cmn.down" />" onclick="buttonPush('fil280down');">
      <br>
      <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">
    </dif>
    </logic:notEmpty>

    <logic:messagesPresent message="false">
      <html:errors />
      <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">
    </logic:messagesPresent>
  </td>
  </tr>

  <logic:notEmpty name="fil280Form" property="fil280cabinetList">
  <tr>
  <td align="left"><span class="text_base">※<gsmsg:write key="fil.fil220.2" /></span></td>
  </tr>
  </logic:notEmpty>
  </table>

  <logic:notEmpty name="fil280Form" property="fil280cabinetList">
  <!-- ページコンテンツ start -->
  <table cellpadding="0" cellspacing="0" width="70%">
  <tr>
  <td width="100%" valign="top">

    <!-- 一覧 -->
    <table class="tl0 prj_tbl_base3" width="100%" cellpadding="0" cellspacing="0">

    <tr>
    <th width="5%" class="td_type_file"></th>
    <th width="5%" class="td_type_file"><html:checkbox property="fil280allCheck" onclick="changeChk();" /></th>
    <th width="75%" class="td_type_file"><span class="text_prjtodo_list_head"><gsmsg:write key="cmn.name4" /></span></th>
    <th width="15%" class="td_type_file"><span class="text_prjtodo_list_head"><gsmsg:write key="fil.103" /></span></th>
    <th width="5%" class="td_type_file"></th>
    </tr>

    <% String[] td_colors = new String[] {"td_type_file1", "td_type_file2"}; %>

    <logic:iterate id="cabinetModel" name="fil280Form" property="fil280cabinetList" indexId="idx">

    <bean:define id="cabinetSid" name="cabinetModel" property="fcbSid" />

    <tr class="<%= td_colors[idx.intValue() % 2] %>">
    <td class="prj_td" align="center">
      <html:radio property="fil280sltRadio" value="<%= String.valueOf(cabinetSid) %>" />
    </td>
    <td class="prj_td" align="center">
      <html:multibox name="fil280Form" property="fil220sltCheck" value="<%= String.valueOf(cabinetSid) %>" />
    </td>
    <td class="prj_td" align="left">
      <img src="../file/images/cabinet.gif" border="0" alt="" style="vertical-align:bottom;">&nbsp;
      <span class="text_base"><bean:write name="cabinetModel" property="fcbName" /></span>
    </td>
    <td class="prj_td" align="center">
      <logic:equal name="cabinetModel" property="fcbAccessKbn" value="<%= accessOn %>">
      <img src="../file/images/file_lock.gif" width="20" height="20" border="0">
      </logic:equal>
    </td>
    <td class="prj_td" align="center">
      <input type="button" class="btn_change" name="btnChange" value="<gsmsg:write key="cmn.change" />" onClick="CabinetDetail('<bean:write name="cabinetModel" property="fcbSid" />');">
    </td>
    </tr>

    </logic:iterate>

    </table>

    <img src="../file/images/file_lock.gif" width="20" height="20" border="0" alt="" style="vertical-align:bottom;">&nbsp;<span class="text_base">：<gsmsg:write key="fil.fil220.3" /></span>
  </td>
  </tr>
  </table>

  <table cellpadding="0" cellspacing="0" width="70%">
  <tr>
  <td align="right">
    <input type="button" class="btn_base1" value="<gsmsg:write key="fil.fil220.1" />" onclick="CabinetDetailMulti();">
    <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onclick="buttonPush('fil280back');">
  </td>
  </tr>
  </table>
  </logic:notEmpty>

</td>
</tr>
</table>

</html:form>

<%@ include file="/WEB-INF/plugin/common/jsp/footer001.jsp" %>
</body>
</html:html>
