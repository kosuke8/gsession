<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>

<%-- CMD定数 --%>
<%
    String backClick          = jp.groupsession.v2.prj.prj022.Prj022Action.CMD_BACK_CLICK;
    String editClick          = jp.groupsession.v2.prj.prj022.Prj022Action.CMD_EDIT_CLICK;
    String tmpEditClick       = jp.groupsession.v2.prj.prj140.Prj140Action.CMD_EDIT_CLICK;
    String addValueClick      = jp.groupsession.v2.prj.prj022.Prj022Action.CMD_ADD_VALUE_CLICK;
    String editValueClick     = jp.groupsession.v2.prj.prj022.Prj022Action.CMD_EDIT_VALUE_CLICK;
    String removeValueClick   = jp.groupsession.v2.prj.prj022.Prj022Action.CMD_REMOVE_VALUE_CLICK;
    String sortUpClick        = jp.groupsession.v2.prj.prj022.Prj022Action.CMD_SORT_UP_CLICK;
    String sortDownClick      = jp.groupsession.v2.prj.prj022.Prj022Action.CMD_SORT_DOWN_CLICK;
%>

<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="../common/css/default.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
<link rel=stylesheet href="../project/css/project.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
<title>[Group Session] <gsmsg:write key="project.24" /></title>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../project/js/project.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../project/js/prj022.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
</head>

<body class="body_03">

<html:form action="/project/prj022">

<input type="hidden" name="CMD" id="CMD" value="">
<html:hidden property="backScreen" />
<html:hidden property="prj010cmdMode" />
<html:hidden property="prj010page1" />
<html:hidden property="prj010page2" />
<html:hidden property="prj010sort" />
<html:hidden property="prj010order" />
<html:hidden property="prj010Init" />
<html:hidden property="selectingProject" />
<html:hidden property="selectingTodoDay" />
<html:hidden property="selectingTodoPrj" />
<html:hidden property="selectingTodoSts" />
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

<logic:notEmpty name="prj022Form" property="prj040scMemberSid" scope="request">
  <logic:iterate id="item" name="prj022Form" property="prj040scMemberSid" scope="request">
    <input type="hidden" name="prj040scMemberSid" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj022Form" property="prj040svScMemberSid" scope="request">
  <logic:iterate id="item" name="prj022Form" property="prj040svScMemberSid" scope="request">
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

<logic:notEmpty name="prj022Form" property="prj030sendMember" scope="request">
  <logic:iterate id="item" name="prj022Form" property="prj030sendMember" scope="request">
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
<html:hidden property="prj020IcoName" />
<html:hidden property="prj020IcoSaveName" />
<html:hidden property="prj020initFlg" />

<logic:notEmpty name="prj022Form" property="prj020syozokuMember" scope="request">
  <logic:iterate id="item" name="prj022Form" property="prj020syozokuMember" scope="request">
    <input type="hidden" name="prj020syozokuMember" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj022Form" property="prj020user" scope="request">
  <logic:iterate id="item" name="prj022Form" property="prj020user" scope="request">
    <input type="hidden" name="prj020user" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj022Form" property="prj020hdnMember" scope="request">
  <logic:iterate id="item" name="prj022Form" property="prj020hdnMember" scope="request">
    <input type="hidden" name="prj020hdnMember" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj022Form" property="prj020adminMember" scope="request">
  <logic:iterate id="item" name="prj022Form" property="prj020adminMember" scope="request">
    <input type="hidden" name="prj020adminMember" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj022Form" property="prj020prjMember" scope="request">
  <logic:iterate id="item" name="prj022Form" property="prj020prjMember" scope="request">
    <input type="hidden" name="prj020prjMember" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj022Form" property="prj020hdnAdmin" scope="request">
  <logic:iterate id="item" name="prj022Form" property="prj020hdnAdmin" scope="request">
    <input type="hidden" name="prj020hdnAdmin" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<html:hidden property="prjTmpMode" />
