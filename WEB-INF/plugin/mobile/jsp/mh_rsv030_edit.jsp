<%@ page pageEncoding="UTF-8" contentType="text/html; charset=Shift_JIS"%>
<%@page import="jp.groupsession.v2.rsv.GSConstReserve"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<bean:define id="rsvSisKbn" name="mbhRsv030Form" property="rsv030SisetuKbn" type="java.lang.Integer" />
<% int sisKbn = rsvSisKbn; %>

<%-- 印刷 --%>
    <logic:equal name="mbhRsv030Form" property="rsv030SisetuKbn" value="<%= String.valueOf(GSConstReserve.RSK_KBN_CAR) %>">
      <logic:equal name="mbhRsv030Form" property="rsvPrintUseKbn" value="<%= String.valueOf(GSConstReserve.RSV_PRINT_USE_YES) %>">

    ■<span class="text_bb1"><gsmsg:write key="reserve.print" /></span>
        <br>
      <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:equal name="mbhRsv030Form" property="rsv030PrintKbn" value="1"><span class="text_base_rsv"><gsmsg:write key="reserve.print.yes" /></span></logic:equal>
        <logic:notEqual name="mbhRsv030Form" property="rsv030PrintKbn" value="1"><span class="text_base_rsv"><gsmsg:write key="reserve.print.no" /></span></logic:notEqual>
      </logic:notEqual>
      <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <html:checkbox name="mbhRsv030Form" property="rsv030PrintKbn" value="1" styleId="print"/><label for="print" class="text_base"><span class="text_base_rsv"><gsmsg:write key="reserve.print.yes" /></span></label>
        </logic:notEqual>
        <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <logic:equal name="mbhRsv030Form" property="rsv030PrintKbn" value="1"><span class="text_base_rsv"><gsmsg:write key="reserve.print.yes" /></span></logic:equal>
          <logic:notEqual name="mbhRsv030Form" property="rsv030PrintKbn" value="1"><span class="text_base_rsv"><gsmsg:write key="reserve.print.no" /></span></logic:notEqual>
        </logic:equal>
      </logic:equal>
      </logic:equal>
    </logic:equal>
    <br>

    ■<span class="text_bb1"><gsmsg:write key="reserve.72" /></span><logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true"><logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>"><span class="text_r2"><gsmsg:write key="cmn.comments" /></span></logic:notEqual></logic:equal>


    <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
      <br><span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Mokuteki" /></span>
    </logic:notEqual>

    <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
      <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
        <br><html:text name="mbhRsv030Form" property="rsv030Mokuteki" size="40" maxlength="50" styleClass="text_base_rsv" />
      </logic:notEqual>
      <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
        <br><span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Mokuteki" /></span>
      </logic:equal>
    </logic:equal>

    <logic:equal name="mbhRsv030Form" property="rsv030SisetuKbn" value="<%= String.valueOf(GSConstReserve.RSK_KBN_HEYA) %>">

    <div class="text_bb1">■<gsmsg:write key="reserve.use.kbn" /></div>
    <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
      <logic:equal name="mbhRsv030Form" property="rsv030UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_NOSET) %>"><gsmsg:write key="reserve.use.kbn.noset" /></logic:equal>
      <logic:equal name="mbhRsv030Form" property="rsv030UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_KAIGI) %>"><gsmsg:write key="reserve.use.kbn.meeting" /></logic:equal>
      <logic:equal name="mbhRsv030Form" property="rsv030UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_KENSYU) %>"><gsmsg:write key="reserve.use.kbn.training" /></logic:equal>
      <logic:equal name="mbhRsv030Form" property="rsv030UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_OTHER) %>"><gsmsg:write key="reserve.use.kbn.other" /></logic:equal>
    </logic:notEqual>
    <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
      <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
      <html:select property="rsv030UseKbn">
        <html:optionsCollection name="mbhRsv030Form" property="rsv030UseKbnLavel" value="value" label="label" />
      </html:select>
      </logic:notEqual>
      <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
        <logic:equal name="mbhRsv030Form" property="rsv030UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_NOSET) %>"><gsmsg:write key="reserve.use.kbn.noset" /></logic:equal>
        <logic:equal name="mbhRsv030Form" property="rsv030UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_KAIGI) %>"><gsmsg:write key="reserve.use.kbn.meeting" /></logic:equal>
        <logic:equal name="mbhRsv030Form" property="rsv030UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_KENSYU) %>"><gsmsg:write key="reserve.use.kbn.training" /></logic:equal>
        <logic:equal name="mbhRsv030Form" property="rsv030UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_OTHER) %>"><gsmsg:write key="reserve.use.kbn.other" /></logic:equal>
      </logic:equal>
    </logic:equal>

    </logic:equal>


   <% if (sisKbn ==GSConstReserve.RSK_KBN_HEYA
            || sisKbn == GSConstReserve.RSK_KBN_CAR) { %>
<%-- 連絡先 --%>
    <br>
    ■<span class="text_bb1"><gsmsg:write key="reserve.contact" /></span><br>

      <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Contact" /></span>
      </logic:notEqual>
      <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <html:text name="mbhRsv030Form" property="rsv030Contact" size="20" maxlength="20" styleClass="text_base_rsv" />
        </logic:notEqual>
        <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Contact" /></span>
        </logic:equal>
      </logic:equal>

    <% } %>

        <logic:equal name="mbhRsv030Form" property="rsv030SisetuKbn" value="<%= String.valueOf(GSConstReserve.RSK_KBN_HEYA) %>">
      <div class="text_bb1">■<gsmsg:write key="reserve.guide" /></div>
      <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Guide" /></span>
      </logic:notEqual>
      <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <html:text name="mbhRsv030Form" property="rsv030Guide" size="20" maxlength="20" styleClass="text_base_rsv" />
        </logic:notEqual>
        <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Guide" /></span>
        </logic:equal>
      </logic:equal>

      <div class="text_bb1">■<gsmsg:write key="reserve.park.num" /></div>
      <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030ParkNum" /></span>
      </logic:notEqual>
      <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <html:text name="mbhRsv030Form" property="rsv030ParkNum" size="20" maxlength="20" styleClass="text_base_rsv" />
        </logic:notEqual>
        <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030ParkNum" /></span>
        </logic:equal>
      </logic:equal>
    </logic:equal>

