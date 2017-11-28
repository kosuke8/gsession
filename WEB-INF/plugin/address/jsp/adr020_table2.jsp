<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<%@ page import="jp.groupsession.v2.adr.GSConstAddress" %>

<%
    String maxLengthBiko = String.valueOf(GSConstAddress.MAX_LENGTH_ADR_BIKO);
%>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap><font class="text_bb1">ＦＡＸ１</font></td>
    <td valign="middle" align="left" class="td_wt" nowrap>
      <html:text property="adr020fax1" maxlength="20" tabindex="30" style="width:143px;" />&nbsp;
      <span class="text_base2"><gsmsg:write key="cmn.comment" />：&nbsp;</span></span><html:text property="adr020fax1Comment" maxlength="10" tabindex="31" style="width:215px;" />
    </td>
    <td valign="middle" align="left" class="table_bg_A5B4E1" rowspan="6" nowrap>
      <span class="text_bb1"><gsmsg:write key="address.61" /></span><span class="text_r2">※</span>
    </td>
    <td valign="top" align="left" class="td_wt" rowspan="6" nowrap>
      <html:radio property="adr020permitView" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.ADR_VIEWPERMIT_OWN) %>" styleId="view0" onclick="viewchange();" tabindex="49" /><label for="view0"><span class="text_base"><gsmsg:write key="address.62" /></span></label>
      <html:radio property="adr020permitView" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.ADR_VIEWPERMIT_GROUP) %>" styleId="view1" onclick="viewchange();" tabindex="50" /><label for="view1"><span class="text_base"><gsmsg:write key="group.designation" /></span></label>
      <html:radio property="adr020permitView" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.ADR_VIEWPERMIT_USER) %>" styleId="view2" onclick="viewchange();" tabindex="51" /><label for="view2"><span class="text_base"><gsmsg:write key="cmn.user.specified" /></span></label>
      <html:radio property="adr020permitView" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.ADR_VIEWPERMIT_NORESTRICTION) %>" styleId="view3" onclick="viewchange();" tabindex="52" /><label for="view3"><span class="text_base"><gsmsg:write key="cmn.no.setting.permission" /></span></label>

      <div id="viewgroup" class="spacer">
        <table cellpadding="3" cellspacing="0" border="0" width="100%">
        <tr>
        <td align="center" class="td_type3" width="50%"><span class="text_base3"><gsmsg:write key="address.66" /></span></td>
        <td width="0%"><img alt="<gsmsg:write key="cmn.space" />" height="1" src="../common/images/damy.gif" width="25"></td>
        <td align="center" class="td_type3" width="50%"><span class="text_base3"><gsmsg:write key="cmn.group" /></span></td>
        </tr>

        <tr>
        <td align="center" class="td_body01" valign="top">
          <html:select name="adr020Form" property="adr020selectPermitViewGroup" size="7" styleClass="add_select01" multiple="true" tabindex="53">
          <logic:notEmpty name="adr020Form" property="selectPermitViewGroup">
            <html:optionsCollection name="adr020Form" property="selectPermitViewGroup" value="value" label="label" />
          </logic:notEmpty>
          <option>&nbsp;</option>
          </html:select>
        </td>
        <td valign="middle" align="center">
          <img alt="<gsmsg:write key="cmn.add" />" border="0" src="../common/images/arrow2_l.gif" onClick="buttonPush('addViewGroup');" tabindex="54">
          <br><br><br>
          <img alt="<gsmsg:write key="cmn.delete" />" border="0" src="../common/images/arrow2_r.gif" onClick="buttonPush('deleteViewGroup');" tabindex="55">
        </td>
        <td align="center" class="td_body01" valign="top">
          <html:select name="adr020Form" property="adr020NoSelectPermitViewGroup" size="6" styleClass="add_select01" multiple="true" tabindex="56">
          <logic:notEmpty name="adr020Form" property="noSelectPermitViewGroup">
            <html:optionsCollection name="adr020Form" property="noSelectPermitViewGroup" value="value" label="label" />
          </logic:notEmpty>
          <option value="-1">&nbsp;</option>
          </html:select>
        </td>
        </tr>
        </table>
      </div>

      <div id="viewuser" class="spacer">
        <table cellpadding="3" cellspacing="0" border="0" width="100%">
        <tr>
        <td align="center" class="td_type3" width="50%"><span class="text_base3"><gsmsg:write key="address.68" /></span></td>
        <td width="0%"><img alt="<gsmsg:write key="cmn.space" />" height="1" src="../common/images/damy.gif" width="25"></td>
        <td align="center" class="td_type3" width="50%"><span class="text_base3"><gsmsg:write key="cmn.user" /></span></td>
        </tr>

        <tr>
        <td align="center" class="td_body01" valign="top">
          <html:select name="adr020Form" property="adr020selectPermitViewUser" size="9" styleClass="add_select01" multiple="true" tabindex="57">
          <logic:notEmpty name="adr020Form" property="selectPermitViewUser">
          <logic:iterate id="user" name="adr020Form" property="selectPermitViewUser"  >
              <bean:define id="userValue" name="user" property="value" />
              <bean:define id="mukouserClass" value="" />
              <logic:equal name="user" property="usrUkoFlg" value="1"><bean:define id="mukouserClass" value="mukouser_option" /></logic:equal>
              <html:option styleClass="<%=mukouserClass %>" value="<%=String.valueOf(userValue) %>"><bean:write name="user" property="label" /></html:option>
          </logic:iterate>
          </logic:notEmpty>
          <option>&nbsp;</option>
          </html:select>
        </td>
        <td valign="middle" align="center">
          <img alt="<gsmsg:write key="cmn.add" />" border="0" src="../common/images/arrow2_l.gif" onClick="buttonPush('addViewUser');" tabindex="58">
          <br><br><br>
          <img alt="<gsmsg:write key="cmn.delete" />" border="0" src="../common/images/arrow2_r.gif" onClick="buttonPush('deleteViewUser');" tabindex="59">
        </td>
        <td align="center" class="td_body01" valign="top">
          <table>
          <tr>
          <td colspan="2">
          <input class="btn_group_n1" value="<gsmsg:write key="cmn.sel.all.group" />" onclick="return openAllGroup(this.form.adr020permitViewUserGroup, 'adr020permitViewUserGroup', '<bean:write name="adr020Form" property="adr020permitViewUserGroup" />', '0', 'init', 'adr020permitViewUser', '-1', '0')" type="button"><br>
          </td>
          </tr>
          <tr>
          <td>
          <html:select name="adr020Form" property="adr020permitViewUserGroup" styleClass="add_select01" onchange="buttonPush('init');" tabindex="60">
            <html:optionsCollection name="adr020Form" property="groupCmbList" value="value" label="label" />
          </html:select>
          </td>
          <td>
            <input type="button" onclick="openGroupWindow(this.form.adr020permitViewUserGroup, 'adr020permitViewUserGroup', '0', 'init')" class="group_btn2" value="&nbsp;&nbsp;" id="adr020GroupBtn2">
          </td>
          </tr>
          <tr>
          <td colspan="2">
          <html:select name="adr020Form" property="adr020NoSelectPermitViewUser" size="6" styleClass="add_select01" multiple="true" tabindex="61">
          <logic:notEmpty name="adr020Form" property="noSelectPermitViewUser">
          <logic:iterate id="user" name="adr020Form" property="noSelectPermitViewUser"  >
              <bean:define id="userValue" name="user" property="value" />
              <bean:define id="mukouserClass" value="" />
              <logic:equal name="user" property="usrUkoFlg" value="1"><bean:define id="mukouserClass" value="mukouser_option" /></logic:equal>
              <html:option styleClass="<%=mukouserClass %>" value="<%=String.valueOf(userValue) %>"><bean:write name="user" property="label" /></html:option>
          </logic:iterate>
          </logic:notEmpty>
          <option value="-1">&nbsp;</option>
          </html:select>
          </td>
          </tr>
          </table>
        </td>
        </tr>
        </table>
      </div>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap><font class="text_bb1">ＦＡＸ２</font></td>
    <td valign="middle" align="left" class="td_wt" nowrap>
      <html:text property="adr020fax2" maxlength="20" tabindex="32" style="width:143px;" />&nbsp;
      <span class="text_base2"><gsmsg:write key="cmn.comment" />：&nbsp;</span></span><html:text property="adr020fax2Comment" maxlength="10" tabindex="33" style="width:215px;" />
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap><font class="text_bb1">ＦＡＸ３</font></td>
    <td valign="middle" align="left" class="td_wt" nowrap>
      <html:text property="adr020fax3" maxlength="20" tabindex="34" style="width:143px;" />&nbsp;
      <span class="text_base2"><gsmsg:write key="cmn.comment" />：&nbsp;</span></span><html:text property="adr020fax3Comment" maxlength="10" tabindex="35" style="width:215px;" />
    </td>
    </tr>

    <% String addressRow = "4"; %>
    <% String editRow = "3"; %>
    <logic:equal name="adr020Form" property="adr020searchUse" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.PLUGIN_NOT_USE) %>">
      <% addressRow = "4"; %>
      <% editRow = "2"; %>
    </logic:equal>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" rowspan="<%= addressRow %>" nowrap> <font class="text_bb1"><gsmsg:write key="cmn.address" /></font> </td>
    <td valign="middle" align="left" class="table_bg_A5B4E1" nowrap><font class="text_bb1"><gsmsg:write key="cmn.postalcode" /></font></td>
    <td valign="middle" align="left" class="td_wt">
      <html:text property="adr020postno1" maxlength="3" tabindex="36" style="width:59px;" />
      <font class="text_base">-</font>
      <html:text property="adr020postno2" maxlength="4" tabindex="37" style="width:71px;" />
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" nowrap> <font class="text_bb1"><gsmsg:write key="cmn.prefectures" /></font> </td>
    <td valign="middle" align="left" class="td_wt">
      <html:select name="adr020Form" property="adr020tdfk" tabindex="38">
        <html:optionsCollection name="adr020Form" property="tdfkCmbList" value="value" label="label" />
      </html:select>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" nowrap> <font class="text_bb1"><gsmsg:write key="cmn.address1" /></font> </td>
    <td valign="middle" align="left" class="td_wt">
      <html:text property="adr020address1" maxlength="100" tabindex="39" style="width:425px;" />
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" nowrap> <font class="text_bb1"><gsmsg:write key="cmn.address2" /></font></td>
    <td valign="middle" align="left" class="td_wt"><html:text property="adr020address2" maxlength="100" tabindex="40" style="width:425px;" /></td>
    <td valign="middle" align="left" class="table_bg_A5B4E1" rowspan="<%= editRow %>" nowrap>
      <span class="text_bb1"><gsmsg:write key="cmn.edit.permissions" /></span><span class="text_r2">※</span>
    </td>
    <td valign="top" align="left" class="td_wt" rowspan="<%= editRow %>" nowrap>

      <div id="editselect">
      <html:radio property="adr020permitEdit" value="<%= String.valueOf(GSConstAddress.EDITPERMIT_OWN) %>" styleId="edit0" onclick="editchange();" tabindex="62" /><label for="edit0"><span class="text_base"><gsmsg:write key="address.62" /></span></label>
      <html:radio property="adr020permitEdit" value="<%= String.valueOf(GSConstAddress.EDITPERMIT_GROUP) %>" styleId="edit1" onclick="editchange();" tabindex="63" /><label for="edit1"><span class="text_base"><gsmsg:write key="group.designation" /></span></label>
      <html:radio property="adr020permitEdit" value="<%= String.valueOf(GSConstAddress.EDITPERMIT_USER) %>" styleId="edit2" onclick="editchange();" tabindex="64" /><label for="edit2"><span class="text_base"><gsmsg:write key="cmn.user.specified" /></span></label>
      <html:radio property="adr020permitEdit" value="<%= String.valueOf(GSConstAddress.EDITPERMIT_NORESTRICTION) %>" styleId="edit3" onclick="editchange();" tabindex="65" /><label for="edit3"><span class="text_base"><gsmsg:write key="cmn.no.setting.permission" /></span></label>
      </div>

      <div id="editselectstr">
      </div>

      <div id="editgroup" class="spacer">
        <table cellpadding="3" cellspacing="0" border="0" width="100%">
        <tr>
        <td align="center" class="td_type3" width="50%"><span class="text_base3"><gsmsg:write key="cmn.editgroup" /></span></td>
        <td width="0%"><img alt="<gsmsg:write key="cmn.space" />" height="1" src="../common/images/damy.gif" width="25"></td>
        <td align="center" class="td_type3" width="50%"><span class="text_base3"><gsmsg:write key="cmn.group" /></span></td>
        </tr>

        <tr>
        <td align="center" class="td_body01" valign="top">
          <html:select name="adr020Form" property="adr020selectPermitEditGroup" size="8" styleClass="add_select01" multiple="true" tabindex="66">
          <logic:notEmpty name="adr020Form" property="selectPermitEditGroup">
            <html:optionsCollection name="adr020Form" property="selectPermitEditGroup" value="value" label="label" />
          </logic:notEmpty>
          <option>&nbsp;</option>
          </html:select>
        </td>
        <td valign="middle" align="center">
          <img alt="<gsmsg:write key="cmn.add" />" border="0" src="../common/images/arrow2_l.gif" onClick="buttonPush('addEditGroup');" tabindex="67">
          <br><br><br>
          <img alt="<gsmsg:write key="cmn.delete" />" border="0" src="../common/images/arrow2_r.gif" onClick="buttonPush('deleteEditGroup');" tabindex="68">
        </td>
        <td align="center" class="td_body01" valign="top">
          <html:select name="adr020Form" property="adr020NoSelectPermitEditGroup" size="8" styleClass="add_select01" multiple="true" tabindex="69">
          <logic:notEmpty name="adr020Form" property="noSelectPermitEditGroup">
            <html:optionsCollection name="adr020Form" property="noSelectPermitEditGroup" value="value" label="label" />
          </logic:notEmpty>
          <option value="-1">&nbsp;</option>
          </html:select>
        </td>
        </tr>
        </table>
      </div>

      <div id="edituser" class="spacer">
        <table cellpadding="3" cellspacing="0" border="0" width="100%">
        <tr>
        <td align="center" class="td_type3" width="50%"><span class="text_base3"><gsmsg:write key="cmn.edituser" /></span></td>
        <td width="0%"><img alt="<gsmsg:write key="cmn.space" />" height="1" src="../common/images/damy.gif" width="25"></td>
        <td align="center" class="td_type3" width="50%"><span class="text_base3"><gsmsg:write key="cmn.user" /></span></td>
        </tr>

        <tr>
        <td align="center" class="td_body01" valign="top">
          <html:select name="adr020Form" property="adr020selectPermitEditUser" size="10" styleClass="add_select01" multiple="true" tabindex="70">
          <logic:notEmpty name="adr020Form" property="selectPermitEditUser">
          <logic:iterate id="user" name="adr020Form" property="selectPermitEditUser"  >
              <bean:define id="userValue" name="user" property="value" />
              <bean:define id="mukouserClass" value="" />
              <logic:equal name="user" property="usrUkoFlg" value="1"><bean:define id="mukouserClass" value="mukouser_option" /></logic:equal>
              <html:option styleClass="<%=mukouserClass %>" value="<%=String.valueOf(userValue) %>"><bean:write name="user" property="label" /></html:option>
          </logic:iterate>
          </logic:notEmpty>
          <option>&nbsp;</option>
          </html:select>
        </td>
        <td valign="middle" align="center">
          <img alt="<gsmsg:write key="cmn.add" />" border="0" src="../common/images/arrow2_l.gif" onClick="buttonPush('addEditUser');" tabindex="71">
          <br><br><br>
          <img alt="<gsmsg:write key="cmn.delete" />" border="0" src="../common/images/arrow2_r.gif" onClick="buttonPush('deleteEditUser');" tabindex="72">
        </td>
        <td align="center" class="td_body01" valign="top">
          <table>
          <tr>
          <td colspan="2">
          <input class="btn_group_n1" value="<gsmsg:write key="cmn.sel.all.group" />" onclick="return openAllGroup(this.form.adr020permitEditUserGroup, 'adr020permitEditUserGroup', '<bean:write name="adr020Form" property="adr020permitEditUserGroup" />', '0', 'init', 'adr020permitEditUser', '-1', '0')" type="button"><br>
          </td>
          </tr>
          <tr>
          <td>
          <html:select name="adr020Form" property="adr020permitEditUserGroup" styleClass="add_select01" onchange="buttonPush('init');" tabindex="73">
            <html:optionsCollection name="adr020Form" property="groupCmbList" value="value" label="label" />
          </html:select>
          </td>
          <td>
            <input type="button" onclick="openGroupWindow(this.form.adr020permitEditUserGroup, 'adr020permitEditUserGroup', '0', 'init')" class="group_btn2" value="&nbsp;&nbsp;" id="adr020GroupBtn3">
          </td>
          </tr>
          <tr>
          <td colspan="2">
          <html:select name="adr020Form" property="adr020NoSelectPermitEditUser" size="7" styleClass="add_select01" multiple="true" tabindex="74">
          <logic:notEmpty name="adr020Form" property="noSelectPermitEditUser">
          <logic:iterate id="user" name="adr020Form" property="noSelectPermitEditUser"  >
              <bean:define id="userValue" name="user" property="value" />
              <bean:define id="mukouserClass" value="" />
              <logic:equal name="user" property="usrUkoFlg" value="1"><bean:define id="mukouserClass" value="mukouser_option" /></logic:equal>
              <html:option styleClass="<%=mukouserClass %>" value="<%=String.valueOf(userValue) %>"><bean:write name="user" property="label" /></html:option>
          </logic:iterate>
          </logic:notEmpty>
          <option value="-1">&nbsp;</option>
          </html:select>
          </td>
          </tr>
          </table>
        </td>
        </tr>
        </table>
      </div>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" colspan="2" nowrap>
      <span class="text_bb1"><gsmsg:write key="cmn.memo" /></span>
    </td>
    <td valign="middle" align="left" class="td_wt">
      <textarea name="adr020biko" style="width:394px" rows="8" styleClass="text_gray" tabindex="41" onkeyup="showLengthStr(value, <%= maxLengthBiko %>, 'inputlength');" id="inputstr"><bean:write name="adr020Form" property="adr020biko" /></textarea>
      <br>
      <span class="font_string_count"><gsmsg:write key="cmn.current.characters" />:</span><span id="inputlength" class="font_string_count">0</span>&nbsp;/&nbsp;<span class="font_string_count_max"><%= maxLengthBiko %>&nbsp;<gsmsg:write key="cmn.character" /></span>
    </td>
    </tr>
