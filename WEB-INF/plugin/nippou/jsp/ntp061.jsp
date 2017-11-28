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

<%
   String maxLengthSyosai = String.valueOf(1000);
%>

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

<input type="hidden" name="helpPrm" value="<bean:write name="ntp061Form" property="ntp060ProcMode" />">

<logic:equal name="ntp061Form" property="ntp061PopKbn" value="0">
  <jsp:include page="/WEB-INF/plugin/common/jsp/header001.jsp" />
</logic:equal>


<html:form action="/nippou/ntp061">

<div id="ntp061CompanyIdArea">
<html:hidden property="ntp061CompanySid" />
</div>

<div id="ntp061CompanyBaseIdArea">
<html:hidden property="ntp061CompanyBaseSid" />
</div>


<input type="hidden" name="CMD" value="">

<jsp:include page="/WEB-INF/plugin/nippou/jsp/ntp060_hiddenParams.jsp" />

<logic:notEmpty name="ntp061Form" property="ntp060Mikomi" scope="request">
<logic:iterate id="mikomi" name="ntp061Form" property="ntp060Mikomi" scope="request">
  <input type="hidden" name="ntp060Mikomi" value="<bean:write name="mikomi"/>">
</logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="ntp061Form" property="ntp060Syodan" scope="request">
<logic:iterate id="syodan" name="ntp061Form" property="ntp060Syodan" scope="request">
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

<html:hidden property="ntp200NanSid" />
<html:hidden property="ntp200ProcMode" />
<html:hidden property="ntp200InitFlg" />
<html:hidden property="ntp200parentPageId" />
<html:hidden property="ntp200RowNumber" />

<logic:notEmpty name="ntp061Form" property="ntp061ChkShohinSidList" scope="request">
<logic:iterate id="item" name="ntp061Form" property="ntp061ChkShohinSidList" scope="request">
  <input type="hidden" name="ntp061ChkShohinSidList" value="<bean:write name="item"/>">
</logic:iterate>
</logic:notEmpty>


