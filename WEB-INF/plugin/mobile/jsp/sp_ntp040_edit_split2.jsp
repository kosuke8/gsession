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
      <% String selActionYearIdStr = ""; %>
      <% String selActionMonthIdStr = ""; %>
      <% String selActionDayIdStr = ""; %>

            <logic:equal name="mbhNtp040Form" property="cmd" value="edit">
            <br>
            <font size="-2">■<span class="text_bb1">内　容<a id="naiyou" name="naiyou"></a></span></font>

              <div class="naiyouArea<%= idx + 1 %>">
                <textarea id="inputstr_<%= idx + 1 %>" name="ntp040Value" cols="50" rows="5" onkeyup="showLengthStr(value, 1000, 'inputlength<%= idx + 1 %>');"><bean:write name="dataMdl" property="valueStr" /></textarea>
                <br>
              </div>

            </logic:equal>


            <logic:equal name="mbhNtp040Form" property="ntp040KtBriHhuUse" value="0">




                <bean:define id="ktbunruival" name="dataMdl" property="ktbunruiSid"/>
                <bean:define id="ktbouhouval" name="dataMdl" property="kthouhouSid"/>

                <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

                <li>
                <font size="-2">■<span class="text_bb1"><gsmsg:write key="ntp.3" />/<gsmsg:write key="ntp.31" /></span></font>

                <div class="ktBunruiArea<%= idx + 1 %>">
                 <span class="dsp_ktbunrui_<%= idx + 1 %>"><bean:write name="dataMdl" property="ntp040DspKtbunrui"/></span>&nbsp;
                 <span class="dsp_kthouhou_<%= idx + 1 %>"><bean:write name="dataMdl" property="ntp040DspKthouhou"/></span>
                </div>

                </li>

                </logic:equal>

                <logic:equal name="mbhNtp040Form" property="cmd" value="edit">
                <br>
                <font size="-2">■<span class="text_bb1"><gsmsg:write key="ntp.3" />/<gsmsg:write key="ntp.31" /></span></font>

                 <div class="ktBunruiArea<%= idx + 1 %>">
                   <% String ntp040Ktbunrui = "ntp040Ktbunrui_" + (idx + 1); %>
                   <div data-role="navbar" align="center">
                   <ul>
                   <li>
                   <logic:notEmpty name="mbhNtp040Form" property="ntp040KtbunruiLavel">
                     <html:select property="ntp040Ktbunrui" value="<%= String.valueOf(ktbunruival) %>">
                        <html:optionsCollection name="mbhNtp040Form" property="ntp040KtbunruiLavel" value="value" label="label" />
                     </html:select>
                   </logic:notEmpty>
                    </li>
                    <li>
                   <logic:notEmpty name="mbhNtp040Form" property="ntp040KthouhouLavel">
                     <% String ntp040Kthouhou = "ntp040Kthouhou_" + (idx + 1); %>
                     <html:select property="ntp040Kthouhou" value="<%= String.valueOf(ktbouhouval) %>">
                        <html:optionsCollection name="mbhNtp040Form" property="ntp040KthouhouLavel" value="value" label="label" />
                     </html:select>
                   </logic:notEmpty>
                    </li>
                </ul>
                </div>
                 </div>

                 </logic:equal>

            </logic:equal>


            <logic:equal name="mbhNtp040Form" property="ntp040MikomidoUse" value="0">


                <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

                <li>

                <font size="-2">■<span class="text_bb1"><gsmsg:write key="ntp.32" /></span><span class="text_r2"></span></font>

                <div class="mikomidoArea<%= idx + 1 %>">
                  <span class="text_base">
                    <span class="dsp_mikomido_<%= idx + 1 %>"><bean:write name="dataMdl" property="ntp040DspMikomido"/></span>％
                  </span>
                </div>

                </li>

                </logic:equal>

                <logic:equal name="mbhNtp040Form" property="cmd" value="edit">
                <br>
                <font size="-2">■<span class="text_bb1"><gsmsg:write key="ntp.32" /></span><span class="text_r2"></span></font>

                <div class="mikomidoArea<%= idx + 1 %>">
                <fieldset data-role="controlgroup" data-mini="true">
                  <span class="text_base">
                    <logic:equal name="dataMdl" property="mikomido" value="0">
                      <input name="ntp040Mikomido" value="0" checked="checked" id="ntp040Mikomido0_<%= idx + 1 %>" type="radio"><label style="font-size:10px;" for="ntp040Mikomido0_<%= idx + 1 %>">10%</label>
                    </logic:equal>
                    <logic:notEqual name="dataMdl" property="mikomido" value="0">
                      <input name="ntp040Mikomido" value="0" id="ntp040Mikomido0_<%= idx + 1 %>" type="radio"><label style="font-size:10px;" for="ntp040Mikomido0_<%= idx + 1 %>">10%</label>
                    </logic:notEqual>

                    <logic:equal name="dataMdl" property="mikomido" value="1">
                      <input name="ntp040Mikomido" value="1" checked="checked" id="ntp040Mikomido1_<%= idx + 1 %>" type="radio"><label for="ntp040Mikomido1_<%= idx + 1 %>">30%</label>
                    </logic:equal>
                    <logic:notEqual name="dataMdl" property="mikomido" value="1">
                      <input name="ntp040Mikomido" value="1" id="ntp040Mikomido1_<%= idx + 1 %>" type="radio"><label style="font-size:10px;" for="ntp040Mikomido1_<%= idx + 1 %>">30%</label>
                    </logic:notEqual>

                    <logic:equal name="dataMdl" property="mikomido" value="2">
                      <input name="ntp040Mikomido" value="2" checked="checked" id="ntp040Mikomido2_<%= idx + 1 %>" type="radio"><label for="ntp040Mikomido2_<%= idx + 1 %>">50%</label>
                    </logic:equal>
                    <logic:notEqual name="dataMdl" property="mikomido" value="2">
                      <input name="ntp040Mikomido" value="2" id="ntp040Mikomido2_<%= idx + 1 %>" type="radio"><label style="font-size:10px;" for="ntp040Mikomido2_<%= idx + 1 %>">50%</label>
                    </logic:notEqual>

                    <logic:equal name="dataMdl" property="mikomido" value="3">
                      <input name="ntp040Mikomido" value="3" checked="checked" id="ntp040Mikomido3_<%= idx + 1 %>" type="radio"><label for="ntp040Mikomido3_<%= idx + 1 %>">70%</label>
                    </logic:equal>
                    <logic:notEqual name="dataMdl" property="mikomido" value="3">
                      <input name="ntp040Mikomido" value="3" id="ntp040Mikomido3_<%= idx + 1 %>" type="radio"><label style="font-size:10px;" for="ntp040Mikomido3_<%= idx + 1 %>">70%</label>
                    </logic:notEqual>

                    <logic:equal name="dataMdl" property="mikomido" value="4">
                      <input name="ntp040Mikomido" value="4" checked="checked" id="ntp040Mikomido4_<%= idx + 1 %>" type="radio"><label for="ntp040Mikomido4_<%= idx + 1 %>">100%</label>
                    </logic:equal>
                    <logic:notEqual name="dataMdl" property="mikomido" value="4">
                      <input name="ntp040Mikomido" value="4" id="ntp040Mikomido4_<%= idx + 1 %>" type="radio"><label style="font-size:10px;" for="ntp040Mikomido4_<%= idx + 1 %>">100%</label>
                    </logic:notEqual>

                  </span>
                  </fieldset>
                </div>

                </logic:equal>

            </logic:equal>

