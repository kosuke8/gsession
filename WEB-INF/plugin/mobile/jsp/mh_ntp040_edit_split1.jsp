<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=Shift_JIS"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>

<bean:define id="dataList " name="mbhNtp040Form" property="ntp040DataModelList"  type="List"/>
<%
   int idx = Integer.parseInt(request.getParameter("mbhNtp040_edit_page_idx"));
   pageContext.setAttribute("dataMdl",  dataList.get(idx));
%>
<bean:define id="frhourval" name="mbhNtp040Form" property="ntp040FrHour" type="java.lang.String"/>
<bean:define id="frminval" name="mbhNtp040Form" property="ntp040FrMin" type="java.lang.String"/>
<bean:define id="tohourval" name="mbhNtp040Form" property="ntp040ToHour" type="java.lang.String"/>
<bean:define id="tominval" name="mbhNtp040Form" property="ntp040ToMin" type="java.lang.String"/>

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


            <br>
            ■<span class="text_bb1">タイトル</span><span class="titleArea<%= idx + 1 %> text_r2" style="display:none;">※</span>


              <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">
              <div class="titleArea<%= idx + 1 %>">
                 <span class="dsp_title_<%= idx + 1 %>"><bean:write name="dataMdl" property="title" /></span>
              </div>
              </logic:equal>

              <logic:equal name="mbhNtp040Form" property="cmd" value="edit">
              <div class="titleArea<%= idx + 1 %>">

                <input name="ntp040Title" maxlength="100" size="40" value="<bean:write name="dataMdl" property="title" />" id="ntpTitleTextBox" class="text_base" type="text">

                <br>

                <logic:equal name="dataMdl" property="bgcolor" value="1">
                  <span class="sc_block_color_1"><input name="ntp040Bgcolor" value="1" checked="checked" id="bg_color1_<%= idx + 1 %>" type="radio"></span>
                  <label for="bg_color1_<%= idx + 1 %>" class="text_base"></label><%= colormsg1 %>
                </logic:equal>
                <logic:notEqual name="dataMdl" property="bgcolor" value="1">
                  <span class="sc_block_color_1"><input name="ntp040Bgcolor" value="1" id="bg_color1_<%= idx + 1 %>" type="radio"></span>
                  <label for="bg_color1_<%= idx + 1 %>" class="text_base"></label><%= colormsg1 %>
                </logic:notEqual>

                <logic:equal name="dataMdl" property="bgcolor" value="2">
                  <span class="sc_block_color_2"><input name="ntp040Bgcolor" value="2" checked="checked" id="bg_color2_<%= idx + 1 %>" type="radio"></span>
                  <label for="bg_color2_<%= idx + 1 %>" class="text_base"></label><%= colormsg2 %>
                </logic:equal>
                <logic:notEqual name="dataMdl" property="bgcolor" value="2">
                  <span class="sc_block_color_2"><input name="ntp040Bgcolor" value="2" id="bg_color2_<%= idx + 1 %>" type="radio"></span>
                  <label for="bg_color2_<%= idx + 1 %>" class="text_base"></label><%= colormsg2 %>
                </logic:notEqual>

                <logic:equal name="dataMdl" property="bgcolor" value="3">
                  <span class="sc_block_color_3"><input name="ntp040Bgcolor" value="3" checked="checked" id="bg_color3_<%= idx + 1 %>" type="radio"></span>
                  <label for="bg_color3_<%= idx + 1 %>" class="text_base"></label><%= colormsg3 %>
                </logic:equal>
                <logic:notEqual name="dataMdl" property="bgcolor" value="3">
                  <span class="sc_block_color_3"><input name="ntp040Bgcolor" value="3" id="bg_color3_<%= idx + 1 %>" type="radio"></span>
                  <label for="bg_color3_<%= idx + 1 %>" class="text_base"></label><%= colormsg3 %>
                </logic:notEqual>

                <logic:equal name="dataMdl" property="bgcolor" value="4">
                  <span class="sc_block_color_4"><input name="ntp040Bgcolor" value="4" checked="checked" id="bg_color4_<%= idx + 1 %>" type="radio"></span>
                  <label for="bg_color4_<%= idx + 1 %>" class="text_base"></label><%= colormsg4 %>
                </logic:equal>
                <logic:notEqual name="dataMdl" property="bgcolor" value="4">
                  <span class="sc_block_color_4"><input name="ntp040Bgcolor" value="4" id="bg_color4_<%= idx + 1 %>" type="radio"></span>
                  <label for="bg_color4_<%= idx + 1 %>" class="text_base"></label><%= colormsg4 %>
                </logic:notEqual>

                <logic:equal name="dataMdl" property="bgcolor" value="5">
                  <span class="sc_block_color_5"><input name="ntp040Bgcolor" value="5" checked="checked" id="bg_color5_<%= idx + 1 %>" type="radio"></span>
                  <label for="bg_color5_<%= idx + 1 %>" class="text_base"></label><%= colormsg5 %>
                </logic:equal>
                <logic:notEqual name="dataMdl" property="bgcolor" value="5">
                  <span class="sc_block_color_5"><input name="ntp040Bgcolor" value="5" id="bg_color5_<%= idx + 1 %>" type="radio"></span>
                  <label for="bg_color5_<%= idx + 1 %>" class="text_base"></label><%= colormsg5 %>
                </logic:notEqual>

              </div>
              </logic:equal>

              <logic:equal name="mbhNtp040Form" property="cmd" value="edit">


            <br>
            ■<span class="text_bb1"><gsmsg:write key="ntp.35" /></span><span class="ntpTimeArea<%= idx + 1 %> text_r2">※</span>
            <br>

             <% String selYearIdStr  = "selYear"  + String.valueOf(idx + 1); %>
             <% String selMonthIdStr = "selMonth" + String.valueOf(idx + 1); %>
             <% String selDayIdStr   = "selDay"   + String.valueOf(idx + 1); %>

             <bean:define id="dataYear" name="dataMdl" property="ntpYear" type="java.lang.Integer"/>
             <bean:define id="dataMonth" name="dataMdl" property="ntpMonth" type="java.lang.Integer"/>
             <bean:define id="dataDay" name="dataMdl" property="ntpDay" type="java.lang.Integer"/>

             <select name="ntp040HoukokuYear" id="<%= selYearIdStr.toString() %>">
               <logic:iterate id="yearLv" name="mbhNtp040Form" property="ntp040YearLavel">
                 <logic:equal name="yearLv" property="value" value="<%= dataYear.toString() %>">
                   <option value="<bean:write name="yearLv" property="value" />" selected="selected"><bean:write name="yearLv" property="label" /></option>
                 </logic:equal>
                 <logic:notEqual name="yearLv" property="value" value="<%= dataYear.toString() %>">
                   <option value="<bean:write name="yearLv" property="value" />"><bean:write name="yearLv" property="label" /></option>
                 </logic:notEqual>
               </logic:iterate>
             </select>

             <select name="ntp040HoukokuMonth" id="<%= selMonthIdStr %>">
               <logic:iterate id="monthLv" name="mbhNtp040Form" property="ntp040MonthLavel">
                 <logic:equal name="monthLv" property="value" value="<%= dataMonth.toString() %>">
                   <option value="<bean:write name="monthLv" property="value" />" selected="selected"><bean:write name="monthLv" property="label" /></option>
                 </logic:equal>
                 <logic:notEqual name="monthLv" property="value" value="<%= dataMonth.toString() %>">
                   <option value="<bean:write name="monthLv" property="value" />"><bean:write name="monthLv" property="label" /></option>
                 </logic:notEqual>
               </logic:iterate>
             </select>

             <select name="ntp040HoukokuDay" id="<%= selDayIdStr %>">
               <logic:iterate id="dayLv" name="mbhNtp040Form" property="ntp040DayLavel">
                 <logic:equal name="dayLv" property="value" value="<%= dataDay.toString() %>">
                   <option value="<bean:write name="dayLv" property="value" />" selected="selected"><bean:write name="dayLv" property="label" /></option>
                 </logic:equal>
                 <logic:notEqual name="dayLv" property="value" value="<%= dataDay.toString() %>">
                   <option value="<bean:write name="dayLv" property="value" />"><bean:write name="dayLv" property="label" /></option>
                 </logic:notEqual>
               </logic:iterate>
             </select>

             <br>
           </logic:equal>

           <br>

            ■<span class="text_bb1">時間</span>

               <logic:equal name="mbhNtp040Form" property="cmd" value="edit">

               <span class="ntpTimeArea<%= idx + 1 %> text_r2">※</span>

               </logic:equal>


             <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">


              <div class="ntpTimeArea<%= idx + 1 %>">

               <span class="dsp_frhour_<%= idx + 1 %>"><bean:write name="dataMdl" property="ntp040DspFrHour" /></span>
               <gsmsg:write key="cmn.hour.input" />
               <span class="dsp_frminute_<%= idx + 1 %>"><bean:write name="dataMdl" property="ntp040DspFrMinute"/></span>
               <gsmsg:write key="cmn.minute.input" />
               -
               <span class="dsp_tohour_<%= idx + 1 %>"><bean:write name="dataMdl" property="ntp040DspToHour"/></span>
               <gsmsg:write key="cmn.hour.input" />
               <span class="dsp_tominute_<%= idx + 1 %>"><bean:write name="dataMdl" property="ntp040DspToMinute"/></span>
               <gsmsg:write key="cmn.minute.input" />
                 &nbsp;&nbsp;&nbsp;&nbsp;<span id="betWeenDays" class="text_base"></span>

              </div>

              </logic:equal>

              <logic:equal name="mbhNtp040Form" property="cmd" value="edit">

              <div class="ntpTimeArea<%= idx + 1 %>">

                 <% String ntp040FrHour = "ntp040FrHour_" + (idx + 1); %>
                 <html:select property="ntp040FrHour" value="<%= String.valueOf(datafrhourval) %>" onchange="setToDay();">
                    <html:optionsCollection name="mbhNtp040Form" property="ntp040HourLavel" value="value" label="label" />
                 </html:select>
                 <gsmsg:write key="cmn.hour.input" />
                 <% String ntp040FrMin = "ntp040FrMin_" + (idx + 1); %>
                 <html:select property="ntp040FrMin" value="<%= String.valueOf(datafrminval) %>" onchange="setToDay();">
                    <html:optionsCollection name="mbhNtp040Form" property="ntp040MinuteLavel" value="value" label="label" />
                 </html:select>
                 <gsmsg:write key="cmn.minute.input" />
                 -
                 <% String ntp040ToHour = "ntp040ToHour_" + (idx + 1); %>
             <br><html:select property="ntp040ToHour" value="<%= String.valueOf(datatohourval) %>" onchange="setToDay();">
                    <html:optionsCollection name="mbhNtp040Form" property="ntp040HourLavel" value="value" label="label" />
                 </html:select>
                 <gsmsg:write key="cmn.hour.input" />
                 <% String ntp040ToMin = "ntp040ToMin_" + (idx + 1); %>
                 <html:select property="ntp040ToMin" value="<%= String.valueOf(datatominval) %>" onchange="setToDay();">
                    <html:optionsCollection name="mbhNtp040Form" property="ntp040MinuteLavel" value="value" label="label" />
                 </html:select>
                 <gsmsg:write key="cmn.minute.input" />
                   &nbsp;&nbsp;&nbsp;&nbsp;<span id="betWeenDays" class="text_base"></span>

              </div>


              </logic:equal>

            <br>

            <logic:equal name="mbhNtp040Form" property="ntp040AnkenCompanyUse" value="0">
              ■<span class="text_bb1"><gsmsg:write key="ntp.11" /></span><span class="text_r2"></span>

              <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

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

                </logic:equal>

                <logic:equal name="mbhNtp040Form" property="cmd" value="edit">

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
                      <font size="-2"><input type="submit" name="ntp040ankendel" class="" value="<gsmsg:write key="cmn.delete" />" /></font>
                    </logic:notEmpty>
                  </div>

               </logic:equal>




              ■<span class="text_bb1"><gsmsg:write key="ntp.15" />・<gsmsg:write key="ntp.16" /></span><span class="text_r2"></span>


                <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

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

               </logic:equal>


               <logic:equal name="mbhNtp040Form" property="cmd" value="edit">

               <div class="kigyouDataArea<%= idx + 1 %>">

                  <input type="submit" class="" value="<gsmsg:write key="addressbook" />" name="ntp040adrbook" />
                  <input type="submit" class="" value="<gsmsg:write key="ntp.17" />" name="ntp040rireki" /><br>
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
                        <font size="-2"><input type="submit" name="ntp040compdel" class="" value="<gsmsg:write key="cmn.delete" />" /></font>
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
              <span class="text_bb1"><gsmsg:write key="ntp.11" /></span><span class="text_r2"></span>


                <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

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

                </logic:equal>

                <logic:equal name="mbhNtp040Form" property="cmd" value="edit">

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
                      <font size="-2"><input type="submit" name="ntp040ankendel" class="" value="<gsmsg:write key="cmn.delete" />" /></font>
                    </logic:notEmpty>
                  </div>

                </div>

                </logic:equal>

            </logic:equal>


            <logic:equal name="mbhNtp040Form" property="ntp040AnkenCompanyUse" value="2">
              <span class="text_bb1"><gsmsg:write key="ntp.15" />・<gsmsg:write key="ntp.16" /></span><span class="text_r2"></span>


                <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

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

                 </logic:equal>

                 <logic:equal name="mbhNtp040Form" property="cmd" value="edit">


               <div class="kigyouDataArea<%= idx + 1 %>">

                  <input type="submit" class="" value="<gsmsg:write key="addressbook" />" name="ntp040adrbook" />
                  <input type="submit" class="" value="<gsmsg:write key="ntp.17" />" name="ntp040rireki" /><br>

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
                        <font size="-2"><input type="submit" name="ntp040compdel" class="" value="<gsmsg:write key="cmn.delete" />" /></font>
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
