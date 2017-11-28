<%@page import="sun.net.www.content.image.jpeg"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ taglib uri="/WEB-INF/ctag-jsmsg.tld" prefix="gsjsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<%@ page import="jp.groupsession.v2.rsv.GSConstReserve" %>
<%@ page import="jp.groupsession.v2.rsv.rsv310.Rsv310Form" %>
<% String maxLengthNaiyo = String.valueOf(GSConstReserve.MAX_LENGTH_NAIYO); %>

<html:html>
<head>
<title>[GroupSession] <gsmsg:write key="cmn.reserve" />
  <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_SINKI) %>"> [ <gsmsg:write key="reserve.19" /> ]</logic:equal>
  <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_EDIT) %>">
    <logic:notEqual name="rsv110Form" property="rsv110EditAuth" value="true">[ <gsmsg:write key="reserve.rsv110.1" /> ]</logic:notEqual>
    <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">[ <gsmsg:write key="reserve.rsv110.2" /> ]</logic:equal>
  </logic:equal>
  <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">[ <gsmsg:write key="reserve.rsv110.1" /> ]</logic:equal>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<gsjsmsg:js filename="gsjsmsg.js"/>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src='../common/js/jquery.bgiframe.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src='../schedule/jquery_ui/js/jquery-ui-1.8.14.custom.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../reserve/js/rsv110.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../reserve/js/rsvschedule.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/calendar.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/count.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/changestyle.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/grouppopup.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/reservepopup.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/textarea_autoresize.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/jtooltip.js?<%= GSConst.VERSION_PARAM %>"></script>

<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../reserve/css/reserve.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../schedule/jquery/jquery-theme.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../schedule/jquery_ui/css/jquery.ui.dialog.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<% boolean editSchFlg = false; %>
<logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_EDIT) %>">
  <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
    <logic:equal name="rsv110Form" property="rsv110ExistSchDateFlg" value="true">
    <logic:greaterThan name="rsv110Form" property="rsv110ScdRsSid" value="0">
      <% editSchFlg = true; %>
    </logic:greaterThan>
    </logic:equal>
  </logic:equal>
</logic:equal>

<% String showScript = ""; %>
<logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
  <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
    <% showScript = "showLengthId($(\'#inputstr\')[0], " + maxLengthNaiyo + ", \'inputlength\');rsvSchChange();"; %>
  </logic:notEqual>
</logic:equal>

<body class="body_03" onunload="calWindowClose();windowClose();" onload="showOrHide();<%= showScript %><% if (editSchFlg) { %>rsvSchDisabled();<% } %>">

<html:form action="/reserve/rsv110">
<input type="hidden" name="CMD" value="sisetu_yoyaku_kakunin">
<html:hidden property="rsvBackPgId" />
<html:hidden property="rsvDspFrom" />
<html:hidden property="rsvSelectedGrpSid" />
<html:hidden property="rsvSelectedSisetuSid" />
<html:hidden property="rsvPrintUseKbn" />
<html:hidden property="rsv110ProcMode" />
<html:hidden property="rsv110InitFlg" />
<html:hidden property="rsv110RsySid" />
<html:hidden property="rsv110RsdSid" />
<html:hidden property="rsv110SinkiDefaultDate" />
<html:hidden property="rsv110ScdRsSid" />
<html:hidden property="rsv110EditAuth" />
<html:hidden property="rsv110ApprBtnFlg" />
<html:hidden property="rsv110rejectDel"/>
<html:hidden property="rsv110SisetuKbn" />

<jsp:include page="/WEB-INF/plugin/reserve/jsp/rsvHidden.jsp" />

<logic:notEmpty name="rsv110Form" property="rsv100CsvOutField" scope="request">
  <logic:iterate id="csvOutField" name="rsv110Form" property="rsv100CsvOutField" scope="request">
    <input type="hidden" name="rsv100CsvOutField" value="<bean:write name="csvOutField"/>">
  </logic:iterate>
</logic:notEmpty>

