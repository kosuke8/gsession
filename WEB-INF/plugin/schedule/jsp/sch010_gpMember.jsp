<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<% int editConfOwn = Integer.valueOf(request.getParameter("editConfOwn"));%>
<% int editConfGroup = Integer.valueOf(request.getParameter("editConfGroup"));%>
<% int dspPublic = Integer.valueOf(request.getParameter("dspPublic"));%>
<% int dspBelongGroup = Integer.valueOf(request.getParameter("dspBelongGroup"));%>
<% String project = request.getParameter("project");%>
<% String nippou = request.getParameter("nippou");%>
<% String grpHeight = request.getParameter("grpHeight");%>
<% long schTipCnt = Long.valueOf(request.getParameter("schTipCnt"));%>

<logic:iterate id="weekBean" name="sch010Form" property="sch010TopList" scope="request" offset="0"/>
<bean:define id="usrBean" name="weekBean" property="sch010UsrMdl"/>
  <logic:iterate id="gpWeekMdl" name="sch010Form" property="sch010BottomList" scope="request" indexId="cnt">
  <bean:define id="ret" value="<%= String.valueOf(cnt.intValue() % 5) %>" />

  <!-- 5行毎にタイトル(氏名,日付) -->
  <logic:notEqual name="cnt" value="0" scope="page">
  <logic:equal name="ret" value="0">
  <tr>
  <th width="16%" class="td_type3"><span class="sc_ttl_def"><gsmsg:write key="cmn.name" /></span></th>
  <logic:notEmpty name="sch010Form" property="sch010CalendarList" scope="request">
  <logic:iterate id="calBean" name="sch010Form" property="sch010CalendarList" scope="request">

    <bean:define id="tdColor" value="" />
    <bean:define id="fontColorSun" value="" />
    <bean:define id="fontColorSat" value="" />
    <bean:define id="fontColorDef" value="" />
    <% String[] tdColors = new String[] {"td_calnot_today", "td_cal_today"}; %>
    <% String[] fontColorsSun = new String[] {"sc_ttl_sun", "sc_ttl_sun"}; %>
    <% String[] fontColorsSat = new String[] {"sc_ttl_sat", "sc_ttl_sat"}; %>
    <% String[] fontColorsDef = new String[] {"sc_ttl_def", "sc_ttl_def_today"}; %>

    <logic:equal name="calBean" property="todayKbn" value="1">
    <% tdColor = tdColors[1]; %>
    <% fontColorSun = fontColorsSun[1]; %>
    <% fontColorSat = fontColorsSat[1]; %>
    <% fontColorDef = fontColorsDef[1]; %>
    </logic:equal>
    <logic:notEqual name="calBean" property="todayKbn" value="1">
    <% tdColor = tdColors[0]; %>
    <% fontColorSun = fontColorsSun[0]; %>
    <% fontColorSat = fontColorsSat[0]; %>
    <% fontColorDef = fontColorsDef[0]; %>
    </logic:notEqual>

  <logic:equal name="calBean" property="holidayKbn" value="1">
  <th width="12%" nowrap class="<%= tdColor %>"><a href="#" onClick="moveDailySchedule('day', <bean:write name="calBean" property="dspDate" />, <bean:write name="usrBean" property="usrSid" />, <bean:write name="usrBean" property="usrKbn" />);">
  <span class="<%= fontColorSun %>"><bean:write name="calBean" property="dspDayString" /></span></a></th>
  </logic:equal>

  <logic:notEqual name="calBean" property="holidayKbn" value="1">
  <logic:equal name="calBean" property="weekKbn" value="1">
  <th width="12%" nowrap class="<%= tdColor %>"><a href="#" onClick="moveDailySchedule('day', <bean:write name="calBean" property="dspDate" />, <bean:write name="usrBean" property="usrSid" />, <bean:write name="usrBean" property="usrKbn" />);">
  <span class="<%= fontColorSun %>"><bean:write name="calBean" property="dspDayString" /></span></a></th>
  </logic:equal>

  <logic:equal name="calBean" property="weekKbn" value="7">
  <th width="12%" nowrap class="<%= tdColor %>"><a href="#" onClick="moveDailySchedule('day', <bean:write name="calBean" property="dspDate" />, <bean:write name="usrBean" property="usrSid" />, <bean:write name="usrBean" property="usrKbn" />);">
  <span class="<%= fontColorSat %>"><bean:write name="calBean" property="dspDayString" /></span></a></th>
  </logic:equal>

  <logic:notEqual name="calBean" property="weekKbn" value="1">
  <logic:notEqual name="calBean" property="weekKbn" value="7">
  <th width="12%" nowrap class="<%= tdColor %>"><a href="#" onClick="moveDailySchedule('day', <bean:write name="calBean" property="dspDate" />, <bean:write name="usrBean" property="usrSid" />, <bean:write name="usrBean" property="usrKbn" />);">
  <span class="<%= fontColorDef %>"><bean:write name="calBean" property="dspDayString" /></span></a></th>
  </logic:notEqual>
  </logic:notEqual>
  </logic:notEqual>

  </logic:iterate>
  </logic:notEmpty>
  </tr>

  </logic:equal>
  </logic:notEqual>


  <tr align="left" valign="top">
  <!-- ユーザ欄 -->
  <bean:define id="usrMdl" name="gpWeekMdl" property="sch010UsrMdl"/>

  <!-- ユーザ氏名 -->
  <logic:equal name="sch010Form" property="zaisekiUseOk" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.PLUGIN_USE) %>">
  <logic:equal name="usrMdl" property="zaisekiKbn" value="1">
  <td rowspan="<bean:write name="gpWeekMdl" property="sch010PeriodRow" />" class="td_type1  break">
  </logic:equal>
  <logic:equal name="usrMdl" property="zaisekiKbn" value="2">
  <td rowspan="<bean:write name="gpWeekMdl" property="sch010PeriodRow" />" class="td_type_gaisyutu  break">
  </logic:equal>
  <logic:equal name="usrMdl" property="zaisekiKbn" value="0">
  <td rowspan="<bean:write name="gpWeekMdl" property="sch010PeriodRow" />" class="td_type_kekkin  break">
  </logic:equal>
  </logic:equal>
  <logic:notEqual name="sch010Form" property="zaisekiUseOk" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.PLUGIN_USE) %>">
  <td rowspan="<bean:write name="gpWeekMdl" property="sch010PeriodRow" />" class="td_type1  break">
  </logic:notEqual>

    <span>
    <a href="javaScript:void(0);" onClick="openUserInfoWindow(<bean:write name="usrMdl" property="usrSid" />);">
    <logic:equal value="1" name="usrMdl" property="schUkoFlg"><span class="mukouser"><bean:write name="usrMdl" property="usrName" /></span></logic:equal>
    <logic:notEqual value="1" name="usrMdl" property="schUkoFlg"><span><bean:write name="usrMdl" property="usrName" /></span></logic:notEqual>
    </span>
    </a>
    <span class="sc_link_5"><bean:write name="usrMdl" property="zaisekiMsg" /></span><br>

    <span>
      <a href="#" onClick="moveMonthSchedule('month', <bean:write name="usrMdl" property="usrSid" />, <bean:write name="usrMdl" property="usrKbn" />);"><img src="../common/images/btn_gekkan_bg.gif" width="35" height="18" alt="" border="0">
        <span class="sc_link_1_vargin_top"><gsmsg:write key="cmn.monthly" /></span>
      </a><br>
      <a href="#" onClick="moveListSchedule('list', <bean:write name="usrMdl" property="usrSid" />, <bean:write name="usrMdl" property="usrKbn" />);"><img src="../common/images/btn_ichiran_bg.gif" width="35" height="18" alt="" border="0">
        <span class="sc_link_1_vargin_top"><gsmsg:write key="cmn.list" /></span>
      </a><br>
      <logic:equal name="sch010Form" property="smailUseOk" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.PLUGIN_USE) %>">
      <logic:equal name="usrMdl" property="smlAble" value="1">
      <a href="#" class="sml_send_link" id="<bean:write name="usrMdl" property="usrSid" />"><img src="../common/images/btn_smail_bg.gif" width="35" height="18" alt="" border="0">
        <span class="sc_link_1_vargin_top"><gsmsg:write key="cmn.shortmail" /></span>
      </a><br>
      </logic:equal>
      </logic:equal>
      <!-- 在席 -->
      <logic:equal name="sch010Form" property="zaisekiUseOk" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.PLUGIN_USE) %>">
      <logic:equal name="usrMdl" property="zaisekiKbn" value="1">
      <input type="button" onClick="setFuzai(<bean:write name="usrMdl" property="usrSid" />);" style="border:0px;color:#417984;font-size:10px;font-weight:bold;width:55px;height:17px;" class="btn_fuzai" value="<gsmsg:write key="cmn.absence" />">
      <input type="button" onClick="setSonota(<bean:write name="usrMdl" property="usrSid" />);" style="border:0px;color:#47a370;font-size:10px;font-weight:bold;width:55px;height:17px;" class="btn_sonota" value="<gsmsg:write key="cmn.other" />">
      </logic:equal>
      <logic:notEqual name="usrMdl" property="zaisekiKbn" value="1">
      <!-- 不在、その他 -->
      <input type="button" onClick="setZaiseki(<bean:write name="usrMdl" property="usrSid" />);" style="border:0px;color:#47a370;font-size:10px;font-weight:bold;width:55px;height:17px;" class="btn_zaiseki" value="<gsmsg:write key="cmn.zaiseki" />">
      <img src="../common/images/damy.gif" width="35" height="18" alt="<gsmsg:write key="cmn.space" />" >
      </logic:notEqual>
      </logic:equal>
      <logic:notEqual name="sch010Form" property="zaisekiUseOk" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.PLUGIN_USE) %>">
      <img src="../common/images/damy.gif" width="35" height="18" alt="<gsmsg:write key="cmn.space" />" >
      <img src="../common/images/damy.gif" width="35" height="18" alt="<gsmsg:write key="cmn.space" />" >
      </logic:notEqual>
    </span>
  </td>

