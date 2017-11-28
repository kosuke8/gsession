<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<% String tdColor = request.getParameter("tdColor");%>

<logic:notEqual name="sch040Form" property="sch010SelectUsrKbn" value="1">
<logic:notEmpty name="sch040Form" property="sch040AddedUsrLabel" scope="request">
<logic:equal name="sch040Form" property="cmd" value="edit">
<logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
<tr id="addedUsrArea">
<td class="table_bg_A5B4E1"><span class="text_bb1"><gsmsg:write key="schedule.32" /></span><span class="text_r2">※</span></td>
<td align="left" class="<%= tdColor %>">
  <span class="text_r1"><gsmsg:write key="schedule.12" /></span>
  <logic:iterate id="aurBean" name="sch040Form" property="sch040AddedUsrLabel" scope="request">
  <br>
      <logic:equal name="aurBean" property="usrUkoFlg" value="1">
        <span class="text_base mukouser">
        <bean:write name="aurBean" property="usiSei" scope="page"/>　<bean:write name="aurBean" property="usiMei" scope="page"/>
      </logic:equal>

      <logic:notEqual name="aurBean" property="usrUkoFlg" value="1">
        <span class="text_base">
        <bean:write name="aurBean" property="usiSei" scope="page"/>　<bean:write name="aurBean" property="usiMei" scope="page"/>
      </logic:notEqual>

    </span>
  </logic:iterate><br>
  <html:radio name="sch040Form" property="sch040BatchRef" styleId="sch040BatchRef0" value="1" onclick="setDisabled();"/><span class="text_base2"><label for="sch040BatchRef0"><gsmsg:write key="schedule.34" /></label></span>
  <html:radio name="sch040Form" property="sch040BatchRef" styleId="sch040BatchRef1" value="0" onclick="setDisabled();"/><span class="text_base2"><label for="sch040BatchRef1"><gsmsg:write key="schedule.33" /></label></span>&nbsp;
</td>
</tr>
</logic:notEqual>
</logic:equal>
</logic:notEmpty>

<logic:empty name="sch040Form" property="sch040AddedUsrLabel" scope="request">
<html:hidden property="sch040BatchRef" value="1"/>
</logic:empty>

<tr>
<td class="table_bg_A5B4E1" nowrap>
  <span class="text_bb1"><gsmsg:write key="schedule.117" /></span>