<html:hidden property="rsv111InitFlg" />
<html:hidden property="rsv111RsrRsid" />
<html:hidden property="rsv111RsrKbn" />
<html:hidden property="rsv111RsrDweek1" />
<html:hidden property="rsv111RsrDweek2" />
<html:hidden property="rsv111RsrDweek3" />
<html:hidden property="rsv111RsrDweek4" />
<html:hidden property="rsv111RsrDweek5" />
<html:hidden property="rsv111RsrDweek6" />
<html:hidden property="rsv111RsrDweek7" />
<html:hidden property="rsv111RsrWeek" />
<html:hidden property="rsv111RsrDay" />
<html:hidden property="rsv111RsrDayOfYearly" />
<html:hidden property="rsv111RsrMonthOfYearly" />
<html:hidden property="rsv111RsrTranKbn" />
<html:hidden property="rsv111RsrDateYearFr" />
<html:hidden property="rsv111RsrDateMonthFr" />
<html:hidden property="rsv111RsrDateDayFr" />
<html:hidden property="rsv111RsrDateYearTo" />
<html:hidden property="rsv111RsrDateMonthTo" />
<html:hidden property="rsv111RsrDateDayTo" />
<html:hidden property="rsv111RsrTimeHourFr" />
<html:hidden property="rsv111RsrTimeMinuteFr" />
<html:hidden property="rsv111RsrTimeHourTo" />
<html:hidden property="rsv111RsrTimeMinuteTo" />
<html:hidden property="rsv111RsrMok" />
<html:hidden property="rsv111RsrBiko" />
<html:hidden property="rsv111RsrEdit" />
<html:hidden property="rsv111RsrPublic" />
<html:hidden property="rsv111ScdReflection" />
<html:hidden property="rsv111Busyo" />
<html:hidden property="rsv111UseName" />
<html:hidden property="rsv111UseNum" />
<html:hidden property="rsv111UseKbn" />
<html:hidden property="rsv111Contact" />
<html:hidden property="rsv111Guide" />
<html:hidden property="rsv111ParkNum" />
<html:hidden property="rsv111PrintKbn"/>
<html:hidden property="rsv111Dest" />
<html:hidden property="rsv110HeaderDspFlg" />
<html:hidden property="rsv110ExistSchDateFlg" />

<logic:notEmpty name="rsv110Form" property="rsvIkkatuTorokuKey" scope="request">
  <logic:iterate id="key" name="rsv110Form" property="rsvIkkatuTorokuKey" scope="request">
    <input type="hidden" name="rsvIkkatuTorokuKey" value="<bean:write name="key"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="rsv110Form" property="sv_users" scope="request">
  <logic:iterate id="ulBean" name="rsv110Form" property="sv_users" scope="request">
    <input type="hidden" name="sv_users" value="<bean:write name="ulBean" />">
  </logic:iterate>
</logic:notEmpty>

<html:hidden property="rsv111GroupSid" />
<logic:notEmpty name="rsv110Form" property="rsv111SvUsers" scope="request">
  <logic:iterate id="ulExBean" name="rsv110Form" property="rsv111SvUsers" scope="request">
    <input type="hidden" name="rsv111SvUsers" value="<bean:write name="ulExBean" />">
  </logic:iterate>
</logic:notEmpty>

<html:hidden property="rsv111SchKbn" />
<html:hidden property="rsv111SchGroupSid" />

<logic:notEmpty name="rsv110Form" property="rsv110SchNotAccessGroupList" scope="request">
  <logic:iterate id="notAccessGroup" name="rsv110Form" property="rsv110SchNotAccessGroupList">
    <input type="hidden" name="rsvSchNotAccessGroup" value="<bean:write name="notAccessGroup" />">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="rsv110Form" property="rsv110SchNotAccessUserList" scope="request">
  <logic:iterate id="notAccessUser" name="rsv110Form" property="rsv110SchNotAccessUserList">
    <input type="hidden" name="rsvSchNotAccessUser" value="<bean:write name="notAccessUser" />">
  </logic:iterate>
</logic:notEmpty>

<bean:define id="rsvSisKbn" name="rsv110Form" property="rsv110SisetuKbn" type="java.lang.Integer" />
<% int sisKbn = rsvSisKbn; %>

<input type="hidden" name="helpPrm" value="<bean:write name ="rsv110Form" property="rsv110SisetuKbn"/>_<bean:write name="rsv110Form" property="rsv110ProcMode" />" />

<logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
  <jsp:include page="/WEB-INF/plugin/common/jsp/header001.jsp" />
</logic:notEqual>

<table width="100%">
<tr>
<td width="100%" align="center">

<logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
  <table cellpadding="0" cellspacing="0" border="0" width="70%">
</logic:notEqual>
<logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
  <table cellpadding="0" cellspacing="0" border="0" width="100%">