<html:hidden property="prtSid" />

<html:hidden property="prj140prtTmpName" />
<html:hidden property="prj140prtId" />
<html:hidden property="prj140prtName" />
<html:hidden property="prj140prtNameS" />
<html:hidden property="prj140yosan" />
<html:hidden property="prj140koukai" />
<html:hidden property="prj140startYear" />
<html:hidden property="prj140startMonth" />
<html:hidden property="prj140startDay" />
<html:hidden property="prj140endYear" />
<html:hidden property="prj140endMonth" />
<html:hidden property="prj140endDay" />
<html:hidden property="prj140status" />
<html:hidden property="prj140mokuhyou" />
<html:hidden property="prj140naiyou" />
<html:hidden property="prj140group" />
<html:hidden property="prj140kengen" />
<html:hidden property="prj140smailKbn" />

<logic:notEmpty name="prj022Form" property="prj140syozokuMember" scope="request">
  <logic:iterate id="item" name="prj022Form" property="prj140syozokuMember" scope="request">
    <input type="hidden" name="prj140syozokuMember" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj022Form" property="prj140user" scope="request">
  <logic:iterate id="item" name="prj022Form" property="prj140user" scope="request">
    <input type="hidden" name="prj140user" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj022Form" property="prj140hdnMember" scope="request">
  <logic:iterate id="item" name="prj022Form" property="prj140hdnMember" scope="request">
    <input type="hidden" name="prj140hdnMember" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj022Form" property="prj140adminMember" scope="request">
  <logic:iterate id="item" name="prj022Form" property="prj140adminMember" scope="request">
    <input type="hidden" name="prj140adminMember" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj022Form" property="prj140prjMember" scope="request">
  <logic:iterate id="item" name="prj022Form" property="prj140prjMember" scope="request">
    <input type="hidden" name="prj140prjMember" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj022Form" property="prj140hdnAdmin" scope="request">
  <logic:iterate id="item" name="prj022Form" property="prj140hdnAdmin" scope="request">
    <input type="hidden" name="prj140hdnAdmin" value="<bean:write name="item"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj022Form" property="prj150CompanySid">
  <logic:iterate id="coId" name="prj022Form" property="prj150CompanySid">
    <input type="hidden" name="prj150CompanySid" value="<bean:write name="coId"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj022Form" property="prj150CompanyBaseSid">
  <logic:iterate id="coId" name="prj022Form" property="prj150CompanyBaseSid">
    <input type="hidden" name="prj150CompanyBaseSid" value="<bean:write name="coId"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="prj022Form" property="prj150AddressIdSv">
  <logic:iterate id="addressId" name="prj022Form" property="prj150AddressIdSv">
    <input type="hidden" name="prj150AddressIdSv" value="<bean:write name="addressId"/>">
  </logic:iterate>
</logic:notEmpty>


<html:hidden name="prj022Form" property="prj022selectCategory" />

<html:hidden property="selectDir" />

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>

