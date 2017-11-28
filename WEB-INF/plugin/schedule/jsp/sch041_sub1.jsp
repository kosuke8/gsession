<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<% String maxLengthContent = String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.MAX_LENGTH_VALUE); %>
<% String maxLengthBiko = String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.MAX_LENGTH_BIKO); %>
<% String tdColor = request.getParameter("tdColor");%>
<% String valueFocusEvent = ""; %>
<% String bikoFocusEvent = ""; %>

<tr>
    <td colspan="2" class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="schedule.10" /></span></td>
    <td align="left" class="<%= tdColor %>">

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
    <logic:iterate id="msgStr" name="sch041Form" property="sch040ColorMsgList" indexId="msgId" type="java.lang.String">
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

    <span class="sc_block_color_1"><html:radio name="sch041Form" property="sch041Bgcolor" value="1" styleId="bg_color1" /></span>
    <label for="bg_color1" class="text_base"><%= colorMsg1 %></label>
    <span class="sc_block_color_2"><html:radio name="sch041Form" property="sch041Bgcolor" value="2" styleId="bg_color2" /></span>
    <label for="bg_color2" class="text_base"><%= colorMsg2 %></label>
    <span class="sc_block_color_3"><html:radio name="sch041Form" property="sch041Bgcolor" value="3" styleId="bg_color3" /></span>
    <label for="bg_color3" class="text_base"><%= colorMsg3 %></label>
    <span class="sc_block_color_4"><html:radio name="sch041Form" property="sch041Bgcolor" value="4" styleId="bg_color4" /></span>
    <label for="bg_color4" class="text_base"><%= colorMsg4 %></label>
    <span class="sc_block_color_5"><html:radio name="sch041Form" property="sch041Bgcolor" value="5" styleId="bg_color5" /></span>
    <label for="bg_color5" class="text_base"><%= colorMsg5 %></label>

    <logic:equal name="sch041Form" property="sch041colorKbn" value="1">
      <div><img src="../schedule/images/spacer.gif" width="1px" border="0" height="10px"></div>
      <span class="sc_block_color_6"><html:radio name="sch041Form" property="sch041Bgcolor" value="6" styleId="bg_color6" /></span>
      <label for="bg_color6" class="text_base"><%= colorMsg6 %></label>
      <span class="sc_block_color_7"><html:radio name="sch041Form" property="sch041Bgcolor" value="7" styleId="bg_color7" /></span>
      <label for="bg_color7" class="text_base"><%= colorMsg7 %></label>
      <span class="sc_block_color_8"><html:radio name="sch041Form" property="sch041Bgcolor" value="8" styleId="bg_color8" /></span>
      <label for="bg_color8" class="text_base"><%= colorMsg8 %></label>
      <span class="sc_block_color_9"><html:radio name="sch041Form" property="sch041Bgcolor" value="9" styleId="bg_color9" /></span>
      <label for="bg_color9" class="text_base"><%= colorMsg9 %></label>
      <span class="sc_block_color_10"><html:radio name="sch041Form" property="sch041Bgcolor" value="10" styleId="bg_color10" /></span>
      <label for="bg_color10" class="text_base"><%= colorMsg10 %></label>
    </logic:equal>

  </td>
    </tr>

<tr>
    <td colspan="2" class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.content2" /></span></td>
    <%-- textareaの先頭行に入力した改行を反映させるため、開始タグの直後には必ず改行をいれること。 --%>
    <td align="left" class="<%= tdColor %>"><textarea name="sch041Value" style="width:455px;" rows="10" styleClass="text_base" onkeyup="showLengthStr(value, <%= maxLengthContent %>, 'inputlength');" id="inputstr" <%= valueFocusEvent %>>
<bean:write name="sch041Form" property="sch041Value" /></textarea>
    <br>
    <span class="font_string_count"><gsmsg:write key="cmn.current.characters" />:</span><span id="inputlength" class="font_string_count">0</span>&nbsp;<span class="font_string_count_max">/&nbsp;<%= maxLengthContent %>&nbsp;<gsmsg:write key="cmn.character" /></span>
    </td>
    </tr>

     <tr>
    <td colspan="2" class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="schedule.2" /></span></td>
    <%-- textareaの先頭行に入力した改行を反映させるため、開始タグの直後には必ず改行をいれること。 --%>
    <td align="left" class="<%= tdColor %>"><textarea name="sch041Biko" style="width:455px;" rows="5" styleClass="text_base" onkeyup="showLengthStr(value, <%= maxLengthBiko %>, 'inputlength2');" id="inputstr2" <%= bikoFocusEvent %>>
<bean:write name="sch041Form" property="sch041Biko" /></textarea>
    <br>
    <span class="font_string_count"><gsmsg:write key="cmn.current.characters" />:</span><span id="inputlength2" class="font_string_count">0</span>&nbsp;<span class="font_string_count_max">/&nbsp;<%= maxLengthBiko %>&nbsp;<gsmsg:write key="cmn.character" /></span>
    </td>
    </tr>

    <tr>
    <td colspan="2" class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.edit.permissions" /></span><span class="text_r2">※</span></td>
    <td align="left" class="<%= tdColor %>">
      <html:radio name="sch041Form" property="sch041Edit" styleId="sch040Edit0" value="0" /><span class="text_base2"><label for="sch040Edit0"><gsmsg:write key="cmn.nolimit" /></label></span>&nbsp;
      <html:radio name="sch041Form" property="sch041Edit" styleId="sch040Edit1" value="1" /><span class="text_base2"><label for="sch040Edit1"><gsmsg:write key="cmn.only.principal.or.registant" /></label></span>
      <html:radio name="sch041Form" property="sch041Edit" styleId="sch040Edit2" value="2" /><span class="text_base2"><label for="sch040Edit2"><gsmsg:write key="cmn.only.affiliation.group.membership" /></label></span>
    </td>
    </tr>

    <tr>
    <td colspan="2" class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="schedule.21" /></span><span class="text_r2">※</span></td>
    <td align="left" class="<%= tdColor %>">
      <html:radio name="sch041Form" property="sch041Public" styleId="sch040Public0" value="0" /><span class="text_base2"><label for="sch040Public0"><gsmsg:write key="cmn.public" /></label></span>&nbsp;
      <html:radio name="sch041Form" property="sch041Public" styleId="sch040Public1" value="1" /><span class="text_base2"><label for="sch040Public1"><gsmsg:write key="cmn.private" /></label></span>
      <logic:equal name="sch041Form" property="sch010SelectUsrKbn" value="0">
        <html:radio name="sch041Form" property="sch041Public" styleId="sch040Public2" value="2" /><span class="text_base2"><label for="sch040Public2"><gsmsg:write key="schedule.5" /></label></span>
        <html:radio name="sch041Form" property="sch041Public" styleId="sch040Public3" value="3" /><span class="text_base2"><label for="sch040Public3"><gsmsg:write key="schedule.28" /></label></span>
      </logic:equal>
      <a id="add_user" name="add_user"></a>
    </td>
    </tr>