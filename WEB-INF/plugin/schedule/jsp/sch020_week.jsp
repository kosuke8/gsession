<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<%
  String sunday            = String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.CHANGE_WEEK_SUN);
  String monday            = String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.CHANGE_WEEK_MON);
  String tuesday           = String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.CHANGE_WEEK_TUE);
  String wednesday         = String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.CHANGE_WEEK_WED);
  String thursday          = String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.CHANGE_WEEK_THU);
  String friday            = String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.CHANGE_WEEK_FRI);
  String saturday          = String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.CHANGE_WEEK_SAT);
%>

 <tr>
  <logic:equal name="sch020Form" property="sch020DspStartWeek" value="<%= sunday %>">
  <%-- 開始曜日：日曜日 --%>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_sun"><gsmsg:write key="cmn.sunday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.Monday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.tuesday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.wednesday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.thursday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.friday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_sat"><gsmsg:write key="cmn.saturday" /></span></th>
  </logic:equal>

  <logic:equal name="sch020Form" property="sch020DspStartWeek" value="<%= monday %>">
  <%-- 開始曜日：月曜日 --%>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.Monday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.tuesday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.wednesday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.thursday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.friday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_sat"><gsmsg:write key="cmn.saturday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_sun"><gsmsg:write key="cmn.sunday" /></span></th>
  </logic:equal>

  <logic:equal name="sch020Form" property="sch020DspStartWeek" value="<%= tuesday %>">
  <%-- 開始曜日：火曜日 --%>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.tuesday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.wednesday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.thursday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.friday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_sat"><gsmsg:write key="cmn.saturday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_sun"><gsmsg:write key="cmn.sunday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.Monday" /></span></th>
  </logic:equal>

  <logic:equal name="sch020Form" property="sch020DspStartWeek" value="<%= wednesday %>">
  <%-- 開始曜日：水曜日 --%>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.wednesday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.thursday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.friday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_sat"><gsmsg:write key="cmn.saturday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_sun"><gsmsg:write key="cmn.sunday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.Monday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.tuesday" /></span></th>
  </logic:equal>

  <logic:equal name="sch020Form" property="sch020DspStartWeek" value="<%= thursday %>">
  <%-- 開始曜日：木曜日 --%>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.thursday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.friday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_sat"><gsmsg:write key="cmn.saturday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_sun"><gsmsg:write key="cmn.sunday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.Monday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.tuesday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.wednesday" /></span></th>
  </logic:equal>

  <logic:equal name="sch020Form" property="sch020DspStartWeek" value="<%= friday %>">
  <%-- 開始曜日：金曜日 --%>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.friday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_sat"><gsmsg:write key="cmn.saturday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_sun"><gsmsg:write key="cmn.sunday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.Monday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.tuesday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.wednesday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.thursday" /></span></th>
  </logic:equal>

  <logic:equal name="sch020Form" property="sch020DspStartWeek" value="<%= saturday %>">
  <%-- 開始曜日：土曜日 --%>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_sat"><gsmsg:write key="cmn.saturday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_sun"><gsmsg:write key="cmn.sunday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.Monday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.tuesday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.wednesday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.thursday" /></span></th>
  <th width="14%" nowrap class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.friday" /></span></th>
  </logic:equal>
  </tr>