<table cellpadding="5" cellspacing="0" width="100%">
<tr>
<td width="100%" align="center">

  <table cellpadding="0" cellspacing="0" border="0" width="605px">
  <tr>
  <td align="center">

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../project/images/header_project_01.gif" border="0" alt="<gsmsg:write key="cmn.project" />"></td>
    <td width="0%" class="header_white_bg_text" align="right" valign="middle" nowrap><span class="plugin_ttl"><gsmsg:write key="cmn.project" /></span></td>
    <td width="0%" class="header_white_bg_text">[ <gsmsg:write key="project.24" /> ]</td>
    <td width="100%" class="header_white_bg"></td>
    <td width="0%"><img src="../common/images/header_white_end.gif" border="0" alt=""></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">

      <logic:lessEqual name="prj022Form" property="prjTmpMode" value="0">
        <input type="button" value="<gsmsg:write key="cmn.setting2" />" class="btn_base1" onclick="buttonPush('<%= editClick %>');">
      </logic:lessEqual>

      <logic:greaterThan name="prj022Form" property="prjTmpMode" value="0">
        <input type="button" value="<gsmsg:write key="cmn.setting2" />" class="btn_base1" onclick="buttonPush('<%= tmpEditClick %>');">
      </logic:greaterThan>

      <input type="button" value="<gsmsg:write key="cmn.back2" />" class="btn_back_n1" onclick="buttonPush('<%= backClick %>');"></td>
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <logic:messagesPresent message="false">
    <table width="100%">
    <tr><td colspan="4" align="left"><html:errors/></td></tr>
    </table>
    </logic:messagesPresent>

    <table width="100%" class="tl0" border="0" cellpadding="5">
    <tr>
    <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.label" /></span></td>
    <td align="left" class="td_wt">

      <table>

      <tr>
      <td rowspan="2">
        <div valign="top"><img src="../common/images/arrow2_t.gif" alt="<gsmsg:write key="cmn.up" />" border="0" onclick="prj022Sort('<%= sortUpClick %>', 0);"></div><br>
        <div><img src="../common/images/arrow2_b.gif" alt="<gsmsg:write key="cmn.down" />" border="0" onclick="prj022Sort('<%= sortDownClick %>', 1);"></div>
      </td>
      <td>
        <html:select property="prj022cateSlc" size="15" styleClass="select01" onchange="prj022select();">
        <logic:notEmpty name="prj022Form" property="statusLabel">
          <% String selectCategory = ""; %>
          <logic:notEmpty name="prj022Form" property="prj022selectCategory">
            <bean:define id="paramCategory" name="prj022Form" property="prj022selectCategory" type="java.lang.String" />
            <% selectCategory = paramCategory; %>
          </logic:notEmpty>
          <logic:iterate id="categoryData" name="prj022Form" property="statusLabel">
            <bean:define id="leftCategory" name="categoryData" property="value" type="java.lang.String" />
            <% String selectedStr = (leftCategory.equals(selectCategory))?" selected":""; %>

            <option value="<bean:write name="categoryData" property="value" />"<%= selectedStr %>><bean:write name="categoryData" property="label" /></option>
          </logic:iterate>
        </logic:notEmpty>

        </html:select>
      </td>
      <td valign="bottom">

        <html:text property="prj022cateAdd" style="width:183px;" maxlength="20" />
        <input type="button" value="<gsmsg:write key="cmn.add" />" class="btn_add_arrow_n1" onClick="return prj022BtnPush('<%= addValueClick %>');"><br><br>
        <br><br><br>

        <html:text name="prj022Form" property="prj022editCategoryName" style="width:183px;" maxlength="20" />
        <input type="button" value="<gsmsg:write key="cmn.edit" />" class="btn_edit_n3" onClick="return prj022BtnPush('<%= editValueClick %>');"><br><br>
        <input type="button" value="<gsmsg:write key="cmn.delete" />" class="btn_dell_n3" onClick="return prj022BtnPush('<%= removeValueClick %>');">
      </td>
      </tr>
      </table>

    </td>
    </tr>
    </table>

    <img src="../schedule/images/spacer.gif" width="1px" height="10px" border="0">

    <table cellpadding="0" width="100%">
    <tr>
    <td align="right">

      <logic:lessEqual name="prj022Form" property="prjTmpMode" value="0">
        <input type="button" value="<gsmsg:write key="cmn.setting2" />" class="btn_base1" onclick="buttonPush('<%= editClick %>');">
      </logic:lessEqual>

      <logic:greaterThan name="prj022Form" property="prjTmpMode" value="0">
        <input type="button" value="<gsmsg:write key="cmn.setting2" />" class="btn_base1" onclick="buttonPush('<%= tmpEditClick %>');">
      </logic:greaterThan>

      <input type="button" value="<gsmsg:write key="cmn.back2" />" class="btn_back_n1" onclick="buttonPush('<%= backClick %>');">
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