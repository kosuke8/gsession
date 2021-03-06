<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>

<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<logic:equal name="adr020knForm" property="adr020viewFlg" value="1">
<title>[Group Session] <gsmsg:write key="address.src.2" /></title>
</logic:equal>
<logic:notEqual name="adr020knForm" property="adr020viewFlg" value="1">
<title>[Group Session] <gsmsg:write key="address.adr020kn.1" /></title>
</logic:notEqual>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href="../common/css/default.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
<link rel=stylesheet href="../address/css/address.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
</head>

<body class="body_03">

<html:form action="/address/adr020kn">

<logic:notEqual name="adr020knForm" property="adr020webmail" value="1">
<jsp:include page="/WEB-INF/plugin/common/jsp/header001.jsp" />
</logic:notEqual>

<input type="hidden" name="CMD" value="">

<jsp:include page="/WEB-INF/plugin/address/jsp/adr010_hiddenParams.jsp" />

<html:hidden property="adr020viewFlg" />
<html:hidden property="adr020init" />
<html:hidden property="adr020ProcMode" />
<html:hidden property="adr020BackId" />
<html:hidden property="adr160pageNum1" />
<html:hidden property="adr160pageNum2" />
<html:hidden property="sortKey" />
<html:hidden property="orderKey" />
<html:hidden property="adr020unameSei" />
<html:hidden property="adr020unameMei" />
<html:hidden property="adr020unameSeiKn" />
<html:hidden property="adr020unameMeiKn" />
<html:hidden property="adr020selectCompany" />
<html:hidden property="adr020selectCompanyBase" />
<html:hidden property="adr020syozoku" />
<html:hidden property="adr020position" />
<html:hidden property="adr020mail1" />
<html:hidden property="adr020mail1Comment" />
<html:hidden property="adr020mail2" />
<html:hidden property="adr020mail2Comment" />
<html:hidden property="adr020mail3" />
<html:hidden property="adr020mail3Comment" />
<html:hidden property="adr020tel1" />
<html:hidden property="adr020tel1Nai" />
<html:hidden property="adr020tel1Comment" />
<html:hidden property="adr020tel2" />
<html:hidden property="adr020tel2Nai" />
<html:hidden property="adr020tel2Comment" />
<html:hidden property="adr020tel3" />
<html:hidden property="adr020tel3Nai" />
<html:hidden property="adr020tel3Comment" />
<html:hidden property="adr020fax1" />
<html:hidden property="adr020fax1Comment" />
<html:hidden property="adr020fax2" />
<html:hidden property="adr020fax2Comment" />
<html:hidden property="adr020fax3" />
<html:hidden property="adr020fax3Comment" />
<html:hidden property="adr020postno1" />
<html:hidden property="adr020postno2" />
<html:hidden property="adr020tdfk" />
<html:hidden property="adr020address1" />
<html:hidden property="adr020address2" />
<html:hidden property="adr020biko" />

<html:hidden property="adr020webmail" />

<logic:notEmpty name="adr020knForm" property="adr010SearchTargetContact" scope="request">
  <logic:iterate id="target" name="adr020knForm" property="adr010SearchTargetContact" scope="request">
    <input type="hidden" name="adr010SearchTargetContact" value="<bean:write name="target"/>">
  </logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="adr020knForm" property="adr010svSearchTargetContact" scope="request">
  <logic:iterate id="svTarget" name="adr020knForm" property="adr010svSearchTargetContact" scope="request">
    <input type="hidden" name="adr010svSearchTargetContact" value="<bean:write name="svTarget"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="adr020knForm" property="adr020tantoList">
<logic:iterate id="tantoList" name="adr020knForm" property="adr020tantoList">
  <input type="hidden" name="adr020tantoList" value="<bean:write name="tantoList" />">
</logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="adr020knForm" property="adr010searchLabel">
<logic:iterate id="searchLabel" name="adr020knForm" property="adr010searchLabel">
  <input type="hidden" name="adr010searchLabel" value="<bean:write name="searchLabel" />">
</logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="adr020knForm" property="adr010svSearchLabel">
<logic:iterate id="svSearchLabel" name="adr020knForm" property="adr010svSearchLabel">
  <input type="hidden" name="adr010svSearchLabel" value="<bean:write name="svSearchLabel" />">
</logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="adr020knForm" property="projectCmbList">
<logic:iterate id="project" name="adr020knForm" property="projectCmbList">
  <input type="hidden" name="projectCmbList" value="<bean:write name="project" />">
</logic:iterate>
</logic:notEmpty>

<html:hidden property="adr020tantoGroup" />

<logic:notEmpty name="adr020knForm" property="adr020label">
<logic:iterate id="label" name="adr020knForm" property="adr020label">
  <input type="hidden" name="adr020label" value="<bean:write name="label" />">
</logic:iterate>
</logic:notEmpty>

<html:hidden property="adr020permitView" />

<logic:notEmpty name="adr020knForm" property="adr020permitViewGroup">
<logic:iterate id="permitViewGroup" name="adr020knForm" property="adr020permitViewGroup">
  <input type="hidden" name="adr020permitViewGroup" value="<bean:write name="permitViewGroup" />">
</logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="adr020knForm" property="adr020permitViewUser">
<logic:iterate id="permitViewUser" name="adr020knForm" property="adr020permitViewUser">
  <input type="hidden" name="adr020permitViewUser" value="<bean:write name="permitViewUser" />">
</logic:iterate>
</logic:notEmpty>

<html:hidden property="adr020permitViewUserGroup" />
<html:hidden property="adr020permitEdit" />

<logic:notEmpty name="adr020knForm" property="adr020permitEditGroup">
<logic:iterate id="permitEditGroup" name="adr020knForm" property="adr020permitEditGroup">
  <input type="hidden" name="adr020permitEditGroup" value="<bean:write name="permitEditGroup" />">
</logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="adr020knForm" property="adr020permitEditUser">
<logic:iterate id="permitEditUser" name="adr020knForm" property="adr020permitEditUser">
  <input type="hidden" name="adr020permitEditUser" value="<bean:write name="permitEditUser" />">
</logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="adr020knForm" property="adr010selectSid">
<logic:iterate id="adrSid" name="adr020knForm" property="adr010selectSid">
  <input type="hidden" name="adr010selectSid" value="<bean:write name="adrSid" />">
</logic:iterate>
</logic:notEmpty>

<html:hidden property="adr110editAcoSid" />
<html:hidden property="adr110BackId" />

<html:hidden property="adr020permitEditUserGroup" />

