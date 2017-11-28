<%@page import="jp.groupsession.v2.usr.model.UsrLabelValueBean"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ taglib uri="/WEB-INF/ctag-jsmsg.tld" prefix="gsjsmsg" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>

<%-- CMD定数 --%>
<%  String kakuteiClick    = jp.groupsession.v2.prj.prj020kn.Prj020knAction.CMD_KAKUTEI_CLICK;
    String backClick       = jp.groupsession.v2.prj.prj020kn.Prj020knAction.CMD_BACK_CLICK;
%>

<%-- 定数値 --%>
<%
    String entryAdd        = jp.groupsession.v2.prj.GSConstProject.CMD_MODE_ADD;
    String entryEdit       = jp.groupsession.v2.prj.GSConstProject.CMD_MODE_EDIT;
    String enabled         = String.valueOf(jp.groupsession.v2.prj.GSConstProject.KBN_KOUKAI_ENABLED);
    String disabled        = String.valueOf(jp.groupsession.v2.prj.GSConstProject.KBN_KOUKAI_DISABLED);
%>

<bean:define id="prjStsMdl" name="prj020knForm" property="prjStatusMdl" />

<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="../common/css/default.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
<link rel=stylesheet href="../project/css/project.css?<%= GSConst.VERSION_PARAM %>" type="text/css">

<logic:equal name="prj020knForm" property="prj020cmdMode" value="<%= entryAdd %>">
<title>[Group Session] <gsmsg:write key="project.107" /> <gsmsg:write key="project.prj020kn.1" /></title>
</logic:equal>
<logic:equal name="prj020knForm" property="prj020cmdMode" value="<%= entryEdit %>">
<title>[Group Session] <gsmsg:write key="project.107" /> <gsmsg:write key="project.prj020kn.2" /></title>
</logic:equal>

<gsjsmsg:js filename="gsjsmsg.js"/>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script type="text/javascript" src="../common/js/calendar.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../project/js/project.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/imageView.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
</head>

<body class="body_03">

<html:form action="/project/prj020kn">
<input type="hidden" name="helpPrm" value="<bean:write name="prj020knForm" property="prj020cmdMode" />">

<input type="hidden" name="CMD" id="CMD" value="">
<html:hidden property="prj010cmdMode" />
<html:hidden property="prj010page1" />
<html:hidden property="prj010page2" />
<html:hidden property="prj010sort" />
<html:hidden property="prj010order" />
<html:hidden property="selectingProject" />
<html:hidden property="selectingTodoDay" />
<html:hidden property="selectingTodoPrj" />
<html:hidden property="selectingTodoSts" />
<html:hidden property="prj010Init" />

<html:hidden property="prj040searchFlg" />
<html:hidden property="prj040scPrjId" />
<html:hidden property="prj040scStatusFrom" />
<html:hidden property="prj040scStatusTo" />
<html:hidden property="prj040scPrjName" />
<html:hidden property="prj040scStartYearFrom" />
<html:hidden property="prj040scStartMonthFrom" />
<html:hidden property="prj040scStartDayFrom" />
<html:hidden property="prj040scStartYearTo" />
<html:hidden property="prj040scStartMonthTo" />
<html:hidden property="prj040scStartDayTo" />
<html:hidden property="prj040scEndYearFrom" />
<html:hidden property="prj040scEndMonthFrom" />
<html:hidden property="prj040scEndDayFrom" />
<html:hidden property="prj040scEndYearTo" />
<html:hidden property="prj040scEndMonthTo" />
<html:hidden property="prj040scEndDayTo" />
<html:hidden property="prj040svScPrjId" />
<html:hidden property="prj040svScStatusFrom" />
<html:hidden property="prj040svScStatusTo" />
<html:hidden property="prj040svScPrjName" />
<html:hidden property="prj040svScStartYearFrom" />
<html:hidden property="prj040svScStartMonthFrom" />
<html:hidden property="prj040svScStartDayFrom" />
<html:hidden property="prj040svScStartYearTo" />
<html:hidden property="prj040svScStartMonthTo" />
<html:hidden property="prj040svScStartDayTo" />
<html:hidden property="prj040svScEndYearFrom" />
<html:hidden property="prj040svScEndMonthFrom" />
<html:hidden property="prj040svScEndDayFrom" />
<html:hidden property="prj040svScEndYearTo" />
<html:hidden property="prj040svScEndMonthTo" />
<html:hidden property="prj040svScEndDayTo" />
<html:hidden property="prj040page1" />
<html:hidden property="prj040page2" />
<html:hidden property="prj040sort" />
<html:hidden property="prj040order" />
<html:hidden property="prj040scYosanFr" />
<html:hidden property="prj040scYosanTo" />
<html:hidden property="prj040svScYosanFr" />
<html:hidden property="prj040svScYosanTo" />

