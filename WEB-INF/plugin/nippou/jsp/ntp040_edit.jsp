<%@page import="jp.groupsession.v2.ntp.ntp040.Ntp040Form"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="jp.groupsession.v2.usr.UserUtil" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ taglib uri="/WEB-INF/ctag-jsmsg.tld" prefix="gsjsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<gsjsmsg:js filename="gsjsmsg.js"/>
<% String tdColor = request.getParameter("tdColor");%>
<% String maxLengthContent = request.getParameter("maxLengthContent"); %>
<% String maxLengthBiko = request.getParameter("maxLengthBiko"); %>

      <html:hidden property="ntp040FrYear" />
      <html:hidden property="ntp040FrMonth" />
      <html:hidden property="ntp040FrDay" />
      <% String selYearIdStr = ""; %>
      <% String selMonthIdStr = ""; %>
      <% String selDayIdStr = ""; %>
      <% String selActionYearIdStr = ""; %>
      <% String selActionMonthIdStr = ""; %>
      <% String selActionDayIdStr = ""; %>
      <% Integer lastRowNumber = 0; %>
      <bean:define id="colormsg1" value=""/>
      <bean:define id="colormsg2" value=""/>
      <bean:define id="colormsg3" value=""/>
      <bean:define id="colormsg4" value=""/>
      <bean:define id="colormsg5" value=""/>
      <logic:iterate id="mstr" name="ntp040Form" property="ntp040ColorMsgList" indexId="mId" type="java.lang.String">
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
      <input type="hidden" id="msgCol1" value="<%= colormsg1 %>" />
      <input type="hidden" id="msgCol2" value="<%= colormsg2 %>" />
      <input type="hidden" id="msgCol3" value="<%= colormsg3 %>" />
      <input type="hidden" id="msgCol4" value="<%= colormsg4 %>" />
      <input type="hidden" id="msgCol5" value="<%= colormsg5 %>" />
      <logic:notEmpty name="ntp040Form" property="ntp040DataModelList">
        <logic:iterate id="dataMdl" name="ntp040Form" property="ntp040DataModelList"  indexId="idx" type="jp.groupsession.v2.ntp.ntp040.model.Ntp040DataModel">
            <% lastRowNumber =  idx + 1; %>
            <bean:define id="datafrhourval" name="dataMdl" property="frHour" />
            <bean:define id="datafrminval" name="dataMdl" property="frMin"/>
            <bean:define id="datatohourval" name="dataMdl" property="toHour"/>
            <bean:define id="datatominval" name="dataMdl" property="toMin"/>
            <tr id="nippou_data_<%= idx + 1 %>">
            <td colspan="6">
            <table width="100%"><tr><td>
            <tr>
            <td colspan="6" height="25px"></td>
            </tr>
            <tr id="<%= idx + 1 %>">
              <td colspan="3" class="nippou_info_bg_left" id="<%= idx + 1 %>" class="tr_nippou">
                <logic:equal name="dataMdl" property="ntp040SelectFlg" value="1">
                <div id="initSelect"></div>
                </logic:equal>
                <div id="pos<%= idx + 1 %>">
                </div>NO,<%= idx + 1 %>
              </td>
              <td id="<bean:write name="dataMdl" property="ntp040NtpSid" />" colspan="2" align="right" class="nippou_info_bg">
              <logic:equal name="dataMdl" property="ankenViewable" value="true">
              <span class="editButtonArea<%= idx + 1 %>">
                <input class="btn_copy_n2" name="ntpCopyBtn" id="<bean:write name="dataMdl" property="ntp040NtpSid" />" value="複写して登録" type="button">
              </span>
              </logic:equal>
              <logic:equal name="ntp040Form" property="authAddEditKbn" value="0">
              <logic:equal name="dataMdl" property="ankenViewable" value="true">
                <span class="editButtonArea<%= idx + 1 %>">
                  <input class="btn_edit_n4" name="ntpEditBtn" id="<%= idx + 1 %>" value="編集" type="button">
                  <input class="close_btn1" id="ntpDellBtn" value="削除" type="button">
                </span>
                <span class="editButtonArea<%= idx + 1 %>" style="display:none;">
                  <input class="btn_edit_n4" id="<%= idx + 1 %>" name="ntpEditKakuteiBtn" value="確定" type="button">
                  <input class="close_btn1" id="<%= idx + 1 %>" name="ntpEditCancelBtn" value="ｷｬﾝｾﾙ" type="button">
                </span>
              </logic:equal>
              </logic:equal>
              </td>
              <td colspan="6" height="25px"></td>
            </tr>
            <tr class="usrInfArea<%= idx + 1 %>">
              <td class="<%= tdColor %>" style="background-color:#fafafa;" colspan="5">
                <table>
                  <tr>
                    <td>
                      <logic:equal name="ntp040Form" property="ntp040UsrBinSid" value="0">
                        <img  class="comment_Img" src="../user/images/photo.gif" name="userImage" alt="<gsmsg:write key="cmn.photo" />" border="1" width="50px" />
                      </logic:equal>
                      <logic:notEqual name="ntp040Form" property="ntp040UsrBinSid" value="0">
                        <logic:equal name="ntp040Form" property="ntp040UsrPctKbn" value="1">
                          <div align="center" class="photo_hikokai2"><span style="color:#fc2929;"><gsmsg:write key="cmn.private" /></span></div>
                        </logic:equal>
                        <logic:notEqual name="ntp040Form" property="ntp040UsrPctKbn" value="1">
                          <img class="comment_Img" src="../common/cmn100.do?CMD=getImageFile&cmn100binSid=<bean:write name="ntp040Form" property="ntp040UsrBinSid" />" alt="<gsmsg:write key="cmn.photo" />" width="50px" />
                        </logic:notEqual>
                      </logic:notEqual>
                    </td>
                    <td style="padding-left:10px;">
                      <bean:define id="ukoFlg" name="ntp040Form" property="ntp040UsrUkoFlg" type="java.lang.Integer"/>
                      <span class="<%= UserUtil.getCSSClassNameNormal(ukoFlg) %>" style="font-size:12px;font-weight:bold;"><bean:write name="ntp040Form" property="ntp040UsrName" /></span>
                      <div>
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
                      <div>
                         <span style="font-weight:bold;" class="dsp_title_<%= idx + 1 %>"><bean:write name="dataMdl" property="title" /></span>
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <jsp:include page="/WEB-INF/plugin/nippou/jsp/ntp040_edit_contents.jsp">
            <jsp:param value="<%= idx %>" name="idx"/>
            </jsp:include>
            </td></tr></table>
            </td>
            </tr>
        </logic:iterate>
      </logic:notEmpty>
      <logic:empty name="ntp040Form" property="ntp040DataModelList">
        <tr id="ntpEmptyArea" class="ntpEmptyArea" align="center">
          <td>
            <span style="font-size:14px;color:#ff0000;font-weight:bold;">該当する日報がありません。</span>
          </td>
        </tr>
      </logic:empty>
      <input type="hidden" id="editLastRowNum" value="<%= lastRowNumber %>" />