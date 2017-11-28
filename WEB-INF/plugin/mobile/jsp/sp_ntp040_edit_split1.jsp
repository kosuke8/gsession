<%@page import="jp.groupsession.v2.usr.UserUtil"%>
<%@page import="jp.groupsession.v2.cmn.model.base.CmnUsrmInfModel"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-jqText.tld" prefix="jquery" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@page import="java.util.List"%>
<bean:define id="dataList " name="mbhNtp040Form" property="ntp040DataModelList"  type="List"/>
<%
   int idx = Integer.parseInt(request.getParameter("mbhNtp040_edit_page_idx"));
   pageContext.setAttribute("dataMdl",  dataList.get(idx));
%>
      <% String selYearIdStr = ""; %>
      <% String selMonthIdStr = ""; %>
      <% String selDayIdStr = ""; %>
      <bean:define id="colormsg1" value=""/>
      <bean:define id="colormsg2" value=""/>
      <bean:define id="colormsg3" value=""/>
      <bean:define id="colormsg4" value=""/>
      <bean:define id="colormsg5" value=""/>
      <logic:iterate id="mstr" name="mbhNtp040Form" property="ntp040ColorMsgList" indexId="mId" type="java.lang.String">

      <logic:equal name="mId" value="0">
      <% colormsg1 = mstr; %>
      </logic:equal>
      <logic:equal name="mId" value="1">
      <% colormsg2 = mstr; %>
      </logic:equal>
      <logic:equal name="mId" value="2">
      <% colormsg3 = mstr; %>
      </logic:equal>
      <logic:equal name="mId" value="3">
      <% colormsg4 = mstr; %>
      </logic:equal>
      <logic:equal name="mId" value="4">
      <% colormsg5 = mstr; %>
      </logic:equal>
      </logic:iterate>

            <bean:define id="datafrhourval" name="dataMdl" property="frHour" />
            <bean:define id="datafrminval" name="dataMdl" property="frMin"/>
            <bean:define id="datatohourval" name="dataMdl" property="toHour"/>
            <bean:define id="datatominval" name="dataMdl" property="toMin"/>


            <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">
            <ul data-role="listview" data-inset="true" data-theme="d" data-dividertheme="c">
            </logic:equal>


            <logic:equal name="mbhNtp040Form" property="cmd" value="edit">
            <font size="-2">■<span class="text_bb1">タイトル</span><span class="titleArea<%= idx + 1 %> text_r2" style="display:none;">※</span></font>
            </logic:equal>

              <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">
              <li>
              <font size="-2">■<span class="text_bb1">タイトル</span><span class="titleArea<%= idx + 1 %> text_r2" style="display:none;">※</span></font>


              <div class="titleArea<%= idx + 1 %>">
                 <span class="dsp_title_<%= idx + 1 %>"><bean:write name="dataMdl" property="title" /></span>
              </div>
              </li>
              </logic:equal>

              <logic:equal name="mbhNtp040Form" property="cmd" value="edit">
              <div class="titleArea<%= idx + 1 %>">

                <input name="ntp040Title" maxlength="100" size="50" value="<bean:write name="dataMdl" property="title" />" id="ntpTitleTextBox" class="text_base" type="text">

              </div>


              <div data-role="navbar" align="center">
                  <ul>
                    <li style="background-color:#0000FF;">
                      <span style="background-color:#0000FF;"><html:radio name="mbhNtp040Form" property="ntp040Bgcolor" value="1" /></span>
                      <label for="bg_color1" class="text_base">&nbsp;&nbsp;</label><br><span style="color:white;"><div class="font_small"><b><%= colormsg1 %></b></div></span>
                    </li>
                    <li style="background-color:#FF0000;">
                      <span style="background-color:#FF0000;"><html:radio name="mbhNtp040Form" property="ntp040Bgcolor" value="2" /></span>
                      <label for="bg_color2" class="text_base">&nbsp;&nbsp;</label><br><span style="color:white;"><div class="font_small"><b><%= colormsg2 %></b></div></span>
                    </li>
                    <li style="background-color:#009900;">
                      <span style="background-color:#009900;"><html:radio name="mbhNtp040Form" property="ntp040Bgcolor" value="3" /></span>
                      <label for="bg_color3" class="text_base">&nbsp;&nbsp;</label><br><span style="color:white;"><div class="font_small"><b><%= colormsg3 %></b></div></span>
                    </li>
                    <li style="background-color:#ff9900;">
                      <span style="background-color:#ff9900;"><html:radio name="mbhNtp040Form" property="ntp040Bgcolor" value="4" /></span>
                      <label for="bg_color4" class="text_base">&nbsp;&nbsp;</label><br><span style="color:white;"><div class="font_small"><b><%= colormsg4 %></b></div></span>
                    </li>
                    <li style="background-color:#333333;">
                      <span style="background-color:#333333;"><html:radio name="mbhNtp040Form" property="ntp040Bgcolor" value="5" /></span>
                      <label for="bg_color5" class="text_base">&nbsp;&nbsp;</label><br><span style="color:white;"><div class="font_small"><b><%= colormsg5 %></b></div></span>
                  </li>
                </ul>
              </div>


              </logic:equal>

              <logic:equal name="mbhNtp040Form" property="cmd" value="edit">


            <br>
            <font size="-2">■<span class="text_bb1"><gsmsg:write key="ntp.35" /></span><span class="ntpTimeArea<%= idx + 1 %> text_r2">※</span></font>
            <br>

             <% selYearIdStr  = "selYear"  + String.valueOf(idx + 1); %>
             <% selMonthIdStr = "selMonth" + String.valueOf(idx + 1); %>
             <% selDayIdStr   = "selDay"   + String.valueOf(idx + 1); %>

             <bean:define id="dataYear" name="dataMdl" property="ntpYear" type="java.lang.Integer"/>
             <bean:define id="dataMonth" name="dataMdl" property="ntpMonth" type="java.lang.Integer"/>
             <bean:define id="dataDay" name="dataMdl" property="ntpDay" type="java.lang.Integer"/>
             <jquery:jqtext id="date" name="mbhNtp040Form" property="ntp040HoukokuDate" readonly="true"/>
             <br>
           </logic:equal>



              <logic:equal name="mbhNtp040Form" property="cmd" value="edit">
            <font size="-2">■<span class="text_bb1">時間</span>

               <span class="ntpTimeArea<%= idx + 1 %> text_r2">※</span></font>

               </logic:equal>


             <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">
              <li>
              <font size="-2">■<span class="text_bb1">時間</span></font>

              <div class="ntpTimeArea<%= idx + 1 %>">

               <span class="dsp_frhour_<%= idx + 1 %>"><bean:write name="dataMdl" property="ntp040DspFrHour" /></span>
               <gsmsg:write key="cmn.hour.input" />
               <span class="dsp_frminute_<%= idx + 1 %>"><bean:write name="dataMdl" property="ntp040DspFrMinute"/></span>
               <gsmsg:write key="cmn.minute.input" />
               ～
               <span class="dsp_tohour_<%= idx + 1 %>"><bean:write name="dataMdl" property="ntp040DspToHour"/></span>
               <gsmsg:write key="cmn.hour.input" />
               <span class="dsp_tominute_<%= idx + 1 %>"><bean:write name="dataMdl" property="ntp040DspToMinute"/></span>
               <gsmsg:write key="cmn.minute.input" />
                 &nbsp;&nbsp;&nbsp;&nbsp;<span id="betWeenDays" class="text_base"></span>

              </div>
              </li>
              </logic:equal>

              <logic:equal name="mbhNtp040Form" property="cmd" value="edit">

              <div class="ntpTimeArea<%= idx + 1 %>">
