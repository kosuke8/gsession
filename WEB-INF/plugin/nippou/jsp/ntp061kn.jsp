<%@page import="jp.groupsession.v2.usr.model.UsrLabelValueBean"%>
<%@page import="jp.groupsession.v2.usr.UserUtil"%>
<%@page import="jp.groupsession.v2.cmn.model.base.CmnUsrmInfModel"%>
<%@ page pageEncoding="Windows-31J" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ taglib uri="/WEB-INF/ctag-jsmsg.tld" prefix="gsjsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<% String maxLengthSyosai = String.valueOf(1000); %>

<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[Group Session] <gsmsg:write key="ntp.1" /></title>
<gsjsmsg:js filename="gsjsmsg.js"/>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src='../common/js/jquery.bgiframe.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src='../schedule/jquery_ui/js/jquery-ui-1.8.14.custom.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/count.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/calendar.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/changestyle.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/grouppopup.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../address/js/adr240.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../nippou/js/ntp061.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/glayer.js"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href="../common/css/default.css" type="text/css">
<link rel=stylesheet href="../nippou/css/nippou.css" type="text/css">
<link rel=stylesheet href='../common/css/glayer.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href="../address/css/address.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
<link rel=stylesheet href='../schedule/jquery/jquery-theme.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../schedule/jquery_ui/css/jquery.ui.dialog.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<body class="body_03" onload="showLengthId($('#inputstr')[0], <%= maxLengthSyosai %>, 'inputlength');" onunload="calWindowClose();companyWindowClose();">

<input type="hidden" name="helpPrm" value="<bean:write name="ntp061knForm" property="ntp060ProcMode" />">
<logic:equal name="ntp061knForm" property="ntp061PopKbn" value="0">
 <jsp:include page="/WEB-INF/plugin/common/jsp/header001.jsp" />
</logic:equal>

<html:form action="/nippou/ntp061kn">
<div id="ntp061CompanyIdArea"><html:hidden property="ntp061CompanySid" /></div>
<div id="ntp061CompanyBaseIdArea"><html:hidden property="ntp061CompanyBaseSid" /></div>
<input type="hidden" name="CMD" value="">
<jsp:include page="/WEB-INF/plugin/nippou/jsp/ntp060_hiddenParams.jsp" />

<logic:notEmpty name="ntp061knForm" property="ntp060Mikomi" scope="request">
<logic:iterate id="mikomi" name="ntp061knForm" property="ntp060Mikomi" scope="request">
  <input type="hidden" name="ntp060Mikomi" value="<bean:write name="mikomi"/>">
</logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="ntp061knForm" property="ntp060Syodan" scope="request">
<logic:iterate id="syodan" name="ntp061knForm" property="ntp060Syodan" scope="request">
  <input type="hidden" name="ntp060Syodan" value="<bean:write name="syodan"/>">
</logic:iterate>
</logic:notEmpty>

<html:hidden property="ntp060ProcMode" />
<html:hidden property="ntp060NanSid" />
<html:hidden property="ntp061ReturnPage" />
<html:hidden property="ntp061InitFlg" />
<html:hidden property="ntp061TourokuName" />
<html:hidden property="ntp061TourokuUsrUkoFlg" />
<html:hidden property="ntp061PopKbn" />
<html:hidden property="ntp061AddCompFlg" />
<html:hidden property="ntp061Date" />
<html:hidden property="ntp061AnkenSid" />
<html:hidden property="ntp061SvCompanySid" />
<html:hidden property="ntp061SvCompanyCode" />
<html:hidden property="ntp061SvCompanyName" />
<html:hidden property="ntp061SvCompanyBaseSid" />
<html:hidden property="ntp061SvCompanyBaseName" />
<html:hidden property="ntp061NanCode" />
<html:hidden property="ntp061NanName" />
<html:hidden property="ntp061NanSyosai" />
<html:hidden property="ntp061NanKinJutyu" />
<html:hidden property="ntp061NanKinMitumori" />
<html:hidden property="ntp061MitumoriYear" />
<html:hidden property="ntp061MitumoriMonth" />
<html:hidden property="ntp061MitumoriDay" />
<html:hidden property="ntp061JutyuYear" />
<html:hidden property="ntp061JutyuMonth" />
<html:hidden property="ntp061JutyuDay" />
<html:hidden property="ntp061NanMikomi" />
<html:hidden property="ntp061NgySid" />
<html:hidden property="ntp061NgpSid" />
<html:hidden property="ntp061NanSyodan" />
<html:hidden property="ntp061NcnSid" />
<html:hidden property="ntp061NanState" />
<html:hidden property="ntp061NanPermitView" />
<html:hidden property="ntp061NanPermitEdit" />
<html:hidden property="ntp200NanSid" />
<html:hidden property="ntp200ProcMode" />
<html:hidden property="ntp200InitFlg" />
<html:hidden property="ntp200parentPageId" />
<html:hidden property="ntp200RowNumber" />