<jsp:include page="/WEB-INF/plugin/address/jsp/adr330_hiddenParams.jsp" >
<jsp:param value="adr020knForm" name="thisFormName"/>
</jsp:include>


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
    <logic:equal name="adr020knForm" property="adr020viewFlg" value="1">
    <td width="100%" class="header_white_bg_text">[ <gsmsg:write key="address.src.2" /> ]</td>
    </logic:equal>
    <logic:notEqual name="adr020knForm" property="adr020viewFlg" value="1">
    <td width="100%" class="header_white_bg_text">[ <gsmsg:write key="address.adr020kn.1" /> ]</td>
    </logic:notEqual>
    <td width="0%"><img src="../common/images/header_white_end.gif" border="0" alt="<gsmsg:write key="cmn.addressbook" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
      <logic:equal name="adr020knForm" property="adr020viewFlg" value="1">
      <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('backAddressList');">
      </logic:equal>
      <logic:notEqual name="adr020knForm" property="adr020viewFlg" value="1">
      <input type="button" class="btn_base1" value="<gsmsg:write key="cmn.final" />" onClick="buttonPush('decision');">
      <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('backRegist');">
      </logic:notEqual>
      <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <logic:messagesPresent message="false">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr><td width="100%"><html:errors /></td></tr>
    </table>
    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">
    </logic:messagesPresent>

    <table cellpadding="5" cellspacing="0" border="0" width="100%" class="tl_u2">
    <tr>
    <td width="15%" valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap>
      <span class="text_bb1"><gsmsg:write key="cmn.name" /></span>
    </td>
    <td width="45%" valign="middle" align="left" class="td_wt">
      <span class="text_base"><bean:write name="adr020knForm" property="adr020unameSei" /> <bean:write name="adr020knForm" property="adr020unameMei" /></span>
    </td>

    <td width="15%" valign="middle" align="left" class="table_bg_A5B4E1" rowspan="5" nowrap>
      <span class="text_bb1"><gsmsg:write key="address.46" /></span>
    </td>

    <td width="30%" valign="top" align="left" class="td_wt" rowspan="5">
      <logic:notEmpty name="adr020knForm" property="selectTantoCombo">
      <span class="text_base">
      <logic:iterate id="user" name="adr020knForm" property="selectTantoCombo"  >
          <bean:define id="userValue" name="user" property="value" />
          <bean:define id="mukouserClass" value="" />
          <logic:equal name="user" property="usrUkoFlg" value="1"><bean:define id="mukouserClass" value="mukouser" /></logic:equal>
          <span class="<%=mukouserClass%>"><bean:write name="user" property="label" /></span><br>
      </logic:iterate>
      </span>
      </logic:notEmpty>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap>
      <span class="text_bb1"><gsmsg:write key="user.119" /></span>
    </td>
    <td valign="middle" align="left" class="td_wt">
      <span class="text_base"><bean:write name="adr020knForm" property="adr020unameSeiKn" /> <bean:write name="adr020knForm" property="adr020unameMeiKn" /></span>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap>
      <span class="text_bb1"><gsmsg:write key="cmn.select.company" /></span>
    </td>
    <td valign="middle" align="left" class="td_wt">
      <span class="text_base">
      <gsmsg:write key="address.7" />：<bean:write name="adr020knForm" property="adr020companyCode" /><br>
      <bean:write name="adr020knForm" property="adr020companyName" />&nbsp;&nbsp;&nbsp;<bean:write name="adr020knForm" property="adr020companyBaseName" /><br>
      </span>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap> <font class="text_bb1"><gsmsg:write key="cmn.affiliation" /></font> </td>
    <td valign="middle" align="left" class="td_wt"><span class="text_base"><bean:write name="adr020knForm" property="adr020syozoku" /></span></td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap>
      <span class="text_bb1"><gsmsg:write key="cmn.post" /></span>
    </td>
    <td valign="middle" align="left" class="td_wt">
      <span class="text_base"><bean:write name="adr020knForm" property="adr020knPositionName" /></span>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap> <font class="text_bb1"><gsmsg:write key="cmn.mailaddress1" /></font></td>
    <td valign="middle" align="left" class="td_wt">
      <span class="text_base"><bean:write name="adr020knForm" property="adr020mail1" /></span>&nbsp;
      <span class="attent1"><gsmsg:write key="cmn.comment" />：&nbsp;</span><span class="text_base"><bean:write name="adr020knForm" property="adr020mail1Comment" /></span>
    </td>
    <td valign="middle" align="left" class="table_bg_A5B4E1" rowspan="6" nowrap>
      <span class="text_bb1"><gsmsg:write key="cmn.label" /></span>
    </td>
    <td valign="middle" align="left" class="td_wt" rowspan="6">

      <logic:notEmpty name="adr020knForm" property="selectLabelList">
      <% String[] labelClass = {"td_label1", "td_label2"}; %>
      <table cellpadding="0" cellspacing="0" class="tl0 spacer" width="99%">

      <logic:iterate id="labelData" name="adr020knForm" property="selectLabelList" indexId="idx">
      <tr class="<%= labelClass[idx.intValue() % 2] %>">
      <td><bean:write name="labelData" property="albName" /></td>
      </tr>
      </logic:iterate>

      </table>
      </logic:notEmpty>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap> <font class="text_bb1"><gsmsg:write key="cmn.mailaddress2" /></font> </td>
    <td valign="middle" align="left" class="td_wt">
      <span class="text_base"><bean:write name="adr020knForm" property="adr020mail2" /></span>&nbsp;
      <span class="attent1"><gsmsg:write key="cmn.comment" />：&nbsp;</span><span class="text_base"><bean:write name="adr020knForm" property="adr020mail2Comment" /></span>
    </td>
    </tr>
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap> <font class="text_bb1"><gsmsg:write key="cmn.mailaddress3" /></font> </td>
    <td valign="middle" align="left" class="td_wt">
      <span class="text_base"><bean:write name="adr020knForm" property="adr020mail3" /></span>&nbsp;
      <span class="attent1"><gsmsg:write key="cmn.comment" />：&nbsp;</span><span class="text_base"><bean:write name="adr020knForm" property="adr020mail3Comment" /></span>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap><font class="text_bb1"><gsmsg:write key="cmn.tel1" /></font></td>
    <td valign="middle" align="left" class="td_wt">
      <span class="text_base"><bean:write name="adr020knForm" property="adr020tel1" /></span>&nbsp;
      <logic:notEmpty name="adr020knForm" property="adr020tel1Nai">
      <span class="attent1"><gsmsg:write key="address.58" />：&nbsp;</span><span class="text_base"><bean:write name="adr020knForm" property="adr020tel1Nai" /></span>
      </logic:notEmpty>
      <logic:notEmpty name="adr020knForm" property="adr020tel1Comment">
      <span class="attent1"><gsmsg:write key="cmn.comment" />：&nbsp;</span><span class="text_base"><bean:write name="adr020knForm" property="adr020tel1Comment" /></span>
      </logic:notEmpty>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap><font class="text_bb1"><gsmsg:write key="cmn.tel2" /></font></td>
    <td valign="middle" align="left" class="td_wt">
      <span class="text_base"><bean:write name="adr020knForm" property="adr020tel2" /></span>&nbsp;
      <logic:notEmpty name="adr020knForm" property="adr020tel2Nai">
      <span class="attent1"><gsmsg:write key="address.58" />：&nbsp;</span><span class="text_base"><bean:write name="adr020knForm" property="adr020tel2Nai" /></span>
      </logic:notEmpty>
      <logic:notEmpty name="adr020knForm" property="adr020tel2Comment">
      <span class="attent1"><gsmsg:write key="cmn.comment" />：&nbsp;</span><span class="text_base"><bean:write name="adr020knForm" property="adr020tel2Comment" /></span>
      </logic:notEmpty>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap><font class="text_bb1"><gsmsg:write key="cmn.tel3" /></font></td>
    <td valign="middle" align="left" class="td_wt">
      <span class="text_base"><bean:write name="adr020knForm" property="adr020tel3" /></span>&nbsp;
      <logic:notEmpty name="adr020knForm" property="adr020tel3Nai">
      <span class="attent1"><gsmsg:write key="address.58" />：&nbsp;</span><span class="text_base"><bean:write name="adr020knForm" property="adr020tel3Nai" /></span>
      </logic:notEmpty>
      <logic:notEmpty name="adr020knForm" property="adr020tel3Comment">
      <span class="attent1"><gsmsg:write key="cmn.comment" />：&nbsp;</span><span class="text_base"><bean:write name="adr020knForm" property="adr020tel3Comment" /></span>
      </logic:notEmpty>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap><font class="text_bb1">ＦＡＸ１</font></td>
    <td valign="middle" align="left" class="td_wt">
      <span class="text_base"><bean:write name="adr020knForm" property="adr020fax1" /></span>
      <logic:notEmpty name="adr020knForm" property="adr020fax1Comment">
      &nbsp;<span class="attent1"><gsmsg:write key="cmn.comment" />：&nbsp;</span><span class="text_base"><bean:write name="adr020knForm" property="adr020fax1Comment" /></span>
      </logic:notEmpty>
    </td>
    <td valign="middle" align="left" class="table_bg_A5B4E1" rowspan="4" nowrap>
      <span class="text_bb1"><gsmsg:write key="address.61" /></span>
    </td>
    <td valign="top" align="left" class="td_wt" rowspan="4">
      <bean:define id="permitView" name="adr020knForm" property="adr020permitView" type="java.lang.Integer"/>
      <% if (permitView.intValue() == jp.groupsession.v2.cmn.GSConst.ADR_VIEWPERMIT_NORESTRICTION) { %>
      <span class="attent1"><gsmsg:write key="cmn.no.setting.permission" /></span>
      <% } else if (permitView.intValue() == jp.groupsession.v2.cmn.GSConst.ADR_VIEWPERMIT_GROUP) { %>
      <span class="attent1"><gsmsg:write key="group.designation" />：</span>
      <br>
      <% } else if (permitView.intValue() == jp.groupsession.v2.cmn.GSConst.ADR_VIEWPERMIT_USER) { %>
      <span class="attent1"><gsmsg:write key="cmn.user.specified" />：</span>
      <br>
      <% } else { %>
      <span class="attent1"><gsmsg:write key="address.62" /></span>
      <% } %>
      <logic:notEmpty name="adr020knForm" property="selectPermitViewUser">
      <span class="text_base">
      <logic:iterate id="user" name="adr020knForm" property="selectPermitViewUser"  >
          <bean:define id="mukouserClass" value="" />
          <logic:equal name="user" property="usrUkoFlg" value="1"><bean:define id="mukouserClass" value="mukouser" /></logic:equal>
          <span class="<%=mukouserClass%>"><bean:write name="user" property="label" /></span><br>
      </logic:iterate>
      </span>
      </logic:notEmpty>

      <logic:equal name="adr020knForm" property="adr020permitView" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.ADR_VIEWPERMIT_GROUP) %>">
        <logic:notEmpty name="adr020knForm" property="adr020knPermitViewList">
        <span class="text_base">
          <logic:iterate id="permitViewName" name="adr020knForm" property="adr020knPermitViewList">
            <bean:write name="permitViewName" /><br>
          </logic:iterate>
        </span>
        </logic:notEmpty>
      </logic:equal>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap><font class="text_bb1">ＦＡＸ２</font></td>
    <td valign="middle" align="left" class="td_wt">
      <span class="text_base"><bean:write name="adr020knForm" property="adr020fax2" /></span>
      <logic:notEmpty name="adr020knForm" property="adr020fax2Comment">
      &nbsp;<span class="attent1"><gsmsg:write key="cmn.comment" />：&nbsp;</span><span class="text_base"><bean:write name="adr020knForm" property="adr020fax2Comment" /></span>
      </logic:notEmpty>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap><font class="text_bb1">ＦＡＸ３</font></td>
    <td valign="middle" align="left" class="td_wt">
      <span class="text_base"><bean:write name="adr020knForm" property="adr020fax3" /></span>
      <logic:notEmpty name="adr020knForm" property="adr020fax3Comment">
      &nbsp;<span class="attent1"><gsmsg:write key="cmn.comment" />：&nbsp;</span><span class="text_base"><bean:write name="adr020knForm" property="adr020fax3Comment" /></span>
      </logic:notEmpty>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" rowspan="4" nowrap> <font class="text_bb1"><gsmsg:write key="cmn.address" /></font> </td>
    <td valign="middle" align="left" class="table_bg_A5B4E1" nowrap><font class="text_bb1"><gsmsg:write key="cmn.postalcode" /></font></td>
    <td valign="middle" align="left" class="td_wt">
      <logic:notEmpty name="adr020knForm" property="adr020postno1">
      <logic:notEmpty name="adr020knForm" property="adr020postno2">
        <span class="text_base"><bean:write name="adr020knForm" property="adr020postno1" />-<bean:write name="adr020knForm" property="adr020postno2" /></span>
      </logic:notEmpty>
      </logic:notEmpty>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" nowrap> <font class="text_bb1"><gsmsg:write key="cmn.prefectures" /></font> </td>
    <td valign="middle" align="left" class="td_wt">
      <span class="text_base"><bean:write name="adr020knForm" property="adr020knTdfkName" /></span>
    </td>
    <td valign="middle" align="left" class="table_bg_A5B4E1" rowspan="4" nowrap>
      <span class="text_bb1"><gsmsg:write key="cmn.edit.permissions" /></span>
    </td>
    <td valign="top" align="left" class="td_wt" rowspan="4">
      <bean:define id="permitEdit" name="adr020knForm" property="adr020permitEdit" type="java.lang.Integer" />
      <% if (permitEdit.intValue() == jp.groupsession.v2.adr.GSConstAddress.EDITPERMIT_NORESTRICTION) { %>
      <span class="attent1"><gsmsg:write key="cmn.no.setting.permission" /></span>
      <% } else if (permitEdit.intValue() == jp.groupsession.v2.adr.GSConstAddress.EDITPERMIT_GROUP) { %>
      <span class="attent1"><gsmsg:write key="group.designation" />：</span>
      <br>
      <% } else if (permitEdit.intValue() == jp.groupsession.v2.adr.GSConstAddress.EDITPERMIT_USER) { %>
      <span class="attent1"><gsmsg:write key="cmn.user.specified" />：</span>
      <br>
      <% } else { %>
      <span class="attent1"><gsmsg:write key="address.62" /></span>
      <% } %>
      <logic:notEmpty name="adr020knForm" property="selectPermitEditUser">
      <span class="text_base">
      <logic:iterate id="user" name="adr020knForm" property="selectPermitEditUser"  >
          <bean:define id="mukouserClass" value="" />
          <logic:equal name="user" property="usrUkoFlg" value="1"><bean:define id="mukouserClass" value="mukouser" /></logic:equal>
          <span class="<%=mukouserClass%>"><bean:write name="user" property="label" /></span><br>
      </logic:iterate>
      </span>
      </logic:notEmpty>

      <logic:equal name="adr020knForm" property="adr020permitEdit" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.ADR_VIEWPERMIT_GROUP) %>">
        <logic:notEmpty name="adr020knForm" property="adr020knPermitEditList">
        <span class="text_base">
          <logic:iterate id="permitEditName" name="adr020knForm" property="adr020knPermitEditList">
            <bean:write name="permitEditName" /><br>
          </logic:iterate>
        </span>
        </logic:notEmpty>
      </logic:equal>

    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" nowrap> <font class="text_bb1"><gsmsg:write key="cmn.address1" /></font> </td>
    <td valign="middle" align="left" class="td_wt">
      <span class="text_base"><bean:write name="adr020knForm" property="adr020address1" /></span>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" nowrap> <font class="text_bb1"><gsmsg:write key="cmn.address2" /></font> </td>
    <td valign="middle" align="left" class="td_wt"><span class="text_base"><bean:write name="adr020knForm" property="adr020address2" /></span></td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap>
      <span class="text_bb1"><gsmsg:write key="cmn.memo" /></span>
    </td>
    <td valign="middle" align="left" class="td_wt"><span class="text_base"><bean:write name="adr020knForm" property="adr020knViewBiko" filter="false" /></span></td>
    </tr>

    </table>

    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table width="100%">
    <tr>
    <td width="100%" align="right" cellpadding="5" cellspacing="0">
      <logic:equal name="adr020knForm" property="adr020viewFlg" value="1">
      <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('backAddressList');">
      </logic:equal>
      <logic:notEqual name="adr020knForm" property="adr020viewFlg" value="1">
      <input type="button" class="btn_base1" value="<gsmsg:write key="cmn.final" />" onClick="buttonPush('decision');">
      <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('backRegist');">
      </logic:notEqual>
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

<jsp:include page="/WEB-INF/plugin/common/jsp/footer001.jsp" />

</body>
</html:html>