<!--　BODY -->
<logic:notEmpty name="ntp061Form" property="sv_users" scope="request">
<logic:iterate id="ulBean" name="ntp061Form" property="sv_users" scope="request">
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
    <logic:notEqual name="ntp061Form" property="ntp060ProcMode" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.CMD_EDIT) %>">
      <td width="0%" class="header_white_bg_text" align="right" valign="middle" nowrap><span class="plugin_ttl"><gsmsg:write key="ntp.11" /><gsmsg:write key="cmn.entry" /></span></td>
    </logic:notEqual>
    <logic:equal name="ntp061Form" property="ntp060ProcMode" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.CMD_EDIT) %>">
      <td width="0%" class="header_white_bg_text" align="right" valign="middle" nowrap><span class="plugin_ttl"><gsmsg:write key="ntp.11" /><gsmsg:write key="cmn.edit" /></span></td>
    </logic:equal>
    <td width="100%" class="header_white_bg"></td>
    <td width="0%"><img src="../common/images/header_white_end.gif" border="0" alt="<gsmsg:write key="ntp.1" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%">
       <logic:equal name="ntp061Form" property="ntp060ProcMode" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.CMD_EDIT) %>">
        <input type="button" value="<gsmsg:write key="cmn.register.copy" />" class="btn_base1" onClick="buttonCopy('061_copy', 'add');">
       </logic:equal>
    </td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
      <logic:equal name="ntp061Form" property="ntp061PopKbn" value="0">
        <input type="button" class="btn_add_n1" value="<gsmsg:write key="cmn.entry" />" onClick="return buttonPush('okNtp061');">
        <logic:equal name="ntp061Form" property="ntp060ProcMode" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.CMD_EDIT) %>">
        <input type="button" class="btn_dell_n1" value="<gsmsg:write key="cmn.delete" />" onClick="return buttonPush('del');">
        </logic:equal>
        <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('backNtp061');">
      </logic:equal>
      <logic:notEqual name="ntp061Form" property="ntp061PopKbn" value="0">
        <input type="button" class="btn_add_n1" value="<gsmsg:write key="cmn.entry" />" onClick="return buttonPush('okNtp061pop');">
        <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('backNtp200');">
      </logic:notEqual>
    </td>
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>
  </td>
  </tr>

  <tr>
  <td><img src="../common/images/spacer.gif" style="width:100px; height:10px;" border="0" alt=""></td>
  </tr>

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
    <bean:define id="userUkoFlg" name="ntp061Form" property="ntp061TourokuUsrUkoFlg" type="Integer"/>
    <span class="<%=UserUtil.getCSSClassNameNormal(userUkoFlg)%>"><bean:write name="ntp061Form" property="ntp061TourokuName" /></span>
    </td>
    </tr>

    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.72" /></span></td>
    <td align="left" class="td_type20" width="85%">
      <bean:write name="ntp061Form" property="ntp061Date" />
    </td>
    </tr>

    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.29" /></span><span class="text_r2">※</span></td>
    <td align="left" class="td_type20" width="85%"><html:text name="ntp061Form" property="ntp061NanCode" maxlength="8" style="width:131px;" /></td>
    </tr>
    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.57" /></span><span class="text_r2">※</span></td>
    <td align="left" class="td_type20" width="85%"><html:text name="ntp061Form" property="ntp061NanName" maxlength="100" style="width:635px;" /></td>
    </tr>
    <tr>
    <td align="left" class="table_bg_A5B4E1" width="10%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.73" /></span></td>
    <td align="left" class="td_type20" width="90%">
      <logic:equal name="ntp061Form" property="ntp061PopKbn" value="0">
        <textarea name="ntp061NanSyosai" style="width:488px;" rows="10" styleClass="text_gray" onkeyup="showLengthStr(value, <%= maxLengthSyosai %>, 'inputlength');" id="inputstr"><bean:write name="ntp061Form" property="ntp061NanSyosai" /></textarea>
        <br>
        <span class="font_string_count"><gsmsg:write key="wml.js.15" /></span><span id="inputlength" class="font_string_count">0</span>&nbsp;<span class="font_string_count_max">/&nbsp;<%= maxLengthSyosai %>&nbsp;<gsmsg:write key="cmn.character" /></span>
      </logic:equal>
      <logic:notEqual name="ntp061Form" property="ntp061PopKbn" value="0">
        <textarea name="ntp061NanSyosai" style="width:488px;" rows="5" styleClass="text_gray" onkeyup="showLengthStr(value, <%= maxLengthSyosai %>, 'inputlength');" id="inputstr"><bean:write name="ntp061Form" property="ntp061NanSyosai" /></textarea>
      </logic:notEqual>
    </td>
    </tr>
    <tr>
    <td class="table_bg_A5B4E1" nowrap>
      <span class="text_bb1"><gsmsg:write key="cmn.staff" /><br><br></span>
    </td>
    <td align="left" class="td_type20">

      <table width="0%" border="0">
      <tr>
      <td width="40%">

      </td>
      <td width="20%">&nbsp;</td>
      <td width="40%">
        <input class="btn_group_n1" value="<gsmsg:write key="cmn.sel.all.group" />" onclick="return openAllGroup(this.form.ntp061GroupSid, 'ntp061GroupSid', '<bean:write name="ntp061Form" property="ntp061GroupSid" />', '1', '061_group', 'sv_users', '0', '0')" type="button">
      </td>
      </tr>
      <tr>
      <td width="40%" class="table_bg_A5B4E1" align="center"><span class="text_bb1"><gsmsg:write key="cmn.staff" /></span></td>
      <td width="20%" align="center">&nbsp;</td>
      <td width="40%" align="left">

      <logic:notEmpty name="ntp061Form" property="ntp061GroupLavel" scope="request">
      <html:select property="ntp061GroupSid" onchange="changeGroupCombo('061_group');" styleClass="select05">

      <logic:notEmpty name="ntp061Form" property="ntp061GroupLavel" scope="request">
      <logic:iterate id="gpBean" name="ntp061Form" property="ntp061GroupLavel" scope="request">

      <bean:define id="gpValue" name="gpBean" property="value" type="java.lang.String" />
      <logic:equal name="gpBean" property="styleClass" value="0">
      <html:option value="<%= gpValue %>"><bean:write name="gpBean" property="label" /></html:option>
      </logic:equal>

      <logic:notEqual name="gpBean" property="styleClass" value="0">
      <html:option styleClass="select03" value="<%= gpValue %>"><bean:write name="gpBean" property="label" /></html:option>
      </logic:notEqual>

      </logic:iterate>
      </logic:notEmpty>

        </html:select>
        </logic:notEmpty>
        <span class="text_base8">
          <input type="button" onclick="openGroupWindow(this.form.ntp061GroupSid, 'ntp061GroupSid', '1', '061_group')" class="group_btn2" value="&nbsp;" id="ntp061GroupBtn">
          <%--
          <input type="checkbox" name="ntp061SelectUsersKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.SELECT_ON) %>" id="select_user" onclick="return selectUsersList();" />
          <label for="select_user"><gsmsg:write key="cmn.select" /></label>
          --%>
       </span>
      </td>
      </tr>

      <tr>
      <td align="center">
         <!-- 登録先 -->
        <select size="5" multiple name="users_r" class="select01">
        <logic:notEmpty name="ntp061Form" property="ntp061SelectUsrLavel" scope="request">
        <logic:iterate id="urBean" name="ntp061Form" property="ntp061SelectUsrLavel" scope="request" type="CmnUsrmInfModel">
           <option class="<%=UserUtil.getCSSClassNameOption(urBean.getUsrUkoFlg()) %>" value="<bean:write name="urBean" property="usrSid" scope="page"/>"><bean:write name="urBean" property="usiSei" scope="page"/>　<bean:write name="urBean" property="usiMei" scope="page"/></option>
          </logic:iterate>
         </logic:notEmpty>
        <option value="-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
        </select>
      </td>

      <td align="center">

        <input type="button" class="btn_base1add" value="<gsmsg:write key="cmn.add"/>" name="adduserBtn" onClick="moveUser('061_rightarrow');"><br><br>
        <input type="button" class="btn_base1del" value="<gsmsg:write key="cmn.delete" />" name="deluserBtn" onClick="moveUser('061_leftarrow');">

      </td>
      <td>
         <!-- グループ -->
         <select size="5" multiple name="users_l" class="select01">
         <logic:notEmpty name="ntp061Form" property="ntp061BelongLavel" scope="request">
          <logic:iterate id="urBean" name="ntp061Form" property="ntp061BelongLavel" scope="request" type="CmnUsrmInfModel">
            <option class="<%=UserUtil.getCSSClassNameOption(urBean.getUsrUkoFlg()) %>" value="<bean:write name="urBean" property="usrSid" scope="page"/>"><bean:write name="urBean" property="usiSei" scope="page"/>　<bean:write name="urBean" property="usiMei" scope="page"/></option>
          </logic:iterate>
         </logic:notEmpty>
        <option value="-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
        </select>
      </td>
      </tr>
      </table>
    </td>
    </tr>
    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.15" />（<gsmsg:write key="ntp.16" />）</span></td>
    <td align="left" valign="middle" class="td_type20" width="85%">
    <div class="text_base7"><gsmsg:write key="address.7" />：<logic:notEmpty name="ntp061Form" property="ntp061AcoCode"><bean:write name="ntp061Form" property="ntp061AcoCode" /></logic:notEmpty></div>
    <div class="text_base7">
    <logic:notEmpty name="ntp061Form" property="ntp061CompanyName">
    <bean:write name="ntp061Form" property="ntp061CompanyName" />&nbsp;&nbsp;&nbsp;<bean:write name="ntp061Form" property="ntp061CompanyBaseName" />

    <a href="javascript:void(0);" onclick="deleteDspCompany();">
      <img src="../common/images/delete.gif" class="img_bottom"/>
    </a>

    </logic:notEmpty>

