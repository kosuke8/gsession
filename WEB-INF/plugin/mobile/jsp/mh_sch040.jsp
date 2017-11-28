<%@ page pageEncoding="UTF-8" contentType="text/html; charset=Shift_JIS"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<%@ include file="/WEB-INF/plugin/mobile/jsp/mh_000_header.jsp" %>
<% String gsurl = jp.groupsession.v2.cmn.GSConst.GS_HOMEPAGE_URL; %>
<% thisForm = "mbhSch040Form"; %>
<html:html>
<head>
<title>[<gsmsg:write key="mobile.4" />] <gsmsg:write key="schedule.108" /><gsmsg:write key="cmn.entry" />･<gsmsg:write key="cmn.check" /></title>
<LINK REL="SHORTCUT ICON" href="../common/images/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
<META HTTP-EQUIV="Pragma" Content="no-cache">
<META HTTP-EQUIV="Cache-Control" Content="no-cache">
<META HTTP-EQUIV="Expires" Content="-1">
<%@ include file="/WEB-INF/plugin/mobile/jsp/mh_001_header.jsp" %>
</head>

<body>

<html:form action="/mobile/mh_sch040">
<input type="hidden" name="mobileType" value="0">
<html:hidden property="cmd" />
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
<html:hidden property="sch040InitFlg" />
<html:hidden property="sch040EditDspMode" />


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

<b><%= emojiTokei.toString() %><gsmsg:write key="schedule.108" /><br><gsmsg:write key="cmn.entry" />･<gsmsg:write key="cmn.check" />･<gsmsg:write key="cmn.delete" /></b>
<hr>
<logic:messagesPresent message="false">
<span style="color: red"><html:errors/></span>
</logic:messagesPresent>

<!-- 編集モード -->
<logic:notEqual name="mbhSch040Form" property="sch040DispMod" value="0">
   <jsp:include page="/WEB-INF/plugin/mobile/jsp/mh_sch040_edit.jsp"/>
</logic:notEqual>



<!-- 確認モード -->
<logic:equal name="mbhSch040Form" property="sch040DispMod" value="0">
■<gsmsg:write key="cmn.name4" />
<br>
<logic:notEqual name="mbhSch040Form" property="sch010SelectUsrKbn" value="0">
<img src="../common/images/groupicon.gif" alt="<gsmsg:write key="cmn.group" />" border="0">
</logic:notEqual>
<bean:write name="mbhSch040Form" property="sch040UsrName.label" />
<br>
<br>

■<gsmsg:write key="cmn.start" />
<br>
<bean:define id="yrf" name="mbhSch040Form" property="sch040FrYear" type="java.lang.String" />
<gsmsg:write key="cmn.year" arg0="<%= yrf %>" />
<bean:write name="mbhSch040Form" property="sch040FrMonth" /><gsmsg:write key="cmn.month" />
<bean:write name="mbhSch040Form" property="sch040FrDay" /><gsmsg:write key="cmn.day" />
<br>
<bean:write name="mbhSch040Form" property="sch040FrHour" /><gsmsg:write key="cmn.hour" />
<logic:notEqual name="mbhSch040Form" property="sch040FrMin" value="0">
  <bean:write name="mbhSch040Form" property="sch040FrMin" /><gsmsg:write key="cmn.minute" />
</logic:notEqual>

<br>■<gsmsg:write key="main.src.man250.30" />
<br>
<bean:define id="yrt" name="mbhSch040Form" property="sch040ToYear" type="java.lang.String" />
<gsmsg:write key="cmn.year" arg0="<%= yrt %>" />
<bean:write name="mbhSch040Form" property="sch040ToMonth" /><gsmsg:write key="cmn.month" />
<bean:write name="mbhSch040Form" property="sch040ToDay" /><gsmsg:write key="cmn.day" />
<br>
<bean:write name="mbhSch040Form" property="sch040ToHour" /><gsmsg:write key="cmn.hour" />
<logic:notEqual name="mbhSch040Form" property="sch040ToMin" value="0">
  <bean:write name="mbhSch040Form" property="sch040ToMin" /><gsmsg:write key="cmn.minute" />
</logic:notEqual>
<br>
<br>■<gsmsg:write key="cmn.title" />
<br><bean:write name="mbhSch040Form" property="sch040Title" />

