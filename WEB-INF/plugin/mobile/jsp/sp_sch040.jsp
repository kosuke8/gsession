<%@page import="jp.groupsession.v2.usr.UserUtil"%>
<%@page import="jp.groupsession.v2.cmn.model.base.CmnUsrmInfModel"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-jqText.tld" prefix="jquery" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>



<html:html>
<head>
<title>[<gsmsg:write key="mobile.5" />] <gsmsg:write key="schedule.108" /><gsmsg:write key="cmn.entry" />･<gsmsg:write key="cmn.check" /></title>

<%@ include file="/WEB-INF/plugin/mobile/jsp/sp_001_header.jsp" %>

<link rel="stylesheet" href="../mobile/sp/css/jquery.ui.datepicker.css?<%= GSConst.VERSION_PARAM %>" />
<link rel="stylesheet" href="../mobile/sp/css/jquery.ui.datepicker.mobile.css?<%= GSConst.VERSION_PARAM %>" />
<script src="../mobile/sp/js/jQuery.ui.datepicker.js?<%= GSConst.VERSION_PARAM %>" type="text/javascript"></script>
<script src="../mobile/sp/js/jquery.ui.datepicker.mobile.js?<%= GSConst.VERSION_PARAM %>" type="text/javascript"></script>

<logic:equal name="mbhSch040Form" property="mobileLang" value="0">
<script src="../mobile/sp/js/jquery.ui.datepicker-ja.js?<%= GSConst.VERSION_PARAM %>" type="text/javascript"></script>
</logic:equal>

<script type="text/javascript">
$(document).ready(function(){
  $("#date").datepicker();
});
</script>
<script type="text/javascript">
$(document).ready(function(){
  $("#date2").datepicker();
});
</script>
<% pluginName = "sch"; %>
<% thisForm = "mbhSch040Form"; %>
</head>

<body>

<%@ include file="/WEB-INF/plugin/mobile/jsp/sp_002_header.jsp" %>

<div data-role="page" data-theme="<%= usrTheme %>">

<html:form action="/mobile/sp_sch040">
<input type="hidden" name="mobileType" value="1">
<html:hidden property="cmd" />
<input type="hidden" name="CMD" value="">
<html:hidden property="dspMod" />
<html:hidden property="sch010SchSid" />
<html:hidden property="listMod" />
<html:hidden property="sch010DspDate" />
<html:hidden property="changeDateFlg" />
<html:hidden property="sch010DspGpSid" />
<html:hidden property="sch010SelectUsrSid" />
<html:hidden property="sch010SelectDate" />
<html:hidden property="sch010SchSid" />
<html:hidden property="sch010SelectUsrKbn" />
<html:hidden property="sch040BatchRef" />
<html:hidden property="sch040ReserveGroupSid" />
<html:hidden property="sch040ResBatchRef" />
<html:hidden property="sch040contact" />
<html:hidden property="sch040ResBatchRef" />
<html:hidden property="sch040DispMod" />
<html:hidden property="sch040FrYear" />
<html:hidden property="sch040FrMonth" />
<html:hidden property="sch040FrDay" />
<html:hidden property="sch040ToYear" />
<html:hidden property="sch040ToMonth" />
<html:hidden property="sch040ToDay" />
<html:hidden property="sch040InitFlg" />
<html:hidden property="sch040EditDspMode" />

<bean:define id="sptm" name="mbhSch040Form" property="spTheme"/>

<div data-role="header" data-nobackbtn="true" data-theme="<%= usrTheme %>">
<a href="#" onClick="buttonPush('sch040back');" data-role="button" data-icon="back" data-iconpos="notext" class="header_back_button">Back</a>
<img src="../mobile/sp/imgages/sch_menu_icon_single.gif" class="tl img_border"/>
  <h1><gsmsg:write key="schedule.108" /><br><gsmsg:write key="cmn.entry" />･<gsmsg:write key="cmn.check" /></h1>
  <a href="../mobile/sp_man001.do?mobileType=1" data-role="button" data-icon="home" data-iconpos="notext" class="header_home_button">Home</a>
</div><!-- /header -->

<div data-role="content">

