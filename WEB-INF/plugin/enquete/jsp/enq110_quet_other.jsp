<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ taglib uri="/WEB-INF/ctag-jsmsg.tld" prefix="gsjsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<%@ page import="jp.groupsession.v2.enq.GSConstEnquete" %>
<%@ page import="jp.groupsession.v2.enq.enq110.Enq110Const" %>
<%@ page import="jp.groupsession.v2.enq.enq210.Enq210Form" %>
<%@ page import="jp.groupsession.v2.enq.model.EnqMainListModel"%>
<%@ page import="jp.groupsession.v2.enq.enq110.Enq110Form"%>

<%
   Enq110Form thisForm = (Enq110Form) request.getAttribute("enq110Form");
   int mIdx = Integer.parseInt(request.getParameter("mIdx"));
   EnqMainListModel mainList = thisForm.getEnq110QueList(mIdx);
   pageContext.setAttribute("mainList", mainList);
%>

        <% String[] quePrmName = {"emnSid", "eqmSeq", "eqmDspSec", "eqmQueKbn", "eqmRequire",
                                  "eqmRngStrNum", "eqmRngEndNum", "eqmRngStrDat", "eqmRngEndDat", "eqmQueSec",
                                  "eqsSeq", "eqsDspName", "eqmOther", "eqmUnitNum"}; %>
        <% String[] ansPrmName = {"eqmAnsText", "eqmAnsTextarea", "eqmAnsNum", "eqmSelectAnsYear", "eqmSelectAnsMonth", "eqmSelectAnsDay", "eqmSelOther", "eqmSelRbn", "eqmSelChk"}; %>

        <% String mIndex = String.valueOf(mIdx); %>
        <% String formName = "enq110QueList[" + mIndex + "]."; %>


        <table width="100%" class="tl0 table_ans2" border="0" cellpadding="0" cellspacing="0">
        <tbody>
        <tr>
          <td class="td_type1_enq">
            <div class="text_bg_index" style="padding-left:0; padding-right:0;">
              <table width="100%" cellpadding="5" cellspacing="0" border="0">
                <tr>
                  <td width="1%" class="text_question" align="left" valign="top" nowrap><gsmsg:write key="enq.37" /></td>
                  <td width="60" class="text_question" align="left" valign="top">
                    <logic:equal name="enq110Form" property="enq210queSeqType" value="0">
                      <bean:write name="mainList" property="eqmQueSec" />
                    </logic:equal>
                  </td>
                  <td class="text_question" align="left" valign="top"><bean:write name="mainList" property="eqmQuestion" /></td>
                </tr>
                <tr>
                  <td rowspan="2" colspan="2" class="text_question" align="left" valign="top">
                    <logic:equal name="mainList" property="<%= quePrmName[4] %>" value="<%= String.valueOf(GSConstEnquete.REQUIRE_ON) %>" >
                      <span style="color: red"><gsmsg:write key="enq.28" /></span>
                    </logic:equal>
                  </td>
                  <td align="left" class="text_question" valign="top">
                    <logic:equal name="mainList" property="eqmAttachKbn" value="<%= String.valueOf(GSConstEnquete.TEMP_IMAGE) %>" >
                      <logic:equal name="mainList" property="eqmAttachPos" value="<%= String.valueOf(GSConstEnquete.TEMP_POS_TOP) %>" >
                        <logic:equal name="enq110Form" property="enq110DspMode" value="0">
                          <img src='../enquete/enq110.do?CMD=getImageFile&ansEnqSid=<bean:write name="enq110Form" property="ansEnqSid" />&enq110BinSid=<bean:write name="mainList" property="eqmAttachId" />' name="enqImgName" alt="<gsmsg:write key='cmn.image' />" border="0" class="img_hoge">
                        </logic:equal>
                        <logic:notEqual name="enq110Form" property="enq110DspMode" value="0">
                          <img src='../enquete/enq110.do?CMD=getPreTempFile&enq110BinSid=<bean:write name="mainList" property="eqmAttachId" />&enq110TempDir=<bean:write name="mainList" property="eqmAttachDir" />&enq110PreTempDirKbn=1' name="enqImgName" alt="<gsmsg:write key='cmn.image' />" border="0" class="img_hoge">
                        </logic:notEqual>
                        <table cellpadding="0" border="0">
                          <tr>
                            <td align="left" valign="middle"><img src="../common/images/file_icon.gif" alt="<gsmsg:write key='cmn.file' />"></td>
                            <td class="td_temp_link" align="left" valign="middle">
                              <logic:equal name="enq110Form" property="enq110DspMode" value="0">
                              <a href="javascript:void(0);" onclick="fileLinkClick(<bean:write name='mainList' property='eqmAttachId' />, <bean:write name="enq110Form" property="enq110DspMode" />, 1);">
                              </logic:equal>
                              <logic:notEqual name="enq110Form" property="enq110DspMode" value="0">
                              <a href="javascript:void(0);" onclick="fileLinkClick(<bean:write name='mainList' property='eqmAttachId' />, <bean:write name="enq110Form" property="enq110DspMode" />, <bean:write name="mainList" property="eqmAttachDir" />, 1);">
                              </logic:notEqual>
                                <span class="text_link"><bean:write name="mainList" property="eqmAttachName" /><bean:write name="mainList" property="eqmAttachSize" /></span>
                              </a>
                            </td>
                          </tr>
                        </table>
                      </logic:equal>
                    </logic:equal>
                    <logic:equal name="mainList" property="eqmAttachKbn" value="<%= String.valueOf(GSConstEnquete.TEMP_FILE) %>" >
                      <logic:equal name="mainList" property="eqmAttachPos" value="<%= String.valueOf(GSConstEnquete.TEMP_POS_TOP) %>" >
                        <table cellpadding="0" border="0">
                          <tr>
                            <td align="left" valign="middle"><img src="../common/images/file_icon.gif" alt="<gsmsg:write key='cmn.file' />"></td>
                            <td class="td_temp_link" align="left" valign="middle">
                            <logic:equal name="enq110Form" property="enq110DspMode" value="0">
                            <a href="javascript:void(0);" onclick="fileLinkClick(<bean:write name='mainList' property='eqmAttachId' />, <bean:write name="enq110Form" property="enq110DspMode" />, 1);">
                            </logic:equal>
                            <logic:notEqual name="enq110Form" property="enq110DspMode" value="0">
                            <a href="javascript:void(0);" onclick="fileLinkClick(<bean:write name='mainList' property='eqmAttachId' />, <bean:write name="enq110Form" property="enq110DspMode" />, <bean:write name="mainList" property="eqmAttachDir" />, 1);">
                            </logic:notEqual>
                              <span class="text_link"><bean:write name="mainList" property="eqmAttachName" /><bean:write name="mainList" property="eqmAttachSize" /></span>
                            </a>
                            </td>
                          </tr>
                        </table>
                      </logic:equal>
                    </logic:equal>

                    <bean:write name="mainList" property="eqmDesc" filter="false" />

                    <logic:equal name="mainList" property="eqmAttachKbn" value="<%= String.valueOf(GSConstEnquete.TEMP_IMAGE) %>" >
                      <logic:equal name="mainList" property="eqmAttachPos" value="<%= String.valueOf(GSConstEnquete.TEMP_POS_BOTTOM) %>" >
                        <logic:equal name="enq110Form" property="enq110DspMode" value="0">
                          <img src='../enquete/enq110.do?CMD=getImageFile&ansEnqSid=<bean:write name="enq110Form" property="ansEnqSid" />&enq110BinSid=<bean:write name="mainList" property="eqmAttachId" />' name="enqImgName" alt="<gsmsg:write key='cmn.image' />" border="0" class="img_hoge">
                        </logic:equal>
                        <logic:notEqual name="enq110Form" property="enq110DspMode" value="0">
                          <img src='../enquete/enq110.do?CMD=getPreTempFile&enq110BinSid=<bean:write name="mainList" property="eqmAttachId" />&enq110TempDir=<bean:write name="mainList" property="eqmAttachDir" />&enq110PreTempDirKbn=1' name="enqImgName" alt="<gsmsg:write key='cmn.image' />" border="0" class="img_hoge">
                        </logic:notEqual>
                        <table cellpadding="0" border="0">
                          <tr>
                            <td align="left" valign="middle"><img src="../common/images/file_icon.gif" alt="<gsmsg:write key='cmn.file' />"></td>
                            <td class="td_temp_link" align="left" valign="middle">
                              <logic:equal name="enq110Form" property="enq110DspMode" value="0">
                              <a href="javascript:void(0);" onclick="fileLinkClick(<bean:write name='mainList' property='eqmAttachId' />, <bean:write name="enq110Form" property="enq110DspMode" />, 1);">
                              </logic:equal>
                              <logic:notEqual name="enq110Form" property="enq110DspMode" value="0">
                              <a href="javascript:void(0);" onclick="fileLinkClick(<bean:write name='mainList' property='eqmAttachId' />, <bean:write name="enq110Form" property="enq110DspMode" />, <bean:write name="mainList" property="eqmAttachDir" />, 1);">
                              </logic:notEqual>
                                <span class="text_link"><bean:write name="mainList" property="eqmAttachName" /><bean:write name="mainList" property="eqmAttachSize" /></span>
                              </a>
                            </td>
                          </tr>
                        </table>
                      </logic:equal>
                    </logic:equal>
                    <logic:equal name="mainList" property="eqmAttachKbn" value="<%= String.valueOf(GSConstEnquete.TEMP_FILE) %>" >
                      <logic:equal name="mainList" property="eqmAttachPos" value="<%= String.valueOf(GSConstEnquete.TEMP_POS_BOTTOM) %>" >
                        <table cellpadding="0" border="0">
                          <tr>
                            <td align="left" valign="middle"><img src="../common/images/file_icon.gif" alt="<gsmsg:write key='cmn.file' />"></td>
                            <td class="td_temp_link" align="left" valign="middle">
                              <logic:equal name="enq110Form" property="enq110DspMode" value="0">
                              <a href="javascript:void(0);" onclick="fileLinkClick(<bean:write name='mainList' property='eqmAttachId' />, <bean:write name="enq110Form" property="enq110DspMode" />, 1);">
                              </logic:equal>
                              <logic:notEqual name="enq110Form" property="enq110DspMode" value="0">
                              <a href="javascript:void(0);" onclick="fileLinkClick(<bean:write name='mainList' property='eqmAttachId' />, <bean:write name="enq110Form" property="enq110DspMode" />, <bean:write name="mainList" property="eqmAttachDir" />, 1);">
                              </logic:notEqual>
                                <span class="text_link"><bean:write name="mainList" property="eqmAttachName" /><bean:write name="mainList" property="eqmAttachSize" /></span>
                              </a>
                            </td>
                          </tr>
                        </table>
                      </logic:equal>
                    </logic:equal>
                  </td>
                </tr>

                <logic:equal name="mainList" property="eqmQueKbn" value="<%= String.valueOf(GSConstEnquete.SYURUI_INTEGER) %>" >
                <!-- 数値の最小値、最大値 -->
                <tr>
                  <td colspan="2" class="text_question" align="left" valign="top">
                    <logic:notEmpty name="mainList" property="eqmRngStrNum">
                      <logic:notEmpty name="mainList" property="eqmRngEndNum">
                        <gsmsg:write key="cmn.asterisk" /><bean:write name="mainList" property="<%= quePrmName[5] %>" />&nbsp;～&nbsp;<bean:write name="mainList" property="<%= quePrmName[6] %>" />&nbsp;<gsmsg:write key="enq.65" />
                      </logic:notEmpty>
                    </logic:notEmpty>
                  </td>
                </tr>
                </logic:equal>


                <logic:equal name="mainList" property="eqmQueKbn" value="<%= String.valueOf(GSConstEnquete.SYURUI_DAY) %>" >
                <!-- 日付の最小値、最大値 -->
                <tr>
                  <td colspan="2" class="text_question" align="left" valign="top">
                    <logic:notEmpty name="mainList" property="eqmRngStrDat">
                      <logic:notEmpty name="mainList" property="eqmRngEndDat">
                        <gsmsg:write key="cmn.asterisk" /><bean:write name="mainList" property="<%= quePrmName[7] %>" />&nbsp;～&nbsp;<bean:write name="mainList" property="<%= quePrmName[8] %>" />&nbsp;<gsmsg:write key="enq.65" />
                      </logic:notEmpty>
                    </logic:notEmpty>
                  </td>
                </tr>
                </logic:equal>

              </table>
            </div>
            <div class="text_answer">
              <table width="90%" class="table_answer" cellpadding="5" cellspacing="0" border="0">
                <tr>
                  <td width="10%" align="center" valign="top" nowrap><gsmsg:write key="enq.52" /></td>
                  <td width="80%" align="left" valign="top">

                    <logic:equal name="mainList" property="eqmQueKbn" value="<%= String.valueOf(GSConstEnquete.SYURUI_SINGLE) %>" >
                    <!-- 単一 -->
                      <logic:notEmpty name="mainList" property="eqmSubList">
                        <logic:iterate id="subList" name="mainList" property="eqmSubList" indexId="sIdx" >
                          <% String sIndex = String.valueOf(sIdx); %>
                          <% String sFormName = "eqmSubList[" + sIndex + "]."; %>
                          <% String radio = "radio_" + mIndex + "_" + sIndex; %>
                          <% String eqsSeq = "eqsSeq"; %>

                          <html:hidden property="<%= formName + sFormName + quePrmName[10] %>" />
                          <html:hidden property="<%= formName + sFormName + quePrmName[11] %>" />

                          <logic:notEqual name="subList" property="eqsSeq" value="<%= String.valueOf(GSConstEnquete.CHOICE_KBN_OTHER) %>">
                            <bean:define id="rbnVal" name="subList" property="eqsSeq"/>
                            <% String val = String.valueOf(rbnVal); %>
                            <div class="enqSelLabel">
                              <label for="<%= radio %>" class="enqSelLabel"><span class="text_question2">
                                <html:radio property="<%= formName + ansPrmName[7] %>" value="<%= val %>" styleId="<%= radio %>" styleClass="enqSelLabel"/><bean:write name="subList" property="eqsDspName" />
                              </span></label>
                            </div>
                          </logic:notEqual>
                          <logic:equal name="subList" property="eqsSeq" value="<%= String.valueOf(GSConstEnquete.CHOICE_KBN_OTHER) %>">
                            <br><div class="enqSelLabel">
                              <span class="text_question2">
                                <logic:equal name="mainList" property="eqmOther" value="<%= String.valueOf(GSConstEnquete.OTHER_TEXT) %>">
                                  <html:radio property="<%= formName + ansPrmName[7] %>" value="-1" styleId="<%= radio %>" styleClass="enqSelLabel" /><label for="<%= radio %>" style="vertical-align:top;"><gsmsg:write key="cmn.other" /></label>  <html:text property="<%= formName + ansPrmName[6] %>"  styleClass="ans_text_other" maxlength="<%= String.valueOf(GSConstEnquete.MAX_LEN_EAS_ANS_TEXT) %>" />
                                </logic:equal>
                                <logic:equal name="mainList" property="eqmOther" value="<%= String.valueOf(GSConstEnquete.OTHER_TEXTAREA) %>">
                                  <html:radio property="<%= formName + ansPrmName[7] %>" value="-1" styleId="<%= radio %>" styleClass="enqSelLabel" /><label for="<%= radio %>" style="vertical-align:top;"><gsmsg:write key="cmn.other" /></label>  <html:textarea property="<%= formName + ansPrmName[6] %>" styleClass="ans_textarea_other" />
                                </logic:equal>
                              </span>
                            </div>
                          </logic:equal>

                        </logic:iterate>
                      </logic:notEmpty>
                    </logic:equal>

                    <logic:equal name="mainList" property="eqmQueKbn" value="<%= String.valueOf(GSConstEnquete.SYURUI_MULTIPLE) %>" >
                    <!-- 複数 -->
                      <logic:notEmpty name="mainList" property="eqmSubList">
                        <logic:iterate id="subList" name="mainList" property="eqmSubList" indexId="sIdx" >
                          <% String sIndex = String.valueOf(sIdx); %>
                          <% String sFormName = "eqmSubList[" + sIndex + "]."; %>
                          <% String check = "check_" + mIndex + "_" + sIndex; %>
                          <% String eqsSeq = "eqsSeq"; %>

                          <html:hidden property="<%= formName + sFormName + quePrmName[10] %>" />
                          <html:hidden property="<%= formName + sFormName + quePrmName[11] %>" />

                          <logic:notEqual name="subList" property="eqsSeq" value="<%= String.valueOf(GSConstEnquete.CHOICE_KBN_OTHER) %>">
                            <bean:define id="chkVal" name="subList" property="eqsSeq"/>
                            <% String val = String.valueOf(chkVal); %>
                            <div class="enqSelLabel">
                              <label for="<%= check %>"><span class="text_question2">
                              <html:multibox property="<%= formName + ansPrmName[8] %>" value="<%= val %>" styleId="<%= check %>"/><bean:write name="subList" property="eqsDspName" />
                              </span></label>
                            </div>
                          </logic:notEqual>
                          <logic:equal name="subList" property="eqsSeq" value="<%= String.valueOf(GSConstEnquete.CHOICE_KBN_OTHER) %>">
                            <br><div class="enqSelLabel">
                              <span class="text_question2">
                                <logic:equal name="mainList" property="eqmOther" value="<%= String.valueOf(GSConstEnquete.OTHER_TEXT) %>">
                                  <html:multibox property="<%= formName + ansPrmName[8] %>" value="-1" styleId="<%= check %>" styleClass="enqSelLabel" /><label for="<%= check %>" style="vertical-align:top;"><gsmsg:write key="cmn.other" /></label>  <html:text property="<%= formName + ansPrmName[6] %>" styleClass="ans_text_other" maxlength="<%= String.valueOf(GSConstEnquete.MAX_LEN_EAS_ANS_TEXT) %>" />
                                </logic:equal>
                                <logic:equal name="mainList" property="eqmOther" value="<%= String.valueOf(GSConstEnquete.OTHER_TEXTAREA) %>">
                                  <html:multibox property="<%= formName + ansPrmName[8] %>" value="-1" styleId="<%= check %>" styleClass="enqSelLabel" /><label for="<%= check %>" style="vertical-align:top;"><gsmsg:write key="cmn.other" /></label>  <html:textarea property="<%= formName + ansPrmName[6] %>" styleClass="ans_textarea_other" />
                                </logic:equal>
                              </span>
                            </div>
                          </logic:equal>

                        </logic:iterate>
                      </logic:notEmpty>
                    </logic:equal>

                    <logic:equal name="mainList" property="eqmQueKbn" value="<%= String.valueOf(GSConstEnquete.SYURUI_TEXT) %>" >
                    <!-- テキスト -->
                      <html:text property="<%= formName + ansPrmName[0] %>" maxlength="<%= String.valueOf(GSConstEnquete.MAX_LEN_EAS_ANS_TEXT) %>" styleClass="ans_text" />
                    </logic:equal>

                    <logic:equal name="mainList" property="eqmQueKbn" value="<%= String.valueOf(GSConstEnquete.SYURUI_TEXTAREA) %>" >
                    <!-- 複数行 -->
                      <html:textarea property="<%= formName + ansPrmName[1] %>" styleClass="text_base ans_textarea" />
                    </logic:equal>

                    <logic:equal name="mainList" property="eqmQueKbn" value="<%= String.valueOf(GSConstEnquete.SYURUI_INTEGER) %>" >
                    <!-- 数値 -->
                      <html:text property="<%= formName + ansPrmName[2] %>" maxlength="<%= String.valueOf(GSConstEnquete.MAX_LEN_EAS_ANS_INT) %>" styleClass="ans_text_num" /> <bean:write name="mainList" property="eqmUnitNum" />
                    </logic:equal>
                    <logic:equal name="mainList" property="eqmQueKbn" value="<%= String.valueOf(GSConstEnquete.SYURUI_DAY) %>" >
                    <!-- 日付 -->
                      <% String selYear  = "selYear_"  + String.valueOf(mIdx); %>
                      <% String selMonth = "selMonth_" + String.valueOf(mIdx); %>
                      <% String selDay   = "selDay_"   + String.valueOf(mIdx); %>
                      <% String calBtn   = "calBtn_"   + String.valueOf(mIdx); %>
                      <html:select property="<%= formName + ansPrmName[3] %>" styleId='<%= selYear %>'>
                        <option value="-1"><gsmsg:write key='cmn.notset' /></option>
                        <html:optionsCollection name="enq110Form" property="enq110YearLabel" value="value" label="label" />
                      </html:select>
                      <html:select property="<%= formName + ansPrmName[4] %>" styleId='<%= selMonth %>'>
                        <option value="-1"><gsmsg:write key='cmn.notset' /></option>
                        <html:optionsCollection name="enq110Form" property="enq110MonthLabel" value="value" label="label" />
                      </html:select>
                      <html:select property="<%= formName + ansPrmName[5] %>" styleId='<%= selDay %>'>
                        <option value="-1"><gsmsg:write key='cmn.notset' /></option>
                        <html:optionsCollection name="enq110Form" property="enq110DayLabel" value="value" label="label" />
                      </html:select>
                    </logic:equal>
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
        </tbody>
        </table>