<br>■<gsmsg:write key="schedule.10" />
<br>
    <bean:define id="colorMsg1" value=""/>
    <bean:define id="colorMsg2" value=""/>
    <bean:define id="colorMsg3" value=""/>
    <bean:define id="colorMsg4" value=""/>
    <bean:define id="colorMsg5" value=""/>
    <bean:define id="colorMsg6" value=""/>
    <bean:define id="colorMsg7" value=""/>
    <bean:define id="colorMsg8" value=""/>
    <bean:define id="colorMsg9" value=""/>
    <bean:define id="colorMsg10" value=""/>
    <logic:iterate id="msgStr" name="mbhSch040Form" property="sch040ColorMsgList" indexId="msgId" type="java.lang.String">
    <logic:equal name="msgId" value="0">
    <% colorMsg1 = msgStr; %>
    </logic:equal>
    <logic:equal name="msgId" value="1">
    <% colorMsg2 = msgStr; %>
    </logic:equal>
    <logic:equal name="msgId" value="2">
    <% colorMsg3 = msgStr; %>
    </logic:equal>
    <logic:equal name="msgId" value="3">
    <% colorMsg4 = msgStr; %>
    </logic:equal>
    <logic:equal name="msgId" value="4">
    <% colorMsg5 = msgStr; %>
    </logic:equal>
    <logic:equal name="msgId" value="5">
    <% colorMsg6 = msgStr; %>
    </logic:equal>
    <logic:equal name="msgId" value="6">
    <% colorMsg7 = msgStr; %>
    </logic:equal>
    <logic:equal name="msgId" value="7">
    <% colorMsg8 = msgStr; %>
    </logic:equal>
    <logic:equal name="msgId" value="8">
    <% colorMsg9 = msgStr; %>
    </logic:equal>
    <logic:equal name="msgId" value="9">
    <% colorMsg10 = msgStr; %>
    </logic:equal>
    </logic:iterate>

  <logic:equal name="mbhSch040Form" property="sch040Bgcolor" value="1">
    <span style="background-color:#0000FF;"><html:radio disabled="true" name="mbhSch040Form" property="sch040Bgcolor" value="1" styleId="bg_color1"/></span>
    <label for="bg_color1" class="text_base"><%= colorMsg1 %></label>
  </logic:equal>
  <logic:equal name="mbhSch040Form" property="sch040Bgcolor" value="2">
    <span style="background-color:#FF0000;"><html:radio disabled="true" name="mbhSch040Form" property="sch040Bgcolor" value="2" styleId="bg_color2" /></span>
    <label for="bg_color2" class="text_base"><%= colorMsg2 %></label>
  </logic:equal>
  <logic:equal name="mbhSch040Form" property="sch040Bgcolor" value="3">
    <span style="background-color:#009900;"><html:radio disabled="true" name="mbhSch040Form" property="sch040Bgcolor" value="3" styleId="bg_color3" /></span>
    <label for="bg_color3" class="text_base"><%= colorMsg3 %></label>
  </logic:equal>
  <logic:equal name="mbhSch040Form" property="sch040Bgcolor" value="4">
    <span style="background-color:#ff9900;"><html:radio disabled="true" name="mbhSch040Form" property="sch040Bgcolor" value="4" styleId="bg_color4" /></span>
    <label for="bg_color4" class="text_base"><%= colorMsg4 %></label>
  </logic:equal>
  <logic:equal name="mbhSch040Form" property="sch040Bgcolor" value="5">
    <span style="background-color:#333333;"><html:radio disabled="true" name="mbhSch040Form" property="sch040Bgcolor" value="5" styleId="bg_color5" /></span>
    <label for="bg_color5" class="text_base"><%= colorMsg5 %></label>
  </logic:equal>

  <logic:equal name="mbhSch040Form" property="sch040colorKbn" value="1">
    <logic:equal name="mbhSch040Form" property="sch040Bgcolor" value="6">
      <span style="background-color:#000080;"><html:radio disabled="true" name="mbhSch040Form" property="sch040Bgcolor" value="6" styleId="bg_color6" /></span>
      <label for="bg_color6" class="text_base"><%= colorMsg5 %></label>
    </logic:equal>
    <logic:equal name="mbhSch040Form" property="sch040Bgcolor" value="7">
      <span style="background-color:#800000;"><html:radio disabled="true" name="mbhSch040Form" property="sch040Bgcolor" value="7" styleId="bg_color7" /></span>
      <label for="bg_color7" class="text_base"><%= colorMsg5 %></label>
    </logic:equal>
    <logic:equal name="mbhSch040Form" property="sch040Bgcolor" value="8">
      <span style="background-color:#008080;"><html:radio disabled="true" name="mbhSch040Form" property="sch040Bgcolor" value="8" styleId="bg_color8" /></span>
      <label for="bg_color8" class="text_base"><%= colorMsg5 %></label>
    </logic:equal>
    <logic:equal name="mbhSch040Form" property="sch040Bgcolor" value="9">
      <span style="background-color:#808080;"><html:radio disabled="true" name="mbhSch040Form" property="sch040Bgcolor" value="9" styleId="bg_color9" /></span>
      <label for="bg_color9" class="text_base"><%= colorMsg5 %></label>
    </logic:equal>
    <logic:equal name="mbhSch040Form" property="sch040Bgcolor" value="10">
      <span style="background-color:#008DCB;"><html:radio disabled="true" name="mbhSch040Form" property="sch040Bgcolor" value="10" styleId="bg_color10" /></span>
      <label for="bg_color10" class="text_base"><%= colorMsg5 %></label>
    </logic:equal>
  </logic:equal>