<logic:notEmpty name="mbhSch040Form" property="sv_users" scope="request">
<logic:iterate id="ulBean" name="mbhSch040Form" property="sv_users" scope="request">
<input type="hidden" name="sv_users" value="<bean:write name="ulBean" />">
</logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="mbhSch040Form" property="svReserveUsers" scope="request">
<logic:iterate id="resBean" name="mbhSch040Form" property="svReserveUsers" scope="request">
<input type="hidden" name="svReserveUsers" value="<bean:write name="resBean" />">
</logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="mbhSch040Form" property="sch040CompanySid">
  <logic:iterate id="coId" name="mbhSch040Form" property="sch040CompanySid">
    <input type="hidden" name="sch040CompanySid" value="<bean:write name="coId"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="mbhSch040Form" property="sch040CompanyBaseSid">
  <logic:iterate id="coId" name="mbhSch040Form" property="sch040CompanyBaseSid">
    <input type="hidden" name="sch040CompanyBaseSid" value="<bean:write name="coId"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="mbhSch040Form" property="sch040AddressId">
  <logic:iterate id="addressId" name="mbhSch040Form" property="sch040AddressId">
    <input type="hidden" name="sch040AddressId" value="<bean:write name="addressId"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:messagesPresent message="false">
<span style="color: red"><html:errors/></span>
</logic:messagesPresent>

<!-- 編集モード -->
<logic:notEqual name="mbhSch040Form" property="sch040DispMod" value="0">
<jsp:include page="/WEB-INF/plugin/mobile/jsp/sp_sch040_edit.jsp" />

</logic:notEqual>


<!-- 確認モード -->
<logic:equal name="mbhSch040Form" property="sch040DispMod" value="0">

<ul data-role="listview" data-inset="true" data-theme="d" data-dividertheme="c">
  <li data-role="list-divider">
    <div align="center">
      <logic:notEqual name="mbhSch040Form" property="sch010SelectUsrKbn" value="0">
      <img src="../common/images/groupicon.gif" alt="<gsmsg:write key="cmn.group" />" border="0">
      </logic:notEqual>
      <span class="<bean:write name="mbhSch040Form" property="sch040UsrName.CSSClassNameNormal" filter="false"/>"><bean:write name="mbhSch040Form" property="sch040UsrName.label" /></span>
    </div>
  </li>

  <li>
    <div class="font_xsmall">■<gsmsg:write key="cmn.start" /></div>
    <bean:define id="yrf" name="mbhSch040Form" property="sch040FrYear" type="java.lang.String" />
    <gsmsg:write key="cmn.year" arg0="<%= yrf %>"/>
    <bean:write name="mbhSch040Form" property="sch040FrMonth" /><gsmsg:write key="cmn.month" />
    <bean:write name="mbhSch040Form" property="sch040FrDay" /><gsmsg:write key="cmn.day" />
    <logic:notEqual name="mbhSch040Form" property="sch040FrHour" value="-1">
      <br>
      <bean:write name="mbhSch040Form" property="sch040FrHour" /><gsmsg:write key="cmn.hour" />
      <logic:notEqual name="mbhSch040Form" property="sch040FrMin" value="0">
        <bean:write name="mbhSch040Form" property="sch040FrMin" /><gsmsg:write key="cmn.minute" />
      </logic:notEqual>
    </logic:notEqual>
  </li>

  <li>
    <div class="font_xsmall">■<gsmsg:write key="main.src.man250.30" /></div>
    <bean:define id="yrt" name="mbhSch040Form" property="sch040ToYear" type="java.lang.String" />
    <gsmsg:write key="cmn.year" arg0="<%= yrt %>" />
    <bean:write name="mbhSch040Form" property="sch040ToMonth" /><gsmsg:write key="cmn.month" />
    <bean:write name="mbhSch040Form" property="sch040ToDay" /><gsmsg:write key="cmn.day" />
    <logic:notEqual name="mbhSch040Form" property="sch040ToHour" value="-1">
      <br>
      <bean:write name="mbhSch040Form" property="sch040ToHour" /><gsmsg:write key="cmn.hour" />
      <logic:notEqual name="mbhSch040Form" property="sch040ToMin" value="0">
        <bean:write name="mbhSch040Form" property="sch040ToMin" /><gsmsg:write key="cmn.minute" />
      </logic:notEqual>
    </logic:notEqual>
  </li>

  <li>
    <div class="font_xsmall">■<gsmsg:write key="cmn.title" /></div>
    <bean:write name="mbhSch040Form" property="sch040Title" />
  </li>

  <logic:notEmpty name="mbhSch040Form" property="sch040BgcolorText">
    <li>
      <div class="font_xsmall">■<gsmsg:write key="schedule.10" /></div>
      <bean:write name="mbhSch040Form" property="sch040BgcolorText" />
    </li>
  </logic:notEmpty>

  <li>
    <div class="font_xsmall">■<gsmsg:write key="cmn.content" /></div>
    <bean:write name="mbhSch040Form" property="sch040Value" />
  </li>


  <logic:notEmpty name="mbhSch040Form" property="sch040Biko">
    <li>
      <div class="font_xsmall">■<gsmsg:write key="cmn.memo" /></div>
      <bean:write name="mbhSch040Form" property="sch040Biko" />
    </li>
  </logic:notEmpty>

  <li>
    <div class="font_xsmall">■<gsmsg:write key="cmn.edit.permissions" /></div>
    <bean:write name="mbhSch040Form" property="sch040EditText" />
  </li>

  <li>
    <div class="font_xsmall">■<gsmsg:write key="cmn.public" /></div>
    <bean:write name="mbhSch040Form" property="sch041PublicText" />
  </li>

  <li>
    <div class="font_xsmall">■出欠確認</div>
    <bean:write name="mbhSch040Form" property="sch041AttendKbnText" />
  </li>

  <logic:equal name="mbhSch040Form" property="sch010SelectUsrKbn" value="0">
    <logic:notEmpty name="mbhSch040Form" property="sch040SelectUsrLavel">
      <li>
        <div class="font_xsmall">■<gsmsg:write key="schedule.117" /></div>
        <logic:iterate id="urBean" name="mbhSch040Form" property="sch040SelectUsrLavel" type="CmnUsrmInfModel">
        <span class="<%=UserUtil.getCSSClassNameNormal(urBean.getUsrUkoFlg())%>"><bean:write name="urBean" property="usiSei" />&nbsp;<bean:write name="urBean" property="usiMei" /></span>
        <br>
        </logic:iterate>
      </li>
    </logic:notEmpty>
  </logic:equal>


  <logic:notEmpty name="mbhSch040Form" property="sch040ReserveSelectLavel" scope="request">
    <li>
      <div class="font_xsmall">■<gsmsg:write key="cmn.reserve" /></div>
      <logic:iterate id="ressBean" name="mbhSch040Form" property="sch040ReserveSelectLavel" scope="request">
        <bean:write name="ressBean" property="rsdName" scope="page"/><br>
      </logic:iterate>
    </li>
 </logic:notEmpty>

  <li>
    <div class="font_xsmall">■<gsmsg:write key="cmn.registant" /></div>
    <logic:notEqual name="mbhSch040Form" property="sch040AddUsrJkbn" value="9">
    <span class="<bean:write name="mbhSch040Form" property="sch040AddUsrName.CSSClassNameNormal" filter="false"/>"><bean:write name="mbhSch040Form" property="sch040AddUsrName.label" /></span>
    </logic:notEqual>
    <logic:equal name="mbhSch040Form" property="sch040AddUsrJkbn" value="9">
    <del>
    <bean:write name="mbhSch040Form" property="sch040AddUsrName.label" />
    </del>
    </logic:equal>
  </li>