<!--       添付ファイル -->
            <logic:equal name="mbhNtp040Form" property="cmd" value="edit">
                <div class="font_small">■<gsmsg:write key="cmn.attach.file"/></div>
                <span id="tmp_file_area">
                  <logic:notEmpty name="mbhNtp040Form" property="ntp040FileLabelList">
                    <logic:iterate id="file" name="mbhNtp040Form" property="ntp040FileLabelList" scope="request">
                       <div style="width:100%;" id="file_<bean:write name="file" property="value" />">
                        <div class="del_file_txt"><bean:write name="file" property="label" /></div>
                        <div id="<bean:write name="file" property="value" />" class="del_file_div">&nbsp;&nbsp;</div>
                      </div>
                      <div style="clear:both;padding-top:10px;"></div>
                    </logic:iterate>
                  </logic:notEmpty>
                </span>

                <div align="center" style="clear:both;">
                  <div id="tmp_button_area" style="display:block;"><input type="button" id="tmp_button" value="添付" data-inline="true" data-role="button" data-icon="grid" data-iconpos="left"/></div>
                </div>
                <br>
            </logic:equal>


            <logic:equal name="mbhNtp040Form" property="ntp040TmpFileUse" value="0">





            <logic:equal name="mbhNtp040Form" property="ntp040NextActionUse" value="0">


              <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

              <li>
              <font size="-2">■<span class="text_bb1"><gsmsg:write key="ntp.96" /><a id="nextAction" name="nextAction"></a></span></font>

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

                </li>

                </logic:equal>

                <logic:equal name="mbhNtp040Form" property="cmd" value="edit">
                <br>
                <font size="-2">■<span class="text_bb1"><gsmsg:write key="ntp.96" /><a id="nextAction" name="nextAction"></a></span></font>

                <div class="nextActionArea<%= idx + 1 %>">

                  <logic:equal name="mbhNtp040Form" property="ntp040ActDateKbn" value="0">
                  <div data-role="controlgroup" data-type="horizontal" align="center" style="font-size:10px;">
                  <input type="submit" name="ntp040actDayAdd" class="" value="<gsmsg:write key="ntp.34" />する" data-inline="true"/>
                  </div>
                  <div id="nxtActDateArea">
                  </logic:equal>

                  <logic:equal name="mbhNtp040Form" property="ntp040ActDateKbn" value="1">
                  <div data-role="controlgroup" data-type="horizontal" align="center" style="font-size:10px;">
                  <input type="submit" name="ntp040actDayNotAdd" class="" value="<gsmsg:write key="ntp.34" />しない" data-inline="true"/>
                  </div>
                  <div id="nxtActDateArea">


                     <% selActionYearIdStr  = "selActionYear"  + String.valueOf(idx + 1); %>
                     <% selActionMonthIdStr = "selActionMonth" + String.valueOf(idx + 1); %>
                     <% selActionDayIdStr   = "selActionDay"   + String.valueOf(idx + 1); %>

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


                   <jquery:jqtext id="date2" name="mbhNtp040Form" property="ntp040ActionDate" readonly="true"/>

                  </logic:equal>

                   </div>

                    <br>

                  </div>

                  <textarea id="actionstr_<%= idx + 1 %>" name="ntp040NextAction" cols="50" rows="2" onkeyup="showLengthStr(value, 1000, 'actionlength<%= idx + 1 %>');"><bean:write name="dataMdl" property="actionStr" /></textarea>


                  </logic:equal>

            </logic:equal>

           <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

            <li>
            <font size="-2">■<span class="text_bb1"><gsmsg:write key="ntp.22" />!</span></font><br>

              <span id="goodBtnArea_<bean:write name="dataMdl" property="ntp040NtpSid" />">
                <logic:equal name="dataMdl" property="ntp040GoodFlg" value="0">
                  <input name="ntp040good" data-icon="plus" data-inline="true" id="<bean:write name="dataMdl" property="ntp040NtpSid" />" style="" class="" value="<gsmsg:write key="ntp.22" />!する" type="submit">
                </logic:equal>
                <logic:notEqual name="dataMdl" property="ntp040GoodFlg" value="0">
                  <span class="text_already_good">いいね!しています</span>
                </logic:notEqual>
              </span>
              <span class="text_good" id="<bean:write name="dataMdl" property="ntp040NtpSid" />">&nbsp;&nbsp;<span id="goodCntArea_<bean:write name="dataMdl" property="ntp040NtpSid" />"><bean:write name="dataMdl" property="ntp040GoodCnt" />件</span>&nbsp;&nbsp;
              </span>
            </li>


            </logic:equal>




              <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

              <logic:notEmpty name="dataMdl" property="ntp040FileList">
              <li>

              <div class="font_small" align="center"><span class="text_bb1"><font size="-2"><gsmsg:write key="cmn.attached" /></font></span></div>

              </li>

                <logic:iterate id="tempMdl" name="dataMdl" property="ntp040FileList">
                <li>
                  <a href="../mobile/sp_ntp040.do?mobileType=1&CMD=fileDownload&ntp010NipSid=<bean:write name="dataMdl" property="ntp040NtpSid" />&ntp040BinSid=<bean:write name="tempMdl" property="binSid"/>"><span class="text_link_min"><bean:write name="tempMdl" property="binFileName"/>
                  <bean:write name="tempMdl" property="binFileSizeDsp" /></span>
                  </a>
                </li>
                </logic:iterate>
              </logic:notEmpty>



                </logic:equal>


            </logic:equal>







            <logic:equal name="mbhNtp040Form" property="cmd" value="kakunin">

           </ul>
            <logic:equal name="dataMdl" property="ankenViewable" value="true">

           <ul data-role="listview" data-inset="true" data-theme="d" data-dividertheme="c">


            <li data-role="list-divider" style="background:#ffffff;">
            <div class="font_small" align="center"><span class="text_bb1">コメント</span></div>
            </li>

            <logic:notEmpty name="dataMdl" property="ntp040CommentList">




                  <logic:iterate id="npcMdl" name="dataMdl" property="ntp040CommentList">

                  <li style="padding-right:3px;">

                    <bean:define id="usrInfMdl" name="npcMdl" property="ntp040UsrInfMdl" type="CmnUsrmInfModel"/>
                    <bean:define id="ntpCmtMdl" name="npcMdl" property="ntp040CommentMdl"/>


                          <span style="font-size:12px;color:#333333;" class="<%=UserUtil.getCSSClassNameNormal(usrInfMdl.getUsrUkoFlg())%>"><b><bean:write name="usrInfMdl" property="usiSei" />&nbsp;<bean:write name="usrInfMdl" property="usiMei" /></b></span>
                          &nbsp;<span style="font-size:12px;color:#333333;"><bean:write name="npcMdl" property="ntp040CommentDate" filter="false"/></span>
                          <br><span style="font-size:13px;color:#333333;"><bean:write name="ntpCmtMdl" property="npcComment" filter="false" /></span>
                          <logic:equal name="npcMdl" property="ntp040CommentDelFlg" value="1">
                          <br><font size="-2"><input name="<%= jp.groupsession.v3.mbh.ntp040.MbhNtp040Form.PARAM_COMMENT_DEL %><bean:write name="ntpCmtMdl" property="npcSid" />" style="" class="" value="<gsmsg:write key="cmn.delete" />" type="submit"  type="submit" data-icon="delete" data-inline="true"></font>
                          </logic:equal>
                  </li>

                  </logic:iterate>







            </logic:notEmpty>



            <li>

              <logic:notEmpty name="mbhNtp040Form" property="ntp040UsrInfMdl">
              <bean:define id="usrInf" name="mbhNtp040Form" property="ntp040UsrInfMdl"/>


                    <div class="textfield">
                      <textarea name="ntp040Comment" cols="50" rows="3" style="height:50px;" id="field_id<%= idx + 1 %>"></textarea>
                    </div>
                    <font size="-2">
                    <input type="submit" name="ntp040AddComment" value="投稿" type="submit" data-icon="plus" data-inline="true"/>
                    </font>

                </li>

              </ul>

              </logic:notEmpty>


            </logic:equal>

           </logic:equal>