<logic:notEmpty name="prj020knForm" property="prj040scMemberSid" scope="request">
  <logic:iterate id="item" name="prj020knForm" property="prj040scMemberSid" scope="request">
    <input type="hidden" name="prj040scMemberSid" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj020knForm" property="prj040svScMemberSid" scope="request">
  <logic:iterate id="item" name="prj020knForm" property="prj040svScMemberSid" scope="request">
    <input type="hidden" name="prj040svScMemberSid" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<html:hidden property="prj030scrId" />
<html:hidden property="prj030prjSid" />
<html:hidden property="prj030sort" />
<html:hidden property="prj030order" />
<html:hidden property="prj030page1" />
<html:hidden property="prj030page2" />
<html:hidden property="prj030Init" />
<html:hidden property="selectingDate" />
<html:hidden property="selectingStatus" />
<html:hidden property="selectingCategory" />
<html:hidden property="selectingMember" />

<logic:notEmpty name="prj020knForm" property="prj030sendMember" scope="request">
  <logic:iterate id="item" name="prj020knForm" property="prj030sendMember" scope="request">
    <input type="hidden" name="prj030sendMember" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<html:hidden property="prj020scrId" />
<html:hidden property="prj020cmdMode" />
<html:hidden property="prj020prjSid" />
<html:hidden property="prj020prjId" />
<html:hidden property="prj020prjName" />
<html:hidden property="prj020prjNameS" />
<html:hidden property="prj020yosan" />
<html:hidden property="prj020koukai" />
<html:hidden property="prj020startYear" />
<html:hidden property="prj020startMonth" />
<html:hidden property="prj020startDay" />
<html:hidden property="prj020endYear" />
<html:hidden property="prj020endMonth" />
<html:hidden property="prj020endDay" />
<html:hidden property="prj020status" />
<html:hidden property="prj020mokuhyou" />
<html:hidden property="prj020naiyou" />
<html:hidden property="prj020group" />
<html:hidden property="prj020kengen" />
<html:hidden property="prj020smailKbn" />
<html:hidden property="prj020prjMyKbn" />
<html:hidden property="prj020initFlg" />

<logic:notEmpty name="prj020knForm" property="prj020syozokuMember" scope="request">
  <logic:iterate id="item" name="prj020knForm" property="prj020syozokuMember" scope="request">
    <input type="hidden" name="prj020syozokuMember" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj020knForm" property="prj020user" scope="request">
  <logic:iterate id="item" name="prj020knForm" property="prj020user" scope="request">
    <input type="hidden" name="prj020user" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj020knForm" property="prj020hdnMember" scope="request">
  <logic:iterate id="item" name="prj020knForm" property="prj020hdnMember" scope="request">
    <input type="hidden" name="prj020hdnMember" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj020knForm" property="prj020adminMember" scope="request">
  <logic:iterate id="item" name="prj020knForm" property="prj020adminMember" scope="request">
    <input type="hidden" name="prj020adminMember" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj020knForm" property="prj020prjMember" scope="request">
  <logic:iterate id="item" name="prj020knForm" property="prj020prjMember" scope="request">
    <input type="hidden" name="prj020prjMember" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj020knForm" property="prj020hdnAdmin" scope="request">
  <logic:iterate id="item" name="prj020knForm" property="prj020hdnAdmin" scope="request">
    <input type="hidden" name="prj020hdnAdmin" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj020knForm" property="prj150AddressIdSv" scope="request">
  <logic:iterate id="addressId" name="prj020knForm" property="prj150AddressIdSv" scope="request">
    <input type="hidden" name="prj150AddressIdSv" value="<bean:write name="addressId"/>">
  </logic:iterate>
