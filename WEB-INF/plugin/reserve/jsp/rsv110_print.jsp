<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.rsv.GSConstReserve" %>

<logic:equal name="rsv110Form" property="rsvPrintUseKbn" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.RSV_PRINT_USE_YES) %>">
<tr>
<td colspan="2" class="table_bg_A5B4E1" width="20%" nowrap><span class="text_bb1"><gsmsg:write key="reserve.print" /></span></td>
<td align="left" class="td_type1" width="80%">
  <table class="tl0" width="99%">
  <tr>
  <td width="60%" nowrap>
  <logic:notEqual name="rsv110Form" property="rsv110EditAuth" value="true">
    <logic:equal name="rsv110Form" property="rsv110PrintKbn" value="1"><span class="text_base_rsv"><gsmsg:write key="reserve.print.yes" /></span></logic:equal>
    <logic:notEqual name="rsv110Form" property="rsv110PrintKbn" value="1"><span class="text_base_rsv"><gsmsg:write key="reserve.print.no" /></span></logic:notEqual>
  </logic:notEqual>

  <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
    <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>">
      <html:checkbox name="rsv110Form" property="rsv110PrintKbn" value="1" styleId="print"/><label for="print" class="text_base_rsv"><gsmsg:write key="reserve.print.yes" /></label>
    </logic:notEqual>
    <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>">
      <logic:equal name="rsv110Form" property="rsv110PrintKbn" value="1"><span class="text_base_rsv"><gsmsg:write key="reserve.print.yes" /></span></logic:equal>
      <logic:notEqual name="rsv110Form" property="rsv110PrintKbn" value="1"><span class="text_base_rsv"><gsmsg:write key="reserve.print.no" /></span></logic:notEqual>
    </logic:equal>
  </logic:equal>
  </td>
  </tr>
  </table>
</td>
</tr>
</logic:equal>