</logic:equal>

  <tr>
  <td>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%">
      <img src="../reserve/images/header_reserve_01.gif" border="0" alt="<gsmsg:write key="cmn.reserve" />"></td>
    <td width="0%" class="header_white_bg_text" align="right" valign="middle" nowrap><span class="plugin_ttl"><gsmsg:write key="cmn.reserve" /></span></td>
    <td width="100%" class="header_white_bg_text">
      <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_SINKI) %>"> [ <gsmsg:write key="reserve.19" /> ]</logic:equal>
      <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_EDIT) %>">
        <logic:notEqual name="rsv110Form" property="rsv110EditAuth" value="true">[ <gsmsg:write key="reserve.rsv110.1" /> ]</logic:notEqual>
        <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">[ <gsmsg:write key="reserve.rsv110.2" /> ]</logic:equal>
      </logic:equal>
      <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">[ <gsmsg:write key="reserve.rsv110.1" /> ]</logic:equal>
      <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_COPY_ADD) %>"> [ <gsmsg:write key="reserve.19" /> ]</logic:equal>
    </td>
    <td width="0%" class="header_white_bg">
      <img src="../common/images/header_white_end.gif" border="0" alt=""></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%">
      <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
        <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <input type="button" value="<gsmsg:write key="cmn.for.repert" />" class="btn_base1" onclick="buttonPush('kurikaeshi');">
          <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_EDIT) %>">
            <input type="button" value="<gsmsg:write key="cmn.register.copy" />" class="btn_base1" onClick="buttonPush('copytouroku');">
          </logic:equal>
        </logic:notEqual>
      </logic:equal>
      <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_EDIT) %>">
          <input type="button" value="<gsmsg:write key="cmn.pdf" />" class="btn_pdf_n1" onClick="buttonPush('pdf');">
      </logic:equal>
    </td>
    <td width="0%"><img src="../reserve/images/header_glay_1.gif" border="0" alt=""></td>
    <td width="50%" class="header_glay_bg">
      <bean:define id="strRsv110ProcMode" name="rsv110Form" property="rsv110ProcMode" type="java.lang.String" />
      <logic:notEqual name="rsv110Form" property="rsv110EditAuth" value="true">
        <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onclick="buttonPush('back_to_menu');">
      </logic:notEqual>
      <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
        <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= GSConstReserve.PROC_MODE_POPUP %>"><input type="button" value="<gsmsg:write key="cmn.close" />" class="btn_close_n1" onclick="window.parent.callYokyakuWindowClose();"></logic:equal>
        <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= GSConstReserve.PROC_MODE_POPUP %>">

          <input type="button" value="OK" class="btn_ok1" onclick="buttonPush('sisetu_yoyaku_kakunin');">
          <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_EDIT) %>"><input type="button" value="<gsmsg:write key="cmn.delete" />" class="btn_dell_n1" onclick="buttonPush('delete');"></logic:equal>
          <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onclick="buttonPush('back_to_menu');">
        </logic:notEqual>
      </logic:equal>
    </td>
    <td width="0%"><img src="../reserve/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>

    <% if (strRsv110ProcMode != null
    && (strRsv110ProcMode.equals(GSConstReserve.PROC_MODE_EDIT)
      || strRsv110ProcMode.equals(GSConstReserve.PROC_MODE_POPUP))) { %>
      <logic:equal name="rsv110Form" property="rsv110ApprBtnFlg" value="1">
      <tr>
      <td colspan="4" align="right" style="padding-top: 5px;">
        <input type="button" value="<gsmsg:write key="cmn.approval" />" id="syoninbtn" class="btn_syonin_n1">
        <input type="button" value="<gsmsg:write key="cmn.rejection" />" id="kyakkabtn" class="btn_kyakka_n1">
      </td>
      </tr>
      </logic:equal>

      <logic:equal name="rsv110Form" property="rsv110ApprBtnFlg" value="2">
      <tr>
      <td colspan="4" align="right" style="padding-top: 5px;">
        <input type="button" value="<gsmsg:write key="reserve.appr.st1" />" id="waitbtn" class="btn_sashimodoshi_n1">
        <input type="button" value="<gsmsg:write key="cmn.rejection" />" id="kyakkabtn" class="btn_kyakka_n1">
      </td>
      </tr>
      </logic:equal>

    <% } %>

    </table>
  </td>
  </tr>

  <tr>
  <td>
    <logic:messagesPresent message="false"><html:errors /></logic:messagesPresent>
    <img src="../common/images/spacer.gif" style="width:100px; height:10px;" border="0" alt="">
  </td></tr>
  <tr>
  <td>

    <%-- 施設情報 --%>
    <jsp:include page="/WEB-INF/plugin/reserve/jsp/rsv110_rsvInfo.jsp" />

  </td>
  </tr>

  <tr>
  <td><br>
  </td>
  </tr>

  <tr>
  <td>

    <table class="tl0" cellpadding="5" cellspacing="0" border="0" width="100%">
    <%-- 登録者 --%>
    <tr>
      <td colspan="2" class="table_bg_A5B4E1" width="20%" nowrap><span class="text_bb1"><gsmsg:write key="cmn.registant" /></span></td>
      <td align="left" class="td_type1" width="80%">
          <table class="tl0" width="99%">
          <%-- 新規登録者 --%>
          <tr>
          <td width="60%" nowrap>
          <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_SINKI) %>" >
          <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_COPY_ADD) %>" >
              <span class="text_base_rsv"><gsmsg:write key="reserve.178"/>：</span>
          </logic:notEqual>
          </logic:notEqual>
          <bean:define id="styleStr" value="text_base_rsv"/>
            <logic:equal name="rsv110Form" property="rsv110AddUsrJKbn" value="<%= String.valueOf(GSConst.JTKBN_TOROKU) %>">
              <logic:equal name="rsv110Form" property="rsv110AddUsrUkoFlg" value="1">
                <% styleStr = "text_base_rsv mukouser"; %>
              </logic:equal>
              <span class="<%=styleStr %>" ><bean:write name="rsv110Form" property="rsv110Torokusya" /></span>
            </logic:equal>
            <logic:equal name="rsv110Form" property="rsv110AddUsrJKbn" value="<%= String.valueOf(GSConst.JTKBN_DELETE) %>">
              <span class="<%=styleStr %>" ><del><bean:write name="rsv110Form" property="rsv110Torokusya" /></del></span>
            </logic:equal>
          </td>
          <td width="40%" align="left" nowrap>
            <span class="text_base"><bean:write name="rsv110Form" property="rsv110AddDate" /></span>
          </td>
          </tr>
          <%-- 最終更新者 --%>
          <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_SINKI) %>" >
          <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_COPY_ADD) %>" >
          <tr>
          <td width="60%" nowrap>
          <span class="text_base_rsv"><gsmsg:write key="reserve.179"/>：</span>
          <bean:define id="styleStr" value="text_base_rsv"/>
            <logic:equal name="rsv110Form" property="rsv110EditUsrJKbn" value="<%= String.valueOf(GSConst.JTKBN_TOROKU) %>">
              <logic:equal name="rsv110Form" property="rsv110EditUsrUkoFlg" value="1">
                <% styleStr = "text_base_rsv mukouser"; %>
              </logic:equal>
              <span class="<%=styleStr %>" ><bean:write name="rsv110Form" property="rsv110Koshinsya" /></span>
            </logic:equal>
            <logic:equal name="rsv110Form" property="rsv110EditUsrJKbn" value="<%= String.valueOf(GSConst.JTKBN_DELETE) %>">
              <span class="<%=styleStr %>" ><del><bean:write name="rsv110Form" property="rsv110Koshinsya" /></del></span>
            </logic:equal>
          </td>
          <td width="40%" align="left" nowrap>
            <span class="text_base"><bean:write name="rsv110Form" property="rsv110EditDate" /></span>
          </td>
          </tr>
          </logic:notEqual>
          </logic:notEqual>
          </table>
      </td>
    </tr>