<%--
    <logic:equal name="ntp061Form" property="ntp061PopKbn" value="0">
    &nbsp;<input type="button" class="btn_address_n2" value="アドレス帳" onclick="return openCompanyWindow3('ntp061')" />
    </logic:equal>

    <logic:notEqual name="ntp061Form" property="ntp061PopKbn" value="0">
--%>
    &nbsp;<input type="button" class="btn_address_n2" value="<gsmsg:write key="addressbook" />" id="adrBtn" />
<%--
    </logic:notEqual>
--%>

    </div>
    </td>
    </tr>
    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.58" /></span></td>
    <td align="left" valign="middle" class="td_type20" width="85%">
<%--
    <logic:equal name="ntp061Form" property="ntp061PopKbn" value="0">
      <img alt="<gsmsg:write key="cmn.add" />" src="../nippou/images/arrow_btn_add2.gif" border="0" onClick="buttonPush('searchShohin');">
    </logic:equal>
    <logic:notEqual name="ntp061Form" property="ntp061PopKbn" value="0">
--%>
      <img alt="<gsmsg:write key="cmn.add" />" src="../nippou/images/arrow_btn_add2.gif" border="0" id="itmAddBtn">
<%--
    </logic:notEqual>
--%>
    <img alt="<gsmsg:write key="cmn.delete" />" src="../nippou/images/arrow_btn_delete2.gif" border="0" onClick="buttonPush('delShohin');"><br>

    <html:select name="ntp061Form" property="ntp061SelectShohin" size="6" multiple="true" styleClass="select01" style="width: 400px;">
      <logic:notEmpty name="ntp061Form" property="ntp061ShohinList">
        <html:optionsCollection name="ntp061Form" property="ntp061ShohinList" value="value" label="label" />
      </logic:notEmpty>
      <option value="-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
    </html:select>
    </td>
    </tr>

    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.61" />／<gsmsg:write key="ntp.62" /></span></td>
    <td align="left" class="td_type20" width="85%">
    <!-- 業務コンボ -->
    <html:select name="ntp061Form" property="ntp061NgySid" styleClass="select01" onchange="return buttonPush('changeGyomu');" style="width: 110px;">
    <logic:notEmpty name="ntp061Form" property="ntp060GyomuList">
    <html:optionsCollection name="ntp061Form" property="ntp060GyomuList" value="value" label="label" />
    </logic:notEmpty>
    </html:select>
    &nbsp;
    <!-- プロセスコンボ -->
    <html:select name="ntp061Form" property="ntp061NgpSid" styleClass="select01" style="width: 110px;">
    <logic:notEmpty name="ntp061Form" property="ntp060ProcessList">
    <html:optionsCollection name="ntp061Form" property="ntp060ProcessList" value="value" label="label" />
    </logic:notEmpty>
    </html:select>
    </td>
    </tr>

    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.63" /></span></td>
    <td align="left" class="td_type20" width="85%">
    <html:radio name="ntp061Form" property="ntp061NanMikomi" styleId="ntp061NanMikomi0" value="0" /><span class="text_base2"><label for="ntp061NanMikomi0">10%</label></span>&nbsp;
    <html:radio name="ntp061Form" property="ntp061NanMikomi" styleId="ntp061NanMikomi1" value="1" /><span class="text_base2"><label for="ntp061NanMikomi1">30%</label></span>&nbsp;
    <html:radio name="ntp061Form" property="ntp061NanMikomi" styleId="ntp061NanMikomi2" value="2" /><span class="text_base2"><label for="ntp061NanMikomi2">50%</label></span>&nbsp;
    <html:radio name="ntp061Form" property="ntp061NanMikomi" styleId="ntp061NanMikomi3" value="3" /><span class="text_base2"><label for="ntp061NanMikomi3">70%</label></span>&nbsp;
    <html:radio name="ntp061Form" property="ntp061NanMikomi" styleId="ntp061NanMikomi4" value="4" /><span class="text_base2"><label for="ntp061NanMikomi4">100%</label></span>&nbsp;
    <logic:notEqual name="ntp061Form" property="ntp061MikomidoFlg" value="0">
    <br>&nbsp;<input class="mikomido_btn mikomido_back" type="button" value="<gsmsg:write key="ntp.33" />" />
    </logic:notEqual>
    </td>
    </tr>
    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.53" /></span></td>
    <td align="left" class="td_type20" width="85%">
      <html:text name="ntp061Form" property="ntp061NanKinMitumori" maxlength="9" style="text-align:right; width:113px;" />&nbsp;<span class="text_base7"><gsmsg:write key="project.103" /></span>&nbsp;&nbsp;&nbsp;&nbsp;
      <span class="text_base2"><gsmsg:write key="ntp.55" />:</span>
      <html:select property="ntp061MitumoriYear" styleId="selMitumoriYear">
        <html:optionsCollection name="ntp061Form" property="ntp061YearLabel" value="value" label="label" />
      </html:select>
      <html:select property="ntp061MitumoriMonth" styleId="selMitumoriMonth">
        <html:optionsCollection name="ntp061Form" property="ntp061MonthLabel" value="value" label="label" />
      </html:select>
      <html:select property="ntp061MitumoriDay" styleId="selMitumoriDay">
        <html:optionsCollection name="ntp061Form" property="ntp061DayLabel" value="value" label="label" />
      </html:select>

      <input type="button" value="Cal" onclick="wrtCalendarByBtn(this.form.selMitumoriDay, this.form.selMitumoriMonth, this.form.selMitumoriYear, 'ntp061MitumoriCalBtn')" class="calendar_btn" id="ntp061MitumoriCalBtn">
      <input type="button" class="btn_arrow_l" value="&nbsp;" onclick="return moveDay($('#selMitumoriYear')[0], $('#selMitumoriMonth')[0], $('#selMitumoriDay')[0], 1)">
      <input type="button" class="btn_today" value="<gsmsg:write key="cmn.today" />" onClick="return moveDay($('#selMitumoriYear')[0], $('#selMitumoriMonth')[0], $('#selMitumoriDay')[0], 2)">
      <input type="button" class="btn_arrow_r" value="&nbsp;" onclick="return moveDay($('#selMitumoriYear')[0], $('#selMitumoriMonth')[0], $('#selMitumoriDay')[0], 3)">

    </td>
    </tr>
    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.54" /></span></td>
    <td align="left" class="td_type20" width="85%">
      <html:text name="ntp061Form" property="ntp061NanKinJutyu" maxlength="9" style="text-align:right; width:113px;" />&nbsp;<span class="text_base7"><gsmsg:write key="project.103" /></span>&nbsp;&nbsp;&nbsp;&nbsp;
      <span class="text_base2"><gsmsg:write key="ntp.56" />:</span>
      <html:select property="ntp061JutyuYear" styleId="selJutyuYear">
        <html:optionsCollection name="ntp061Form" property="ntp061YearLabel" value="value" label="label" />
      </html:select>
      <html:select property="ntp061JutyuMonth" styleId="selJutyuMonth">
        <html:optionsCollection name="ntp061Form" property="ntp061MonthLabel" value="value" label="label" />
      </html:select>
      <html:select property="ntp061JutyuDay" styleId="selJutyuDay">
        <html:optionsCollection name="ntp061Form" property="ntp061DayLabel" value="value" label="label" />
      </html:select>

      <input type="button" value="Cal" onclick="wrtCalendarByBtn(this.form.selJutyuDay, this.form.selJutyuMonth, this.form.selJutyuYear, 'ntp061JutyuCalBtn')" class="calendar_btn" id="ntp061JutyuCalBtn">
      <input type="button" class="btn_arrow_l" value="&nbsp;" onclick="return moveDay($('#selJutyuYear')[0], $('#selJutyuMonth')[0], $('#selJutyuDay')[0], 1)">
      <input type="button" class="btn_today" value="<gsmsg:write key="cmn.today" />" onClick="return moveDay($('#selJutyuYear')[0], $('#selJutyuMonth')[0], $('#selJutyuDay')[0], 2)">
      <input type="button" class="btn_arrow_r" value="&nbsp;" onclick="return moveDay($('#selJutyuYear')[0], $('#selJutyuMonth')[0], $('#selJutyuDay')[0], 3)">

    </td>
    </tr>
    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.64" /></span></td>
    <td align="left" class="td_type20" width="85%">
    <html:radio name="ntp061Form" property="ntp061NanSyodan" styleId="ntp061NanSyodan0" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.SYODAN_CHU) %>" /><span class="text_base7"><label for="ntp061NanSyodan0"><gsmsg:write key="ntp.68" /></label></span>&nbsp;
    <html:radio name="ntp061Form" property="ntp061NanSyodan" styleId="ntp061NanSyodan1" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.SYODAN_JYUCHU) %>" /><span class="text_base7"><label for="ntp061NanSyodan1"><gsmsg:write key="ntp.69" /></label></span>&nbsp;
    <html:radio name="ntp061Form" property="ntp061NanSyodan" styleId="ntp061NanSyodan2" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.SYODAN_SICHU) %>" /><span class="text_base7"><label for="ntp061NanSyodan2"><gsmsg:write key="ntp.7" /></label></span>&nbsp;
    </td>
    </tr>

    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.65" /></span></td>
    <td align="left" class="td_type20" width="85%">
    <!-- 顧客源泉 -->
    <logic:notEmpty name="ntp061Form" property="ntp060ContactList">
    <logic:iterate id="ncnMdl" name="ntp061Form" property="ntp060ContactList" indexId="ncnidx">
    <bean:define  id="ncnVal" name="ncnMdl" property="value" />
    <% String idFor = "ntp061NcnSid" + String.valueOf(ncnidx); %>
    <html:radio name="ntp061Form" property="ntp061NcnSid" styleId="<%= idFor %>"  value="<%= String.valueOf(ncnVal) %>" /><span class="text_base7"><label for="<%= idFor %>"><bean:write  name="ncnMdl" property="label" /></label></span>&nbsp;</wbr>
    </logic:iterate>
    </logic:notEmpty>

    </td>
    </tr>

    <!-- 状態 -->
    <tr>
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"><gsmsg:write key="ntp.71" /></span></td>
    <td align="left" class="td_type20" width="85%">
    <html:radio name="ntp061Form" property="ntp061NanState" styleId="ntp061NanState0" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.STATE_UNCOMPLETE) %>" /><span class="text_base7"><label for="ntp061NanState0"><gsmsg:write key="ntp.74" /></label></span>&nbsp;
    <html:radio name="ntp061Form" property="ntp061NanState" styleId="ntp061NanState1" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.STATE_COMPLETE) %>" /><span class="text_base7"><label for="ntp061NanState1"><gsmsg:write key="ntp.75" /></label></span>&nbsp;
    </td>
    </tr>
    <!-- 権限設定 -->
    <tr>
    <logic:equal name="ntp061Form" property="ntp061NanPermitView" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_ALL) %>">
    <td align="left" class="table_bg_A5B4E1" width="15%"  rowspan="2" nowrap><span class="text_bb1"><gsmsg:write key="cmn.setting.permissions" /></span></td>
    </logic:equal>
    <logic:notEqual name="ntp061Form" property="ntp061NanPermitView" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_ALL) %>">
    <td align="left" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb1"  ><gsmsg:write key="cmn.setting.permissions"  /></span></td>
    </logic:notEqual>
    <td align="left" class="td_type20" width="85%">
    <logic:equal name="ntp061Form" property="ntp061NanPermitView" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_ALL) %>">
    <span id="permissionViewLabel"><gsmsg:write key="address.61" />:</span>
    </logic:equal>
    <logic:notEqual name="ntp061Form" property="ntp061NanPermitView" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_ALL) %>">
    <span id="permissionViewLabel" style="display: none;" ><gsmsg:write key="address.61" />:</span>
    </logic:notEqual>
    <%--制限なし --%>
    <html:radio name="ntp061Form" property="ntp061NanPermitView" styleId="ntp061NanPermitView0" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_ALL) %>" /><span class="text_base7"><label for="ntp061NanPermitView0"><gsmsg:write key="cmn.nolimit" /></label></span>&nbsp;
    <%--担当者のみ --%>
    <html:radio name="ntp061Form" property="ntp061NanPermitView" styleId="ntp061NanPermitView1" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_TANTO) %>" /><span class="text_base7"><label for="ntp061NanPermitView1"><gsmsg:write key="address.62" /></label></span>&nbsp;
    <%--ユーザグループ指定 --%>
    <html:radio name="ntp061Form" property="ntp061NanPermitView" styleId="ntp061NanPermitView2" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_USERGROUP) %>" /><span class="text_base7"><label for="ntp061NanPermitView2"><gsmsg:write key="ntp.ntp061.1" /></label></span>&nbsp;
    <logic:notEqual name="ntp061Form" property="ntp061NanPermitView" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_ALL) %>">
    <jsp:include page="/WEB-INF/plugin/common/jsp/usrgrpselect.jsp">
       <jsp:param value="ntp061Form" name="thisFormName"/>
       <jsp:param value="ntp061NanPermitUsrGrp" name="id"/>
    </jsp:include>
    </logic:notEqual>
    </td>
    </tr>
    <logic:equal name="ntp061Form" property="ntp061NanPermitView" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_ALL) %>">
    <tr id="permissionEditRadio" >
    </logic:equal>
    <logic:notEqual name="ntp061Form" property="ntp061NanPermitView" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_ALL) %>">
    <tr id="permissionEditRadio" style="display: none;">
    </logic:notEqual>
    <td align="left" class="td_type20" width="85%">
    <gsmsg:write key="cmn.edit.permissions" />:
    <%--制限なし --%>
    <html:radio name="ntp061Form" property="ntp061NanPermitEdit" styleId="ntp061NanPermitEdit0" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_ALL) %>" /><span class="text_base7"><label for="ntp061NanPermitEdit0"><gsmsg:write key="cmn.nolimit" /></label></span>&nbsp;
    <%--担当者のみ --%>
    <html:radio name="ntp061Form" property="ntp061NanPermitEdit" styleId="ntp061NanPermitEdit1" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_TANTO) %>" /><span class="text_base7"><label for="ntp061NanPermitEdit1"><gsmsg:write key="address.62" /></label></span>&nbsp;
    <%--ユーザグループ指定 --%>
    <html:radio name="ntp061Form" property="ntp061NanPermitEdit" styleId="ntp061NanPermitEdit2" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_USERGROUP) %>" /><span class="text_base7"><label for="ntp061NanPermitEdit2"><gsmsg:write key="ntp.ntp061.1" /></label></span>&nbsp;
    <logic:equal name="ntp061Form" property="ntp061NanPermitView" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.NAP_KBN_ALL) %>">
    <jsp:include page="/WEB-INF/plugin/common/jsp/usrgrpselect.jsp">
       <jsp:param value="ntp061Form" name="thisFormName"/>
       <jsp:param value="ntp061NanPermitUsrGrp" name="id"/>
    </jsp:include>
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

    <td width="50%">
       <logic:equal name="ntp061Form" property="ntp060ProcMode" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.CMD_EDIT) %>">
        <input type="button" value="<gsmsg:write key="cmn.register.copy" />" class="btn_base1" onClick="buttonCopy('061_copy', 'add');">
       </logic:equal>
    </td>

    <td width="50%" align="right">
      <logic:equal name="ntp061Form" property="ntp061PopKbn" value="0">
        <input type="button" class="btn_add_n1" value="<gsmsg:write key="cmn.entry" />" onClick="return buttonPush('okNtp061');">
        <logic:equal name="ntp061Form" property="ntp060ProcMode" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.CMD_EDIT) %>">
        <input type="button" class="btn_dell_n1" value="<gsmsg:write key="cmn.delete" />" onClick="return buttonPush('del');">
        </logic:equal>
        <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('backNtp061');">
      </logic:equal>
      <logic:notEqual name="ntp061Form" property="ntp061PopKbn" value="0">
        <input type="button" class="btn_add_n1" value="<gsmsg:write key="cmn.entry" />" onClick="return buttonPush('okNtp061pop');">
        <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('backNtp200');">
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


<logic:equal name="ntp061Form" property="ntp061PopKbn" value="0">
  <jsp:include page="/WEB-INF/plugin/common/jsp/footer001.jsp" />
</logic:equal>
<br/>
<jsp:include page="/WEB-INF/plugin/nippou/jsp/ntp061_dialog.jsp">
  <jsp:param value="ntp061Form" name="thisFormName"/>
 </jsp:include>


</html:form>

</body>
</html:html>