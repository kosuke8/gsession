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

      <table cellpadding="5" cellspacing="0" width="100%" class="tl0" align="center">
      <tbody>

        <!-- 基本情報 重要度 -->
        <tr>
          <td width="13%" align="center" class="td_gray text_header" nowrap><gsmsg:write key="enq.24" /></td>
          <td width="25%" class="td_type20" nowrap>
            <logic:equal name="enq110Form" property="enq110PriKbn" value="<%= String.valueOf(GSConstEnquete.JUUYOU_0) %>">
              <img src="../enquete/images/star_blue_16.png" class="star" border="0" alt="<gsmsg:write key='enq.33' />">
              <img src="../enquete/images/star_white_16.png" class="star" border="0" alt="<gsmsg:write key='enq.33' />">
              <img src="../enquete/images/star_white_16.png" class="star" border="0" alt="<gsmsg:write key='enq.33' />">
            </logic:equal>
            <logic:equal name="enq110Form" property="enq110PriKbn" value="<%= String.valueOf(GSConstEnquete.JUUYOU_1) %>">
              <img src="../enquete/images/star_gold_16.png" class="star" border="0" alt="<gsmsg:write key='enq.34' />">
              <img src="../enquete/images/star_gold_16.png" class="star" border="0" alt="<gsmsg:write key='enq.34' />">
              <img src="../enquete/images/star_white_16.png" class="star" border="0" alt="<gsmsg:write key='enq.34' />">
            </logic:equal>
            <logic:equal name="enq110Form" property="enq110PriKbn" value="<%= String.valueOf(GSConstEnquete.JUUYOU_2) %>">
              <img src="../enquete/images/star_red_16.png" class="star" border="0" alt="<gsmsg:write key='enq.35' />">
              <img src="../enquete/images/star_red_16.png" class="star" border="0" alt="<gsmsg:write key='enq.35' />">
              <img src="../enquete/images/star_red_16.png" class="star" border="0" alt="<gsmsg:write key='enq.35' />">
            </logic:equal>
          </td>
          <!-- 基本情報 発信者 -->
          <td width="10%" align="center" class="td_gray text_header" nowrap><gsmsg:write key="enq.25" /></td>
          <td width="52%" class="td_type20" nowrap>
            <bean:define id="sdFlg" name="enq110Form" property="enq110SendNameDelFlg" type="java.lang.Boolean" />
            <bean:define id="ukoFlg" name="enq110Form" property="enq110SendUkoFlg" type="java.lang.Integer"/>
            <span class="text_base2<% if (sdFlg) { %> text_deluser_enq<% } else if (ukoFlg == 1) { %> mukouser<% } %>">
              <logic:notEqual name="enq110Form" property="enq210editMode" value="<%= String.valueOf(Enq210Form.EDITMODE_TEMPLATE) %>" >
                <bean:write name="enq110Form" property="enq110SendName" />
              </logic:notEqual>
            </span>
          </td>
        </tr>

        <!-- 基本情報 アンケート内容 -->
        <tr>
          <td width="10%" align="center" class="td_gray text_header" nowrap><gsmsg:write key="enq.26" /></td>
          <td colspan="3" class="td_type20">
          <span class="text_base2">
            <logic:equal name="enq110Form" property="enq110AttachKbn" value="<%= String.valueOf(GSConstEnquete.TEMP_IMAGE) %>" >
              <logic:equal name="enq110Form" property="enq110AttachPos" value="<%= String.valueOf(GSConstEnquete.TEMP_POS_TOP) %>" >
                <logic:equal name="enq110Form" property="enq110DspMode" value="0">
                  <img src='../enquete/enq110.do?CMD=getImageFile&ansEnqSid=<bean:write name="enq110Form" property="ansEnqSid" />&enq110BinSid=<bean:write name="enq110Form" property="enq110AttachId" />' name="enqImgName" alt="<gsmsg:write key='cmn.image' />" border="0" class="img_hoge"><br>
                </logic:equal>
                <logic:notEqual name="enq110Form" property="enq110DspMode" value="0">
                  <img src='../enquete/enq110.do?CMD=getPreTempFile&enq110BinSid=<bean:write name="enq110Form" property="enq110AttachId" />&enq110PreTempDirKbn=0' name="enqImgName" alt="<gsmsg:write key='cmn.image' />" border="0" class="img_hoge"><br>
                </logic:notEqual>
                <table cellpadding="0" border="0">
                  <tr>
                    <td align="left" valign="middle"><img src="../common/images/file_icon.gif" alt="<gsmsg:write key='cmn.file' />"></td>
                    <td class="td_temp_link" align="left" valign="middle">
                      <a href="javascript:void(0);" onclick="fileLinkClick(<bean:write name='enq110Form' property='enq110AttachId' />, <bean:write name="enq110Form" property="enq110DspMode" />, 0);">
                        <span class="text_link"><bean:write name="enq110Form" property="enq110AttachName" /><bean:write name="enq110Form" property="enq110AttachSize" /></span>
                      </a><br>
                    </td>
                  </tr>
                </table>
              </logic:equal>
            </logic:equal>
            <logic:equal name="enq110Form" property="enq110AttachKbn" value="<%= String.valueOf(GSConstEnquete.TEMP_FILE) %>" >
              <logic:equal name="enq110Form" property="enq110AttachPos" value="<%= String.valueOf(GSConstEnquete.TEMP_POS_TOP) %>" >
                <table cellpadding="0" border="0">
                  <tr>
                    <td align="left" valign="middle"><img src="../common/images/file_icon.gif" alt="<gsmsg:write key='cmn.file' />"></td>
                    <td class="td_temp_link" align="left" valign="middle">
                      <a href="javascript:void(0);" onclick="fileLinkClick(<bean:write name='enq110Form' property='enq110AttachId' />, <bean:write name="enq110Form" property="enq110DspMode" />, 0);">
                        <span class="text_link"><bean:write name="enq110Form" property="enq110AttachName" /><bean:write name="enq110Form" property="enq110AttachSize" /></span>
                      </a><br>
                    </td>
                  </tr>
                </table>
              </logic:equal>
            </logic:equal>

            <bean:write name="enq110Form" property="enq110Desc" filter="false" />

            <logic:equal name="enq110Form" property="enq110AttachKbn" value="<%= String.valueOf(GSConstEnquete.TEMP_IMAGE) %>" >
              <logic:equal name="enq110Form" property="enq110AttachPos" value="<%= String.valueOf(GSConstEnquete.TEMP_POS_BOTTOM) %>" >
                <logic:equal name="enq110Form" property="enq110DspMode" value="0">
                  <img src='../enquete/enq110.do?CMD=getImageFile&ansEnqSid=<bean:write name="enq110Form" property="ansEnqSid" />&enq110BinSid=<bean:write name="enq110Form" property="enq110AttachId" />' name="enqImgName" alt="<gsmsg:write key='cmn.image' />" border="0" class="img_hoge"><br>
                </logic:equal>
                <logic:notEqual name="enq110Form" property="enq110DspMode" value="0">
                  <img src='../enquete/enq110.do?CMD=getPreTempFile&enq110BinSid=<bean:write name="enq110Form" property="enq110AttachId" />&enq110PreTempDirKbn=0' name="enqImgName" alt="<gsmsg:write key='cmn.image' />" border="0" class="img_hoge"><br>
                </logic:notEqual>
                <table cellpadding="0" border="0">
                  <tr>
                    <td align="left" valign="middle"><img src="../common/images/file_icon.gif" alt="<gsmsg:write key='cmn.file' />"></td>
                    <td class="td_temp_link" align="left" valign="middle">
                      <a href="javascript:void(0);" onclick="fileLinkClick(<bean:write name='enq110Form' property='enq110AttachId' />, <bean:write name="enq110Form" property="enq110DspMode" />, 0);">
                        <span class="text_link"><bean:write name="enq110Form" property="enq110AttachName" /><bean:write name="enq110Form" property="enq110AttachSize" /></span>
                      </a><br>
                    </td>
                  </tr>
                </table>
              </logic:equal>
            </logic:equal>
            <logic:equal name="enq110Form" property="enq110AttachKbn" value="<%= String.valueOf(GSConstEnquete.TEMP_FILE) %>" >
              <logic:equal name="enq110Form" property="enq110AttachPos" value="<%= String.valueOf(GSConstEnquete.TEMP_POS_BOTTOM) %>" >
                <table cellpadding="0" border="0">
                  <tr>
                    <td align="left" valign="middle"><img src="../common/images/file_icon.gif" alt="<gsmsg:write key='cmn.file' />"></td>
                    <td class="td_temp_link" align="left" valign="middle">
                      <a href="javascript:void(0);" onclick="fileLinkClick(<bean:write name='enq110Form' property='enq110AttachId' />, <bean:write name="enq110Form" property="enq110DspMode" />, 0);">
                        <span class="text_link"><bean:write name="enq110Form" property="enq110AttachName" /><bean:write name="enq110Form" property="enq110AttachSize" /></span>
                      </a><br>
                    </td>
                  </tr>
                </table>
              </logic:equal>
            </logic:equal>
          </span>
          </td>
        </tr>

        <!-- 基本情報 回答期限 -->
        <logic:notEqual name="enq110Form" property="enq210editMode" value="<%= String.valueOf(Enq210Form.EDITMODE_TEMPLATE) %>" >
        <tr>
          <td width="10%" align="center" class="td_gray text_header" nowrap><gsmsg:write key="enq.19" /></td>
          <td class="td_type20" nowrap>
            <span class="text_base2"><bean:write name="enq110Form" property="enq110ResEnd" /></span>
          </td>
          <!-- 基本情報 結果公開期限 -->
          <td width="10%" align="center" class="td_gray text_header" nowrap><gsmsg:write key="enq.enq210.11" /></td>
          <td class="td_type20" nowrap>
        <bean:define id="ansOpen" name="enq110Form" property="enq110AnsOpen" type="java.lang.Integer" />
        <% if (ansOpen == GSConstEnquete.EMN_ANS_OPEN_PUBLIC) {%>
            <span class="text_base2"><bean:write name="enq110Form" property="enq110AnsPubStr" /></span>
            &nbsp;～&nbsp;
            <logic:empty name="enq110Form" property="enq110OpenEnd">
            <gsmsg:write key="main.man200.9" />
            </logic:empty>
            <logic:notEmpty name="enq110Form" property="enq110OpenEnd">
            <span class="text_base2"><bean:write name="enq110Form" property="enq110OpenEnd" /></span>
            </logic:notEmpty>
          </td>
         <% } else { %>
          <gsmsg:write key="cmn.private" />
         <% } %>
        </tr>
        </logic:notEqual>

        <!-- 基本情報 注意事項 -->
        <tr>
          <td width="10%" align="center" class="td_gray text_header" nowrap><gsmsg:write key="enq.27" /></td>
          <td colspan="3" class="td_type20" nowrap>
            <span class="text_base2">
              <bean:define id="anony" name="enq110Form" property="enq110Anony" type="java.lang.Integer" />
              <bean:define id="ansOpen" name="enq110Form" property="enq110AnsOpen" type="java.lang.Integer" />
              <% if (anony == GSConstEnquete.ANONYMUS_ON && ansOpen == GSConstEnquete.KOUKAI_ON) { %>
                <gsmsg:write key="enq.69" />
              <% } else if (anony == GSConstEnquete.ANONYMUS_ON) { %>
                <gsmsg:write key="enq.31" />
              <% } else if (ansOpen == GSConstEnquete.KOUKAI_ON) { %>
                <gsmsg:write key="enq.32" />
              <% } %>
            </span>
          </td>
        </tr>

      </tbody>
      </table>
