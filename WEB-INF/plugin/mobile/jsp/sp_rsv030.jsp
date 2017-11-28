<%@page import="jp.groupsession.v2.usr.GSConstUser"%>
<%@page import="jp.groupsession.v2.rsv.GSConstReserve"%>
<%@page import="jp.groupsession.v2.usr.UserUtil"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-jqText.tld" prefix="jquery" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>



<html:html>
<head>
<title>[<gsmsg:write key="mobile.5" />] <gsmsg:write key="cmn.reserve" /></title>
<%@ include file="/WEB-INF/plugin/mobile/jsp/sp_001_header.jsp" %>

<link rel="stylesheet" href="../mobile/sp/css/jquery.ui.datepicker.css?<%= GSConst.VERSION_PARAM %>" />
<link rel="stylesheet" href="../mobile/sp/css/jquery.ui.datepicker.mobile.css?<%= GSConst.VERSION_PARAM %>" />
<script src="../mobile/sp/js/jQuery.ui.datepicker.js?<%= GSConst.VERSION_PARAM %>" type="text/javascript"></script>
<script src="../mobile/sp/js/jquery.ui.datepicker.mobile.js?<%= GSConst.VERSION_PARAM %>" type="text/javascript"></script>

<logic:equal name="mbhRsv030Form" property="mobileLang" value="0">
<script src="../mobile/sp/js/jquery.ui.datepicker-ja.js?<%= GSConst.VERSION_PARAM %>" type="text/javascript"></script>
</logic:equal>

<bean:define id="sptm" name="mbhRsv030Form" property="spTheme"/>
<script type="text/javascript">
$(document).ready(function(){
  $("#date").datepicker();
  <logic:notEmpty name="mbhRsv030Form" property="rsv030SchGroupSid">
    <logic:notEqual name="mbhRsv030Form" property="rsv030SchGroupSid" value="-1">
    rsvSchGrpChange('<%= sptm %>');
    </logic:notEqual>
  </logic:notEmpty>
});
</script>
<script type="text/javascript">
$(document).ready(function(){
  $("#date2").datepicker();
});
</script>

<% pluginName = "rsv"; %>
<% thisForm = "mbhRsv030Form"; %>
</head>

<% boolean editSchFlg = false; %>
<logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_EDIT) %>">
  <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
    <logic:equal name="mbhRsv030Form" property="rsv030ExistSchDateFlg" value="true">
    <logic:greaterThan name="mbhRsv030Form" property="rsv030ScdRsSid" value="0">
      <% editSchFlg = true; %>
    </logic:greaterThan>
    </logic:equal>
  </logic:equal>
</logic:equal>

<body>

<%@ include file="/WEB-INF/plugin/mobile/jsp/sp_002_header.jsp" %>

<div data-role="page" data-theme="<%= usrTheme %>">

<html:form method="post" action="/mobile/sp_rsv030">
<html:hidden property="mobileType" value="1"/>
<div data-role="header" data-nobackbtn="true" data-theme="<%= usrTheme %>">
<img src="../mobile/sp/imgages/rsv_menu_icon_single.gif" class="tl img_border"/>
  <h1><gsmsg:write key="cmn.reserve" /></h1>
  <a href="../mobile/sp_man001.do?mobileType=1" data-role="button" data-icon="home" data-iconpos="notext" class="header_home_button">Home</a>
</div><!-- /header -->

<div data-role="content">
<html:hidden property="rsvBackPgId" />
<html:hidden property="rsvDspFrom" />
<html:hidden property="rsvSelectedGrpSid" />
<html:hidden property="rsvSelectedSisetuSid" />
<html:hidden property="acordParam" />
<html:hidden property="rsv030ProcMode" />
<html:hidden property="rsv030InitFlg" />
<html:hidden property="rsv030RsySid" />
<html:hidden property="rsv030RsdSid" />
<html:hidden property="rsv030SinkiDefaultDate" />
<html:hidden property="rsv030ScdRsSid" />
<html:hidden property="rsv030EditAuth" />
<html:hidden property="rsv100InitFlg" />
<html:hidden property="rsv100SearchFlg" />
<html:hidden property="rsv100SortKey" />
<html:hidden property="rsv100OrderKey" />
<html:hidden property="rsv100PageTop" />
<html:hidden property="rsv100PageBottom" />
<html:hidden property="rsv100selectedFromYear" />
<html:hidden property="rsv100selectedFromMonth" />
<html:hidden property="rsv100selectedFromDay" />
<html:hidden property="rsv100selectedToYear" />
<html:hidden property="rsv100selectedToMonth" />
<html:hidden property="rsv100selectedToDay" />