</td>
<td align="left" class="<%= tdColor %>">
<logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">

  <table width="0%" border="0">
  <tr>
  <td width="40%">
  <span class="text_r1">[<gsmsg:write key="schedule.29" />]</span>
  </td>
  <td width="20%">&nbsp;</td>
  <td width="40%">
    <logic:equal name="sch040Form" property="sch040CrangeKbn" value="0">
      <input class="btn_group_n1" value="<gsmsg:write key="cmn.sel.all.group" />" onclick="return openAllGroup_setDisable(this.form.sch040GroupSid, 'sch040GroupSid', '<bean:write name="sch040Form" property="sch040GroupSid" />', '1', '040_group', 'sv_users', '<bean:write name="sch040Form" property="sch010SelectUsrSid" />', '0', 0, 0, 0, 'schNotAccessUser', null, 'schNotAccessGroup')" type="button">
    </logic:equal>
  </td>
  </tr>
  <tr>
  <td width="40%" class="table_bg_A5B4E1" align="center"><span class="text_bb1"><gsmsg:write key="cmn.target.user" /></span></td>
  <td width="20%" align="center">&nbsp;</td>
  <td width="40%" align="left">

  <logic:notEmpty name="sch040Form" property="sch040GroupLabel" scope="request">
  <html:select property="sch040GroupSid" onchange="changeGroupCombo('040_group');" styleClass="select05">

  <logic:notEmpty name="sch040Form" property="sch040GroupLabel" scope="request">
  <logic:iterate id="gpBean" name="sch040Form" property="sch040GroupLabel" scope="request">

  <% boolean gpDisabled = false; %>
  <logic:equal name="gpBean" property="viewKbn" value="false">
  <% gpDisabled = true; %>
  </logic:equal>

  <bean:define id="gpValue" name="gpBean" property="value" type="java.lang.String" />
  <logic:equal name="gpBean" property="styleClass" value="0">
  <html:option value="<%= gpValue %>" disabled="<%= gpDisabled %>"><bean:write name="gpBean" property="label" /></html:option>
  </logic:equal>

  <logic:notEqual name="gpBean" property="styleClass" value="0">
  <html:option styleClass="select03" value="<%= gpValue %>" disabled="<%= gpDisabled %>"><bean:write name="gpBean" property="label" /></html:option>
  </logic:notEqual>

  </logic:iterate>
  </logic:notEmpty>

    </html:select>
    </logic:notEmpty>
    <span class="text_base8">
    <logic:equal name="sch040Form" property="sch040CrangeKbn" value="0">
      <input type="button" onclick="openGroupWindow(this.form.sch040GroupSid, 'sch040GroupSid', '1', '040_group', 0, '', 'schNotAccessGroup');" class="group_btn2" value="&nbsp;" id="sch040GroupBtn">
    </logic:equal>
    <input type="checkbox" name="sch040SelectUsersKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.SELECT_ON) %>" id="select_user" onclick="return selectUsersList();" />
    <label for="select_user"><gsmsg:write key="cmn.select" /></label></span>
  </td>
  </tr>

  <tr>
  <td align="center">
    <!-- 同時登録先 -->
    <select size="5" multiple name="users_r" class="select01">
    <logic:notEmpty name="sch040Form" property="sch040SelectUsrLabel" scope="request">
    <logic:iterate id="urBean" name="sch040Form" property="sch040SelectUsrLabel" scope="request">
        <logic:equal name="urBean" property="usrUkoFlg" value="1">
          <option value="<bean:write name="urBean" property="usrSid" scope="page"/>" class="mukouser_option">
          <bean:write name="urBean" property="usiSei" scope="page"/>　<bean:write name="urBean" property="usiMei" scope="page"/>
        </logic:equal>

        <logic:notEqual name="urBean" property="usrUkoFlg" value="1">
          <option value="<bean:write name="urBean" property="usrSid" scope="page"/>">
          <bean:write name="urBean" property="usiSei" scope="page"/>　<bean:write name="urBean" property="usiMei" scope="page"/>
        </logic:notEqual>
    </logic:iterate>
    </logic:notEmpty>
    <option value="-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
    </select>
  </td>

  <td align="center">

    <input type="button" class="btn_base1add" value="<gsmsg:write key="cmn.add"/>" name="adduserBtn" onClick="moveUser('040_rightarrow');"><br><br>
    <input type="button" class="btn_base1del" value="<gsmsg:write key="cmn.delete" />" name="deluserBtn" onClick="moveUser('040_leftarrow');">

  </td>
  <td>
     <!-- グループ -->
     <select size="5" multiple name="users_l" class="select01">
     <logic:notEmpty name="sch040Form" property="sch040BelongLabel" scope="request">
      <logic:iterate id="urBean" name="sch040Form" property="sch040BelongLabel" scope="request">

        <logic:equal name="urBean" property="usrUkoFlg" value="1">
          <option value="<bean:write name="urBean" property="usrSid" scope="page"/>" class="mukouser_option">
          <bean:write name="urBean" property="usiSei" scope="page"/>　<bean:write name="urBean" property="usiMei" scope="page"/>
        </logic:equal>

        <logic:notEqual name="urBean" property="usrUkoFlg" value="1">
          <option value="<bean:write name="urBean" property="usrSid" scope="page"/>">
          <bean:write name="urBean" property="usiSei" scope="page"/>　<bean:write name="urBean" property="usiMei" scope="page"/>
        </logic:notEqual>

        </option>
      </logic:iterate>
     </logic:notEmpty>
    <option value="-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
    </select>
  </td>
  </tr>
  </table>
  </logic:notEqual>
  <logic:equal name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
    <logic:notEmpty name="sch040Form" property="sch040SelectUsrLabel" scope="request">
    <logic:iterate id="urBean" name="sch040Form" property="sch040SelectUsrLabel" scope="request">

      <logic:equal name="urBean" property="usrUkoFlg" value="1">
        <span class="text_base mukouser">
        <bean:write name="urBean" property="usiSei" scope="page"/>　<bean:write name="urBean" property="usiMei" scope="page"/>
      </logic:equal>

      <logic:notEqual name="urBean" property="usrUkoFlg" value="1">
        <span class="text_base">
        <bean:write name="urBean" property="usiSei" scope="page"/>　<bean:write name="urBean" property="usiMei" scope="page"/>
      </logic:notEqual>
      <br>
    </span>

    </logic:iterate>
    </logic:notEmpty>
  </logic:equal>
</td>
</tr>
</logic:notEqual>