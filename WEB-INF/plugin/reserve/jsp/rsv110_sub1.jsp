<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ taglib uri="/WEB-INF/ctag-jsmsg.tld" prefix="gsjsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<%@ page import="jp.groupsession.v2.rsv.GSConstReserve" %>
<script language="JavaScript" src="../reserve/js/rsvschedule.js?<%= GSConst.VERSION_PARAM %>"></script>
<% String maxLengthNaiyo = String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.MAX_LENGTH_NAIYO); %>

    <tr>
    <td rowspan="2" class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.period" /></span></td>
    <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.start" /></span><logic:equal name="rsv110Form" property="rsv110EditAuth" value="true"><logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>"><span class="text_r2"><gsmsg:write key="cmn.comments" /></span></logic:notEqual></logic:equal></td>
    <td align="left" class="td_wt">

      <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>">
      <span class="text_base"><bean:write name="rsv110Form" property="yoyakuFrString" /></span>
      </logic:equal>
      <logic:notEqual name="rsv110Form" property="rsv110EditAuth" value="true">
      <span class="text_base"><bean:write name="rsv110Form" property="yoyakuFrString" /></span>
      </logic:notEqual>

      <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
        <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>">

        <html:select property="rsv110SelectedYearFr" styleId="fromYear" onchange="setToDay()">
          <logic:notEmpty name="rsv110Form" property="rsv110YearComboList">
            <html:optionsCollection name="rsv110Form" property="rsv110YearComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>

        <html:select property="rsv110SelectedMonthFr" styleId="fromMonth" onchange="setToDay()">
          <logic:notEmpty name="rsv110Form" property="rsv110MonthComboList">
            <html:optionsCollection name="rsv110Form" property="rsv110MonthComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>

        <html:select property="rsv110SelectedDayFr" styleId="fromDay" onchange="setToDay()">
          <logic:notEmpty name="rsv110Form" property="rsv110DayComboList">
            <html:optionsCollection name="rsv110Form" property="rsv110DayComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>

        <input type="button" value="Cal" onclick="wrtCalendar(this.form.fromDay, this.form.fromMonth, this.form.fromYear)" onfocus="setToDay()" class="calendar_btn">

      <input type="button" class="btn_arrow_l" value="&nbsp;" onclick="return moveFromDay($('#fromYear')[0], $('#fromMonth')[0], $('#fromDay')[0], 1)">
      <input type="button" class="btn_today" value="<gsmsg:write key="cmn.today" />" onClick="return moveFromDay($('#fromYear')[0], $('#fromMonth')[0], $('#fromDay')[0], 2)">
      <input type="button" class="btn_arrow_r" value="&nbsp;" onclick="return moveFromDay($('#fromYear')[0], $('#fromMonth')[0], $('#fromDay')[0], 3)">

        <div class="text_time">
        <html:select styleId="rsv110FrHour" name="rsv110Form" property="rsv110SelectedHourFr" onchange="setToDay()">
          <logic:notEmpty name="rsv110Form" property="rsv110HourComboList">
            <html:optionsCollection name="rsv110Form" property="rsv110HourComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>
        <gsmsg:write key="cmn.hour.input" />

        <html:select styleId="rsv110FrMin" name="rsv110Form" property="rsv110SelectedMinuteFr" onchange="setToDay()">
          <logic:notEmpty name="rsv110Form" property="rsv110MinuteComboList">
            <html:optionsCollection name="rsv110Form" property="rsv110MinuteComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>
        <gsmsg:write key="cmn.minute.input" />
        </logic:notEqual>

        <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>">
          <html:select property="rsv110SelectedYearFr" styleId="fromYear" styleClass="display_none" onchange="setToDay()">
            <logic:notEmpty name="rsv110Form" property="rsv110YearComboList">
              <html:optionsCollection name="rsv110Form" property="rsv110YearComboList" value="value" label="label" />
            </logic:notEmpty>
          </html:select>

          <html:select property="rsv110SelectedMonthFr" styleId="fromMonth" styleClass="display_none" onchange="setToDay()">
            <logic:notEmpty name="rsv110Form" property="rsv110MonthComboList">
              <html:optionsCollection name="rsv110Form" property="rsv110MonthComboList" value="value" label="label" />
            </logic:notEmpty>
          </html:select>

          <html:select property="rsv110SelectedDayFr" styleId="fromDay" styleClass="display_none" onchange="setToDay()">
            <logic:notEmpty name="rsv110Form" property="rsv110DayComboList">
              <html:optionsCollection name="rsv110Form" property="rsv110DayComboList" value="value" label="label" />
            </logic:notEmpty>
          </html:select>

          <html:select styleId="rsv110FrHour" name="rsv110Form" property="rsv110SelectedHourFr" styleClass="display_none" onchange="setToDay()">
            <logic:notEmpty name="rsv110Form" property="rsv110HourComboList">
              <html:optionsCollection name="rsv110Form" property="rsv110HourComboList" value="value" label="label" />
            </logic:notEmpty>
          </html:select>

          <html:select styleId="rsv110FrMin" name="rsv110Form" property="rsv110SelectedMinuteFr" styleClass="display_none" onchange="setToDay()">
            <logic:notEmpty name="rsv110Form" property="rsv110MinuteComboList">
              <html:optionsCollection name="rsv110Form" property="rsv110MinuteComboList" value="value" label="label" />
            </logic:notEmpty>
          </html:select>
        </logic:equal>
      </logic:equal>

      <%-- 時間マスタ --%>
      <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>">
      <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
      &nbsp;&nbsp;
      <span class="text_base">
        <a href="javaScript:void(0);" onclick="setAmTime();"><gsmsg:write key="cmn.am" />
        <span class="tooltips">
          <bean:write name="rsv110Form" property="rsv110AmFrHour" format="00" />:<bean:write name="rsv110Form" property="rsv110AmFrMin" format="00" />～<bean:write name="rsv110Form" property="rsv110AmToHour" format="00" />:<bean:write name="rsv110Form" property="rsv110AmToMin" format="00" />
        </span>
        </a>
      </span>
      &nbsp;&nbsp;
      <span class="text_base"><a href="javaScript:void(0);" onclick="setPmTime();"><gsmsg:write key="cmn.pm" />
        <span class="tooltips">
          <bean:write name="rsv110Form" property="rsv110PmFrHour" format="00" />:<bean:write name="rsv110Form" property="rsv110PmFrMin" format="00" />～<bean:write name="rsv110Form" property="rsv110PmToHour" format="00" />:<bean:write name="rsv110Form" property="rsv110PmToMin" format="00" />
        </span>
        </a>
      </span>
      &nbsp;&nbsp;
      <span class="text_base"><a href="javaScript:void(0);" onclick="setAllTime();"><gsmsg:write key="cmn.allday" />
        <span class="tooltips">
          <bean:write name="rsv110Form" property="rsv110AllDayFrHour" format="00" />:<bean:write name="rsv110Form" property="rsv110AllDayFrMin" format="00" />～<bean:write name="rsv110Form" property="rsv110AllDayToHour" format="00" />:<bean:write name="rsv110Form" property="rsv110AllDayToMin" format="00" />
        </span>
        </a>
      </span>
     </logic:equal>
     </logic:notEqual>
      </div>
    </td>
    </tr>

    <tr>
    <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.end" /></span><logic:equal name="rsv110Form" property="rsv110EditAuth" value="true"><logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>"><span class="text_r2"><gsmsg:write key="cmn.comments" /></span></logic:notEqual></logic:equal></td>
    <td align="left" class="td_wt">

      <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>">
      <span class="text_base"><bean:write name="rsv110Form" property="yoyakuToString" /></span>
      </logic:equal>

      <logic:notEqual name="rsv110Form" property="rsv110EditAuth" value="true">
      <span class="text_base"><bean:write name="rsv110Form" property="yoyakuToString" /></span>
      </logic:notEqual>

      <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
        <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>">

        <%-- 期間 --%>
        <html:select property="rsv110SelectedYearTo" styleId="toYear" onchange="setFromDay()">
          <logic:notEmpty name="rsv110Form" property="rsv110YearComboList">
            <html:optionsCollection name="rsv110Form" property="rsv110YearComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>

        <html:select property="rsv110SelectedMonthTo" styleId="toMonth" onchange="setFromDay()">
          <logic:notEmpty name="rsv110Form" property="rsv110MonthComboList">
            <html:optionsCollection name="rsv110Form" property="rsv110MonthComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>

        <html:select property="rsv110SelectedDayTo" styleId="toDay" onchange="setFromDay()">
          <logic:notEmpty name="rsv110Form" property="rsv110DayComboList">
            <html:optionsCollection name="rsv110Form" property="rsv110DayComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>

        <input type="button" value="Cal" onclick="wrtCalendar(this.form.toDay, this.form.toMonth, this.form.toYear)" onfocus="setFromDay()" class="calendar_btn">

      <input type="button" class="btn_arrow_l" value="&nbsp;" onclick="return moveToDay($('#toYear')[0], $('#toMonth')[0], $('#toDay')[0], 1)">
      <input type="button" class="btn_today" value="<gsmsg:write key="cmn.today" />" onClick="return moveToDay($('#toYear')[0], $('#toMonth')[0], $('#toDay')[0], 2)">
      <input type="button" class="btn_arrow_r" value="&nbsp;" onclick="return moveToDay($('#toYear')[0], $('#toMonth')[0], $('#toDay')[0], 3)">
        <div class="text_time">
        <html:select styleId="rsv110ToHour" name="rsv110Form" property="rsv110SelectedHourTo" onchange="setFromDay()">
          <logic:notEmpty name="rsv110Form" property="rsv110HourComboList">
            <html:optionsCollection name="rsv110Form" property="rsv110HourComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>
        <gsmsg:write key="cmn.hour.input" />

        <html:select styleId="rsv110ToMin" name="rsv110Form" property="rsv110SelectedMinuteTo" onchange="setFromDay()">
          <logic:notEmpty name="rsv110Form" property="rsv110MinuteComboList">
            <html:optionsCollection name="rsv110Form" property="rsv110MinuteComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>
        <gsmsg:write key="cmn.minute.input" />
        </div>
        </logic:notEqual>
      </logic:equal>
    </td>
    </tr>

    <tr>
    <td colspan="2" class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.content" /></span></td>
    <td align="left" class="td_type1">
      <table class="tl0" width="99%">
      <tr>
      <td width="60%" nowrap>
      <logic:notEqual name="rsv110Form" property="rsv110EditAuth" value="true">
        <span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110Naiyo" filter="false" /></span>
      </logic:notEqual>

      <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
        <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>">
        <%-- textareaの先頭行に入力した改行を反映させるため、開始タグの直後には必ず改行をいれること。 --%>
          <textarea styleClass="text_base_rsv" name="rsv110Naiyo" rows="5" onkeyup="showLengthStr(value, <%= maxLengthNaiyo %>, 'inputlength');" id="inputstr" style="width:472px;">