<br>
<br>■<gsmsg:write key="cmn.content" />
<br><bean:write name="mbhSch040Form" property="sch040Value" />

<logic:notEmpty name="mbhSch040Form" property="sch040Biko">
<br>■<gsmsg:write key="cmn.memo" />
<br><bean:write name="mbhSch040Form" property="sch040Biko" />
</logic:notEmpty>

<br>
<br>■<gsmsg:write key="cmn.edit.permissions" />
<br>
<bean:write name="mbhSch040Form" property="sch040EditText" />
<br>

<br>■<gsmsg:write key="cmn.public" />
<br>
<bean:write name="mbhSch040Form" property="sch041PublicText" />
<br>

<br>■出欠確認
<br>
<bean:write name="mbhSch040Form" property="sch041AttendKbnText" />

<br>
<logic:equal name="mbhSch040Form" property="sch010SelectUsrKbn" value="0">
<br>■<gsmsg:write key="schedule.117" />
<br>
<logic:notEmpty name="mbhSch040Form" property="sch040SelectUsrLavel">
<logic:iterate id="urBean" name="mbhSch040Form" property="sch040SelectUsrLavel">
<bean:write name="urBean" property="usiSei" />&nbsp;<bean:write name="urBean" property="usiMei" />
<br>
</logic:iterate>
</logic:notEmpty>
</logic:equal>

<br>■<gsmsg:write key="cmn.reserve" />
<logic:notEmpty name="mbhSch040Form" property="sch040ReserveSelectLavel" scope="request">
  <logic:iterate id="ressBean" name="mbhSch040Form" property="sch040ReserveSelectLavel" scope="request">
     <br><bean:write name="ressBean" property="rsdName" scope="page"/>
  </logic:iterate>
 </logic:notEmpty>

<br>
<br>■<gsmsg:write key="cmn.registant" />
<br>
<logic:notEqual name="mbhSch040Form" property="sch040AddUsrJkbn" value="9">
<bean:write name="mbhSch040Form" property="sch040AddUsrName.label" />
</logic:notEqual>
<logic:equal name="mbhSch040Form" property="sch040AddUsrJkbn" value="9">
<del>
<bean:write name="mbhSch040Form" property="sch040AddUsrName.label" />
</del>
</logic:equal>


<gsmsg:define id="cmnEdit" msgkey="cmn.edit" />
<div align="center">
  <br>
  <logic:equal name="mbhSch040Form" property="schEditKbn" value="0">
    <html:submit property="sch040edit" value="<%= cmnEdit %>" />
  </logic:equal>
  <input name="sch040back" value="<gsmsg:write key="cmn.back" />" type="submit">
</div>
</logic:equal>

<hr>
<a href="../mobile/mh_sch030.do<%= jsessionId.toString() %>"><gsmsg:write key="mobile.18" /></a>
<br>
<a href="../mobile/mh_sch010.do<%= jsessionId.toString() %>"><gsmsg:write key="schedule.19" /></a>
<br>
<a href="../mobile/mh_sch020.do<%= jsessionId.toString() %>"><gsmsg:write key="mobile.19" /></a>

</html:form>

<%@ include file="/WEB-INF/plugin/mobile/jsp/mh_000_footer.jsp" %>
</body>
</html:html>