<%-- 印刷 --%>
    <logic:equal name="rsv110Form" property="rsv110SisetuKbn" value="<%= String.valueOf(GSConstReserve.RSK_KBN_CAR) %>">
      <jsp:include page="/WEB-INF/plugin/reserve/jsp/rsv110_print.jsp" />
    </logic:equal>

    <tr>
    <td colspan="2" class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="reserve.72" /></span><logic:equal name="rsv110Form" property="rsv110EditAuth" value="true"><logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>"><span class="text_r2"><gsmsg:write key="cmn.comments" /></span></logic:notEqual></logic:equal></td>
    <td align="left" class="td_type1">
      <table class="tl0" width="99%">
      <tr>
      <td width="60%" nowrap>
      <logic:notEqual name="rsv110Form" property="rsv110EditAuth" value="true">
        <span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110Mokuteki" /></span>
        <html:hidden name="rsv110Form" property="rsv110Mokuteki" />
      </logic:notEqual>

      <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
        <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <html:text name="rsv110Form" property="rsv110Mokuteki" maxlength="50" style="width:501px;" styleClass="text_base_rsv" />
        </logic:notEqual>
        <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110Mokuteki" /></span>
          <html:hidden name="rsv110Form" property="rsv110Mokuteki" />
        </logic:equal>
      </logic:equal>
      </td>
      </tr>
      </table>
    </td>
    </tr>

    <%-- 利用区分 --%>
    <logic:equal name="rsv110Form" property="rsv110SisetuKbn" value="<%= String.valueOf(GSConstReserve.RSK_KBN_HEYA) %>">
      <tr>
        <td colspan="2" class="table_bg_A5B4E1" width="20%" nowrap><span class="text_bb1"><gsmsg:write key="reserve.use.kbn" /></span></td>
        <td align="left" class="td_type1" width="80%">
        <table class="tl0" width="99%">
        <tr>
        <td width="60%" nowrap>
        <span class="text_base_rsv">
        <logic:notEqual name="rsv110Form" property="rsv110EditAuth" value="true">
           <logic:equal name="rsv110Form" property="rsv110UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_NOSET) %>"><gsmsg:write key="reserve.use.kbn.noset" /></logic:equal>
           <logic:equal name="rsv110Form" property="rsv110UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_KAIGI) %>"><gsmsg:write key="reserve.use.kbn.meeting" /></logic:equal>
           <logic:equal name="rsv110Form" property="rsv110UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_KENSYU) %>"><gsmsg:write key="reserve.use.kbn.training" /></logic:equal>
           <logic:equal name="rsv110Form" property="rsv110UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_OTHER) %>"><gsmsg:write key="reserve.use.kbn.other" /></logic:equal>
        </logic:notEqual>

        <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
          <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
            <html:radio name="rsv110Form" property="rsv110UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_NOSET) %>" styleId="rsyUkbnNoset"><label for="rsyUkbnNoset"><gsmsg:write key="reserve.use.kbn.noset" /></label></html:radio>&nbsp;
            <html:radio name="rsv110Form" property="rsv110UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_KAIGI) %>" styleId="rsyUkbnKaigi"><label for="rsyUkbnKaigi"><gsmsg:write key="reserve.use.kbn.meeting" /></label></html:radio>&nbsp;
            <html:radio name="rsv110Form" property="rsv110UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_KENSYU) %>" styleId="rsyUkbnKensyu"><label for="rsyUkbnKensyu"><gsmsg:write key="reserve.use.kbn.training" /></label></html:radio>&nbsp;
            <html:radio name="rsv110Form" property="rsv110UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_OTHER) %>" styleId="rsyUkbnOther"><label for="rsyUkbnOther"><gsmsg:write key="reserve.use.kbn.other" /></label></html:radio>
          </logic:notEqual>
          <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
            <logic:equal name="rsv110Form" property="rsv110UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_NOSET) %>"><gsmsg:write key="reserve.use.kbn.noset" /></logic:equal>
            <logic:equal name="rsv110Form" property="rsv110UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_KAIGI) %>"><gsmsg:write key="reserve.use.kbn.meeting" /></logic:equal>
            <logic:equal name="rsv110Form" property="rsv110UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_KENSYU) %>"><gsmsg:write key="reserve.use.kbn.training" /></logic:equal>
            <logic:equal name="rsv110Form" property="rsv110UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_OTHER) %>"><gsmsg:write key="reserve.use.kbn.other" /></logic:equal>
          </logic:equal>
        </logic:equal>
        </span>
        </td>
        </tr>
        </table>
        </td>
      </tr>
    </logic:equal>

    <% if (sisKbn ==GSConstReserve.RSK_KBN_HEYA
            || sisKbn == GSConstReserve.RSK_KBN_CAR) { %>
    <tr>
    <td colspan="2" class="table_bg_A5B4E1" width="20%" nowrap><span class="text_bb1"><gsmsg:write key="reserve.contact" /></span></td>
    <td align="left" class="td_type1" width="80%">
      <table class="tl0" width="99%">
      <tr>
      <td width="60%" nowrap>
      <logic:notEqual name="rsv110Form" property="rsv110EditAuth" value="true">
        <span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110Contact" /></span>
      </logic:notEqual>
      <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
        <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <html:text name="rsv110Form" property="rsv110Contact"  maxlength="20" style="width:155px;" styleClass="text_base_rsv" />
        </logic:notEqual>
        <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110Contact" /></span>
        </logic:equal>
      </logic:equal>
      </td>
      </tr>
      </table>
    </td>
    </tr>
    <% } %>

    <logic:equal name="rsv110Form" property="rsv110SisetuKbn" value="<%= String.valueOf(GSConstReserve.RSK_KBN_HEYA) %>">
    <tr>
    <td colspan="2" class="table_bg_A5B4E1" width="20%" nowrap><span class="text_bb1"><gsmsg:write key="reserve.guide" /></span></td>
    <td align="left" class="td_type1" width="80%">
      <table class="tl0" width="99%">
      <tr>
      <td width="60%" nowrap>
      <logic:notEqual name="rsv110Form" property="rsv110EditAuth" value="true">
        <span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110Guide"/></span>
      </logic:notEqual>
      <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
        <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <html:text name="rsv110Form" property="rsv110Guide" style="width:335px;" maxlength="50" styleClass="text_base_rsv" />
        </logic:notEqual>
        <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110Guide"/></span>
        </logic:equal>
      </logic:equal>
      </td>
      </tr>
      </table>
    </td>
    </tr>

    <tr>
    <td colspan="2" class="table_bg_A5B4E1" width="20%" nowrap><span class="text_bb1"><gsmsg:write key="reserve.park.num" /></span></td>
    <td align="left" class="td_type1" width="80%">
      <table class="tl0" width="99%">
      <tr>
      <td width="60%" nowrap>
      <logic:notEqual name="rsv110Form" property="rsv110EditAuth" value="true">
        <span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110ParkNum" /></span>
      </logic:notEqual>
      <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
        <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <html:text name="rsv110Form" property="rsv110ParkNum" maxlength="5" styleClass="text_base_rsv" style="text-align:right;width:65px;" />
        </logic:notEqual>
        <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110ParkNum" /></span>
        </logic:equal>
      </logic:equal>
      </td>
      </tr>
      </table>
    </td>
    </tr>

    </logic:equal>

    <logic:equal name="rsv110Form" property="rsv110SisetuKbn" value="<%= String.valueOf(GSConstReserve.RSK_KBN_CAR) %>">
    <%-- 行先 --%>
    <tr>
    <td colspan="2" class="table_bg_A5B4E1" width="20%" nowrap><span class="text_bb1"><gsmsg:write key="reserve.dest" /></span></td>
    <td align="left" class="td_type1" width="80%">
      <table class="tl0" width="99%">
      <tr>
      <td width="60%" nowrap>
      <logic:notEqual name="rsv110Form" property="rsv110EditAuth" value="true">
        <span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110Dest" /></span>
      </logic:notEqual>
      <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
        <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <html:text name="rsv110Form" property="rsv110Dest" maxlength="50" styleClass="text_base_rsv" style="width:335px;"/>
        </logic:notEqual>
        <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110Dest" /></span>
        </logic:equal>
      </logic:equal>
      </td>
      </tr>
      </table>
    </td>
    </tr>
    </logic:equal>

    <html:hidden styleId="rsv110AmFrHour" property="rsv110AmFrHour"/>
    <html:hidden styleId="rsv110AmFrMin" property="rsv110AmFrMin"/>
    <html:hidden styleId="rsv110AmToHour" property="rsv110AmToHour"/>
    <html:hidden styleId="rsv110AmToMin" property="rsv110AmToMin"/>
    <html:hidden styleId="rsv110PmFrHour" property="rsv110PmFrHour"/>
    <html:hidden styleId="rsv110PmFrMin" property="rsv110PmFrMin"/>
    <html:hidden styleId="rsv110PmToHour" property="rsv110PmToHour"/>
    <html:hidden styleId="rsv110PmToMin" property="rsv110PmToMin"/>
    <html:hidden styleId="rsv110AllDayFrHour" property="rsv110AllDayFrHour"/>
    <html:hidden styleId="rsv110AllDayFrMin" property="rsv110AllDayFrMin"/>
    <html:hidden styleId="rsv110AllDayToHour" property="rsv110AllDayToHour"/>
    <html:hidden styleId="rsv110AllDayToMin" property="rsv110AllDayToMin"/>

    <jsp:include page="/WEB-INF/plugin/reserve/jsp/rsv110_sub1.jsp" />