</logic:notEmpty>

<html:hidden property="selectDir" />
<html:hidden property="prj020AddMemAllDelFlg" />
<html:hidden property="prj020IcoName" />
<html:hidden property="prj020IcoSaveName" />

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>

<table cellpadding="5" cellspacing="0" width="100%">
<tr>
<td width="100%" align="center">

  <table cellpadding="0" width="70%" class="tl0">
  <tr>
  <td align="center">

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../project/images/header_project_01.gif" border="0" alt="<gsmsg:write key="cmn.project" />"></td>
    <td width="0%" class="header_white_bg_text" align="right" valign="middle" nowrap><span class="plugin_ttl"><gsmsg:write key="cmn.project" /></span></td>
    <logic:equal name="prj020knForm" property="prj020cmdMode" value="<%= entryAdd %>">
    <td width="0%" class="header_white_bg_text">[ <gsmsg:write key="project.prj020kn.1" /> ]</td>
    </logic:equal>
    <logic:equal name="prj020knForm" property="prj020cmdMode" value="<%= entryEdit %>">
    <td width="0%" class="header_white_bg_text">[ <gsmsg:write key="project.prj020kn.2" /> ]</td>
    </logic:equal>

    <td width="100%" class="header_white_bg">
    <td width="0%"><img src="../common/images/header_white_end.gif" border="0" alt=""></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%">
    </td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
      <input type="button" value="<gsmsg:write key="cmn.final" />" class="btn_base1" onclick="buttonPush('<%= kakuteiClick %>');">
      <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onclick="buttonPush('<%= backClick %>');">
    </td>
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

  <logic:messagesPresent message="false">
    <table width="100%">
    <tr><td colspan="4" align="left"><html:errors/></td></tr>
    </table>
  </logic:messagesPresent>

    <table width="100%" class="tl0 prj_tbl_base" border="0" cellpadding="5">
    <tr>
    <td class="td_sub_title" width="20%" nowrap><span class="text_bb1"><gsmsg:write key="project.31" /></span></td>
    <td class="td_type1" align="left" width="80%"><bean:write name="prj020knForm" property="prj020prjId" /></td>
    </tr>

    <tr>
    <td class="td_sub_title" nowrap><span class="text_bb1"><gsmsg:write key="project.40" /></span></td>
    <td align="left" class="td_type1"><bean:write name="prj020knForm" property="prj020prjName" /></td>
    </tr>

    <tr>
    <td class="td_sub_title" nowrap><span class="text_bb1"><gsmsg:write key="project.41" /></span></td>
    <td align="left" class="td_type1"><bean:write name="prj020knForm" property="prj020prjNameS" /></td>
    </tr>

    <tr>
    <td class="td_sub_title" nowrap><span class="text_bb1"><gsmsg:write key="project.10" /></span></td>
    <td align="left" class="td_type1"><bean:write name="prj020knForm" property="yosan" /></td>
    </tr>

    <tr>
    <td class="td_sub_title" nowrap><span class="text_bb1"><gsmsg:write key="project.19" /></span></td>
    <td align="left" class="td_type1"><bean:write name="prj020knForm" property="koukai" /></td>
    </tr>

    <tr>
    <td class="td_sub_title" nowrap><span class="text_bb1"><gsmsg:write key="cmn.start" /></span></td>
    <td align="left" class="td_type1"><bean:write name="prj020knForm" property="startDate" /></td>
    </tr>
    <tr>
    <td class="td_sub_title" nowrap><span class="text_bb1"><gsmsg:write key="cmn.end" /></span></td>
    <td align="left" class="td_type1"><bean:write name="prj020knForm" property="endDate" /></td>
    </tr>

    <logic:equal name="prj020knForm" property="prj020prjMyKbn" value="<%= String.valueOf(jp.groupsession.v2.prj.GSConstProject.KBN_MY_PRJ_DEF) %>">
    <tr>
    <td class="td_sub_title" nowrap><span class="text_bb1"><gsmsg:write key="cmn.status" /></span></td>
    <td align="left" class="td_type1"><bean:write name="prj020knForm" property="status" /></td>
    </tr>
    </logic:equal>

    <tr>
    <td class="td_sub_title" nowrap><span class="text_bb1"><gsmsg:write key="project.21" /></span></td>
    <td align="left" class="td_type1"><bean:write name="prj020knForm" property="mokuhyou" filter="false" /></td>
    </tr>

    <tr>
    <td class="td_sub_title" nowrap><span class="text_bb1"><gsmsg:write key="cmn.content2" /></span></td>
    <td align="left" class="td_type1"><bean:write name="prj020knForm" property="naiyou" filter="false" /></td>
    </tr>

    <logic:equal name="prj020knForm" property="prj020prjMyKbn" value="<%= String.valueOf(jp.groupsession.v2.prj.GSConstProject.KBN_MY_PRJ_DEF) %>">
    <tr>
    <td class="td_sub_title" nowrap><span class="text_bb1"><gsmsg:write key="cmn.squad" /></span></td>
    <td align="left" class="td_type1">
      <logic:notEmpty name="prj020knForm" property="syozokuMemberLabel">
      <logic:iterate id="member" name="prj020knForm" property="syozokuMemberLabel" type="UsrLabelValueBean">
      <span class="<%=member.getCSSClassNameNormal()%>"><bean:write name="member" property="label" /></span><br>
      </logic:iterate>
      </logic:notEmpty>
    </td>
    </tr>

    <logic:notEmpty name="prj020knForm" property="prj150CompanySid" scope="request">
      <logic:iterate id="coId" name="prj020knForm" property="prj150CompanySid" scope="request">
        <input type="hidden" name="prj150CompanySid" value="<bean:write name="coId"/>">
      </logic:iterate>
    </logic:notEmpty>

    <logic:notEmpty name="prj020knForm" property="prj150CompanyBaseSid" scope="request">
      <logic:iterate id="coId" name="prj020knForm" property="prj150CompanyBaseSid" scope="request">
        <input type="hidden" name="prj150CompanyBaseSid" value="<bean:write name="coId"/>">
      </logic:iterate>
    </logic:notEmpty>

    <logic:notEmpty name="prj020knForm" property="prj150AddressIdSv" scope="request">
    <tr>
    <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="project.prj020.4" /></span></td>
    <td align="left" class="td_type1">
    <logic:notEmpty name="prj020knForm" property="prj020AddDataList">
      <logic:iterate name="prj020knForm" property="prj020AddDataList" scope="request" id="companyData">
        <bean:write name="companyData" property="adrName" /><br>
      </logic:iterate>
    </logic:notEmpty>
    </td>
    </tr>
    </logic:notEmpty>
    <tr>
    <td class="td_sub_title" nowrap><span class="text_bb1"><gsmsg:write key="project.src.32" /></span></td>
    <td align="left" class="td_type1">
      <logic:notEmpty name="prj020knForm" property="adminMemberLabel">
      <logic:iterate id="member" name="prj020knForm" property="adminMemberLabel" type="UsrLabelValueBean">
      <span class="<%=member.getCSSClassNameNormal()%>"><bean:write name="member" property="label" /></span><br>
      </logic:iterate>
      </logic:notEmpty>
    </td>
    </tr>
    </logic:equal>

    <tr>
      <td valign="middle" align="left" class="table_bg_A5B4E1" nowrap>
        <span class="text_bb1"><gsmsg:write key="cmn.icon" /></span>
      </td>
      <td valign="middle" align="left" class="td_wt">

        <table width="100%" border="0">
        <tr>
        <td width="0%">
        <logic:equal name="prj020knForm" property="prj020IcoName" value="">
          <img src="../project/images/prj_icon.gif" name="pitctImage" width="30" height="30" alt="<gsmsg:write key="cmn.icon" />" border="1"><br>
        </logic:equal>
        <logic:notEqual name="prj020knForm" property="prj020IcoName" value="">
          <img src="../project/prj020kn.do?CMD=getImageFile&prj020cmdMode=<bean:write name="prj020knForm" property="prj020cmdMode" />&prj020prjSid=<bean:write name="prj020knForm" property="prj020prjSid" />" name="pitctImage" width="30" height="30" alt="<gsmsg:write key="cmn.icon" />" border="1" onload="initImageView('pitctImage');">
        </logic:notEqual>
        </td>
        </tr>
        </table>
      </td>
    </tr>

    </table>

    <br>
    <div align="left" class="text_bb1"><gsmsg:write key="project.prj150.5" /></div>

    <table width="100%" class="tl0 prj_tbl_base" border="0" cellpadding="5">
    <tr>
    <td class="td_sub_title" width="20%" nowrap><span class="text_bb1"><gsmsg:write key="cmn.label" /></span></td>
    <td align="left" class="td_type1" width="80%">
      <span class="text_base2">
      <logic:notEmpty name="prjStsMdl" property="todoCateList">
      <logic:iterate id="todoCate" name="prjStsMdl" property="todoCateList">
      <bean:write name="todoCate" property="ptcName" /><br>
      </logic:iterate>
      </logic:notEmpty>
      </span>
    </td>
    </tr>

    <tr>
    <td class="td_sub_title" nowrap><span class="text_bb1"><gsmsg:write key="cmn.status" /></span></td>
    <td align="left" class="td_type1">
      <span class="text_base2">
      <logic:notEmpty name="prjStsMdl" property="todoStatusList">
      <logic:iterate id="todoStatus" name="prjStsMdl" property="todoStatusList">
      <bean:write name="todoStatus" property="ptsRate" />%(<bean:write name="todoStatus" property="ptsName" />)<br>
      </logic:iterate>
      </logic:notEmpty>
      </span>
    </td>
    </tr>

    <logic:equal name="prj020knForm" property="prj020prjMyKbn" value="<%= String.valueOf(jp.groupsession.v2.prj.GSConstProject.KBN_MY_PRJ_DEF) %>">
    <tr>
    <td class="td_sub_title" nowrap><span class="text_bb1"><gsmsg:write key="cmn.edit.permissions" /></span></td>
    <td align="left" class="td_type1"><bean:write name="prj020knForm" property="kengen" /></td>
    </tr>
    </logic:equal>

    <logic:equal name="prj020knForm" property="useSmail" value="true">
    <tr>
    <td class="td_sub_title" nowrap><span class="text_bb1"><gsmsg:write key="project.2" /></span></td>
    <td align="left" class="td_type1"><bean:write name="prj020knForm" property="smailKbn" /></td>
    </tr>
    </logic:equal>

    </table>

    <img src="../schedule/images/spacer.gif" width="1px" height="10px" border="0">

    <table cellpadding="0" width="100%">
    <tr>
    <td align="right">
      <input type="button" value="<gsmsg:write key="cmn.final" />" class="btn_base1" onclick="buttonPush('<%= kakuteiClick %>');">
      <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onclick="buttonPush('<%= backClick %>');">
    </td>
    </tr>
    </table>

  </td>
  </tr>
  </table>

</td>
</tr>
</table>

<%@ include file="/WEB-INF/plugin/common/jsp/footer001.jsp" %>

</html:form>

</body>
</html:html>