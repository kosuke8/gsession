<%@page import="jp.groupsession.v2.usr.model.UsrLabelValueBean"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ taglib uri="/WEB-INF/ctag-jsmsg.tld" prefix="gsjsmsg" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<%@ page import="jp.groupsession.v2.bbs.GSConstBulletin" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%
    String maxLengthValue = String.valueOf(jp.groupsession.v2.bbs.GSConstBulletin.MAX_LENGTH_THREVALUE);
    String limitNo = String.valueOf(jp.groupsession.v2.bbs.GSConstBulletin.THREAD_LIMIT_NO);
    String limitYes = String.valueOf(jp.groupsession.v2.bbs.GSConstBulletin.THREAD_LIMIT_YES);
%>

<html:html>
<head>
<logic:notEqual name="bbs070Form" property="bbs070cmdMode" value="<%= String.valueOf(GSConstBulletin.BBSCMDMODE_EDIT) %>">
<title>[GroupSession] <gsmsg:write key="bbs.bbs070.1" /></title>
</logic:notEqual>
<logic:equal name="bbs070Form" property="bbs070cmdMode" value="<%= String.valueOf(GSConstBulletin.BBSCMDMODE_EDIT) %>">
<title>[GroupSession] <gsmsg:write key="bbs.bbs070.2" /></title>
</logic:equal>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<gsjsmsg:js filename="gsjsmsg.js"/>
<script language="JavaScript" src="../common/js/cmn110.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/count.js?<%= GSConst.VERSION_PARAM %>"></script>
<script type="text/javascript" src="../common/js/changestyle.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/calendar.js?<%= GSConst.VERSION_PARAM %>"></script>
<script type="text/javascript" src="../common/js/tinymce//tinymce.min.js?<%= GSConst.VERSION_PARAM %>"></script>
<script type="text/javascript" src="../bulletin/js/bbs_tinymce.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../bulletin/js/bbs070.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../bulletin/css/bulletin.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<body class="body_03" onunload="windowClose();calWindowClose();" onload="showLengthId($('input_area_plain')[0], <%= maxLengthValue %>, 'inputlength');">

<html:form action="/bulletin/bbs070">

<input type="hidden" name="CMD" value="">
<html:hidden name="bbs070Form" property="s_key" />
<html:hidden name="bbs070Form" property="tempDirId" />
<html:hidden name="bbs070Form" property="bbs010page1" />
<html:hidden name="bbs070Form" property="bbs010forumSid" />
<html:hidden name="bbs070Form" property="bbs060page1" />
<html:hidden name="bbs070Form" property="threadSid" />
<html:hidden name="bbs070Form" property="searchDspID" />
<html:hidden name="bbs070Form" property="bbs040forumSid" />
<html:hidden name="bbs070Form" property="bbs040keyKbn" />
<html:hidden name="bbs070Form" property="bbs040taisyouThread" />
<html:hidden name="bbs070Form" property="bbs040taisyouNaiyou" />
<html:hidden name="bbs070Form" property="bbs040userName" />
<html:hidden name="bbs070Form" property="bbs040readKbn" />
<html:hidden name="bbs070Form" property="bbs040publicStatusOngoing" />
<html:hidden name="bbs070Form" property="bbs040publicStatusScheduled" />
<html:hidden name="bbs070Form" property="bbs040publicStatusOver" />
<html:hidden name="bbs070Form" property="bbs040dateNoKbn" />
<html:hidden name="bbs070Form" property="bbs040fromYear" />
<html:hidden name="bbs070Form" property="bbs040fromMonth" />
<html:hidden name="bbs070Form" property="bbs040fromDay" />
<html:hidden name="bbs070Form" property="bbs040toYear" />
<html:hidden name="bbs070Form" property="bbs040toMonth" />
<html:hidden name="bbs070Form" property="bbs040toDay" />
<html:hidden name="bbs070Form" property="bbs041page1" />
<html:hidden name="bbs070Form" property="bbs060postPage1" />
<html:hidden name="bbs070Form" property="bbs060postSid" />
<html:hidden name="bbs070Form" property="bbs060postOrderKey" />
<html:hidden name="bbs070Form" property="bbs070limitDisable" />
<html:hidden name="bbs070Form" property="bbs070limitException" />
<html:hidden name="bbs070Form" property="bbs170backForumSid" />
<html:hidden name="bbs070Form" property="bbs170allForumFlg" />

<html:hidden name="bbs070Form" property="bbs070cmdMode" />

