<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<% String tdColor = request.getParameter("tdColor");%>

<logic:equal name="sch040Form" property="reservePluginKbn" value="0">
<tr>
<td class="table_bg_A5B4E1" nowrap>
  <span class="text_bb1"><gsmsg:write key="cmn.reserve" /></span>
</td>
<td align="left" class="<%= tdColor %>">
<logic:notEqual name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">

  <span class="text_r1">[<gsmsg:write key="schedule.26" />]</span>

  <logic:equal name="sch040Form" property="cmd" value="edit">
  <html:radio name="sch040Form" property="sch040ResBatchRef" styleId="sch040ResBatchRef0" value="1" onchange="setDisabled();"/><span class="text_base2"><label for="sch040ResBatchRef0"><gsmsg:write key="schedule.25" /></label></span>
  <html:radio name="sch040Form" property="sch040ResBatchRef" styleId="sch040ResBatchRef1" value="0" onchange="setDisabled();"/><span class="text_base2"><label for="sch040ResBatchRef1"><gsmsg:write key="schedule.24" /></label></span>&nbsp;
  </logic:equal>

  <table width="0%" border="0">
  <tr>
  <td width="40%" class="table_bg_A5B4E1" align="center"><span class="text_bb1"><gsmsg:write key="schedule.6" /></span></td>
  <td width="20%" align="center">&nbsp;</td>
  <td width="40%" align="left">
    <logic:notEmpty name="sch040Form" property="sch040ReserveGroupLabel" scope="request">
    <html:select property="sch040ReserveGroupSid" onchange="changeGroupCombo('040_resgroup');">
      <html:optionsCollection name="sch040Form" property="sch040ReserveGroupLabel" value="value" label="label" />
    </html:select>
    </logic:notEmpty>
    <span class="text_base8">
    <input type="checkbox" name="sch040SelectResKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.SELECT_ON) %>" id="select_res" onclick="return selectResList();" />
    <label for="select_res"><gsmsg:write key="cmn.select" /></label></span>
  </td>
  </tr>

  <tr>
  <td align="center">
     <!-- 同時登録施設 -->
    <select size="5" multiple name="reserve_r" class="select01">
    <logic:notEmpty name="sch040Form" property="sch040ReserveSelectLabel" scope="request">
    <logic:iterate id="ressBean" name="sch040Form" property="sch040ReserveSelectLabel" scope="request">
       <option value="<bean:write name="ressBean" property="rsdSid" scope="page"/>"><bean:write name="ressBean" property="rsdName" scope="page"/></option>
      </logic:iterate>
     </logic:notEmpty>
    <option value="-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
    </select>
    <logic:notEqual name="sch040Form" property="sch040CantReadRsvCount" value="0">
    <br>
    <span class="text_r1"><gsmsg:write key="schedule.150" />:<bean:write name="sch040Form" property="sch040CantReadRsvCount" /></span>
    </logic:notEqual>
  </td>

  <td align="center">

    <input type="button" class="btn_base1add" value="<gsmsg:write key="cmn.add"/>" name="addresBtn" onClick="moveUser('040_res_rightarrow');"><br><br>
    <input type="button" class="btn_base1del" value="<gsmsg:write key="cmn.delete" />" name="delresBtn" onClick="moveUser('040_res_leftarrow');">

  </td>
  <td colspan="1">
     <!-- グループ -->
     <select size="5" multiple name="reserve_l" class="select01">
     <logic:notEmpty name="sch040Form" property="sch040ReserveBelongLabel" scope="request">
      <logic:iterate id="resbelBean" name="sch040Form" property="sch040ReserveBelongLabel" scope="request">
        <option value="<bean:write name="resbelBean" property="rsdSid" scope="page"/>"><bean:write name="resbelBean" property="rsdName" scope="page"/></option>
      </logic:iterate>
     </logic:notEmpty>
    <option value="-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
    </select>
  </td>
  </tr>

  </table>
</logic:notEqual>
<logic:equal name="sch040Form" property="sch040EditDspMode" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.EDIT_DSP_MODE_ANSWER) %>">
    <logic:notEmpty name="sch040Form" property="sch040ReserveSelectLabel" scope="request">
    <logic:iterate id="ressBean" name="sch040Form" property="sch040ReserveSelectLabel" scope="request">
       <span class="text_base"><bean:write name="ressBean" property="rsdName" scope="page"/></span>
       <br>
    </logic:iterate>
    </logic:notEmpty>
</logic:equal>
</td>
</tr>

</logic:equal>