<bean:write name="rsv110Form" property="rsv110Naiyo" /></textarea>
          <br>
          <span class="font_string_count"><gsmsg:write key="cmn.current.characters" />:</span><span id="inputlength" class="font_string_count">0</span>&nbsp;<span class="font_string_count_max">/&nbsp;<%= maxLengthNaiyo %>&nbsp;<gsmsg:write key="cmn.character" /></span>
        </logic:notEqual>
        <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>">
          <span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110Naiyo" filter="false" /></span>
        </logic:equal>
      </logic:equal>
      </td>
      </tr>
      </table>
    </td>
    </tr>

     <%-- 編集権限 --%>
    <tr>
    <td colspan="2" class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.edit.permissions" /></span><logic:equal name="rsv110Form" property="rsv110EditAuth" value="true"><logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>"><span class="text_r2"><gsmsg:write key="cmn.comments" /></span></logic:notEqual></logic:equal></td>
    <td align="left" class="td_type1">
      <logic:notEqual name="rsv110Form" property="rsv110EditAuth" value="true">
        <span class="text_base_rsv">
          <logic:equal name="rsv110Form" property="rsv110RsyEdit" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.EDIT_AUTH_NONE) %>"><gsmsg:write key="cmn.nolimit" /></logic:equal>
          <logic:equal name="rsv110Form" property="rsv110RsyEdit" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.EDIT_AUTH_PER_AND_ADU) %>"><gsmsg:write key="cmn.only.principal.or.registant" /></logic:equal>
          <logic:equal name="rsv110Form" property="rsv110RsyEdit" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.EDIT_AUTH_GRP_AND_ADU) %>"><gsmsg:write key="cmn.only.affiliation.group.membership" /></logic:equal>
        </span>
      </logic:notEqual>

      <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
        <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>">
          <span class="text_base_rsv"><gsmsg:write key="cmn.comments" /><gsmsg:write key="reserve.89" /><br>
          ※<gsmsg:write key="reserve.90" /><br>
          &nbsp;&nbsp;<gsmsg:write key="reserve.91" /></span>
          <br><br>
          <html:radio styleId="lvl1" name="rsv110Form" property="rsv110RsyEdit" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.EDIT_AUTH_NONE) %>" /><label for="lvl1"><gsmsg:write key="cmn.nolimit" /></label>&nbsp;
          <html:radio styleId="lvl2" name="rsv110Form" property="rsv110RsyEdit" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.EDIT_AUTH_PER_AND_ADU) %>" /><label for="lvl2"><gsmsg:write key="cmn.only.principal.or.registant" /></label>&nbsp;
          <html:radio styleId="lvl3" name="rsv110Form" property="rsv110RsyEdit" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.EDIT_AUTH_GRP_AND_ADU) %>" /><label for="lvl3"><gsmsg:write key="cmn.only.affiliation.group.membership" /></label>
        </logic:notEqual>
        <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>">
          <span class="text_base_rsv">
            <logic:equal name="rsv110Form" property="rsv110RsyEdit" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.EDIT_AUTH_NONE) %>"><gsmsg:write key="cmn.nolimit" /></logic:equal>
            <logic:equal name="rsv110Form" property="rsv110RsyEdit" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.EDIT_AUTH_PER_AND_ADU) %>"><gsmsg:write key="cmn.only.principal.or.registant" /></logic:equal>
            <logic:equal name="rsv110Form" property="rsv110RsyEdit" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.EDIT_AUTH_GRP_AND_ADU) %>"><gsmsg:write key="cmn.only.affiliation.group.membership" /></logic:equal>
          </span>
        </logic:equal>
      </logic:equal>
    </td>
    </tr>

    <%-- 公開区分 --%>
    <tr>
    <td colspan="2" class="table_bg_A5B4E1" nowrap>
        <span class="text_bb1"><gsmsg:write key="cmn.public.kbn" /></span><logic:equal name="rsv110Form" property="rsv110EditAuth" value="true"><logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>"><span class="text_r2"><gsmsg:write key="cmn.comments" /></span></logic:notEqual></logic:equal>
    </td>
    <logic:notEqual name="rsv110Form" property="rsv110EditAuth" value="true">
      <td>
      <span class="text_base_rsv">
        <logic:equal name="rsv110Form" property="rsv110Public" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PUBLIC_KBN_ALL) %>"><gsmsg:write key="cmn.public" /></logic:equal>
        <logic:equal name="rsv110Form" property="rsv110Public" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PUBLIC_KBN_PLANS) %>"><gsmsg:write key="reserve.175" /></logic:equal>
        <logic:equal name="rsv110Form" property="rsv110Public" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PUBLIC_KBN_GROUP) %>"><gsmsg:write key="reserve.176" /></logic:equal>
      </span>
      </td>
    </logic:notEqual>
    <logic:equal name="rsv110Form" property="rsv110EditAuth" value="true">
      <td align="left" class="td_type1">
        <logic:notEqual name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>">
          <html:radio name="rsv110Form" property="rsv110Public" styleId="rsv110Public0" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PUBLIC_KBN_ALL) %>" /><span class="text_base2"><label for="rsv110Public0"><gsmsg:write key="cmn.public" /></label></span>&nbsp;
          <html:radio name="rsv110Form" property="rsv110Public" styleId="rsv110Public1" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PUBLIC_KBN_PLANS) %>" /><span class="text_base2"><label for="rsv110Public1"><gsmsg:write key="reserve.175" /></label></span>&nbsp;
          <html:radio name="rsv110Form" property="rsv110Public" styleId="rsv110Public2" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PUBLIC_KBN_GROUP) %>" /><span class="text_base2"><label for="rsv110Public2"><gsmsg:write key="reserve.176" /></label></span>
        </logic:notEqual>
        <logic:equal name="rsv110Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>">
          <span class="text_base_rsv">
            <logic:equal name="rsv110Form" property="rsv110Public" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PUBLIC_KBN_ALL) %>"><gsmsg:write key="cmn.public" /></logic:equal>
            <logic:equal name="rsv110Form" property="rsv110Public" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PUBLIC_KBN_PLANS) %>"><gsmsg:write key="reserve.175" /></logic:equal>
            <logic:equal name="rsv110Form" property="rsv110Public" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PUBLIC_KBN_GROUP) %>"><gsmsg:write key="reserve.176" /></logic:equal>
        </span>
        </logic:equal>
      </td>
    </logic:equal>
    </tr>
