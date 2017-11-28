<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<%-- 定数値 --%>
<bean:define id="ntpEditMode" name="ntp089Form" property="ntp088editMode" type="java.lang.Integer" />

<%
  int editMode = ntpEditMode.intValue();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html:html>
<head>
<title>[Group Session] <gsmsg:write key="schedule.sch240.01" /></title>
  <meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
  <theme:css filename="theme.css"/>
  <link rel="stylesheet" href="../common/css/default.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
  <link rel="stylesheet" href="../webmail/css/webmail.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
  <script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
  <script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
  <script language="JavaScript" src="../common/js/grouppopup.js?<%= GSConst.VERSION_PARAM %>"></script>

</head>


<html:form action="/nippou/ntp089">
<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>
<input type="hidden" name="CMD" value="">

<html:hidden property="ntp088keyword" />
<html:hidden property="ntp088pageTop" />
<html:hidden property="ntp088pageBottom" />
<html:hidden property="ntp088pageDspFlg" />
<html:hidden property="ntp088svKeyword" />
<html:hidden property="ntp088sortKey" />
<html:hidden property="ntp088order" />
<html:hidden property="ntp088editData" />
<html:hidden property="ntp088searchFlg" />
<html:hidden property="ntp088editMode" />

<html:hidden property="ntp089initFlg" />

<logic:equal name="ntp089Form" property="ntp088editMode" value="0">
  <input type="hidden" name="helpPrm" value="0">
</logic:equal>
<logic:notEqual name="ntp089Form" property="ntp088editMode" value="0">
  <input type="hidden" name="helpPrm" value="1">
</logic:notEqual>

<logic:notEmpty name="ntp089Form" property="ntp089subject">
  <logic:iterate id="subject" name="ntp089Form" property="ntp089subject">
    <input type="hidden" name="ntp089subject" value="<bean:write name="subject"/>">
  </logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="ntp089Form" property="ntp089editUser">
  <logic:iterate id="editUser" name="ntp089Form" property="ntp089editUser">
    <input type="hidden" name="ntp089editUser" value="<bean:write name="editUser"/>">
  </logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="ntp089Form" property="ntp089accessUser">
  <logic:iterate id="accessUser" name="ntp089Form" property="ntp089accessUser">
    <input type="hidden" name="ntp089accessUser" value="<bean:write name="accessUser"/>">
  </logic:iterate>
</logic:notEmpty>