<%-- <html:hidden name="bbs070Form" property="bbs170writeSid" /> --%>
<html:hidden name="bbs070Form" property="bbs070BackID" />
<html:hidden name="bbs070Form" property="bbs070valueType" />


<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>
<!-- BODY -->
<table align="center"  cellpadding="5" cellspacing="0" border="0" width="100%">
<tr>
<td width="100%" align="center">

  <table cellpadding="0" cellspacing="0" border="0" width="100%">
  <tr>
  <td>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td width="0%">
        <img src="../bulletin/images/header_bulletin_01.gif" border="0" alt="<gsmsg:write key="cmn.bulletin" />"></td>
        <td width="0%" class="header_white_bg_text" align="right" valign="middle" nowrap><span class="plugin_ttl"><gsmsg:write key="cmn.bulletin" /></span></td>
        <logic:notEqual name="bbs070Form" property="bbs070cmdMode" value="<%= String.valueOf(GSConstBulletin.BBSCMDMODE_EDIT) %>">
        <td width="100%" class="header_white_bg_text">[ <gsmsg:write key="bbs.bbs070.1" /> ]</td>
        </logic:notEqual>
        <logic:equal name="bbs070Form" property="bbs070cmdMode" value="<%= String.valueOf(GSConstBulletin.BBSCMDMODE_EDIT) %>">
        <td width="100%" class="header_white_bg_text">[ <gsmsg:write key="bbs.bbs070.2" /> ]</td>
        </logic:equal>
        <td width="0%">
        <img src="../common/images/header_white_end.gif" border="0" alt="<gsmsg:write key="cmn.bulletin" />"></td>
      </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td width="50%"></td>
        <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
        <td class="header_glay_bg" width="50%">
          <input type="button" value="ＯＫ" class="btn_ok1" onClick="buttonPush('moveThreadConfirm');">
          <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onClick="buttonPush('backList');">
        </td>
        <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
      </tr>
    </table>

    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <logic:messagesPresent message="false">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
         <td align="left"><html:errors/><br></td>
      </tr>
    </table>

    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">

    </logic:messagesPresent>

    <table width="100%" class="tl0" border="0" cellpadding="5">

      <tr>
      <td width="20%" class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.contributor" /></span><span class="text_r3">※</span></td>
      <td width="80%" class="td_type20">
        <logic:equal name="bbs070Form" property="bbs070contributorEditKbn" value="0">
          <logic:iterate id="labelMdl" name="bbs070Form" property="bbs070contributorList">
          <html:hidden name="bbs070Form" property="bbs070contributor" />
          <logic:equal name="bbs070Form" property="bbs070contributorJKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.JTKBN_DELETE) %>" >
            <span class="text_base2"><del><bean:write name="labelMdl" property="label" /></del></span>
          </logic:equal>
          <logic:notEqual name="bbs070Form" property="bbs070contributorJKbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.JTKBN_DELETE) %>" >
            <span class="text_base2"><bean:write name="labelMdl" property="label" /></span>
          </logic:notEqual>
          </logic:iterate>
        </logic:equal>
        <logic:equal name="bbs070Form" property="bbs070contributorEditKbn" value="1">

          <%-- 投稿者項目の設定  --%>
          <html:select property="bbs070contributor">
            <logic:iterate name="bbs070Form" property="bbs070contributorList" id="contributor" type="UsrLabelValueBean">
              <html:option styleClass="<%=contributor.getCSSClassNameOption() %>" value="<%=contributor.getValue() %>"><bean:write name="contributor" property="label"/></html:option>
            </logic:iterate>
          </html:select>

        </logic:equal>

      </td>
      </tr>

      <tr>
      <td width="20%" class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="bbs.3" /></span></td>
      <td width="80%" class="td_type20"><span class="text_base2"><bean:write name="bbs070Form" property="bbs070forumName" /></span></td>
      </tr>

      <tr>
      <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.title" /></span><span class="text_r3">※</span></td>
      <td align="left" class="td_type20" ><html:text name="bbs070Form" property="bbs070title" maxlength="70" style="width:695px;"/></td>
      </tr>

      <!-- 重要度 -->
      <tr>
        <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="project.prj050.4" /></span></td>
        <td align="left" class="td_type20"><span class="text_base2"><html:checkbox name="bbs070Form" styleId="bbs070Importance" property="bbs070Importance" value="1" /><label for="bbs070Importance"><img src="../smail/images/zyuu.gif" alt="<gsmsg:write key="sml.61" />" border="0" class="img_bottom"><gsmsg:write key="sml.61" /></label>&nbsp;</span></td>
      </tr>

      <!-- 本文 -->
      <tr>
        <td class="table_bg_A5B4E1" nowrap>
          <span class="text_bb1"><gsmsg:write key="cmn.content" /></span><span class="text_r3">※</span>
        </td>
        <td align="left" class="td_type20" width="0%">
          <div style="width:100%; text-align:right;"><span id="value_content_type_switch"></span></div>

          <div id="input_area_html">
            <textarea name="bbs070valueHtml" id="inputstr_tinymce">