<logic:notEmpty name="ntp061knForm" property="ntp061ChkShohinSidList" scope="request">
<logic:iterate id="item" name="ntp061knForm" property="ntp061ChkShohinSidList" scope="request">
  <input type="hidden" name="ntp061ChkShohinSidList" value="<bean:write name="item"/>">
</logic:iterate>
</logic:notEmpty>

<%--　BODY --%>
<logic:notEmpty name="ntp061knForm" property="sv_users" scope="request">
<logic:iterate id="ulBean" name="ntp061knForm" property="sv_users" scope="request">
<input type="hidden" name="sv_users" value="<bean:write name="ulBean" />">
</logic:iterate>
</logic:notEmpty>
<%-------------------------------- 案件登録画面 --------------------------------%>
<table width="100%" cellpadding="5" cellspacing="0">
<tr>
<td width="100%" align="center">
  <table width="70%" cellpadding="0" cellspacing="0">
  <tr>
  <td align="left">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../nippou/images/header_anken_01.gif" border="0" alt="<gsmsg:write key="ntp.1" />"></td>
    <td width="0%" class="header_white_bg_text" align="right" valign="middle" nowrap><span class="plugin_ttl"><gsmsg:write key="ntp.11" />
    <logic:notEqual name="ntp061knForm" property="ntp060ProcMode" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.CMD_DSP) %>">
    <logic:notEqual name="ntp061knForm" property="ntp060ProcMode" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.CMD_EDIT) %>">
        <gsmsg:write key="cmn.entry" />
    </logic:notEqual>
    <logic:equal name="ntp061knForm" property="ntp060ProcMode" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.CMD_EDIT) %>">
      <gsmsg:write key="cmn.edit" />
    </logic:equal>
    </logic:notEqual>
    <gsmsg:write key="cmn.check" /></span></td>
    <td width="100%" class="header_white_bg"></td>
    <td width="0%"><img src="../common/images/header_white_end.gif" border="0" alt="<gsmsg:write key="ntp.1" />"></td>
    </tr>
    </table>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%">
    </td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
    <logic:equal name="ntp061knForm" property="ntp060ProcMode" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.CMD_DSP) %>">
        <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('backNtp061kn');">
    </logic:equal>
    <logic:notEqual name="ntp061knForm" property="ntp060ProcMode" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.CMD_DSP) %>">
      <logic:equal name="ntp061knForm" property="ntp061PopKbn" value="0">
        <input type="button" class="btn_add_n1" value="<gsmsg:write key="cmn.entry" />" onClick="return buttonPush('addOk');">
        <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('backNtp061kn');">
      </logic:equal>
      <logic:notEqual name="ntp061knForm" property="ntp061PopKbn" value="0">
        <input type="button" class="btn_add_n1" value="<gsmsg:write key="cmn.entry" />" onClick="return buttonPush('addOkPop');">
        <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('backNtp061kn');">
      </logic:notEqual>
    </logic:notEqual>
    </td>
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>
  </td>
  </tr>

  <tr><td><img src="../common/images/spacer.gif" style="width:100px; height:10px;" border="0" alt=""></td></tr>

  <logic:messagesPresent message="false">
  <tr><td align="left"><span class="TXT02"><html:errors/></span></td></tr>
  <tr><td><img src="../common/images/spacer.gif" style="width:100px; height:10px;" border="0" alt=""></td></tr>
  </logic:messagesPresent>
  <tr>
  <td align="left">
    <table width="100%" class="tl0" border="0" cellpadding="5">
    <tr>
      <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="cmn.registant" /></span></td>
      <td align="left" class="td_type20" width="85%">
      <bean:define id="userUkoFlg" name="ntp061knForm" property="ntp061TourokuUsrUkoFlg" type="Integer"/>
      <span class="<%=UserUtil.getCSSClassNameNormal(userUkoFlg)%>"><bean:write name="ntp061knForm" property="ntp061TourokuName" /></span>
      </td>
    </tr>
    <tr>
      <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.72" /></span></td>
      <td align="left" class="td_type20" width="85%">
         <bean:write name="ntp061knForm" property="ntp061Date" />
      </td>
    </tr>
    <tr>
      <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.29" /></span><span class="text_r2"></span></td>
      <td align="left" class="td_type20" width="85%"><bean:write name="ntp061knForm" property="ntp061NanCode" /></td>
    </tr>
    <tr>
      <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.57" /></span><span class="text_r2">※</span></td>
      <td align="left" class="td_type20" width="85%"><bean:write name="ntp061knForm" property="ntp061NanName" /></td>
    </tr>
    <tr>
      <td align="left" class="table_bg_A5B4E1" width="10%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.73" /></span></td>
      <td align="left" class="td_type20" width="90%">
            <bean:write name="ntp061knForm" property="ntp061knNanSyosai" filter="false" />
    </td>
    </tr>
    <tr>
      <td class="table_bg_A5B4E1" nowrap>
        <span class="text_bb1"><gsmsg:write key="cmn.staff" /><br><br></span>
      </td>
      <td align="left" class="td_type20">
        <logic:notEmpty name="ntp061knForm" property="ntp061SelectUsrLavel" scope="request">
        <logic:iterate id="urBean" name="ntp061knForm" property="ntp061SelectUsrLavel" scope="request" type="CmnUsrmInfModel">
           <span class="<%=UserUtil.getCSSClassNameNormal(urBean.getUsrUkoFlg())%>"><bean:write name="urBean" property="usiSei" scope="page"/>　<bean:write name="urBean" property="usiMei" scope="page"/></span><br>
          </logic:iterate>
         </logic:notEmpty>
      </td>
    </tr>
    <tr>
      <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.15" />（<gsmsg:write key="ntp.16" />）</span></td>
      <td align="left" valign="middle" class="td_type20" width="85%">
        <div class="text_base7"><gsmsg:write key="address.7" />：<logic:notEmpty name="ntp061knForm" property="ntp061AcoCode"><bean:write name="ntp061knForm" property="ntp061AcoCode" /></logic:notEmpty></div>
        <div class="text_base7">
          <logic:notEmpty name="ntp061knForm" property="ntp061CompanyName">
          <bean:write name="ntp061knForm" property="ntp061CompanyName" />&nbsp;&nbsp;&nbsp;<bean:write name="ntp061knForm" property="ntp061CompanyBaseName" />
          </logic:notEmpty>
      </div>
      </td>
    </tr>
    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.58" /></span></td>
    <td align="left" valign="middle" class="td_type20" width="85%">
      <logic:notEmpty name="ntp061knForm" property="ntp061ShohinList">
        <logic:iterate id="shnMdl" name="ntp061knForm" property="ntp061ShohinList">
          <bean:write name="shnMdl" property="label" /><br>
        </logic:iterate>
      </logic:notEmpty>
    </td>
    </tr>
    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.61" />／<gsmsg:write key="ntp.62" /></span></td>
    <td align="left" class="td_type20" width="85%">
    <logic:notEmpty name="ntp061knForm" property="ntp060GyomuList">
      <bean:define id="ngyId" name="ntp061knForm" property="ntp061NgySid" />
      <logic:iterate id="gyoushuMdl" name="ntp061knForm" property="ntp060GyomuList">
        <logic:equal name="gyoushuMdl" property="value" value="<%= String.valueOf(ngyId) %>"><bean:write name="gyoushuMdl" property="label" /></logic:equal>
      </logic:iterate>
    </logic:notEmpty>/
    <logic:notEmpty name="ntp061knForm" property="ntp060ProcessList">
      <bean:define id="ngpId" name="ntp061knForm" property="ntp061NgpSid" />
      <logic:iterate id="processMdl" name="ntp061knForm" property="ntp060ProcessList">
        <logic:equal name="processMdl" property="value" value="<%= String.valueOf(ngpId) %>"><bean:write name="processMdl" property="label" /></logic:equal>
      </logic:iterate>
    </logic:notEmpty>
    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.63" /></span></td>
    <td align="left" class="td_type20" width="85%">
      <logic:equal name="ntp061knForm" property="ntp061NanMikomi" value="0">10%</logic:equal>
      <logic:equal name="ntp061knForm" property="ntp061NanMikomi" value="1">30%</logic:equal>
      <logic:equal name="ntp061knForm" property="ntp061NanMikomi" value="2">50%</logic:equal>
      <logic:equal name="ntp061knForm" property="ntp061NanMikomi" value="3">70%</logic:equal>
      <logic:equal name="ntp061knForm" property="ntp061NanMikomi" value="4">100%</logic:equal>
    </td>
    </tr>
    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.53" /></span></td>
    <td align="left" class="td_type20" width="85%">
      <bean:write name="ntp061knForm" property="ntp061NanKinMitumori" /><span class="text_base7"><gsmsg:write key="project.103" /></span>&nbsp;&nbsp;&nbsp;&nbsp;
      <span class="text_base2"><gsmsg:write key="ntp.55" />:</span>
      <logic:notEmpty name="ntp061knForm" property="ntp061YearLabel">
        <bean:define id="mYearId" name="ntp061knForm" property="ntp061MitumoriYear" />
        <logic:iterate id="mYearMdl" name="ntp061knForm" property="ntp061YearLabel">
          <logic:equal name="mYearMdl" property="value" value="<%= String.valueOf(mYearId) %>"><bean:write name="mYearMdl" property="label" /></logic:equal>
        </logic:iterate>
      </logic:notEmpty>
      <logic:notEmpty name="ntp061knForm" property="ntp061MonthLabel">
        <bean:define id="mMonthId" name="ntp061knForm" property="ntp061MitumoriMonth" />
        <logic:iterate id="mMonthMdl" name="ntp061knForm" property="ntp061MonthLabel">
          <logic:equal name="mMonthMdl" property="value" value="<%= String.valueOf(mMonthId) %>"><bean:write name="mMonthMdl" property="label" /></logic:equal>
        </logic:iterate>
      </logic:notEmpty>
      <logic:notEmpty name="ntp061knForm" property="ntp061DayLabel">
        <bean:define id="mDayId" name="ntp061knForm" property="ntp061MitumoriDay" />
        <logic:iterate id="mDayMdl" name="ntp061knForm" property="ntp061DayLabel">
          <logic:equal name="mDayMdl" property="value" value="<%= String.valueOf(mDayId) %>"><bean:write name="mDayMdl" property="label" /></logic:equal>
        </logic:iterate>
      </logic:notEmpty>
    </td>
    </tr>
    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.54" /></span></td>
    <td align="left" class="td_type20" width="85%">
      <bean:write name="ntp061knForm" property="ntp061NanKinJutyu" /><gsmsg:write key="project.103" /></span>&nbsp;&nbsp;&nbsp;&nbsp;
      <span class="text_base2"><gsmsg:write key="ntp.56" />:</span>
      <logic:notEmpty name="ntp061knForm" property="ntp061YearLabel">
        <bean:define id="jYearId" name="ntp061knForm" property="ntp061JutyuYear" />
        <logic:iterate id="jYearMdl" name="ntp061knForm" property="ntp061YearLabel">
          <logic:equal name="jYearMdl" property="value" value="<%= String.valueOf(jYearId) %>"><bean:write name="jYearMdl" property="label" /></logic:equal>
        </logic:iterate>
      </logic:notEmpty>
      <logic:notEmpty name="ntp061knForm" property="ntp061MonthLabel">
        <bean:define id="jMonthId" name="ntp061knForm" property="ntp061JutyuMonth" />
        <logic:iterate id="jMonthMdl" name="ntp061knForm" property="ntp061MonthLabel">
          <logic:equal name="jMonthMdl" property="value" value="<%= String.valueOf(jMonthId) %>"><bean:write name="jMonthMdl" property="label" /></logic:equal>
        </logic:iterate>
      </logic:notEmpty>
      <logic:notEmpty name="ntp061knForm" property="ntp061DayLabel">
        <bean:define id="jDayId" name="ntp061knForm" property="ntp061JutyuDay" />
        <logic:iterate id="jDayMdl" name="ntp061knForm" property="ntp061DayLabel">
          <logic:equal name="jDayMdl" property="value" value="<%= String.valueOf(jDayId) %>"><bean:write name="jDayMdl" property="label" /></logic:equal>
        </logic:iterate>
      </logic:notEmpty>
    </td>
    </tr>
    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.64" /></span></td>
    <td align="left" class="td_type20" width="85%">
      <logic:equal name="ntp061knForm" property="ntp061NanSyodan" value="0"><gsmsg:write key="ntp.68" /></logic:equal>
      <logic:equal name="ntp061knForm" property="ntp061NanSyodan" value="1"><gsmsg:write key="ntp.69" /></logic:equal>
      <logic:equal name="ntp061knForm" property="ntp061NanSyodan" value="2"><gsmsg:write key="ntp.7" /></logic:equal>
    </td>
    </tr>
    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.65" /></span></td>
    <td align="left" class="td_type20" width="85%">
    <%-- <gsmsg:write key="ntp.65" /> --%>
    <logic:notEmpty name="ntp061knForm" property="ntp060ContactList">
    <logic:iterate id="ncnMdl" name="ntp061knForm" property="ntp060ContactList" indexId="ncnidx">
    <bean:define  id="ncnVal" name="ncnMdl" property="value" />
    <logic:equal name="ntp061knForm" property="ntp061NcnSid" value="<%= String.valueOf(ncnVal) %>"><bean:write  name="ncnMdl" property="label" /></logic:equal>
    </logic:iterate>
    </logic:notEmpty>
    </td>
    </tr>
    <tr><%-- 状態 --%>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.71" /></span></td>
    <td align="left" class="td_type20" width="85%">
      <logic:equal name="ntp061knForm" property="ntp061NanState" value="0"><gsmsg:write key="ntp.74" /></logic:equal>
      <logic:equal name="ntp061knForm" property="ntp061NanState" value="1"><gsmsg:write key="ntp.75" /></logic:equal>
    </td>
    </tr>
    <tr><!-- 権限設定 -->
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"  ><gsmsg:write key="cmn.setting.permissions"  /></span></td>
    <td align="left" class="td_type20" width="85%">
    <logic:equal name="ntp061knForm" property="ntp061NanPermitView" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_ALL) %>">
        <%--制限なし --%>
        <span id="permissionViewLabel"><gsmsg:write key="address.61" />:</span>
        <gsmsg:write key="cmn.nolimit" /></p>
        <gsmsg:write key="cmn.edit.permissions" />:
        <logic:equal name="ntp061knForm" property="ntp061NanPermitEdit" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_ALL) %>">
            <gsmsg:write key="cmn.nolimit" /></p>
        </logic:equal>
        <logic:equal name="ntp061knForm" property="ntp061NanPermitEdit" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_TANTO) %>">
        <%--担当者のみ --%>
            <gsmsg:write key="address.62" />
        </logic:equal>
        <%--ユーザグループ指定 --%>
        <logic:equal name="ntp061knForm" property="ntp061NanPermitEdit" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_USERGROUP) %>">
            <gsmsg:write key="ntp.ntp061.1" /></br>
            <logic:iterate id="user" name="ntp061knForm" property="ntp061NanPermitUsrGrp.selectedList(edit)" type="UsrLabelValueBean">
               <html:hidden property="ntp061NanPermitUsrGrp.selected(edit)" value="<%=user.getValue() %>" />
               <span class="<%=user.getCSSClassNameNormal()%>"><bean:write name="user" property="label" /></span><br>
            </logic:iterate>
        </logic:equal>
    </logic:equal>
    <logic:equal name="ntp061knForm" property="ntp061NanPermitView" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_TANTO) %>">
    <%--担当者のみ --%>
        <gsmsg:write key="address.62" />
    </logic:equal>
    <%--ユーザグループ指定 --%>
    <logic:equal name="ntp061knForm" property="ntp061NanPermitView" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_USERGROUP) %>">
        <gsmsg:write key="ntp.ntp061.1" /><p />
        <bean:write name="ntp061knForm" property="ntp061NanPermitUsrGrp.selectedListName(view)"/>:<br />
        <logic:iterate id="user" name="ntp061knForm" property="ntp061NanPermitUsrGrp.selectedList(view)" type="UsrLabelValueBean">
           <span class="<%=user.getCSSClassNameNormal()%>"><bean:write name="user" property="label" /></span><br>
           <html:hidden property="ntp061NanPermitUsrGrp.selected(view)" value="<%=user.getValue() %>" />
        </logic:iterate>
        </br>
        <bean:write name="ntp061knForm" property="ntp061NanPermitUsrGrp.selectedListName(edit)"/>:<br />
        <logic:iterate id="user" name="ntp061knForm" property="ntp061NanPermitUsrGrp.selectedList(edit)" type="UsrLabelValueBean">
           <span class="<%=user.getCSSClassNameNormal()%>"><bean:write name="user" property="label" /></span><br>
           <html:hidden property="ntp061NanPermitUsrGrp.selected(edit)" value="<%=user.getValue() %>" />
        </logic:iterate>
    </logic:equal>
    </td>
  </tr>
  </table>
  </td>
  </tr>
  <tr>
  <td><img src="../common/images/spacer.gif" style="width:100px; height:10px;" border="0" alt=""></td>
  </tr>
  <tr>
  <td align="left">
    <table width="100%">
    <tr>
    <td width="50%"></td>
    <td width="50%" align="right">
    <logic:equal name="ntp061knForm" property="ntp060ProcMode" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.CMD_DSP) %>">
        <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('backNtp061kn');">
    </logic:equal>
    <logic:notEqual name="ntp061knForm" property="ntp060ProcMode" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.CMD_DSP) %>">

      <logic:equal name="ntp061knForm" property="ntp061PopKbn" value="0">
        <input type="button" class="btn_add_n1" value="<gsmsg:write key="cmn.entry" />" onClick="return buttonPush('addOk');">
        <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('backNtp061kn');">
      </logic:equal>
      <logic:notEqual name="ntp061knForm" property="ntp061PopKbn" value="0">
        <input type="button" class="btn_add_n1" value="<gsmsg:write key="cmn.entry" />" onClick="return buttonPush('addOkPop');">
        <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('backNtp061kn');">
      </logic:notEqual>
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

<logic:equal name="ntp061knForm" property="ntp061PopKbn" value="0">
  <jsp:include page="/WEB-INF/plugin/common/jsp/footer001.jsp" />
</logic:equal>

<jsp:include page="/WEB-INF/plugin/nippou/jsp/ntp061_dialog.jsp">
  <jsp:param value="ntp061knForm" name="thisFormName"/>
 </jsp:include>
</html:form>

</body>
</html:html>