<table align="center"  cellpadding="5" cellspacing="0" border="0" width="100%">
<tr>
<td width="100%" align="center">

  <table cellpadding="0" cellspacing="0" border="0" width="75%">
  <tr>
  <td>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt=""></td>
        <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
        <% if (editMode == 0) { %>
        <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="schedule.sch240.01" /> ]</td>
        <% } else if (editMode == 1) { %>
        <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="schedule.sch240.02" /> ]</td>
        <% } %>
        <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt=""></td>
      </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td width="50%"></td>
        <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
        <td class="header_glay_bg" width="50%">
          <input type="button" value="OK" class="btn_ok1" onClick="buttonPush('confirm');">
          <logic:equal name="ntp089Form" property="ntp088editMode" value="1">
            <input type="button" value="<gsmsg:write key="cmn.delete" />" class="btn_dell_n1" onClick="buttonPush('deleteAccess');">
          </logic:equal>
          <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onClick="buttonPush('ntp089back');">
        </td>
        <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
      </tr>
    </table>

   <logic:messagesPresent message="false">
     <tr>
     <td>
     <table width="100%">
       <tr><td align="left"><html:errors/></td></tr>
     </table>
     </td>
     </tr>
   </logic:messagesPresent>

   <tr>
   <td>
     <span id="errorArea"></span>
     <img src="../common/images/spacer.gif" width="10" height="10" border="0" alt="">
   </td>
   </tr>

  <tr>
  <td>

    <table id="wml_settings" class="tl0" cellpadding="5" cellspacing="0" border="0" width="100%">
      <tr>
        <td class="table_bg_A5B4E1" width="150" nowrap><span class="text_bb1"><gsmsg:write key="schedule.sch240.04" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span></td>
        <td align="left" class="td_wt" width="850">
          <html:text name="ntp089Form" property="ntp089name" maxlength="50" style="width:273px;"/>
        </td>
      </tr>

      <tr>
        <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="schedule.sch240.05" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span></td>
        <td align="left">
          <table width="100%" border="0" padding="0" margin="0">
          <tr>
          <td width="40%" class="td_sub_title3" align="center">
            <span class="text_bb1"><gsmsg:write key="schedule.sch240.06" /></span>
          </td>
          <td width="20%" align="center" style="border: 0px;">&nbsp;</td>

          <td width="40%" align="left" style="border: 0px;">
          <input class="btn_group_n1" value="<gsmsg:write key="cmn.sel.all.group" />" onclick="return openAllGroup(this.form.ntp089subjectGroup, 'ntp089subjectGroup', '<bean:write name="ntp089Form" property="ntp089subjectGroup" />', '0', 'init', 'ntp089subject', '-1', '0');" type="button">
          <html:select name="ntp089Form" property="ntp089subjectGroup" styleClass="select01" onchange="return buttonPush('changeGrp');" style="width: 150px;">
          <logic:notEmpty name="ntp089Form" property="groupCombo">
          <html:optionsCollection name="ntp089Form" property="groupCombo" value="value" label="label" />
          </logic:notEmpty>
          </html:select>
          <input type="button" onclick="openGroupWindow(this.form.ntp089subjectGroup, 'ntp089subjectGroup', '0', 'changeGrp')" class="group_btn2" value="&nbsp;&nbsp;" id="ntp089subjectGroupBtn">
          </td>
          </tr>

          <tr>
          <td align="center">
          <html:select name="ntp089Form" property="ntp089subjectSelect" size="10" multiple="true" styleClass="select01" style="width:220px;">
          <logic:notEmpty name="ntp089Form" property="ntp089subjectSelectCombo">

            <logic:iterate name="ntp089Form" property="ntp089subjectSelectCombo" id="subUser">

              <logic:equal name="subUser" property="usrUkoFlg" value="1">
                <option value='<bean:write name="subUser" property="value"/>' class="mukouser_option">
              </logic:equal>
              <logic:notEqual name="subUser" property="usrUkoFlg" value="1">
                <option value='<bean:write name="subUser" property="value"/>'>
              </logic:notEqual>
              <bean:write name="subUser" property="label"/>

            </logic:iterate>

          </logic:notEmpty>
          </html:select>
          </td>

          <td align="center" style="border: 0px;">
          <input type="button" class="btn_base1add" value="<gsmsg:write key="cmn.add"/>" name="adduserBtn" onClick="buttonPush('addSubject');">
          <br><br>
          <input type="button" class="btn_base1del" value="<gsmsg:write key="cmn.delete" />" name="deluserBtn" onClick="buttonPush('deleteSubject');">
          </td>

          <td valign="top" style="border: 0px;">
          <html:select name="ntp089Form" property="ntp089subjectNoSelect" size="10" multiple="true" styleClass="select01" style="width:220px;">
          <logic:notEmpty name="ntp089Form" property="ntp089subjectNoSelectCombo">

            <logic:iterate name="ntp089Form" property="ntp089subjectNoSelectCombo" id="noSelect">

              <logic:equal name="noSelect" property="usrUkoFlg" value="1">
                <option value='<bean:write name="noSelect" property="value"/>' class="mukouser_option">
              </logic:equal>
              <logic:notEqual name="noSelect" property="usrUkoFlg" value="1">
                <option value='<bean:write name="noSelect" property="value"/>'>
              </logic:notEqual>
              <bean:write name="noSelect" property="label"/>

            </logic:iterate>

          </logic:notEmpty>
          </html:select>
          </td>
          </tr>

          </table>
        </td>
      </tr>

      <tr>
        <td class="table_bg_A5B4E1" rowspan="2" nowrap><span class="text_bb1"><gsmsg:write key="cmn.reading.permit" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span></td>
        <td align="left" class="td_type20">
          <table>
          <tr>
          <td rowspan="2" class="text_bb1" style="border: 0px!important; padding: 0px 5px 0px 0px; margin: 0px;">
          <gsmsg:write key="cmn.post" />:
          </td>
          <td style="border: 0px!important; padding: 0px; margin: 0px;">
          <html:select property="ntp089position">
            <logic:notEmpty name="ntp089Form" property="ntp089positionCombo">
            <html:optionsCollection name="ntp089Form" property="ntp089positionCombo" value="value" label="label" />
            </logic:notEmpty>
          </html:select>
          </td>
          </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td>
          <table width="0%" border="0" padding="0" margin="0"  style="margin-top: 15px;">
          <tr>
          <td width="40%" class="td_sub_title3" align="center"><span class="text_bb1"><gsmsg:write key="cmn.reading" /></span></td>
          <td width="20%" align="center" style="border: 0px;">&nbsp;</td>
          <td width="40%" align="left" style="border: 0px;">
            <input class="btn_group_n1" value="<gsmsg:write key="cmn.sel.all.group" />" onclick="return openAllGroup(this.form.ntp089accessGroup, 'ntp089accessGroup', '<bean:write name="ntp089Form" property="ntp089accessGroup" />', '0', 'init', 'ntp089accessUser', '-1', '1');" type="button">
            <html:select name="ntp089Form" property="ntp089accessGroup" styleClass="select01" onchange="return buttonPush('changeGrp');" style="width: 150px;">
            <logic:notEmpty name="ntp089Form" property="groupCombo">
            <html:optionsCollection name="ntp089Form" property="groupCombo" value="value" label="label" />
            </logic:notEmpty>
            </html:select>
            <input type="button" onclick="openGroupWindow(this.form.ntp089accessGroup, 'ntp089accessGroup', '0', 'changeGrp')" class="group_btn2" value="&nbsp;&nbsp;" id="ntp089GroupBtn">
          </td>
          </tr>

          <tr>
          <td align="center">
            <html:select name="ntp089Form" property="ntp089accessUserSelect" size="10" multiple="true" styleClass="select01" style="width:220px;">
            <logic:notEmpty name="ntp089Form" property="ntp089accessSelectCombo">

            <logic:iterate name="ntp089Form" property="ntp089accessSelectCombo" id="accessSelect">

              <logic:equal name="accessSelect" property="usrUkoFlg" value="1">
                <option value='<bean:write name="accessSelect" property="value"/>' class="mukouser_option">
              </logic:equal>
              <logic:notEqual name="accessSelect" property="usrUkoFlg" value="1">
                <option value='<bean:write name="accessSelect" property="value"/>'>
              </logic:notEqual>
              <bean:write name="accessSelect" property="label"/>

            </logic:iterate>

            </logic:notEmpty>
            </html:select>
          </td>

          <td align="center" style="border: 0px;">
            <input type="button" class="btn_base1add" value="<gsmsg:write key="cmn.add"/>" name="adduserBtn" onClick="buttonPush('addAccessUser');"><br><br>
            <input type="button" class="btn_base1del" value="<gsmsg:write key="cmn.delete" />" name="deluserBtn" onClick="buttonPush('deleteAccessUser');">
          </td>

          <td rowspan="3" align="left" style="border: 0px;">
            <html:select name="ntp089Form" property="ntp089accessUserNoSelect" size="10" multiple="true" styleClass="select01" style="width:220px;">
            <logic:notEmpty name="ntp089Form" property="ntp089accessNoSelectCombo">

            <logic:iterate name="ntp089Form" property="ntp089accessNoSelectCombo" id="editNoSelect">

              <logic:equal name="editNoSelect" property="usrUkoFlg" value="1">
                <option value='<bean:write name="editNoSelect" property="value"/>' class="mukouser_option">
              </logic:equal>
              <logic:notEqual name="editNoSelect" property="usrUkoFlg" value="1">
                <option value='<bean:write name="editNoSelect" property="value"/>'>
              </logic:notEqual>
              <bean:write name="editNoSelect" property="label"/>

            </logic:iterate>

            </logic:notEmpty>
            </html:select>
          </td>
          </tr>

          </table>

        </td>
      </tr>

      <tr>
        <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.memo" /></span></td>
        <td align="left" class="webmail_td1">
          <html:textarea name="ntp089Form" property="ntp089biko"  rows="10" style="width:572px;" />
        </td>
      </tr>

    </table>
  </td>
  </tr>

  <tr>
  <td>
    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0" alt="<gsmsg:write key="cmn.spacer" />">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td width="100%" align="right">
          <input type="button" value="OK" class="btn_ok1" onClick="buttonPush('confirm');">
          <logic:equal name="ntp089Form" property="ntp088editMode" value="1">
            <input type="button" value="<gsmsg:write key="cmn.delete" />" class="btn_dell_n1" onClick="buttonPush('deleteAccess');">
          </logic:equal>
          <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onClick="buttonPush('ntp089back');">
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