<bean:write name="bbs070Form" property="bbs070valueHtml"/></textarea>
          </div>

          <textarea name="bbs070value" style="width:100%;" rows="10" id="input_area_plain" onkeyup="showLengthStr(value, <%= maxLengthValue %>, 'inputlength');" >
<bean:write name="bbs070Form" property="bbs070value"/></textarea>

          <div id="plain_text_count"><span class="font_string_count"><gsmsg:write key="cmn.current.characters" />:</span><span id="inputlength" class="font_string_count">0</span>&nbsp;/&nbsp;<span class="font_string_count_max"><%= maxLengthValue %>&nbsp;<gsmsg:write key="cmn.character" /></span></div>
        </td>
      </tr>

      <tr>
      <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.attached" /></span></td>
      <td align="left" class="td_type20">
        <input type="button" class="btn_delete" value="<gsmsg:write key="cmn.delete" />" name="dellBtn" onClick="buttonPush('delTempFile');">
        &nbsp;<input type="button" class="btn_attach" value="<gsmsg:write key="cmn.attached" />" name="attacheBtn" onClick="opnTemp('bbs070files', 'bulletin', '0', '0', '<bean:write name="bbs070Form" property="tempDirId" />');">
        <br>
        <html:select property="bbs070files" styleClass="select01" multiple="true">
          <html:optionsCollection name="bbs070Form" property="bbs070FileLabelList" value="value" label="label" />
        </html:select>
      </td>
      </tr>


      <logic:equal name="bbs070Form" property="bbs070limitDisable" value="<%= String.valueOf(jp.groupsession.v2.bbs.GSConstBulletin.THREAD_ENABLE) %>">
      <tr>
      <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="bbs.12" /></span><span class="text_r3">※</span></td>
      <td align="left" class="td_type20" width="0%">
        <div>
        <html:radio styleId="limit0" name="bbs070Form" property="bbs070limit" value="<%= limitNo %>" /><label for="limit0"><gsmsg:write key="cmn.unlimited" /></label>
        <html:radio styleId="limit1" name="bbs070Form" property="bbs070limit" value="<%= limitYes %>" /><label for="limit1"><gsmsg:write key="bbs.bbs070.4" /></label>
        </div>
        <div id="limit_date_area">
           <table>
           <tr>
           <td>
             <span class="text_bb1"><gsmsg:write key="bbs.bbs070.5" />:</span>
           </td>
           <td>
             <div>
             <html:select property="bbs070limitFrYear">
               <html:optionsCollection name="bbs070Form" property="bbs070FrYearList" value="value" label="label" />
             </html:select>
             <html:select property="bbs070limitFrMonth">
               <html:optionsCollection name="bbs070Form" property="bbs070FrMonthList" value="value" label="label" />
             </html:select>
             <html:select property="bbs070limitFrDay">
               <html:optionsCollection name="bbs070Form" property="bbs070FrDayList" value="value" label="label" />
             </html:select>
             <input type="button" value="Cal" name="limitCalendarBtn" onclick="wrtCalendar(this.form.bbs070limitFrDay, this.form.bbs070limitFrMonth, this.form.bbs070limitFrYear);" class="calendar_btn">
             </div>
             <div>
             <html:select property="bbs070limitFrHour">
               <html:optionsCollection name="bbs070Form" property="bbs070FrHourList" value="value" label="label"/>
             </html:select>
             <html:select property="bbs070limitFrMinute">
               <html:optionsCollection name="bbs070Form" property="bbs070FrMinuteList" value="value" label="label"/>
             </html:select>
           </div>
           </td>
           </tr>
           </table>

           <table>
           <tr>
           <td>
             <span class="text_bb1"><gsmsg:write key="bbs.bbs070.6" />:</span>
           </td>
           <td>
             <div>
             <html:select property="bbs070limitYear">
               <html:optionsCollection name="bbs070Form" property="bbs070yearList" value="value" label="label" />
             </html:select>
             <html:select property="bbs070limitMonth">
               <html:optionsCollection name="bbs070Form" property="bbs070monthList" value="value" label="label" />
             </html:select>
             <html:select property="bbs070limitDay">
               <html:optionsCollection name="bbs070Form" property="bbs070dayList" value="value" label="label" />
             </html:select>
             <input type="button" value="Cal" name="limitCalendarBtn" onclick="wrtCalendar(this.form.bbs070limitDay, this.form.bbs070limitMonth, this.form.bbs070limitYear);" class="calendar_btn">
             <span class="text_base4">※<gsmsg:write key="bbs.bbs070.3" /></span>
             </div>
             <div>
             <html:select property="bbs070limitHour">
               <html:optionsCollection name="bbs070Form" property="bbs070HourList" value="value" label="label"/>
             </html:select>
             <html:select property="bbs070limitMinute">
               <html:optionsCollection name="bbs070Form" property="bbs070MinuteList" value="value" label="label"/>
             </html:select>
             </div>
           </td>
           </tr>
           </table>
        </div>
      </td>
      </tr>
      </logic:equal>

      <logic:notEqual name="bbs070Form" property="bbs070limitDisable" value="<%= String.valueOf(jp.groupsession.v2.bbs.GSConstBulletin.THREAD_ENABLE) %>">
      <logic:equal name="bbs070Form" property="bbs070limitException" value="<%= String.valueOf(jp.groupsession.v2.bbs.GSConstBulletin.THREAD_EXCEPTION) %>">
      <tr>
      <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="bbs.12" /></span><span class="text_r3">※</span></td>
      <td align="left" class="td_type20" width="0%">
        <div>
        <html:radio styleId="limit0" name="bbs070Form" property="bbs070limit" value="<%= limitNo %>" /><label for="limit0"><gsmsg:write key="cmn.unlimited" /></label>
        <html:radio styleId="limit1" name="bbs070Form" property="bbs070limit" value="<%= limitYes %>" /><label for="limit1"><gsmsg:write key="bbs.bbs070.4" /></label>
        </div>
        <div id="limit_date_area">
           <div>
           掲示開始日
           <html:select property="bbs070limitFrYear">
             <html:optionsCollection name="bbs070Form" property="bbs070FrYearList" value="value" label="label" />
           </html:select>
           <html:select property="bbs070limitFrMonth">
             <html:optionsCollection name="bbs070Form" property="bbs070FrMonthList" value="value" label="label" />
           </html:select>
           <html:select property="bbs070limitFrDay">
             <html:optionsCollection name="bbs070Form" property="bbs070FrDayList" value="value" label="label" />
           </html:select>
           <input type="button" value="Cal" name="limitCalendarBtn" onclick="wrtCalendar(this.form.bbs070limitFrDay, this.form.bbs070limitFrMonth, this.form.bbs070limitFrYear);" class="calendar_btn">
           </div>
           <div>
           掲示終了日
           <html:select property="bbs070limitYear">
             <html:optionsCollection name="bbs070Form" property="bbs070yearList" value="value" label="label" />
           </html:select>
           <html:select property="bbs070limitMonth">
             <html:optionsCollection name="bbs070Form" property="bbs070monthList" value="value" label="label" />
           </html:select>
           <html:select property="bbs070limitDay">
             <html:optionsCollection name="bbs070Form" property="bbs070dayList" value="value" label="label" />
           </html:select>
           <input type="button" value="Cal" name="limitCalendarBtn" onclick="wrtCalendar(this.form.bbs070limitDay, this.form.bbs070limitMonth, this.form.bbs070limitYear);" class="calendar_btn">
           <span class="text_base4">※<gsmsg:write key="bbs.bbs070.3" /></span>
           </div>
        </div>
        </td>
        </tr>
        </logic:equal>
        </logic:notEqual>
    </table>

    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table cellpadding="0" cellspacing="0" width="100%">
      <tr>
        <td align="right">
          <input type="button" value="ＯＫ" class="btn_ok1" onClick="buttonPush('moveThreadConfirm');">
          <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onClick="buttonPush('backList');">
        </td>
      </tr>
    </table>

  </td>
  </tr>
  </table>

</td>
</tr>
</table>

</html:form>

<%@ include file="/WEB-INF/plugin/common/jsp/footer001.jsp" %>
</body>
</html:html>