<logic:equal name="mbhRsv030Form" property="rsv030SisetuKbn" value="<%= String.valueOf(GSConstReserve.RSK_KBN_CAR) %>">
    <%-- 行先 --%>
      <div class="text_bb1">■<gsmsg:write key="reserve.dest" /></div>
      <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Dest" /></span>
      </logic:notEqual>
      <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <html:text name="mbhRsv030Form" property="rsv030Dest" size="20" maxlength="20" styleClass="text_base_rsv" />
        </logic:notEqual>
        <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Dest" /></span>
        </logic:equal>
      </logic:equal>
    </logic:equal>
    <br>

        ■<span class="text_bb1"><gsmsg:write key="cmn.start" /></span><br>

      <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
      <span class="text_base"><bean:write name="mbhRsv030Form" property="yoyakuFrString" /></span>
      </logic:equal>

      <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
      <span class="text_base"><bean:write name="mbhRsv030Form" property="yoyakuFrString" /></span>
      </logic:notEqual>

      <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">

        <html:select property="rsv030SelectedYearFr" styleId="fromYear">
          <logic:notEmpty name="mbhRsv030Form" property="rsv030YearComboList">
            <html:optionsCollection name="mbhRsv030Form" property="rsv030YearComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>

        <html:select property="rsv030SelectedMonthFr" styleId="fromMonth">
          <logic:notEmpty name="mbhRsv030Form" property="rsv030MonthComboList">
            <html:optionsCollection name="mbhRsv030Form" property="rsv030MonthComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>

        <html:select property="rsv030SelectedDayFr" styleId="fromDay">
          <logic:notEmpty name="mbhRsv030Form" property="rsv030DayComboList">
            <html:optionsCollection name="mbhRsv030Form" property="rsv030DayComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>

       <br>

        <html:select property="rsv030SelectedHourFr">
          <logic:notEmpty name="mbhRsv030Form" property="rsv030HourComboList">
            <html:optionsCollection name="mbhRsv030Form" property="rsv030HourComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>
        <gsmsg:write key="cmn.hour.input" />

        <html:select property="rsv030SelectedMinuteFr">
          <logic:notEmpty name="mbhRsv030Form" property="rsv030MinuteComboList">
            <html:optionsCollection name="mbhRsv030Form" property="rsv030MinuteComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>
        <gsmsg:write key="cmn.minute.input" />

        </logic:notEqual>
      </logic:equal>


      <br>


      ■<span class="text_bb1"><gsmsg:write key="cmn.end" /></span><br>


      <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
      <span class="text_base"><bean:write name="mbhRsv030Form" property="yoyakuToString" /></span>
      </logic:equal>

      <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
      <span class="text_base"><bean:write name="mbhRsv030Form" property="yoyakuToString" /></span>
      </logic:notEqual>

      <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">

        <html:select property="rsv030SelectedYearTo" styleId="toYear">
          <logic:notEmpty name="mbhRsv030Form" property="rsv030YearComboList">
            <html:optionsCollection name="mbhRsv030Form" property="rsv030YearComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>

        <html:select property="rsv030SelectedMonthTo" styleId="toMonth">
          <logic:notEmpty name="mbhRsv030Form" property="rsv030MonthComboList">
            <html:optionsCollection name="mbhRsv030Form" property="rsv030MonthComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>

        <html:select property="rsv030SelectedDayTo" styleId="toDay">
          <logic:notEmpty name="mbhRsv030Form" property="rsv030DayComboList">
            <html:optionsCollection name="mbhRsv030Form" property="rsv030DayComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>

        <br>

        <html:select property="rsv030SelectedHourTo">
          <logic:notEmpty name="mbhRsv030Form" property="rsv030HourComboList">
            <html:optionsCollection name="mbhRsv030Form" property="rsv030HourComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>
        <gsmsg:write key="cmn.hour.input" />

        <html:select property="rsv030SelectedMinuteTo">
          <logic:notEmpty name="mbhRsv030Form" property="rsv030MinuteComboList">
            <html:optionsCollection name="mbhRsv030Form" property="rsv030MinuteComboList" value="value" label="label" />
          </logic:notEmpty>
        </html:select>
        <gsmsg:write key="cmn.minute.input" />

        </logic:notEqual>
      </logic:equal>

      <br>

      ■<span class="text_bb1"><gsmsg:write key="cmn.content" /></span><br>


      <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Naiyo" filter="false" /></span>
      </logic:notEqual>

      <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <textarea styleClass="text_base_rsv" name="rsv030Naiyo" cols="25" rows="6"" id="inputstr"><bean:write name="mbhRsv030Form" property="rsv030Naiyo" /></textarea>

        </logic:notEqual>

      </logic:equal>

      <br>