<div data-role="navbar" align="center">
  <ul>
    <li>
                 <% String ntp040FrHour = "ntp040FrHour_" + (idx + 1); %>
                 <html:select property="ntp040FrHour" value="<%= String.valueOf(datafrhourval) %>" onchange="setToDay();">
                    <html:optionsCollection name="mbhNtp040Form" property="ntp040HourLavel" value="value" label="label" />
                 </html:select>
                 <gsmsg:write key="cmn.hour.input" />
    </li>
    <li>
                 <% String ntp040FrMin = "ntp040FrMin_" + (idx + 1); %>
                 <html:select property="ntp040FrMin" value="<%= String.valueOf(datafrminval) %>" onchange="setToDay();">
                    <html:optionsCollection name="mbhNtp040Form" property="ntp040MinuteLavel" value="value" label="label" />
                 </html:select>
                 <gsmsg:write key="cmn.minute.input" />
   </li>
  </ul>
</div>
                 ～
<div data-role="navbar" align="center">
  <ul>
    <li>
                 <% String ntp040ToHour = "ntp040ToHour_" + (idx + 1); %>
                 <html:select property="ntp040ToHour" value="<%= String.valueOf(datatohourval) %>" onchange="setToDay();">
                    <html:optionsCollection name="mbhNtp040Form" property="ntp040HourLavel" value="value" label="label" />
                 </html:select>
                 <gsmsg:write key="cmn.hour.input" />
    </li>
    <li>
                 <% String ntp040ToMin = "ntp040ToMin_" + (idx + 1); %>
                 <html:select property="ntp040ToMin" value="<%= String.valueOf(datatominval) %>" onchange="setToDay();">
                    <html:optionsCollection name="mbhNtp040Form" property="ntp040MinuteLavel" value="value" label="label" />
                 </html:select>
                 <gsmsg:write key="cmn.minute.input" />
   </li>
  </ul>