<%-- 担当部署/使用者名/人数 --%>
    <% if (sisKbn ==GSConstReserve.RSK_KBN_HEYA
            || sisKbn == GSConstReserve.RSK_KBN_CAR) { %>
    <% String headName="";
           jp.groupsession.v2.struts.msg.GsMessage gsMsg = new jp.groupsession.v2.struts.msg.GsMessage(request);
           String msgTanto = gsMsg.getMessage("reserve.use.name.1");
           String msgUser = gsMsg.getMessage("reserve.use.name.2");
    %>

    <logic:equal name="rsv110Form" property="rsv110SisetuKbn" value="<%= String.valueOf(GSConstReserve.RSK_KBN_HEYA) %>">
    <% headName= msgTanto; %>
    </logic:equal>
    <logic:equal name="rsv110Form" property="rsv110SisetuKbn" value="<%= String.valueOf(GSConstReserve.RSK_KBN_CAR) %>">
    <% headName= msgUser; %>
    </logic:equal>

    <tr>
       <td colspan="2" class="table_bg_A5B4E1" width="20%" nowrap><span class="text_bb1">
         <gsmsg:write key="reserve.busyo" />/<%= headName %>/<gsmsg:write key="reserve.use.num" />
       </span>
    </td>
    <td align="left" class="td_type1" width="80%">
      <table class="tl0" width="99%">
      <tr>
        <td width="60%" nowrap>
          <logic:notEqual name="rsv110Form" property="rsv110EditAuth" value="true">
                 <span class="text_base_rsv">
                 <gsmsg:write key="reserve.busyo" />&nbsp;<bean:write name="rsv110Form" property="rsv110Busyo" /><br>
                 <%= headName %>&nbsp;<bean:write name="rsv110Form" property="rsv110UseName" /><br>
                 他&nbsp;<bean:write name="rsv110Form" property="rsv110UseNum" />人
                 </span>
          </logic:notEqual>

          <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
             <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
             <span class="text_base_rsv">
               <gsmsg:write key="reserve.busyo" />&nbsp;<html:text name="rsv110Form" property="rsv110Busyo" maxlength="50" styleClass="text_base_rsv" style="width:153px;" /><br>
               <%= headName %>&nbsp;<html:text name="rsv110Form" property="rsv110UseName" maxlength="62" styleClass="text_base_rsv" style="width:153px;" /><br>
               他&nbsp;<html:text name="rsv110Form" property="rsv110UseNum" maxlength="5" styleClass="text_base_rsv" style="text-align: right;width:63px;" />人
             </span>
             </logic:notEqual>
             <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
               <span class="text_base_rsv">
               <gsmsg:write key="reserve.busyo" />&nbsp;<bean:write name="rsv110Form" property="rsv110Busyo" /><br>
               <%= headName %>&nbsp;<bean:write name="rsv110Form" property="rsv110UseName" /><br>
               他&nbsp;<bean:write name="rsv110Form" property="rsv110UseNum" />人
               </span>
             </logic:equal>
          </logic:equal>
        </td>
      </tr>
      </table>
    </td>

    </tr>
    <% } %>

    <% if (editSchFlg) { %>
        <tr>
        <td colspan="2" class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="reserve.85" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span></td>
        <td align="left" class="td_type1">
          <html:radio styleId="refOk" name="rsv110Form" property="rsv110ScdReflection" value="<%= String.valueOf(GSConstReserve.SCD_REFLECTION_OK) %>" onclick="rsvSchDisabled();" /><label for="refOk"><gsmsg:write key="reserve.86" /></label>&nbsp;
          <html:radio styleId="refNo" name="rsv110Form" property="rsv110ScdReflection" value="<%= String.valueOf(GSConstReserve.SCD_REFLECTION_NO) %>" onclick="rsvSchDisabled();" /><label for="refNo"><gsmsg:write key="reserve.87" /></label>
        </td>
        </tr>
    <% } %>

    <%-- スケジュール同時登録 --%>
    <logic:equal name="rsv110Form" property="schedulePluginKbn" value="<%= String.valueOf(GSConst.PLUGIN_USE) %>">
    <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
    <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
      <jsp:include page="/WEB-INF/plugin/reserve/jsp/rsv110_schedule.jsp" />
    </logic:equal>
    </logic:notEqual>
    </logic:equal>

    <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
       <tr>
       <td class="table_bg_A5B4E1" colspan="2" nowrap><span class="text_bb1"><gsmsg:write key="schedule.18" /></span></td>
       <td align="left" class="td_type1">
         <table class="tl0" width="100%">
         <tr>
         <td width="50%" nowrap><span class="text_base">※<gsmsg:write key="schedule.35" /></span>
         </span>
         </td>
         <td width="50%" align="left" nowrap>

           <input type="button" value="<gsmsg:write key="schedule.17" />" class="btn_base1" onClick="openScheduleReserveWindowForReserve(<%= String.valueOf(Rsv310Form.POP_DSP_MODE_RSV110) %>);">

         </td>
         </tr>
         </table>
       </td>
       </tr>
    </logic:equal>

    </table>

  </td>
  </tr>

  <tr>
  <td>
    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0" alt="">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td widht="50%" align="left">
      <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
        <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <input type="button" value="<gsmsg:write key="cmn.for.repert" />" class="btn_base1" onclick="buttonPush('kurikaeshi');">
          <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_EDIT) %>">
            <input type="button" value="<gsmsg:write key="cmn.register.copy" />" class="btn_base1" onClick="buttonPush('copytouroku');">
          </logic:equal>
        </logic:notEqual>
      </logic:equal>
    <td width="50%" align="right">
      <logic:notEqual name="rsv110Form" property="rsv110EditAuth" value="true">
        <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onclick="buttonPush('back_to_menu');">
      </logic:notEqual>
      <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
        <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>"><input type="button" value="<gsmsg:write key="cmn.close" />" class="btn_close_n1" onclick="window.parent.callYokyakuWindowClose();"></logic:equal>
        <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <input type="button" value="OK" class="btn_ok1" onclick="buttonPush('sisetu_yoyaku_kakunin');">
          <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_EDIT) %>"><input type="button" value="<gsmsg:write key="cmn.delete" />" class="btn_dell_n1" onclick="buttonPush('delete');"></logic:equal>
          <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onclick="buttonPush('back_to_menu');">
        </logic:notEqual>
      </logic:equal>
    </td>
    </tr>

    <% if (strRsv110ProcMode != null
    && (strRsv110ProcMode.equals(GSConstReserve.PROC_MODE_EDIT)
      || strRsv110ProcMode.equals(GSConstReserve.PROC_MODE_POPUP))) { %>
      <logic:equal name="rsv110Form" property="rsv110ApprBtnFlg" value="1">
      <tr>
      <td colspan="2" align="right" style="padding-top: 5px;">
        <input type="button" value="<gsmsg:write key="cmn.approval" />" id="syoninbtn" class="btn_syonin_n1">
        <input type="button" value="<gsmsg:write key="cmn.rejection" />" id="kyakkabtn" class="btn_kyakka_n1">
      </td>
      </tr>
      </logic:equal>
    <% } %>
    </table>

  </td>
  </tr>
  </table>