<html:hidden property="rsv100KeyWord" />
<html:hidden property="rsv100SearchCondition" />
<html:hidden property="rsv100TargetMok" />
<html:hidden property="rsv100TargetNiyo" />
<logic:notEmpty name="mbhRsv030Form" property="rsv100CsvOutField" scope="request">
  <logic:iterate id="csvOutField" name="mbhRsv030Form" property="rsv100CsvOutField" scope="request">
    <input type="hidden" name="rsv100CsvOutField" value="<bean:write name="csvOutField"/>">
  </logic:iterate>
</logic:notEmpty>
<html:hidden property="rsv100SelectedKey1" />
<html:hidden property="rsv100SelectedKey2" />
<html:hidden property="rsv100SelectedKey1Sort" />
<html:hidden property="rsv100SelectedKey2Sort" />
<html:hidden property="rsv100svFromYear" />
<html:hidden property="rsv100svFromMonth" />
<html:hidden property="rsv100svFromDay" />
<html:hidden property="rsv100svToYear" />
<html:hidden property="rsv100svToMonth" />
<html:hidden property="rsv100svToDay" />
<html:hidden property="rsv100svGrp1" />
<html:hidden property="rsv100svGrp2" />
<html:hidden property="rsv100svKeyWord" />
<html:hidden property="rsv100svSearchCondition" />
<html:hidden property="rsv100svTargetMok" />
<html:hidden property="rsv100svTargetNiyo" />
<html:hidden property="rsv100svSelectedKey1" />
<html:hidden property="rsv100svSelectedKey2" />
<html:hidden property="rsv100svSelectedKey1Sort" />
<html:hidden property="rsv100svSelectedKey2Sort" />
<html:hidden property="rsv100SearchSvFlg" />
<html:hidden property="rsv030HeaderDspFlg" />
<html:hidden property="rsv030ExistSchDateFlg" />

<html:hidden property="rsv030SisetuKbn" />
<html:hidden property="rsvPrintUseKbn" />


<logic:notEmpty name="mbhRsv030Form" property="sv_users" scope="request">
  <logic:iterate id="ulBean" name="mbhRsv030Form" property="sv_users" scope="request">
    <input type="hidden" name="sv_users" value="<bean:write name="ulBean" />">
  </logic:iterate>
</logic:notEmpty>