</div>
                 <span id="betWeenDays" class="text_base"></span>

              </div>


              </logic:equal>


            <logic:equal name="mbhNtp040Form" property="ntp040AnkenCompanyUse" value="0">

              <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

              <li>

              <font size="-2">■<span class="text_bb1"><gsmsg:write key="ntp.11" /></span><span class="text_r2"></span></font>

                <div class="ankenDataArea<%= idx + 1 %>">

                  <img src="../schedule/images/spacer.gif" width="1px" border="0" height="10px">

                  <logic:notEmpty name="dataMdl" property="ankenSid">
                    <span class="text_anken_code"><gsmsg:write key="ntp.29" />：<span class="anken_code_name_<%= idx + 1 %>"><bean:write name="dataMdl" property="ankenCode" /></span></span><br>
                  </logic:notEmpty>

                  <logic:notEmpty name="dataMdl" property="ankenSid">
                    <span class="text_anken">
                      <a id="<bean:write name="dataMdl" property="ankenSid" />" class="sc_link anken_click">
                        <span class="anken_name_<%= idx + 1 %>"><bean:write name="dataMdl" property="ankenName" /></span>
                      </a>
                    </span>
                  </logic:notEmpty>

                </div>

                </li>

                </logic:equal>

                <logic:equal name="mbhNtp040Form" property="cmd" value="edit">
                <br>
                <font size="-2">■<span class="text_bb1"><gsmsg:write key="ntp.11" /></span><span class="text_r2"></span></font>



                  <input type="submit" class="" value="<gsmsg:write key="ntp.11" /><gsmsg:write key="cmn.search" />" name="ntp040adr" /><br>
                  <img src="../schedule/images/spacer.gif" width="1px" border="0" height="10px">
                  <div id="ntp040AnkenIdArea_<%= idx + 1 %>">
                    <logic:notEmpty name="dataMdl" property="ankenSid">
                      <input name="ntp040AnkenSid" value="<bean:write name="dataMdl" property="ankenSid" />" type="hidden">
                    </logic:notEmpty>
                  </div>
                  <div id="ntp040AnkenCodeArea_<%= idx + 1 %>">
                    <logic:notEmpty name="dataMdl" property="ankenCode">
                      <span class="text_anken_code"><gsmsg:write key="ntp.29" />：<span class="anken_code_name_<%= idx + 1 %>"><bean:write name="dataMdl" property="ankenCode" /></span></span>
                    </logic:notEmpty>
                  </div>
                  <div id="ntp040AnkenNameArea_<%= idx + 1 %>">
                    <logic:notEmpty name="dataMdl" property="ankenName">
                      <span class="text_anken">
                        <a id="<bean:write name="dataMdl" property="ankenSid" />" class="sc_link anken_click">
                          <span class="anken_name_<%= idx + 1 %>"><bean:write name="dataMdl" property="ankenName" /></span>
                        </a>
                      </span>
                      <div align="center">
                      <font size="-2"><input type="submit" name="ntp040ankendel" class="" value="<gsmsg:write key="cmn.delete" />" data-icon="delete" data-inline="true" /></font>
                      </div>
                    </logic:notEmpty>
                  </div>

               </logic:equal>


                <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

                <li>

                <font size="-2">■<span class="text_bb1"><gsmsg:write key="ntp.15" />・<gsmsg:write key="ntp.16" /></span><span class="text_r2"></span></font>

                <div class="kigyouDataArea<%= idx + 1 %>">

                  <img src="../schedule/images/spacer.gif" width="1px" border="0" height="10px">

                    <logic:notEmpty name="dataMdl" property="companySid">
                      <span class="text_anken_code"><gsmsg:write key="address.7" />：<span class="comp_code_name_<%= idx + 1 %>"><bean:write name="dataMdl" property="companyCode" /></span></span><br>
                    </logic:notEmpty>

                    <logic:notEmpty name="dataMdl" property="companySid">
                      <span class="text_company">
                        <a id="<bean:write name="dataMdl" property="companySid" />" class="sc_link comp_click comp_name_link_<%= idx + 1 %>">
                          <span class="comp_name_<%= idx + 1 %>"><bean:write name="dataMdl" property="companyName" />
                            <logic:notEmpty name="dataMdl" property="companySid">
                              <bean:write name="dataMdl" property="companyBaseName" />
                            </logic:notEmpty>
                          </span>
                        </a>
                      </span>
                    </logic:notEmpty>

                 </div>

                 </li>

               </logic:equal>


               <logic:equal name="mbhNtp040Form" property="cmd" value="edit">
               <br>
               <font size="-2">■<span class="text_bb1"><gsmsg:write key="ntp.15" />・<gsmsg:write key="ntp.16" /></span><span class="text_r2"></span></font>

               <div class="kigyouDataArea<%= idx + 1 %>">

               <div data-role="controlgroup" data-type="horizontal" align="center">

                  <input type="submit" class="" value="<gsmsg:write key="addressbook" />" name="ntp040adrbook" data-inline="true" />
                  <input type="submit" class="" value="<gsmsg:write key="ntp.17" />" name="ntp040rireki" data-inline="true" />

               </div>

                  <img src="../schedule/images/spacer.gif" width="1px" border="0" height="10px">
                  <div id="ntp040CompanyIdArea_<%= idx + 1 %>">
                    <logic:notEmpty name="dataMdl" property="companySid">
                      <input name="ntp040CompanySid" value="<bean:write name="dataMdl" property="companySid" />" type="hidden">
                    </logic:notEmpty>
                  </div>
                  <div id="ntp040CompanyBaseIdArea_<%= idx + 1 %>">
                    <logic:notEmpty name="dataMdl" property="companyBaseSid">
                      <input name="ntp040CompanyBaseSid" value="<bean:write name="dataMdl" property="companyBaseSid" />" type="hidden">
                    </logic:notEmpty>
                  </div>
                  <div id="ntp040CompanyCodeArea_<%= idx + 1 %>">
                    <logic:notEmpty name="dataMdl" property="companyCode">
                      <span class="text_anken_code"><gsmsg:write key="address.7" />：<span class="comp_code_name_<%= idx + 1 %>"><bean:write name="dataMdl" property="companyCode" /></span></span>
                    </logic:notEmpty>
                  </div>
                  <div id="ntp040CompNameArea_<%= idx + 1 %>">
                    <logic:notEmpty name="dataMdl" property="companyName">
                      <span class="text_company">
                        <a id="<bean:write name="dataMdl" property="companySid" />" class="sc_link comp_click">
                          <span class="comp_name_<%= idx + 1 %>"><bean:write name="dataMdl" property="companyName" />
                          <logic:notEmpty name="dataMdl" property="companyName">
                            <bean:write name="dataMdl" property="companyBaseName" />
                          </logic:notEmpty>
                          </span>
                        </a>
                        <div align="center">
                        <font size="-2"><input type="submit" name="ntp040compdel" class="" value="<gsmsg:write key="cmn.delete" />" data-icon="delete" data-inline="true" /></font>
                        </div>
                      </span>
                    </logic:notEmpty>
                  </div>
                  <div id="ntp040AddressIdArea_<%= idx + 1 %>">
                  </div>
                  <div id="ntp040AddressNameArea_<%= idx + 1 %>">
                  </div>

                </div>

                </logic:equal>

            </logic:equal>


            <logic:equal name="mbhNtp040Form" property="ntp040AnkenCompanyUse" value="1">



                <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

                <li>
                <span class="text_bb1">■<gsmsg:write key="ntp.11" /></span><span class="text_r2"></span>

                <div class="ankenDataArea<%= idx + 1 %>">

                  <img src="../schedule/images/spacer.gif" width="1px" border="0" height="10px">

                  <logic:notEmpty name="dataMdl" property="ankenSid">
                    <span class="text_anken_code"><gsmsg:write key="ntp.29" />：<span class="anken_code_name_<%= idx + 1 %>"><bean:write name="dataMdl" property="ankenCode" /></span></span><br>
                  </logic:notEmpty>

                  <logic:notEmpty name="dataMdl" property="ankenSid">
                    <span class="text_anken">
                      <a id="<bean:write name="dataMdl" property="ankenSid" />" class="sc_link anken_click">
                        <span class="anken_name_<%= idx + 1 %>"><bean:write name="dataMdl" property="ankenName" /></span>
                      </a>
                    </span>
                  </logic:notEmpty>

                </div>

                </li>

                </logic:equal>

                <logic:equal name="mbhNtp040Form" property="cmd" value="edit">
                <br>
                <span class="text_bb1">■<gsmsg:write key="ntp.11" /></span><span class="text_r2"></span>

                <div class="ankenDataArea<%= idx + 1 %>">

                  <input type="submit" class="" value="<gsmsg:write key="ntp.11" /><gsmsg:write key="cmn.search" />" name="ntp040adr" /><br>
                  <img src="../schedule/images/spacer.gif" width="1px" border="0" height="10px">
                  <div id="ntp040AnkenIdArea_<%= idx + 1 %>">
                    <logic:notEmpty name="dataMdl" property="ankenSid">
                      <input name="ntp040AnkenSid" value="<bean:write name="dataMdl" property="ankenSid" />" type="hidden">
                    </logic:notEmpty>
                  </div>
                  <div id="ntp040AnkenCodeArea_<%= idx + 1 %>">
                    <logic:notEmpty name="dataMdl" property="ankenCode">
                      <span class="text_anken_code"><gsmsg:write key="ntp.29" />：<span class="anken_code_name_<%= idx + 1 %>"><bean:write name="dataMdl" property="ankenCode" /></span></span>
                    </logic:notEmpty>
                  </div>
                  <div id="ntp040AnkenNameArea_<%= idx + 1 %>">
                    <logic:notEmpty name="dataMdl" property="ankenName">
                      <span class="text_anken">
                        <a id="<bean:write name="dataMdl" property="ankenSid" />" class="sc_link anken_click">
                          <span class="anken_name_<%= idx + 1 %>"><bean:write name="dataMdl" property="ankenName" /></span>
                        </a>
                      </span>
                      <div align="center">
                      <font size="-2"><input type="submit" name="ntp040ankendel" class="" value="<gsmsg:write key="cmn.delete" />" data-icon="delete" data-inline="true" /></font>
                      </div>
                    </logic:notEmpty>
                  </div>

                </div>

                </logic:equal>

            </logic:equal>


            <logic:equal name="mbhNtp040Form" property="ntp040AnkenCompanyUse" value="2">

                <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

                <li>

                <span class="text_bb1">■<gsmsg:write key="ntp.15" />・<gsmsg:write key="ntp.16" /></span><span class="text_r2"></span>

                <div class="kigyouDataArea<%= idx + 1 %>">

                  <img src="../schedule/images/spacer.gif" width="1px" border="0" height="10px">

                    <logic:notEmpty name="dataMdl" property="companySid">
                      <span class="text_anken_code"><gsmsg:write key="address.7" />：<span class="comp_code_name_<%= idx + 1 %>"><bean:write name="dataMdl" property="companyCode" /></span></span><br>
                    </logic:notEmpty>

                    <logic:notEmpty name="dataMdl" property="companySid">
                      <span class="text_company">
                        <a id="<bean:write name="dataMdl" property="companySid" />" class="sc_link comp_click comp_name_link_<%= idx + 1 %>">
                          <span class="comp_name_<%= idx + 1 %>"><bean:write name="dataMdl" property="companyName" />
                            <logic:notEmpty name="dataMdl" property="companySid">
                              <bean:write name="dataMdl" property="companyBaseName" />
                            </logic:notEmpty>
                          </span>
                        </a>
                      </span>
                    </logic:notEmpty>

                 </div>

                 </li>

                 </logic:equal>

                 <logic:equal name="mbhNtp040Form" property="cmd" value="edit">
                 <br>
                 <span class="text_bb1">■<gsmsg:write key="ntp.15" />・<gsmsg:write key="ntp.16" /></span><span class="text_r2"></span>


               <div class="kigyouDataArea<%= idx + 1 %>">

               <div data-role="controlgroup" data-type="horizontal" align="center">

                  <input type="submit" class="" value="<gsmsg:write key="addressbook" />" name="ntp040adrbook" data-inline="true" />
                  <input type="submit" class="" value="<gsmsg:write key="ntp.17" />" name="ntp040rireki" data-inline="true" />

               </div>

                  <img src="../schedule/images/spacer.gif" width="1px" border="0" height="10px">
                  <div id="ntp040CompanyIdArea_<%= idx + 1 %>">
                    <logic:notEmpty name="dataMdl" property="companySid">
                      <input name="ntp040CompanySid" value="<bean:write name="dataMdl" property="companySid" />" type="hidden">
                    </logic:notEmpty>
                  </div>
                  <div id="ntp040CompanyBaseIdArea_<%= idx + 1 %>">
                    <logic:notEmpty name="dataMdl" property="companyBaseSid">
                      <input name="ntp040CompanyBaseSid" value="<bean:write name="dataMdl" property="companyBaseSid" />" type="hidden">
                    </logic:notEmpty>
                  </div>
                  <div id="ntp040CompanyCodeArea_<%= idx + 1 %>">
                    <logic:notEmpty name="dataMdl" property="companyCode">
                      <span class="text_anken_code"><gsmsg:write key="address.7" />：<span class="comp_code_name_<%= idx + 1 %>"><bean:write name="dataMdl" property="companyCode" /></span></span>
                    </logic:notEmpty>
                  </div>
                  <div id="ntp040CompNameArea_<%= idx + 1 %>">
                    <logic:notEmpty name="dataMdl" property="companyName">
                      <span class="text_company">
                        <a id="<bean:write name="dataMdl" property="companySid" />" class="sc_link comp_click">
                          <span class="comp_name_<%= idx + 1 %>"><bean:write name="dataMdl" property="companyName" />
                          <logic:notEmpty name="dataMdl" property="companyName">
                            <bean:write name="dataMdl" property="companyBaseName" />
                          </logic:notEmpty>
                          </span>
                        </a>

                        <div align="center">
                        <font size="-2"><input type="submit" name="ntp040compdel" class="" value="<gsmsg:write key="cmn.delete" />" data-icon="delete" data-inline="true" /></font>
                        </div>
                      </span>
                    </logic:notEmpty>
                  </div>
                  <div id="ntp040AddressIdArea_<%= idx + 1 %>">
                  </div>
                  <div id="ntp040AddressNameArea_<%= idx + 1 %>">
                  </div>

                </div>

                </logic:equal>

            </logic:equal>


            <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

            <li>
            <font size="-2">■<span class="text_bb1">内　容<a id="naiyou" name="naiyou"></a></span></font>

              <div class="naiyouArea<%= idx + 1 %>">
                <span class="dsp_naiyou_<%= idx + 1 %>"><bean:write name="dataMdl" property="ntp040DspValueStr" filter="false"/></span>
              </div>

              </li>

            </logic:equal>

