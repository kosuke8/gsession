<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.rsv.GSConstReserve" %>

 <tr>
 <td colspan="2" class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="schedule.3" /></span></td>
 <td align="left" class="td_type1">

   <html:radio property="rsv110SchKbn" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.RSV_SCHKBN_USER) %>" styleId="rsvSchKbn0" onclick="rsvSchChange();" /><label for="rsvSchKbn0"><span class="text_base"><gsmsg:write key="cmn.user" /></span></label>
   <html:radio property="rsv110SchKbn" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.RSV_SCHKBN_GROUP) %>" styleId="rsvSchKbn1" onclick="rsvSchChange();" /><label for="rsvSchKbn1"><span class="text_base"><gsmsg:write key="cmn.group" /></span></label>
   <br>

   <span id="rsvSchGroup">
     <span class="text_r1">[<gsmsg:write key="reserve.167" />]</span><br>

     <html:select property="rsv110SchGroupSid" styleId="rsvSchGrpSid">
     <logic:notEmpty name="rsv110Form" property="rsv110SchGroupLabel" scope="request">
       <logic:iterate id="exSchGpBean" name="rsv110Form" property="rsv110SchGroupLabel" scope="request">
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
<%--           <html:select property="rsv110SchGroupSid" styleId="rsvSchGrpSid"> --%>
<%--           <logic:notEmpty name="rsv110Form" property="rsv110SchGroupLabel" scope="request"> --%>
<%--              <html:optionsCollection name="rsv110Form" property="rsv110SchGroupLabel" value="value" label="label" /> --%>
<%--           </logic:notEmpty> --%>
<%--           </html:select> --%>
    <input type="button" onclick="openGroupWindow_Disabled(this.form.rsv110SchGroupSid, 'rsv110SchGroupSid', '0', '', 1, '', 'rsvSchNotAccessGroup', 1)" class="group_btn2" value="&nbsp;&nbsp;" id="rsvSchGrpBtn1">
  </span>

  <table cellpadding="0" cellspacing="0" border="0" width="99%" id="rsvSchUser">
  <tr>
  <td width="99%" align="left" class="tbl_in_tbl">
    <span class="text_r1">[<gsmsg:write key="reserve.166" />]</span>

    <table width="0%" border="0">
    <tr>
    <td width="40%" align="center"></td>
    <td width="20%" align="center">&nbsp;</td>
    <td width="40%" align="left">
      <logic:equal name="rsv110Form" property="rsv110SchCrangeKbn" value="0">
      <input id="rsvSchBtn" class="btn_group_n1" value="<gsmsg:write key="cmn.sel.all.group" />" onclick="return openAllGroup_setDisable(this.form.rsv110GroupSid, 'rsv110GroupSid', '<bean:write name="rsv110Form" property="rsv110GroupSid" />', '1', '110_group', 'sv_users', '-1', '0', 0, 0, 0, 'rsvSchNotAccessUser', null, 'rsvSchNotAccessGroup')" type="button">
      </logic:equal>
    </td>
    </tr>
    <tr>
    <td width="40%" class="table_bg_A5B4E1" align="center"><span class="text_bb1"><gsmsg:write key="cmn.target.user" /></span></td>
    <td width="20%" align="center">&nbsp;</td>
    <td width="40%" align="left">

      <logic:notEmpty name="rsv110Form" property="rsv110GroupLabel" scope="request">
        <html:select style="width:220px" property="rsv110GroupSid" onchange="buttonPush('110_group');" styleId="rsvSchGrpLabel">
        <logic:notEmpty name="rsv110Form" property="rsv110GroupLabel" scope="request">
          <logic:iterate id="gpBean" name="rsv110Form" property="rsv110GroupLabel" scope="request">
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
        <logic:equal name="rsv110Form" property="rsv110SchCrangeKbn" value="0">
        <input type="button" onclick="openGroupWindow(this.form.rsv110GroupSid, 'rsv110GroupSid', '1', '110_group')" class="group_btn2" value="&nbsp;&nbsp;" id="rsvSchGrpBtn2">
        </logic:equal>
      </logic:notEmpty>
      <br>
      <span class="text_base">
      <input type="checkbox" name="rsv110SelectUsersKbn" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.SELECT_ON) %>" id="select_user" onclick="return selectUsersList();" />
      <label for="select_user"><gsmsg:write key="cmn.select" /></label></span>

    </td>
    </tr>

    <tr>
    <td align="center">
      <!-- 同時登録先 -->
      <select size="5" multiple name="users_r" class="select01" id="rsvSchUsers_r">
      <logic:notEmpty name="rsv110Form" property="rsv110SelectUsrLabel" scope="request">
        <logic:iterate id="urBean" name="rsv110Form" property="rsv110SelectUsrLabel" scope="request">
        <bean:define id="styleStr" value=""/>
          <logic:equal name="urBean" property="usrUkoFlg" value="1">
            <% styleStr = "mukouser_option"; %>
          </logic:equal>
          <option class="<%= styleStr %>" value="<bean:write name="urBean" property="usrSid" scope="page"/>"><bean:write name="urBean" property="usiSei" scope="page"/>&nbsp;&nbsp;<bean:write name="urBean" property="usiMei" scope="page"/></option>
        </logic:iterate>
      </logic:notEmpty>
      <option value="-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
      </select>
    </td>

    <td align="center">
      <input type="button" class="btn_base1add" value="<gsmsg:write key="cmn.add"/>" name="adduserBtn" onClick="buttonPush('110_rightarrow');"><br><br>
      <input type="button" class="btn_base1del" value="<gsmsg:write key="cmn.delete" />" name="deluserBtn" onClick="buttonPush('110_leftarrow');">
    </td>
    <td>
      <select size="5" multiple name="users_l" class="select01" id="rsvSchUsers_l">
      <logic:notEmpty name="rsv110Form" property="rsv110BelongLabel" scope="request">
        <logic:iterate id="urBean" name="rsv110Form" property="rsv110BelongLabel" scope="request">
        <bean:define id="styleStr" value=""/>
          <logic:equal name="urBean" property="usrUkoFlg" value="1">
            <% styleStr = "mukouser_option"; %>
          </logic:equal>
          <option class="<%= styleStr %>" value="<bean:write name="urBean" property="usrSid" scope="page"/>"><bean:write name="urBean" property="usiSei" scope="page"/>&nbsp;&nbsp;<bean:write name="urBean" property="usiMei" scope="page"/></option>
        </logic:iterate>
      </logic:notEmpty>
      <option value="-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
      </select>
    </td>
    </tr>
    </table>

  </td>
  </tr>
  </table>
</td>
</tr>