<logic:messagesPresent message="false"><html:errors /></logic:messagesPresent>

  <jsp:include page="/WEB-INF/plugin/mobile/jsp/sp_rsv030_edit.jsp" />
  <br>

    <logic:equal name="mbhRsv030Form" property="schedulePluginKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.PLUGIN_USE) %>">
    <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
    <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">

  <br>

    <logic:equal name="mbhRsv030Form" property="acordParam" value="true">
      <div data-role="collapsible" data-collapsed="true">
    </logic:equal>
    <logic:equal name="mbhRsv030Form" property="acordParam" value="false">
      <div data-role="collapsible" data-collapsed="false">
    </logic:equal>

      <h2>
        <div width="100%" align="center" class="font_small" onClick="chacord()"><gsmsg:write key="schedule.3" /></div>
      </h2>


      <% if (editSchFlg) { %>

         <% String grpColor = radioFont; %>
         <% String nameColor = radioFont; %>
         <logic:equal name="mbhRsv030Form" property="rsv030ScdReflection" value="<%= String.valueOf(GSConstReserve.SCD_REFLECTION_OK) %>">
           <% grpColor = radioFontActive; %>
         </logic:equal>
         <logic:equal name="mbhRsv030Form" property="rsv030ScdReflection" value="<%= String.valueOf(GSConstReserve.SCD_REFLECTION_NO) %>">
           <% nameColor = radioFontActive; %>
         </logic:equal>

         <fieldset data-type="horizontal" align="center">
          <html:radio styleId="refOk" name="mbhRsv030Form" property="rsv030ScdReflection" value="<%= String.valueOf(GSConstReserve.SCD_REFLECTION_OK) %>" onchange="chRsvYes('<%= sptm %>')" />
          <label for="refOk" class="<%= radioClass %>" id="rbr0"><span class="font_xsmall" id="rsvNo" style="color:<%= grpColor %>"><gsmsg:write key="reserve.86" /></span></label>
          <html:radio styleId="refNo" name="mbhRsv030Form" property="rsv030ScdReflection" value="<%= String.valueOf(GSConstReserve.SCD_REFLECTION_NO) %>" onchange="chRsvNo('<%= sptm %>')" />
          <label for="refNo" class="<%= radioClass %>" id="rbr1"><span class="font_xsmall" id="rsvYes" style="color:<%= nameColor %>"><gsmsg:write key="reserve.87" /></span></label>
         </fieldset>
      <% } %>


      <div id="schUsrText" align="center" style="display:block;"><font size="-2">[<gsmsg:write key="reserve.166" />]</font></div>
      <div id="schGrpText" align="center" style="display:none;"><font size="-2">[<gsmsg:write key="reserve.167" />]</font></div>
      <fieldset data-role="controlgroup" data-type="horizontal" align="center">
        <html:radio property="rsv030SchKbn" value="<%= String.valueOf(GSConstReserve.RSV_SCHKBN_USER) %>" styleId="rsvSchKbn0" onchange="rsvSchUsrChange('<%= sptm %>');"/>
        <label for="rsvSchKbn0" id="rsvSchUsrLb" class="<%= radioClass %>"><span id="rsvSchUsrBtn" class="font_xsmall" style="color:<%= radioFontActive %>"><gsmsg:write key="cmn.user" /></span></label>
        <html:radio property="rsv030SchKbn" value="<%= String.valueOf(GSConstReserve.RSV_SCHKBN_GROUP) %>" styleId="rsvSchKbn1" onchange="rsvSchGrpChange('<%= sptm %>');"/>
        <label for="rsvSchKbn1" id="rsvSchGrpLb" class="<%= radioClass %>"><span id="rsvSchGrpBtn" class="font_xsmall" style="color:<%= radioFont %>"><gsmsg:write key="cmn.group" /></span></label>
      </fieldset>

      <div id="schUsrAddArea" align="center" class="font_xsmall" style="display:block">
        <input name="rsv030usrAdd" value="<gsmsg:write key="cmn.user.add" />" type="submit" data-inline="true" data-icon="plus"/>

        <logic:notEmpty name="mbhRsv030Form" property="rsv030SelectUsrLabel" scope="request">
          <logic:notEmpty name="mbhRsv030Form" property="rsv030SelectUsrLabel" scope="request">
          <logic:iterate id="urBean" name="mbhRsv030Form" property="rsv030SelectUsrLabel" scope="request">
          <div align="center" class="font_xsmall"><input name="<bean:write name="urBean" property="usrSid" />" value="<bean:write name="urBean" property="usiSei" />&nbsp;<bean:write name="urBean" property="usiMei" />" type="submit" data-icon="delete"></div>
          </logic:iterate>
          </logic:notEmpty>
        </logic:notEmpty>

      </div>

      <div id="schGrpAddArea" data-role="controlgroup" data-type="horizontal" align="center" class="font_small" style="display:none">
        <div align="center" class="font_small">
          <html:select property="rsv030SchGroupSid" styleId="rsvSchGrpSid">
            <logic:notEmpty name="mbhRsv030Form" property="rsv030SchGroupLabel" scope="request">
                <logic:iterate id="exSchGpBean" name="mbhRsv030Form" property="rsv030SchGroupLabel" scope="request">
                  <% boolean schGpDisabled = false; %>
                  <logic:equal name="exSchGpBean" property="viewKbn" value="false">
                    <% schGpDisabled = true; %>
                  </logic:equal>
                  <bean:define id="gpValue" name="exSchGpBean" property="value" type="java.lang.String" />
                  <logic:equal name="exSchGpBean" property="styleClass" value="0">
                    <html:option value="<%= gpValue %>" disabled="<%= schGpDisabled %>"><bean:write name="exSchGpBean" property="label" /></html:option>
                  </logic:equal>
                  <logic:notEqual name="exSchGpBean" property="styleClass" value="0">
                    <html:option value="<%= gpValue %>" disabled="<%= schGpDisabled %>"><bean:write name="exSchGpBean" property="label" /></html:option>
                  </logic:notEqual>

                </logic:iterate>
            </logic:notEmpty>
          </html:select>
        </div>
      </div>

      </div>

    </logic:equal>
    </logic:notEqual>
    </logic:equal>

    <br>


    <div data-role="controlgroup" data-type="horizontal" align="center" class="font_small">
      <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <input name="rsv030back" type="submit" value="<gsmsg:write key="cmn.back" />" />
      </logic:notEqual>
      <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>"><input name="rsv030delete" type="submit" value="<gsmsg:write key="cmn.close" />"></logic:equal>
        <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <input name="rsv030add" type="submit" value="ＯＫ" data-inline="true" data-icon="check">
          <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_EDIT) %>"><input name="rsv030delete" type="submit" value="<gsmsg:write key="cmn.delete" />"></logic:equal>
          <input name="rsv030back" type="submit" value="<gsmsg:write key="cmn.back" />" data-icon="back" data-inline="true" data-iconpos="right" />
        </logic:notEqual>
      </logic:equal>
     </div>

<br>

</div><!-- /content -->

<%@ include file="/WEB-INF/plugin/mobile/jsp/sp_001_footer.jsp" %>
</html:form>
</div><!-- /page -->

</body>
</html:html>