</td>
</tr>
</table>

<% String reserveMokuteki = ""; %>

<logic:notEmpty name="rsv110Form" property="rsv110MokutekiEsc">
<bean:define id="reserveMokutekistr" name="rsv110Form" property="rsv110MokutekiEsc" type="java.lang.String" />
<% reserveMokuteki = reserveMokutekistr; %>
</logic:notEmpty>


<div id="rsvApproval" title="<gsmsg:write key='reserve.rsv110.info.2'/>" style="display:none;">
  <p>
    <div>
       <span class="ui-icon ui-icon-info" style="float:left; margin:0 7px 20px 0;"></span>
       <b><gsmsg:write key='reserve.rsv110.info.msg.2' arg0="<%= reserveMokuteki %>" /></b><br><br>
    </div>
  </p>
</div>

<div id="rsvcheck" title="<gsmsg:write key='reserve.rsv110.info'/>" style="display:none;">
  <p>
    <div>
       <span class="ui-icon ui-icon-info" style="float:left; margin:0 7px 20px 0;"></span>
       <b><gsmsg:write key='reserve.rsv110.info.msg' arg0="<%= reserveMokuteki %>" /></b><br><br>
       <input type="checkbox" id="rejectDel" value="1" /><label for="rejectDel" class="text_base"><span class="dialog_checkbox"><gsmsg:write key="reserve.rsv110.appr.note1" /></span></label>&nbsp;
    </div>
  </p>
</div>

<div id="rsvWait" title="<gsmsg:write key='reserve.rsv110.info.2'/>" style="display:none;">
  <p>
    <div>
       <span class="ui-icon ui-icon-info" style="float:left; margin:0 7px 20px 0;"></span>
       <b><gsmsg:write key='reserve.rsv110.info.msg.3' arg0="<%= reserveMokuteki %>" /></b><br><br>
    </div>
  </p>
</div>

<logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
  <jsp:include page="/WEB-INF/plugin/common/jsp/footer001.jsp" />
</logic:notEqual>

</html:form>
</body>
</html:html>
