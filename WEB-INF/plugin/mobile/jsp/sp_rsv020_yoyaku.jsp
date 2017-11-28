<%@page import="jp.groupsession.v3.mbh.rsv.MbhRsvYoyakuModel"%>
<%@page import="jp.groupsession.v2.usr.UserUtil"%>
<%@page import="jp.groupsession.v2.usr.GSConstUser"%>
<%@page import="jp.groupsession.v2.rsv.GSConstReserve"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<% jp.groupsession.v2.struts.msg.GsMessage gsMsg = new jp.groupsession.v2.struts.msg.GsMessage(); %>


  <logic:iterate id="sisetu" name="mbhRsv020Form" property="rsv020DaylyList" scope="request" indexId="cnt">

  <logic:notEmpty name="mbhRsv020Form" property="rsv020TimeChartList" scope="request">
  <logic:iterate id="tmcHour" name="mbhRsv020Form" property="rsv020TimeChartList" scope="request">

  <logic:notEmpty name="sisetu" property="rsvWeekList">
    <logic:iterate id="week" name="sisetu" property="rsvWeekList">

      <logic:notEmpty name="week" property="yoyakuDayList">
        <logic:iterate id="day" name="week" property="yoyakuDayList">
           <logic:notEmpty name="day" property="yoyakuList">
            <logic:iterate id="yrk" name="day" property="yoyakuList" indexId="idx">
                <div id="rsv_<bean:write name="sisetu" property="rsdSid" />_<bean:write name="tmcHour" />" style="position:absolute;bottom:0;display:none;z-index:10;display:none;width:100%;height:100%;background:rgba(255, 255, 255, 0.7);">
                  <div class="rsv_popupmenu">
                    <div style="text-align:right;">
                      <a href="#" onclick="popupRsvData('rsv_<bean:write name="sisetu" property="rsdSid" />_<bean:write name="tmcHour" />');" data-role="button" data-icon="delete" data-iconpos="notext">Close</a>
                    </div>

                    <div align="center">
                      <ul style="width:80%;" data-role="listview" data-inset="true" data-theme="d" data-dividertheme="c">

                        <bean:define id="yrDate" name="day" property="yrkDateStr" type="java.lang.String"/>
                        <% if (yrDate.length() >= 8) { %>
                        <%    yrDate = yrDate.substring(0, 4) + gsMsg.getMessage(request, "cmn.year") + yrDate.substring(4, 6) + gsMsg.getMessage(request, "cmn.month") + yrDate.substring(6) + gsMsg.getMessage(request, "cmn.day");%>
                        <% } %>

                        <bean:define id="tmcFr" name="tmcHour" type="java.lang.String"/>
                        <% String tmcString = tmcFr + gsMsg.getMessage(request, "tcd.running.time") + "～" + (Integer.valueOf(tmcFr) + 1) + gsMsg.getMessage(request, "tcd.running.time"); %>

                        <li data-role="list-divider" style="background:#ffffff;">
                          <div class="font_small" align="center"><b><bean:write name="sisetu" property="rsdName" /></b><hr><%= yrDate %>&nbsp;&nbsp;&nbsp;&nbsp;<%= tmcString %></div>
                        </li>

                          <logic:iterate id="yrkTime" name="day" property="yoyakuList" indexId="idx2" type="MbhRsvYoyakuModel">
                            <bean:define id="tmcNm" name="tmcHour" type="java.lang.String" />
                            <bean:define id="frHnm" name="yrkTime" property="rsyFrHour" type="java.lang.Integer" />
                            <bean:define id="toHnm" name="yrkTime" property="rsyToHour" type="java.lang.Integer" />
                            <bean:define id="toMnm" name="yrkTime" property="rsyToMinute" type="java.lang.Integer" />

                            <% boolean dspFlg = false; %>
                            <% if (Integer.valueOf(tmcNm) >= Integer.valueOf(frHnm) && Integer.valueOf(tmcNm) < Integer.valueOf(toHnm)) { %>
                            <%    dspFlg = true; %>
                            <% } else if (Integer.valueOf(tmcNm) == Integer.valueOf(toHnm) && Integer.valueOf(toMnm) > 0) { %>
                            <%    dspFlg = true; %>
                            <% } %>


                            <% if (dspFlg) { %>


                            <bean:define id="s_rsdSid" name="sisetu" property="rsdSid" type="java.lang.Integer" />
                            <bean:define id="s_rsySid" name="yrkTime" property="rsySid" type="java.lang.Integer" />
                            <bean:define id="s_date" name="day" property="yrkDateStr"  type="java.lang.String" />

                            <%-- 公開 --%>
                            <logic:notEqual name="yrkTime" property="public" value="<%= String.valueOf(GSConstReserve.PUBLIC_KBN_PLANS) %>">
                              <logic:notEmpty name="yrkTime" property="rsyNaiyo">
                                <bean:define id="scnaiyou" name="yrkTime" property="rsyNaiyo" />
                                <%
                                  String tmpText = (String)pageContext.getAttribute("scnaiyou",PageContext.PAGE_SCOPE);
                                  String tmpText2 = jp.co.sjts.util.StringUtilHtml.transToHTml(tmpText);
                                %>
                                <li>
                                <a href="#" onclick="return moveSisetuEdit('<bean:write name="yrkTime" property="rsySid" />');" title="<gsmsg:write key="cmn.content" />:<%= tmpText2 %>">
                              </logic:notEmpty>

                              <logic:empty name="yrkTime" property="rsyNaiyo">
                                <li>
                                <a href="#" title="<bean:write name="yrkTime" property="rsyMok" />" onclick="return moveSisetuEdit('<bean:write name="yrkTime" property="rsySid" />');">
                              </logic:empty>
                              <logic:notEmpty name="yrkTime" property="yrkRiyoDateStr">
                                  <div class="font_xsmall">
                                    <span style="color:#ff0000"><bean:write name="yrkTime" property="yrkRiyoDateStr" /></span>
                                  </div>
                              </logic:notEmpty>
                                <span class="font_small" style="color:blue;">
                                  <logic:notEmpty name="yrkTime" property="rsyMok"><bean:write name="yrkTime" property="rsyMok" /></logic:notEmpty>
                                    <logic:notEmpty name="yrkTime" property="rsyMok">
                                      <logic:notEmpty name="yrkTime" property="yrkName">&nbsp;/&nbsp;</logic:notEmpty>
                                    </logic:notEmpty>
                                    <logic:notEmpty name="yrkTime" property="yrkName">
                                      <logic:equal value="<%=String.valueOf(GSConstUser.USER_JTKBN_DELETE) %>" name="yrkTime" property="yrkJkbn"><del><bean:write name="yrkTime" property="yrkName" /></del></logic:equal>
                                      <logic:notEqual value="<%=String.valueOf(GSConstUser.USER_JTKBN_DELETE) %>" name="yrkTime" property="yrkJkbn"><span class="<%=UserUtil.getCSSClassNameNormal(yrkTime.getYrkUkoFlg())%>"><bean:write name="yrkTime" property="yrkName" /></span></logic:notEqual>
                                  </logic:notEmpty>
                                </span>
                              </a>
                            </li>
                          </logic:notEqual>

                          <%-- 予定あり --%>
                          <logic:equal name="yrkTime" property="public" value="<%= String.valueOf(GSConstReserve.PUBLIC_KBN_PLANS) %>">
                            <li>
                              <logic:notEmpty name="yrkTime" property="yrkRiyoDateStr">
                                <div class="font_xsmall">
                                  <span style="color:#ff0000"><bean:write name="yrkTime" property="yrkRiyoDateStr" /></span>
                                </div>
                              </logic:notEmpty>
                              <span class="font_small">
                                <logic:notEmpty name="yrkTime" property="rsyMok"><bean:write name="yrkTime" property="rsyMok" /></logic:notEmpty>
                                <logic:notEmpty name="yrkTime" property="rsyMok">
                                  <logic:notEmpty name="yrkTime" property="yrkName">&nbsp;/&nbsp;</logic:notEmpty>
                                </logic:notEmpty>
                                <logic:notEmpty name="yrkTime" property="yrkName">
                                  <logic:equal value="<%=String.valueOf(GSConstUser.USER_JTKBN_DELETE) %>" name="yrkTime" property="yrkJkbn"><del><bean:write name="yrkTime" property="yrkName" /></del></logic:equal>
                                  <logic:notEqual value="<%=String.valueOf(GSConstUser.USER_JTKBN_DELETE) %>" name="yrkTime" property="yrkJkbn"><span class="<%=UserUtil.getCSSClassNameNormal(yrkTime.getYrkUkoFlg())%>"><bean:write name="yrkTime" property="yrkName" /></span></logic:notEqual>
                                </logic:notEmpty>
                              </span>
                            </li>
                          </logic:equal>
                          <% } %>


                        </logic:iterate>

                      </ul>
                      <logic:equal name="sisetu" property="racAuth" value="1">
                        <a href="#" onclick="moveSisetuAdd2('<bean:write name="day" property="yrkDateStr" />', '<bean:write name="sisetu" property="rsdSid" />', '<bean:write name="tmcHour" />');" data-inline="true" data-role="button" data-icon="plus"><div class="font_small"><gsmsg:write key="cmn.new" /><gsmsg:write key="cmn.entry" /></div></a>
                      </logic:equal>
                    </div>

                  </div>
                </div>

            </logic:iterate>
          </logic:notEmpty>

        </logic:iterate>
      </logic:notEmpty>

    </logic:iterate>
  </logic:notEmpty>

  </logic:iterate>
  </logic:notEmpty>

  </logic:iterate>