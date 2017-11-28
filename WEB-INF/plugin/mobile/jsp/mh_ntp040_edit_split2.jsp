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


            <br>

            ■<span class="text_bb1">内　容<a id="naiyou" name="naiyou"></a></span>

            <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

              <div class="naiyouArea<%= idx + 1 %>">
                <span class="dsp_naiyou_<%= idx + 1 %>"><bean:write name="dataMdl" property="ntp040DspValueStr" filter="false"/></span>
              </div>

            </logic:equal>

            <logic:equal name="mbhNtp040Form" property="cmd" value="edit">

              <div class="naiyouArea<%= idx + 1 %>">
                <textarea id="inputstr_<%= idx + 1 %>" name="ntp040Value" cols="50" rows="5" onkeyup="showLengthStr(value, 1000, 'inputlength<%= idx + 1 %>');"><bean:write name="dataMdl" property="valueStr" /></textarea>
                <br>
              </div>

            </logic:equal>


            <logic:equal name="mbhNtp040Form" property="ntp040KtBriHhuUse" value="0">

              <br>

              ■<span class="text_bb1"><gsmsg:write key="ntp.3" />/<gsmsg:write key="ntp.31" /></span>


                <bean:define id="ktbunruival" name="dataMdl" property="ktbunruiSid"/>
                <bean:define id="ktbouhouval" name="dataMdl" property="kthouhouSid"/>

                <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

                <div class="ktBunruiArea<%= idx + 1 %>">
                 <span class="dsp_ktbunrui_<%= idx + 1 %>"><bean:write name="dataMdl" property="ntp040DspKtbunrui"/></span>&nbsp;
                 <span class="dsp_kthouhou_<%= idx + 1 %>"><bean:write name="dataMdl" property="ntp040DspKthouhou"/></span>
                </div>

                </logic:equal>

                <logic:equal name="mbhNtp040Form" property="cmd" value="edit">

                 <div class="ktBunruiArea<%= idx + 1 %>">
                   <% String ntp040Ktbunrui = "ntp040Ktbunrui_" + (idx + 1); %>
                   <logic:notEmpty name="mbhNtp040Form" property="ntp040KtbunruiLavel">
                     <html:select property="ntp040Ktbunrui" value="<%= String.valueOf(ktbunruival) %>">
                        <html:optionsCollection name="mbhNtp040Form" property="ntp040KtbunruiLavel" value="value" label="label" />
                     </html:select>
                   </logic:notEmpty>

                   <logic:notEmpty name="mbhNtp040Form" property="ntp040KthouhouLavel">
                     <% String ntp040Kthouhou = "ntp040Kthouhou_" + (idx + 1); %>
                     <html:select property="ntp040Kthouhou" value="<%= String.valueOf(ktbouhouval) %>">
                        <html:optionsCollection name="mbhNtp040Form" property="ntp040KthouhouLavel" value="value" label="label" />
                     </html:select>
                   </logic:notEmpty>
                 </div>

                 </logic:equal>

            </logic:equal>


            <logic:equal name="mbhNtp040Form" property="ntp040MikomidoUse" value="0">

              <br>

              ■<span class="text_bb1"><gsmsg:write key="ntp.32" /></span><span class="text_r2"></span>


                <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

                <div class="mikomidoArea<%= idx + 1 %>">
                  <span class="text_base">
                    <span class="dsp_mikomido_<%= idx + 1 %>"><bean:write name="dataMdl" property="ntp040DspMikomido"/></span>％
                  </span>
                </div>

                </logic:equal>

                <logic:equal name="mbhNtp040Form" property="cmd" value="edit">

                <div class="mikomidoArea<%= idx + 1 %>">
                  <span class="text_base">
                    <logic:equal name="dataMdl" property="mikomido" value="0">
                      <input name="ntp040Mikomido" value="0" checked="checked" id="ntp040Mikomido0_<%= idx + 1 %>" type="radio"><label for="ntp040Mikomido0_<%= idx + 1 %>">10%</label>
                    </logic:equal>
                    <logic:notEqual name="dataMdl" property="mikomido" value="0">
                      <input name="ntp040Mikomido" value="0" id="ntp040Mikomido0_<%= idx + 1 %>" type="radio"><label for="ntp040Mikomido0_<%= idx + 1 %>">10%</label>
                    </logic:notEqual>

                    <logic:equal name="dataMdl" property="mikomido" value="1">
                      <input name="ntp040Mikomido" value="1" checked="checked" id="ntp040Mikomido1_<%= idx + 1 %>" type="radio"><label for="ntp040Mikomido1_<%= idx + 1 %>">30%</label>
                    </logic:equal>
                    <logic:notEqual name="dataMdl" property="mikomido" value="1">
                      <input name="ntp040Mikomido" value="1" id="ntp040Mikomido1_<%= idx + 1 %>" type="radio"><label for="ntp040Mikomido1_<%= idx + 1 %>">30%</label>
                    </logic:notEqual>

                    <logic:equal name="dataMdl" property="mikomido" value="2">
                      <input name="ntp040Mikomido" value="2" checked="checked" id="ntp040Mikomido2_<%= idx + 1 %>" type="radio"><label for="ntp040Mikomido2_<%= idx + 1 %>">50%</label>
                    </logic:equal>
                    <logic:notEqual name="dataMdl" property="mikomido" value="2">
                      <input name="ntp040Mikomido" value="2" id="ntp040Mikomido2_<%= idx + 1 %>" type="radio"><label for="ntp040Mikomido2_<%= idx + 1 %>">50%</label>
                    </logic:notEqual>

                    <logic:equal name="dataMdl" property="mikomido" value="3">
                      <input name="ntp040Mikomido" value="3" checked="checked" id="ntp040Mikomido3_<%= idx + 1 %>" type="radio"><label for="ntp040Mikomido3_<%= idx + 1 %>">70%</label>
                    </logic:equal>
                    <logic:notEqual name="dataMdl" property="mikomido" value="3">
                      <input name="ntp040Mikomido" value="3" id="ntp040Mikomido3_<%= idx + 1 %>" type="radio"><label for="ntp040Mikomido3_<%= idx + 1 %>">70%</label>
                    </logic:notEqual>

                    <logic:equal name="dataMdl" property="mikomido" value="4">
                      <input name="ntp040Mikomido" value="4" checked="checked" id="ntp040Mikomido4_<%= idx + 1 %>" type="radio"><label for="ntp040Mikomido4_<%= idx + 1 %>">100%</label>
                    </logic:equal>
                    <logic:notEqual name="dataMdl" property="mikomido" value="4">
                      <input name="ntp040Mikomido" value="4" id="ntp040Mikomido4_<%= idx + 1 %>" type="radio"><label for="ntp040Mikomido4_<%= idx + 1 %>">100%</label>
                    </logic:notEqual>

                  </span>
                </div>

                </logic:equal>

            </logic:equal>


            <logic:equal name="mbhNtp040Form" property="ntp040TmpFileUse" value="0">



              <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">
              <br>
              ■<span class="text_bb1"><gsmsg:write key="cmn.attached" /><a id="naiyou" name="naiyou"></a></span>

                <div class="tempFileArea<%= idx + 1 %> dsp_tmp_file_area_<%= idx + 1 %>">
                  <logic:notEmpty name="dataMdl" property="ntp040FileList">
                    <logic:iterate id="tempMdl" name="dataMdl" property="ntp040FileList">
                      <span class="text_link_min"><bean:write name="tempMdl" property="binFileName"/><bean:write name="tempMdl" property="binFileSizeDsp" /></span><br>
                    </logic:iterate>
                  </logic:notEmpty>
                </div>

                </logic:equal>


            </logic:equal>

            <logic:equal name="mbhNtp040Form" property="ntp040NextActionUse" value="0">

              <br>

              ■<span class="text_bb1"><gsmsg:write key="ntp.96" /><a id="nextAction" name="nextAction"></a></span>


              <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

                <div class="nextActionArea<%= idx + 1 %>">

                  <span id="actionSelDateArea_<%= idx + 1 %>" style="color:#000000;font-size:12px;font-weight:bold;">
                    <logic:equal name="dataMdl" property="actDateKbn" value="1">
                      &nbsp;日付：
                      <span class="dsp_actionyear_<%= idx + 1 %>"><bean:write name="dataMdl" property="actionYear"/></span>年
                      <span class="dsp_actionmonth_<%= idx + 1 %>"><bean:write name="dataMdl" property="actionMonth"/></span>月
                      <span class="dsp_actionday_<%= idx + 1 %>"><bean:write name="dataMdl" property="actionDay"/></span>日
                      <br>
                    </logic:equal>
                  </span>

                  <span class="dsp_nextaction_<%= idx + 1 %>"><bean:write name="dataMdl" property="ntp040DspActionStr" filter="false"/></span>
                </div>

                </logic:equal>

                <logic:equal name="mbhNtp040Form" property="cmd" value="edit">

                <div class="nextActionArea<%= idx + 1 %>">



                  <logic:equal name="mbhNtp040Form" property="ntp040ActDateKbn" value="0">
                  <input type="submit" name="ntp040actDayAdd" class="" value="<gsmsg:write key="ntp.34" />する"/>
                  <div id="nxtActDateArea">
                  </logic:equal>

                  <logic:equal name="mbhNtp040Form" property="ntp040ActDateKbn" value="1">
                  <input type="submit" name="ntp040actDayNotAdd" class="" value="<gsmsg:write key="ntp.34" />しない"/>
                  <div id="nxtActDateArea">


                     <% String selActionYearIdStr  = "selActionYear"  + String.valueOf(idx + 1); %>
                     <% String selActionMonthIdStr = "selActionMonth" + String.valueOf(idx + 1); %>
                     <% String selActionDayIdStr   = "selActionDay"   + String.valueOf(idx + 1); %>

                     <bean:define id="dataActionYear" name="dataMdl" property="actionYear" type="java.lang.Integer"/>
                     <bean:define id="dataActionMonth" name="dataMdl" property="actionMonth" type="java.lang.Integer"/>
                     <bean:define id="dataActionDay" name="dataMdl" property="actionDay" type="java.lang.Integer"/>

                     <logic:equal name="dataMdl" property="actDateKbn" value="0">
                       <bean:define id="actionInitYear" name="mbhNtp040Form" property="ntp040InitYear" type="java.lang.String"/>
                       <bean:define id="actionInitMonth" name="mbhNtp040Form" property="ntp040InitMonth" type="java.lang.String"/>
                       <bean:define id="actionInitDay" name="mbhNtp040Form" property="ntp040InitDay" type="java.lang.String"/>
                       <% dataActionYear  =  Integer.parseInt(actionInitYear); %>
                       <% dataActionMonth =  Integer.parseInt(actionInitMonth); %>
                       <% dataActionDay   =  Integer.parseInt(actionInitDay); %>
                     </logic:equal>


                     <select name="ntp040NxtActYear" id="<%= selActionYearIdStr.toString() %>">
                       <logic:iterate id="yearLv" name="mbhNtp040Form" property="ntp040YearLavel">
                         <logic:equal name="yearLv" property="value" value="<%= dataActionYear.toString() %>">
                           <option value="<bean:write name="yearLv" property="value" />" selected="selected"><bean:write name="yearLv" property="label" /></option>
                         </logic:equal>
                         <logic:notEqual name="yearLv" property="value" value="<%= dataActionYear.toString() %>">
                           <option value="<bean:write name="yearLv" property="value" />"><bean:write name="yearLv" property="label" /></option>
                         </logic:notEqual>
                       </logic:iterate>
                     </select>

                     <select name="ntp040NxtActMonth" id="<%= selActionMonthIdStr %>">
                       <logic:iterate id="monthLv" name="mbhNtp040Form" property="ntp040MonthLavel">
                         <logic:equal name="monthLv" property="value" value="<%= dataActionMonth.toString() %>">
                           <option value="<bean:write name="monthLv" property="value" />" selected="selected"><bean:write name="monthLv" property="label" /></option>
                         </logic:equal>
                         <logic:notEqual name="monthLv" property="value" value="<%= dataActionMonth.toString() %>">
                           <option value="<bean:write name="monthLv" property="value" />"><bean:write name="monthLv" property="label" /></option>
                         </logic:notEqual>
                       </logic:iterate>
                     </select>

                     <select name="ntp040NxtActDay" id="<%= selActionDayIdStr %>">
                       <logic:iterate id="dayLv" name="mbhNtp040Form" property="ntp040DayLavel">
                         <logic:equal name="dayLv" property="value" value="<%= dataActionDay.toString() %>">
                           <option value="<bean:write name="dayLv" property="value" />" selected="selected"><bean:write name="dayLv" property="label" /></option>
                         </logic:equal>
                         <logic:notEqual name="dayLv" property="value" value="<%= dataActionDay.toString() %>">
                           <option value="<bean:write name="dayLv" property="value" />"><bean:write name="dayLv" property="label" /></option>
                         </logic:notEqual>
                       </logic:iterate>
                     </select>

                  </div>
                  </logic:equal>



                    <br>

                  </div>

                  <textarea id="actionstr_<%= idx + 1 %>" name="ntp040NextAction" cols="50" rows="2" onkeyup="showLengthStr(value, 1000, 'actionlength<%= idx + 1 %>');"><bean:write name="dataMdl" property="actionStr" /></textarea>
                  <br>
                  </div>

                  </logic:equal>

            </logic:equal>

            <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">
            <br>
            ■<span class="text_bb1"><gsmsg:write key="ntp.22" />!</span><br>


              <span id="goodBtnArea_<bean:write name="dataMdl" property="ntp040NtpSid" />">
                <logic:equal name="dataMdl" property="ntp040GoodFlg" value="0">
                  <input name="ntp040good" id="<bean:write name="dataMdl" property="ntp040NtpSid" />" style="" class="" value="<gsmsg:write key="ntp.22" />!" type="submit">
                </logic:equal>
                <logic:notEqual name="dataMdl" property="ntp040GoodFlg" value="0">
                  <span class="text_already_good">いいね!しています</span>
                </logic:notEqual>
              </span>
              <span class="text_good" id="<bean:write name="dataMdl" property="ntp040NtpSid" />">&nbsp;&nbsp;<span id="goodCntArea_<bean:write name="dataMdl" property="ntp040NtpSid" />"><bean:write name="dataMdl" property="ntp040GoodCnt" /></span>&nbsp;&nbsp;
              </span>

            <br><br>
            <logic:equal name="dataMdl" property="ankenViewable" value="true">
            ■<span class="text_bb1">コメント</span><br>

            <logic:notEmpty name="dataMdl" property="ntp040CommentList">



                  <span class="commentDspArea<%= idx + 1 %>">
                  <logic:iterate id="npcMdl" name="dataMdl" property="ntp040CommentList">
                    <bean:define id="usrInfMdl" name="npcMdl" property="ntp040UsrInfMdl"/>
                    <bean:define id="ntpCmtMdl" name="npcMdl" property="ntp040CommentMdl"/>

                          <span style="font-size:12px;color:#333333;"><b><bean:write name="usrInfMdl" property="usiSei" />&nbsp;<bean:write name="usrInfMdl" property="usiMei" /></b></span>
                          &nbsp;<span style="font-size:12px;color:#333333;"><bean:write name="npcMdl" property="ntp040CommentDate" filter="false"/></span>
                          <logic:equal name="npcMdl" property="ntp040CommentDelFlg" value="1">
                          &nbsp;&nbsp;<input name="<%= jp.groupsession.v3.mbh.ntp040.MbhNtp040Form.PARAM_COMMENT_DEL %><bean:write name="ntpCmtMdl" property="npcSid" />" style="" class="" value="<gsmsg:write key="cmn.delete" />" type="submit">
                          </logic:equal><br><span style="font-size:13px;color:#333333;"><bean:write name="ntpCmtMdl" property="npcComment" filter="false" /></span>

                    <br>

                  </logic:iterate>
                  </span>



            </logic:notEmpty>


              <br>


              <logic:notEmpty name="mbhNtp040Form" property="ntp040UsrInfMdl">
              <bean:define id="usrInf" name="mbhNtp040Form" property="ntp040UsrInfMdl"/>


                    <div class="textfield">
                      <textarea name="ntp040Comment" cols="50" rows="3" style="height:50px;" id="field_id<%= idx + 1 %>"></textarea>
                    </div>
                    <input type="submit" name="ntp040AddComment" value="投稿" />



              </logic:notEmpty>
            </logic:equal>
           </logic:equal>


