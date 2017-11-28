<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<% int editConfOwn = Integer.valueOf(request.getParameter("editConfOwn"));%>
<% int editConfGroup = Integer.valueOf(request.getParameter("editConfGroup"));%>
<% int dspPublic = Integer.valueOf(request.getParameter("dspPublic"));%>
<% String project = request.getParameter("project");%>
<% String nippou = request.getParameter("nippou");%>
<% String grpHeight = request.getParameter("grpHeight");%>
<% long schTipCnt = Long.valueOf(request.getParameter("schTipCnt"));%>

  <logic:iterate id="weekMdl" name="sch010Form" property="sch010TopList" scope="request">
  <tr align="left" valign="top">
  <bean:define id="usrMdl" name="weekMdl" property="sch010UsrMdl"/>

  <!-- グループ -->
  <logic:equal name="usrMdl" property="usrKbn" value="1">
    <td rowspan="<bean:write name="weekMdl" property="sch010PeriodRow" />" class="td_type1" >
    <span id="lt"><img src="../common/images/groupicon.gif" alt="<gsmsg:write key="cmn.group" />" border="0"></span>
    <span id="lt" class="text_bb1"><bean:write name="usrMdl" property="usrName" /></span><br>
    <span>
      <a href="#" onClick="moveMonthSchedule('month', <bean:write name="usrMdl" property="usrSid" />, <bean:write name="usrMdl" property="usrKbn" />);"><img src="../common/images/btn_gekkan_bg.gif" width="35" height="18" alt="" border="0">
        <span class="sc_link_1_vargin_top"><gsmsg:write key="cmn.monthly" /></span>
      </a><br>
      <a href="#" onClick="moveListSchedule('list', <bean:write name="usrMdl" property="usrSid" />, <bean:write name="usrMdl" property="usrKbn" />);"><img src="../common/images/btn_ichiran_bg.gif" width="35" height="18" alt="" border="0">
        <span class="sc_link_1_vargin_top"><gsmsg:write key="cmn.list" /></span>
      </a>
    </span>
    </td>
  </logic:equal>

  <!-- 本人 -->
  <logic:notEqual name="usrMdl" property="usrKbn" value="1">
  <logic:equal name="sch010Form" property="zaisekiUseOk" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.PLUGIN_USE) %>">
    <logic:equal name="usrMdl" property="zaisekiKbn" value="1">
    <td rowspan="<bean:write name="weekMdl" property="sch010PeriodRow" />" class="td_type1 break">
    </logic:equal>
    <logic:equal name="usrMdl" property="zaisekiKbn" value="2">
    <td rowspan="<bean:write name="weekMdl" property="sch010PeriodRow" />" class="td_type_gaisyutu  break">
    </logic:equal>
    <logic:equal name="usrMdl" property="zaisekiKbn" value="0">
    <td rowspan="<bean:write name="weekMdl" property="sch010PeriodRow" />" class="td_type_kekkin  break">
    </logic:equal>
  </logic:equal>
  <logic:notEqual name="sch010Form" property="zaisekiUseOk" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstSchedule.PLUGIN_USE) %>">
    <td rowspan="<bean:write name="weekMdl" property="sch010PeriodRow" />" class="td_type1  break">
  </logic:notEqual>

    <span>
    <a href="javaScript:void(0);" onClick="openUserInfoWindow(<bean:write name="usrMdl" property="usrSid" />);"><bean:write name="usrMdl" property="usrName" /></a>
    </span>
    <span class="sc_link_5"><bean:write name="usrMdl" property="zaisekiMsg" /></span><br>
    <span>
      <a href="#" onClick="moveMyMonthSchedule('month', <bean:write name="usrMdl" property="usrSid" />, <bean:write name="usrMdl" property="usrKbn" />, '<bean:write name="sch010Form" property="sysDfGroupSid" />');"><img src="../common/images/btn_gekkan_bg.gif" width="35" height="18" alt="" border="0">
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
  </logic:notEqual>

  <!-- スケジュール情報 -->
  <logic:notEmpty name="weekMdl" property="sch010SchList">
  <logic:iterate id="dayMdl" name="weekMdl" property="sch010SchList">

  <logic:equal name="dayMdl" property="weekKbn" value="1">
  <logic:notEqual name="dayMdl" property="todayKbn" value="1">
    <td style="height:<%= grpHeight %>px" align="left" valign="top" class="td_type9">
  </logic:notEqual>
  <logic:equal name="dayMdl" property="todayKbn" value="1">
    <td style="height:<%= grpHeight %>px" align="left" valign="top" class="td_cal_today">
  </logic:equal>
  </logic:equal>
  <logic:equal name="dayMdl" property="weekKbn" value="7">

  <logic:notEqual name="dayMdl" property="todayKbn" value="1">
  <td style="height:<%= grpHeight %>px" align="left" valign="top" class="td_type8">
  </logic:notEqual>
  <logic:equal name="dayMdl" property="todayKbn" value="1">
  <td style="height:<%= grpHeight %>px" align="left" valign="top" class="td_cal_today">
  </logic:equal>
  </logic:equal>

  <logic:notEqual name="dayMdl" property="weekKbn" value="1">
  <logic:notEqual name="dayMdl" property="weekKbn" value="7">
    <logic:equal name="dayMdl" property="todayKbn" value="1">
    <td style="height:<%= grpHeight %>px" align="left" valign="top" class="td_cal_today">
    </logic:equal>
    <logic:notEqual name="dayMdl" property="todayKbn" value="1">
    <td style="height:<%= grpHeight %>px" align="left" valign="top" class="td_type1">
    </logic:notEqual>

  </logic:notEqual>
  </logic:notEqual>
    <logic:equal name="usrMdl" property="schRegistFlg" value="true">
      <span id="lt"><a href="#" onClick="return addSchedule('add', <bean:write name="dayMdl" property="schDate" />, <bean:write name="dayMdl" property="usrSid" />, <bean:write name="dayMdl" property="usrKbn" />);"><img src="../schedule/images/scadd.gif" alt="<gsmsg:write key="cmn.add" />" width="16" height="16" border="0" ></a></span>
    </logic:equal>

    <logic:notEmpty name="dayMdl" property="holidayName">
    <span id="rt"><font size="-2" color="#ff0000"><bean:write name="dayMdl" property="holidayName" /></font></span>
    </logic:notEmpty>

    <logic:notEmpty name="dayMdl" property="schDataList">
    <logic:iterate id="schMdl" name="dayMdl" property="schDataList">

      <bean:define id="u_usrsid" name="dayMdl" property="usrSid" type="java.lang.Integer" />
      <bean:define id="u_schsid" name="schMdl" property="schSid" type="java.lang.Integer" />
      <bean:define id="u_date" name="dayMdl" property="schDate"  type="java.lang.String" />
      <bean:define id="u_public" name="schMdl" property="public"  type="java.lang.Integer" />
      <bean:define id="u_kjnEdKbn" name="schMdl" property="kjnEdKbn"  type="java.lang.Integer" />
      <bean:define id="u_grpEdKbn" name="schMdl" property="grpEdKbn"  type="java.lang.Integer" />

      <%
        int publicType = ((Integer)pageContext.getAttribute("u_public",PageContext.PAGE_SCOPE));
        int kjnEdKbn = ((Integer)pageContext.getAttribute("u_kjnEdKbn",PageContext.PAGE_SCOPE));
        int grpEdKbn = ((Integer)pageContext.getAttribute("u_grpEdKbn",PageContext.PAGE_SCOPE));
      %>
      <br>
      <!--公開-->
      <%
      if ((publicType == dspPublic) || (kjnEdKbn == editConfOwn || grpEdKbn == editConfGroup)) {
      %>

      <logic:empty name="schMdl" property="valueStr">
        <logic:equal name="schMdl" property="userKbn" value="0">
          <a href="#" id="tooltips_sch<%= String.valueOf(schTipCnt++) %>" onClick="editSchedule('edit', <bean:write name="dayMdl" property="schDate" />, <bean:write name="schMdl" property="schSid" />, <bean:write name="dayMdl" property="usrSid" />, <bean:write name="schMdl" property="userKbn" />);">
        </logic:equal>
        <logic:notEqual name="schMdl" property="userKbn" value="0">
          <a href="#" id="tooltips_sch<%= String.valueOf(schTipCnt++) %>" onClick="editSchedule('edit', <bean:write name="dayMdl" property="schDate" />, <bean:write name="schMdl" property="schSid" />, <bean:write name="schMdl" property="userSid" />, <bean:write name="schMdl" property="userKbn" />);">
        </logic:notEqual>
        <span class="tooltips"><bean:write name="schMdl" property="title" /></span>
      </logic:empty>
      <logic:notEmpty name="schMdl" property="valueStr">
      <bean:define id="scnaiyou" name="schMdl" property="valueStr" />
      <%
        String tmpText = (String)pageContext.getAttribute("scnaiyou",PageContext.PAGE_SCOPE);
        String tmpText2 = jp.co.sjts.util.StringUtilHtml.transToHTml(tmpText);
      %>
      <logic:equal name="schMdl" property="userKbn" value="0">
        <a href="#" id="tooltips_sch<%= String.valueOf(schTipCnt++) %>" onClick="editSchedule('edit', <bean:write name="dayMdl" property="schDate" />, <bean:write name="schMdl" property="schSid" />, <bean:write name="dayMdl" property="usrSid" />, <bean:write name="schMdl" property="userKbn" />);">
      </logic:equal>
      <logic:notEqual name="schMdl" property="userKbn" value="0">
        <a href="#" id="tooltips_sch<%= String.valueOf(schTipCnt++) %>" onClick="editSchedule('edit', <bean:write name="dayMdl" property="schDate" />, <bean:write name="schMdl" property="schSid" />, <bean:write name="schMdl" property="userSid" />, <bean:write name="schMdl" property="userKbn" />);">
      </logic:notEqual>
      <span class="tooltips"><gsmsg:write key="cmn.content" />:<%= tmpText2 %></span>
      </logic:notEmpty>

      <!--タイトルカラー設定-->
      <logic:equal name="schMdl" property="bgColor" value="0">
      <span class="sc_link_1">
      </logic:equal>
      <logic:equal name="schMdl" property="bgColor" value="1">
      <span class="sc_link_1">
      </logic:equal>
      <logic:equal name="schMdl" property="bgColor" value="2">
      <span class="sc_link_2">
      </logic:equal>
      <logic:equal name="schMdl" property="bgColor" value="3">
      <span class="sc_link_3">
      </logic:equal>
      <logic:equal name="schMdl" property="bgColor" value="4">
      <span class="sc_link_4">
      </logic:equal>
      <logic:equal name="schMdl" property="bgColor" value="5">
      <span class="sc_link_5">
      </logic:equal>
      <logic:equal name="schMdl" property="bgColor" value="6">
      <span class="sc_link_6">
      </logic:equal>
      <logic:equal name="schMdl" property="bgColor" value="7">
      <span class="sc_link_7">
      </logic:equal>
      <logic:equal name="schMdl" property="bgColor" value="8">
      <span class="sc_link_8">
      </logic:equal>
      <logic:equal name="schMdl" property="bgColor" value="9">
      <span class="sc_link_9">
      </logic:equal>
      <logic:equal name="schMdl" property="bgColor" value="10">
      <span class="sc_link_10">
      </logic:equal>
      <logic:equal name="dayMdl" property="usrKbn" value="0">
        <logic:equal name="schMdl" property="userKbn" value="1">
          <span class="sc_link_g">G</span>
        </logic:equal>
      </logic:equal>
        <logic:notEmpty name="schMdl" property="time">
        <font size="-2"><bean:write name="schMdl" property="time" /><br></font>
        </logic:notEmpty>
        <bean:write name="schMdl" property="title" />
      </span>
      </a>

      <%
       } else {
      %>

      <!--非公開-->
      <span class="sc_nolink">
        <logic:equal name="dayMdl" property="usrKbn" value="0">
          <logic:equal name="schMdl" property="userKbn" value="1">
            <span class="sc_link_g">G</span>
          </logic:equal>
        </logic:equal>
        <logic:notEmpty name="schMdl" property="time">
        <font size="-2"><bean:write name="schMdl" property="time" /></font>
        </logic:notEmpty>
        <bean:write name="schMdl" property="title" />
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
  <logic:notEmpty name="weekMdl" property="sch010NoTimeSchList">
    <logic:iterate id="periodList" name="weekMdl" property="sch010NoTimeSchList">
      <logic:notEmpty name="periodList">
        <tr class="td_type33">

          <bean:define id="prList" name="periodList" type="java.util.ArrayList"/>
          <% int size = prList.size(); %>

          <logic:iterate id="uPeriodMdl" name="periodList" indexId="pIdx">

            <logic:notEmpty name="uPeriodMdl" property="periodMdl">
              <bean:define id="pMdl" name="uPeriodMdl" property="periodMdl"/>

              <td class="td_type1 td_type_kikan" colspan="<bean:write name="pMdl" property="schPeriodCnt" />">

                  <bean:define id="p_schsid" name="uPeriodMdl" property="schSid" type="java.lang.Integer" />
                  <bean:define id="p_public" name="uPeriodMdl" property="public"  type="java.lang.Integer" />
                  <bean:define id="p_kjnEdKbn" name="uPeriodMdl" property="kjnEdKbn"  type="java.lang.Integer" />
                  <bean:define id="p_grpEdKbn" name="uPeriodMdl" property="grpEdKbn"  type="java.lang.Integer" />
                  <%
                    int publicType = ((Integer)pageContext.getAttribute("p_public",PageContext.PAGE_SCOPE));
                    int kjnEdKbn = ((Integer)pageContext.getAttribute("p_kjnEdKbn",PageContext.PAGE_SCOPE));
                    int grpEdKbn = ((Integer)pageContext.getAttribute("p_grpEdKbn",PageContext.PAGE_SCOPE));
                  %>

                  <!--公開-->
                  <%
                  if ((publicType == dspPublic) || (kjnEdKbn == editConfOwn || grpEdKbn == editConfGroup)) {
                  %>

                  <logic:empty name="uPeriodMdl" property="schAppendUrl">
                    <logic:empty name="uPeriodMdl" property="valueStr">
                      <logic:equal name="uPeriodMdl" property="userKbn" value="0">
                        <a href="#" id="tooltips_sch<%= String.valueOf(schTipCnt++) %>" onClick="editSchedule('edit', <bean:write name="dayMdl" property="schDate" />, <bean:write name="uPeriodMdl" property="schSid" />, <bean:write name="dayMdl" property="usrSid" />, <bean:write name="uPeriodMdl" property="userKbn" />);">
                      </logic:equal>
                      <logic:notEqual name="uPeriodMdl" property="userKbn" value="0">
                        <a href="#" id="tooltips_sch<%= String.valueOf(schTipCnt++) %>" onClick="editSchedule('edit', <bean:write name="dayMdl" property="schDate" />, <bean:write name="uPeriodMdl" property="schSid" />, <bean:write name="uPeriodMdl" property="userSid" />, <bean:write name="uPeriodMdl" property="userKbn" />);">
                      </logic:notEqual>
                      <span class="tooltips"><bean:write name="uPeriodMdl" property="title" /></span>
                    </logic:empty>
                    <logic:notEmpty name="uPeriodMdl" property="valueStr">
                    <bean:define id="scnaiyou" name="uPeriodMdl" property="valueStr" />
                    <%
                      String tmpText = (String)pageContext.getAttribute("scnaiyou",PageContext.PAGE_SCOPE);
                      String tmpText2 = jp.co.sjts.util.StringUtilHtml.transToHTml(tmpText);
                    %>
                    <logic:equal name="uPeriodMdl" property="userKbn" value="0">
                      <a href="#" id="tooltips_sch<%= String.valueOf(schTipCnt++) %>" onClick="editSchedule('edit', <bean:write name="dayMdl" property="schDate" />, <bean:write name="uPeriodMdl" property="schSid" />, <bean:write name="dayMdl" property="usrSid" />, <bean:write name="uPeriodMdl" property="userKbn" />);">
                    </logic:equal>
                    <logic:notEqual name="uPeriodMdl" property="userKbn" value="0">
                      <a href="#" id="tooltips_sch<%= String.valueOf(schTipCnt++) %>" onClick="editSchedule('edit', <bean:write name="dayMdl" property="schDate" />, <bean:write name="uPeriodMdl" property="schSid" />, <bean:write name="uPeriodMdl" property="userSid" />, <bean:write name="uPeriodMdl" property="userKbn" />);">
                    </logic:notEqual>
                    <span class="tooltips"><gsmsg:write key="cmn.content" />:<%= tmpText2 %></span>
                    </logic:notEmpty>
                  </logic:empty>

                  <logic:notEmpty name="uPeriodMdl" property="schAppendUrl">
                    <logic:empty name="uPeriodMdl" property="valueStr">
                    <a href="<bean:write name="uPeriodMdl" property="schAppendUrl" />" id="tooltips_sch<%= String.valueOf(schTipCnt++) %>">
                    <% boolean schFilter = true; %>
                    <logic:equal name="uPeriodMdl" property="userKbn" value="<%= project %>">
                      <% schFilter = false; %>
                    </logic:equal>
                    <span class="tooltips"><bean:write name="uPeriodMdl" property="title" filter="<%= schFilter %>"/></span>
                    </logic:empty>
                    <logic:notEmpty name="uPeriodMdl" property="valueStr">
                    <bean:define id="scnaiyou" name="uPeriodMdl" property="valueStr" />
                    <%
                      String tmpText = (String)pageContext.getAttribute("scnaiyou",PageContext.PAGE_SCOPE);
                      String tmpText2 = jp.co.sjts.util.StringUtilHtml.transToHTml(tmpText);
                    %>
                    <a href="<bean:write name="uPeriodMdl" property="schAppendUrl" />" id="tooltips_sch<%= String.valueOf(schTipCnt++) %>">
                    <span class="tooltips"><gsmsg:write key="cmn.content" />:<%= tmpText2 %></span>
                    </logic:notEmpty>
                  </logic:notEmpty>

                  <!--タイトルカラー設定-->
                  <logic:equal name="uPeriodMdl" property="bgColor" value="0">
                  <span class="sc_link_1">
                  </logic:equal>
                  <logic:equal name="uPeriodMdl" property="bgColor" value="1">
                  <span class="sc_link_1">
                  </logic:equal>
                  <logic:equal name="uPeriodMdl" property="bgColor" value="2">
                  <span class="sc_link_2">
                  </logic:equal>
                  <logic:equal name="uPeriodMdl" property="bgColor" value="3">
                  <span class="sc_link_3">
                  </logic:equal>
                  <logic:equal name="uPeriodMdl" property="bgColor" value="4">
                  <span class="sc_link_4">
                  </logic:equal>
                  <logic:equal name="uPeriodMdl" property="bgColor" value="5">
                  <span class="sc_link_5">
                  </logic:equal>
                  <logic:equal name="uPeriodMdl" property="bgColor" value="6">
                  <span class="sc_link_6">
                  </logic:equal>
                  <logic:equal name="uPeriodMdl" property="bgColor" value="7">
                  <span class="sc_link_7">
                  </logic:equal>
                  <logic:equal name="uPeriodMdl" property="bgColor" value="8">
                  <span class="sc_link_8">
                  </logic:equal>
                  <logic:equal name="uPeriodMdl" property="bgColor" value="9">
                  <span class="sc_link_9">
                  </logic:equal>
                  <logic:equal name="uPeriodMdl" property="bgColor" value="10">
                  <span class="sc_link_10">
                  </logic:equal>
                  <% boolean schFilter = true; %>
                  <logic:equal name="dayMdl" property="usrKbn" value="0">
                    <logic:equal name="uPeriodMdl" property="userKbn" value="1">
                      <span class="sc_link_g">G</span>
                    </logic:equal>
                    <logic:equal name="uPeriodMdl" property="userKbn" value="<%= project %>">
                      <span class="sc_link_g">TODO</span>
                      <% schFilter = false; %>
                    </logic:equal>
                    <logic:equal name="uPeriodMdl" property="userKbn" value="<%= nippou %>">
                      <span class="sc_link_g">アクション</span>
                    </logic:equal>
                  </logic:equal>
                    <logic:notEmpty name="uPeriodMdl" property="time">
                    <font size="-2"><bean:write name="uPeriodMdl" property="time" /><br></font>
                    </logic:notEmpty>
                    <bean:write name="uPeriodMdl" property="title" filter="<%= schFilter %>" />
                  </span>
                  </a>

                  <%
                   } else {
                  %>

                  <!--非公開-->
                  <span class="sc_nolink">
                    <logic:equal name="dayMdl" property="usrKbn" value="0">
                      <logic:equal name="uPeriodMdl" property="userKbn" value="1">
                        <span class="sc_link_g">G</span>
                      </logic:equal>
                    </logic:equal>
                    <logic:notEmpty name="uPeriodMdl" property="time">
                    <font size="-2"><bean:write name="uPeriodMdl" property="time" /><br></font>
                    </logic:notEmpty>
                    <bean:write name="uPeriodMdl" property="title" />
                  </span>

                  <%
                   }
                  %>
              </td>
            </logic:notEmpty>
            <logic:empty name="uPeriodMdl" property="periodMdl">

              <% if ((Integer.valueOf(pIdx) + 1) == (Integer.valueOf(size))) { %>
              <td class="td_type_kikan3"></td>
              <% } else { %>
              <td class="td_type_kikan2"></td>
              <% } %>

            </logic:empty>
          </logic:iterate>
        </tr>
      </logic:notEmpty>
    </logic:iterate>
  </logic:notEmpty>


  <!-- グループと本人の間のボーダー -->
  <logic:equal name="usrMdl" property="usrKbn" value="1">
  <tr><td colspan="8" class="table_sch_bg_type1"><img src="../schedule/images/damy.gif" width="1" height="3" alt="<gsmsg:write key="cmn.space" />"></td></tr>
  </logic:equal>

  </logic:iterate>