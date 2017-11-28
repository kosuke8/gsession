<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html:html>
<head>
<title>[GroupSession] <gsmsg:write key="tcd.55" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/grouppopup.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../timecard/js/tcd110.js?<%= GSConst.VERSION_PARAM %>"></script>

<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>

</head>

<body class="body_03">
<html:form action="/timecard/tcd110">
<input type="hidden" name="CMD" value="">
<html:hidden property="backScreen" />
<html:hidden property="year" />
<html:hidden property="month" />
<html:hidden property="tcdDspFrom" />

<html:hidden property="usrSid" />
<html:hidden property="sltGroupSid" />

<html:hidden property="tcd110initFlg" />

<logic:notEmpty name="tcd110Form" property="tcd110target">
<logic:iterate id="targetId" name="tcd110Form" property="tcd110target">
<input type="hidden" name="tcd110target" value="<bean:write name="targetId" />">
</logic:iterate>
</logic:notEmpty>


<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>

<!--　BODY -->
<table width="100%" cellpadding="5" cellspacing="0">
<tr>
<td width="100%" align="center">

  <table width="70%" cellpadding="0" cellspacing="0">
  <tr>
  <td align="left">

    <!-- タイトル -->
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
        <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
        <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="tcd.55" /> ]</td>
        <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
      </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-bottom: 10px">
      <tr>
        <td width="50%"></td>
        <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
        <td class="header_glay_bg" width="50%">
          <input type="button" value="<gsmsg:write key="tcd.tcd010.12" />" class="btn_excel_n2" onClick="buttonPush('tcd110_submit');" id="outputBtn1" />
          <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('tcd110_back');"/>
        </td>
        <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
      </tr>
    </table>

    <!-- エラーメッセージ -->
    <logic:messagesPresent message="false">
      <span class="TXT02"><html:errors/></span>
    </logic:messagesPresent>

    <table cellpadding="10" cellspacing="0" border="0" width="100%" class="tl_u2">

    <tr>
      <td width="10%" valign="middle" align="left" class="table_bg_A5B4E1" width="0%" nowrap>
        <span class="text_bb1"><gsmsg:write key="tcd.tcd110.01" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span>
      </td>
      <td valign="middle" align="left" class="td_wt" width="100%">
        <html:select name="tcd110Form" property="tcd110Year" >
          <html:optionsCollection name="tcd110Form" property="tcd110YearLabelList" />
        </html:select>
        <html:select name="tcd110Form" property="tcd110Month" >
          <html:optionsCollection name="tcd110Form" property="tcd110MonthLabelList" />
        </html:select>
      </td>
    </tr>

    <tr>
      <td width="10%" valign="middle" align="left" class="table_bg_A5B4E1" width="0%" nowrap>
        <span class="text_bb1"><gsmsg:write key="tcd.tcd110.04" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span>
      </td>
      <td valign="middle" align="left" class="td_wt" width="100%">
        <html:radio styleId="tcd110OutputFileType_0" name="tcd110Form" property="tcd110OutputFileType" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstTimecard.KINMU_EXCEL) %>" onclick="changeOutputType();" /><span class="text_base"><label for="tcd110OutputFileType_0"><gsmsg:write key="tcd.tcd080.15" /></label></span>&nbsp;
        <html:radio styleId="tcd110OutputFileType_1" name="tcd110Form" property="tcd110OutputFileType" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConstTimecard.KINMU_PDF) %>" onclick="changeOutputType();" /><span class="text_base"><label for="tcd110OutputFileType_1"><gsmsg:write key="tcd.tcd080.14" /></label>&nbsp;</span>
      </td>
    </tr>

    <tr>
      <td width="10%" valign="middle" align="left" class="table_bg_A5B4E1" width="0%" nowrap>
        <span class="text_bb1"><gsmsg:write key="tcd.tcd110.02" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span>
      </td>
      <td valign="middle" align="left" class="td_wt" width="100%">

        <!-- 出力対象ユーザグループ -->
        <table width="100%" border="0">
          <tr>
            <td width="40%" class="td_sub_title3" align="center" nowrap><span class="text_bb1"><gsmsg:write key="tcd.tcd110.03" /></span></td>
            <td width="20%" align="center" style="border: 0px;">&nbsp;</td>

            <!-- グループ選択コンボ -->
            <td width="40%" align="left" style="border: 0px;">
              <input class="btn_group_n1" value="<gsmsg:write key="cmn.sel.all.group" />"
               onclick="return openAllGroup(this.form.tcd110targetGroup, 'tcd110targetGroup', '<bean:write name="tcd110Form" property="tcd110targetGroup" />', '0', 'changeGrp', 'tcd110target', '-1', '1')"
                type="button" /><br>
              <html:select name="tcd110Form" property="tcd110targetGroup" styleClass="select01" onchange="return buttonPush('changeGrp');" style="width: 150px;">
                <logic:notEmpty name="tcd110Form" property="groupCombo">
                  <html:optionsCollection name="tcd110Form" property="groupCombo" value="value" label="label" />
                </logic:notEmpty>
              </html:select>
              <input type="button" onclick="openGroupWindow(this.form.tcd110targetGroup, 'tcd110targetGroup', '0', 'changeGrp')" class="group_btn2" value="&nbsp;&nbsp;" id="tcd110GroupBtn" />
            </td>
          </tr>

          <tr>
            <td align="center">
              <div style="height: 2px;">&nbsp;</div>
              <html:select name="tcd110Form" property="tcd110targetSelect" size="10" multiple="true" styleClass="select01" style="width: 98%;">
                <logic:notEmpty name="tcd110Form" property="tcd110targetSelectCombo">
                  <html:optionsCollection name="tcd110Form" property="tcd110targetSelectCombo" value="value" label="label" />
                </logic:notEmpty>
                <option value="-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
              </html:select>
            </td>

            <td align="center" style="border: 0px;">
              <input type="button" class="btn_base1add" value="<gsmsg:write key="cmn.add"/>" name="adduserBtn" onClick="buttonPush('addTarget');" />
              <br><br>
              <input type="button" class="btn_base1del" value="<gsmsg:write key="cmn.delete" />" name="deluserBtn" onClick="buttonPush('deleteTarget');" />
            </td>

            <td valign="top"  style="border: 0px;">
              <html:select name="tcd110Form" property="tcd110targetNoSelect" size="10" multiple="true" styleClass="select01" style="width: 95%;">
                <logic:notEmpty name="tcd110Form" property="tcd110targetNoSelectCombo">
                  <html:optionsCollection name="tcd110Form" property="tcd110targetNoSelectCombo" value="value" label="label" />
                </logic:notEmpty>
                <option value="-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
              </html:select>
            </td>
          </tr>

        </table>
      </td>

    </tr>

    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table width="100%">
      <tr>
        <td width="100%" align="right" cellpadding="5" cellspacing="0">
          <input type="button" value="<gsmsg:write key="tcd.tcd010.12" />" class="btn_excel_n2" onClick="buttonPush('tcd110_submit');" id="outputBtn2" />
          <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('tcd110_back');" />
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