</ul>

<div data-role="controlgroup" data-type="horizontal" align="center" class="font_small">
  <br>
  <logic:equal name="mbhSch040Form" property="schEditKbn" value="0">
    <input type="submit" name="sch040edit" value="<gsmsg:write key="cmn.edit" />"  data-inline="true" data-icon="arrow-l"/>
  </logic:equal>
  <input name="sch040back" value="<gsmsg:write key="cmn.back" />" type="submit" data-icon="back" data-inline="true" data-iconpos="right"/>
</div>
</logic:equal>
<br>

<ul data-role="listview" data-theme="d" data-dividertheme="c">
  <li><a href="../mobile/sp_sch030.do"><gsmsg:write key="mobile.18" /></a></li>
  <li><a href="../mobile/sp_sch010.do"><gsmsg:write key="schedule.19" /></a></li>
  <li><a href="../mobile/sp_sch020.do"><gsmsg:write key="mobile.19" /></a></li>
</ul>

</div><!-- /content -->

<%@ include file="/WEB-INF/plugin/mobile/jsp/sp_001_footer.jsp" %>

<div id="mailAttend" style="position:absolute;bottom:0;display:none;z-index:10;display:none;width:100%;height:100%;background:rgba(255, 255, 255, 0.7);">
  <div id="schAttendPopup">
    <div style="text-align:right;">
    <a href="#" onclick="schAttendPopup();" data-role="button" data-icon="delete" data-iconpos="notext">Close</a>
    </div>
    <div align="center">
    <div style="width:90%;" class="title_1" align="center">
      <div class="font_small">
         <b>スケジュールを更新します。<br>よろしいですか？</b>
      </div>
      <br>
      <div>
         <input type="checkbox" name="sch040EditMailSendKbn" id="mailSendKbn" value="1" /><label for="mailSendKbn" class="text_base"><span class="font_xsmall">出欠確認<br>再通知メールを送信する</span></label>
      </div>
    </div>

    <div>
    <input name="sch040add" value="はい" type="submit" data-inline="true" data-role="button" data-icon="plus" style="font-size: 10px;"/>
    <input value="キャンセル" type="button" data-inline="true" data-role="button" data-icon="delete" onclick="schAttendPopup();"; />
  </div>

</div>
  </div>
</div>


</html:form>
</div><!-- /page -->

</body>
</html:html>