<!-- スケジュール情報 -->
  <logic:notEmpty name="gpWeekMdl" property="sch010SchList">
  <logic:iterate id="gpDayMdl" name="gpWeekMdl" property="sch010SchList">

  <logic:equal name="gpDayMdl" property="weekKbn" value="1">
  <logic:equal name="gpDayMdl" property="todayKbn" value="1">
    <td style="height:<%= grpHeight %>px" align="left" valign="top" class="td_cal_today">
  </logic:equal>
  <logic:notEqual name="gpDayMdl" property="todayKbn" value="1">
    <td style="height:<%= grpHeight %>px" align="left" valign="top" class="td_type9">
  </logic:notEqual>
  </logic:equal>

  <logic:equal name="gpDayMdl" property="weekKbn" value="7">
  <logic:equal name="gpDayMdl" property="todayKbn" value="1">
    <td style="height:<%= grpHeight %>px" align="left" valign="top" class="td_cal_today">
  </logic:equal>
  <logic:notEqual name="gpDayMdl" property="todayKbn" value="1">
    <td style="height:<%= grpHeight %>px" align="left" valign="top" class="td_type8">
  </logic:notEqual>
  </logic:equal>

  <logic:notEqual name="gpDayMdl" property="weekKbn" value="1">
  <logic:notEqual name="gpDayMdl" property="weekKbn" value="7">

  <logic:equal name="gpDayMdl" property="todayKbn" value="1">
    <td style="height:<%= grpHeight %>px" align="left" valign="top" class="td_cal_today">
  </logic:equal>

  <logic:notEqual name="gpDayMdl" property="todayKbn" value="1">
    <td style="height:<%= grpHeight %>px" align="left" valign="top" class="td_type1">
  </logic:notEqual>

  </logic:notEqual>
  </logic:notEqual>

    <logic:equal name="usrMdl" property="schRegistFlg" value="true">
    <a href="#" onClick="return addSchedule('add', <bean:write name="gpDayMdl" property="schDate" />, <bean:write name="gpDayMdl" property="usrSid" />, <bean:write name="gpDayMdl" property="usrKbn" />);"><img src="../schedule/images/scadd.gif" alt="<gsmsg:write key="cmn.add" />" width="16" height="16" border="0"></a><br>
    </logic:equal>

    <logic:notEmpty name="gpDayMdl" property="schDataList">
    <logic:iterate id="gpSchMdl" name="gpDayMdl" property="schDataList">

      <bean:define id="u_usrsid" name="gpDayMdl" property="usrSid" type="java.lang.Integer" />
      <bean:define id="u_schsid" name="gpSchMdl" property="schSid" type="java.lang.Integer" />
      <bean:define id="u_date" name="gpDayMdl" property="schDate"  type="java.lang.String" />

      <bean:define id="type1" name="gpSchMdl" property="public"  type="java.lang.Integer" />
      <bean:define id="type2" name="gpSchMdl" property="kjnEdKbn"  type="java.lang.Integer" />
      <bean:define id="type3" name="gpSchMdl" property="grpEdKbn"  type="java.lang.Integer" />

      <%
        int publicType = ((Integer)pageContext.getAttribute("type1",PageContext.PAGE_SCOPE));
        int kjnEdKbn = ((Integer)pageContext.getAttribute("type2",PageContext.PAGE_SCOPE));
        int grpEdKbn = ((Integer)pageContext.getAttribute("type3",PageContext.PAGE_SCOPE));
      %>

      <!--公開-->
      <%
      if ((publicType == dspPublic || publicType == dspBelongGroup) || (kjnEdKbn == editConfOwn || grpEdKbn == editConfGroup)) {
      %>

      <logic:empty name="gpSchMdl" property="valueStr">

      <a href="#" id="tooltips_sch<%= String.valueOf(schTipCnt++) %>" onClick="editSchedule('edit', <bean:write name="gpDayMdl" property="schDate" />, <bean:write name="gpSchMdl" property="schSid" />, <bean:write name="gpDayMdl" property="usrSid" />, <bean:write name="gpDayMdl" property="usrKbn" />);">
      <span class="tooltips"><bean:write name="gpSchMdl" property="title" /></span>
      </logic:empty>
      <logic:notEmpty name="gpSchMdl" property="valueStr">
      <bean:define id="scnaiyou" name="gpSchMdl" property="valueStr" />
      <%
        String tmpText = (String)pageContext.getAttribute("scnaiyou",PageContext.PAGE_SCOPE);
        String tmpText2 = jp.co.sjts.util.StringUtilHtml.transToHTml(tmpText);
      %>
      <a href="#" id="tooltips_sch<%= String.valueOf(schTipCnt++) %>" onClick="editSchedule('edit', <bean:write name="gpDayMdl" property="schDate" />, <bean:write name="gpSchMdl" property="schSid" />, <bean:write name="gpDayMdl" property="usrSid" />, <bean:write name="gpDayMdl" property="usrKbn" />);">
      <span class="tooltips"><gsmsg:write key="cmn.content" />:<%= tmpText2 %></span>
      </logic:notEmpty>

      <!--タイトルカラー設定-->
      <logic:equal name="gpSchMdl" property="bgColor" value="0">
      <span class="sc_link_1">
      </logic:equal>
      <logic:equal name="gpSchMdl" property="bgColor" value="1">
      <span class="sc_link_1">
      </logic:equal>
      <logic:equal name="gpSchMdl" property="bgColor" value="2">
      <span class="sc_link_2">
      </logic:equal>
      <logic:equal name="gpSchMdl" property="bgColor" value="3">
      <span class="sc_link_3">
      </logic:equal>
      <logic:equal name="gpSchMdl" property="bgColor" value="4">
      <span class="sc_link_4">
      </logic:equal>
      <logic:equal name="gpSchMdl" property="bgColor" value="5">
      <span class="sc_link_5">
      </logic:equal>
      <logic:equal name="gpSchMdl" property="bgColor" value="6">
      <span class="sc_link_6">
      </logic:equal>
      <logic:equal name="gpSchMdl" property="bgColor" value="7">
      <span class="sc_link_7">
      </logic:equal>
      <logic:equal name="gpSchMdl" property="bgColor" value="8">
      <span class="sc_link_8">
      </logic:equal>
      <logic:equal name="gpSchMdl" property="bgColor" value="9">
      <span class="sc_link_9">
      </logic:equal>
      <logic:equal name="gpSchMdl" property="bgColor" value="10">
      <span class="sc_link_10">
      </logic:equal>


        <logic:notEmpty name="gpSchMdl" property="time">
        <font size="-2"><bean:write name="gpSchMdl" property="time" /><br></font>
        </logic:notEmpty>
        <bean:write name="gpSchMdl" property="title" /><br>
      </span>
      </a>

      <%
      } else {
      %>

      <!--非公開-->
      <span class="sc_nolink">
        <logic:notEmpty name="gpSchMdl" property="time">
        <font size="-2"><bean:write name="gpSchMdl" property="time" /><br></font>
        </logic:notEmpty>
        <logic:notEmpty name="gpSchMdl" property="title">
        <bean:write name="gpSchMdl" property="title" />
        <br>
        </logic:notEmpty>
      </span>
      <%
      }
      %>
    </logic:iterate>
    </logic:notEmpty>
  </td>

  </logic:iterate>
  </logic:notEmpty>
  </tr>


  <!--期間スケジュール-->
  <logic:notEmpty name="gpWeekMdl" property="sch010NoTimeSchList">

   <bean:define id="memPrList" name="gpWeekMdl" property="sch010NoTimeSchList" type="java.util.ArrayList"/>
   <% int rowSize = memPrList.size(); %>

    <logic:iterate id="periodList" name="gpWeekMdl" property="sch010NoTimeSchList" indexId="rowPidx">
      <logic:notEmpty name="periodList">

        <% if ((Integer.valueOf(rowPidx) + 1) == (Integer.valueOf(rowSize))) { %>
        <tr class="td_sch_type7">
        <% } else { %>
        <tr class="td_sch_type6">
        <% } %>

          <bean:define id="prList" name="periodList" type="java.util.ArrayList"/>
          <% int size = prList.size(); %>

          <logic:iterate id="gpPeriodMdl" name="periodList" indexId="memPidx">
            <logic:notEmpty name="gpPeriodMdl" property="periodMdl">
              <bean:define id="pMdl" name="gpPeriodMdl" property="periodMdl"/>

              <td class="td_type1 td_type_kikan" colspan="<bean:write name="pMdl" property="schPeriodCnt" />">


                  <bean:define id="p_schsid" name="gpPeriodMdl" property="schSid" type="java.lang.Integer" />
                  <bean:define id="p_public" name="gpPeriodMdl" property="public"  type="java.lang.Integer" />
                  <bean:define id="p_kjnEdKbn" name="gpPeriodMdl" property="kjnEdKbn"  type="java.lang.Integer" />
                  <bean:define id="p_grpEdKbn" name="gpPeriodMdl" property="grpEdKbn"  type="java.lang.Integer" />
                  <%
                    int publicType = ((Integer)pageContext.getAttribute("p_public",PageContext.PAGE_SCOPE));
                    int kjnEdKbn = ((Integer)pageContext.getAttribute("p_kjnEdKbn",PageContext.PAGE_SCOPE));
                    int grpEdKbn = ((Integer)pageContext.getAttribute("p_grpEdKbn",PageContext.PAGE_SCOPE));
                  %>

                  <!--公開-->
                  <%
                  if ((publicType == dspPublic || publicType == dspBelongGroup) || (kjnEdKbn == editConfOwn || grpEdKbn == editConfGroup)) {
                  %>

                  <logic:empty name="gpPeriodMdl" property="schAppendUrl">
                    <logic:empty name="gpPeriodMdl" property="valueStr">
                    <a href="#" id="tooltips_sch<%= String.valueOf(schTipCnt++) %>" onClick="editSchedule('edit', <bean:write name="gpDayMdl" property="schDate" />, <bean:write name="gpPeriodMdl" property="schSid" />, <bean:write name="gpDayMdl" property="usrSid" />, <bean:write name="gpDayMdl" property="usrKbn" />);">
                    <span class="tooltips"><bean:write name="gpPeriodMdl" property="title" /></span>
                    </logic:empty>
                    <logic:notEmpty name="gpPeriodMdl" property="valueStr">
                    <bean:define id="scnaiyou" name="gpPeriodMdl" property="valueStr" />
                    <%
                      String tmpText = (String)pageContext.getAttribute("scnaiyou",PageContext.PAGE_SCOPE);
                      String tmpText2 = jp.co.sjts.util.StringUtilHtml.transToHTml(tmpText);
                    %>
                    <a href="#" id="tooltips_sch<%= String.valueOf(schTipCnt++) %>" onClick="editSchedule('edit', <bean:write name="gpDayMdl" property="schDate" />, <bean:write name="gpPeriodMdl" property="schSid" />, <bean:write name="gpDayMdl" property="usrSid" />, <bean:write name="gpDayMdl" property="usrKbn" />);">
                    <span class="tooltips"><gsmsg:write key="cmn.content" />:<%= tmpText2 %></span>
                    </logic:notEmpty>
                  </logic:empty>

                  <logic:notEmpty name="gpPeriodMdl" property="schAppendUrl">
                    <logic:empty name="gpPeriodMdl" property="valueStr">
                    <a id="tooltips_sch<%= String.valueOf(schTipCnt++) %>" href="<bean:write name="gpPeriodMdl" property="schAppendUrl" />">
                    <% boolean schFilter = true; %>
                    <logic:equal name="gpPeriodMdl" property="userKbn" value="<%= project %>">
                      <% schFilter = false; %>
                    </logic:equal>
                    <span class="tooltips"><bean:write name="gpPeriodMdl" property="title" filter="<%= schFilter %>" /></span>
                    </logic:empty>
                    <logic:notEmpty name="gpPeriodMdl" property="valueStr">
                    <bean:define id="scnaiyou" name="gpPeriodMdl" property="valueStr" />
                    <%
                      String tmpText = (String)pageContext.getAttribute("scnaiyou",PageContext.PAGE_SCOPE);
                      String tmpText2 = jp.co.sjts.util.StringUtilHtml.transToHTml(tmpText);
                    %>
                    <a id="tooltips_sch<%= String.valueOf(schTipCnt++) %>" href="<bean:write name="gpPeriodMdl" property="schAppendUrl" />">
                    <span class="tooltips"><gsmsg:write key="cmn.content" />:<%= tmpText2 %></span>
                    </logic:notEmpty>
                  </logic:notEmpty>

                  <!--タイトルカラー設定-->
                  <logic:equal name="gpPeriodMdl" property="bgColor" value="0">
                  <span class="sc_link_1">
                  </logic:equal>
                  <logic:equal name="gpPeriodMdl" property="bgColor" value="1">
                  <span class="sc_link_1">
                  </logic:equal>
                  <logic:equal name="gpPeriodMdl" property="bgColor" value="2">
                  <span class="sc_link_2">
                  </logic:equal>
                  <logic:equal name="gpPeriodMdl" property="bgColor" value="3">
                  <span class="sc_link_3">
                  </logic:equal>
                  <logic:equal name="gpPeriodMdl" property="bgColor" value="4">
                  <span class="sc_link_4">
                  </logic:equal>
                  <logic:equal name="gpPeriodMdl" property="bgColor" value="5">
                  <span class="sc_link_5">
                  </logic:equal>
                  <logic:equal name="gpPeriodMdl" property="bgColor" value="6">
                  <span class="sc_link_6">
                  </logic:equal>
                  <logic:equal name="gpPeriodMdl" property="bgColor" value="7">
                  <span class="sc_link_7">
                  </logic:equal>
                  <logic:equal name="gpPeriodMdl" property="bgColor" value="8">
                  <span class="sc_link_8">
                  </logic:equal>
                  <logic:equal name="gpPeriodMdl" property="bgColor" value="9">
                  <span class="sc_link_9">
                  </logic:equal>
                  <logic:equal name="gpPeriodMdl" property="bgColor" value="10">
                  <span class="sc_link_10">
                  </logic:equal>
                  <% boolean schFilter = true; %>
                  <logic:equal name="gpPeriodMdl" property="userKbn" value="<%= project %>">
                    <span class="sc_link_g">TODO</span>
                    <% schFilter = false; %>
                  </logic:equal>
                  <logic:equal name="gpPeriodMdl" property="userKbn" value="<%= nippou %>">
                    <span class="sc_link_g">アクション</span>
                  </logic:equal>

                    <logic:notEmpty name="gpPeriodMdl" property="time">
                    <font size="-2"><bean:write name="gpPeriodMdl" property="time" /><br></font>
                    </logic:notEmpty>
                    <bean:write name="gpPeriodMdl" property="title" filter="<%= schFilter %>" /><br>
                  </span>
                  </a>

                  <%
                  } else {
                  %>

                  <!--非公開-->
                  <span class="sc_nolink">
                    <logic:notEmpty name="gpPeriodMdl" property="time">
                    <font size="-2"><bean:write name="gpPeriodMdl" property="time" /><br></font>
                    </logic:notEmpty>
                    <logic:notEmpty name="gpPeriodMdl" property="title">
                    <bean:write name="gpPeriodMdl" property="title" />
                    <br>
                    </logic:notEmpty>
                  </span>
                  <%
                  }
                  %>
              </td>
            </logic:notEmpty>
            <logic:empty name="gpPeriodMdl" property="periodMdl">

              <% String td_class = "td_type_kikan2"; %>
              <% if ((Integer.valueOf(memPidx) + 1) == (Integer.valueOf(size))) { %>
              <% td_class ="td_type_kikan3"; %>
              <% } else if (Integer.valueOf(memPidx) == 0){ %>
              <% td_class ="td_type_kikan4"; %>
              <% } %>

              <% if ((Integer.valueOf(rowPidx) + 1) == (Integer.valueOf(rowSize))) { %>
              <% td_class = td_class  + " td_type_kikan5"; %>
              <% } %>

              <td class="<%= td_class %>"></td>

            </logic:empty>
          </logic:iterate>
        </tr>
      </logic:notEmpty>
    </logic:iterate>
  </logic:notEmpty>
  </logic:iterate>