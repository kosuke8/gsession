<%@ page import="jp.groupsession.v2.usr.model.UsrLabelValueBean"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>

<%
   String cabUse      = String.valueOf(jp.groupsession.v2.fil.GSConstFile.CABINET_PRIVATE_USE);
   String cabNotUse   = String.valueOf(jp.groupsession.v2.fil.GSConstFile.CABINET_PRIVATE_NOT_USE);
   String cabAuthAll  = String.valueOf(jp.groupsession.v2.fil.GSConstFile.CABINET_AUTH_ALL);
   String cabAuthUser = String.valueOf(jp.groupsession.v2.fil.GSConstFile.CABINET_AUTH_USER);
   String capaKbnOff  = String.valueOf(jp.groupsession.v2.fil.GSConstFile.CAPA_KBN_OFF);
   String capaKbnOn   = String.valueOf(jp.groupsession.v2.fil.GSConstFile.CAPA_KBN_ON);
   String verKbnOn    = String.valueOf(jp.groupsession.v2.fil.GSConstFile.VERSION_KBN_ON);
   String verKbnOff   = String.valueOf(jp.groupsession.v2.fil.GSConstFile.VERSION_KBN_OFF);
%>

<html:html>
<head>
<title>[GroupSession] <gsmsg:write key="cmn.filekanri" />　<gsmsg:write key="cmn.preferences" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/grouppopup.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../file/js/fil290.js?<%= GSConst.VERSION_PARAM %>"></script>

<theme:css filename="theme.css"/>
<link rel=stylesheet href="../common/css/default.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
<link rel=stylesheet href="../file/css/file.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
<link rel=stylesheet href="../file/css/dtree.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
</head>

<body class="body_03" onload="showOrHide();">

<html:form action="/file/fil290">
<input type="hidden" name="CMD" value="">
<html:hidden property="backDsp" />
<html:hidden property="backScreen" />
<html:hidden property="filSearchWd" />
<html:hidden property="fil010SelectCabinet" />
<html:hidden property="fil010SelectDirSid" />
<html:hidden property="fil040SelectDel" />
<html:hidden property="fil010SelectDelLink" />

<html:hidden property="fil290initFlg" />
<html:hidden property="fil290VerVisible" />

<logic:notEmpty name="fil290Form" property="fil290CabinetSv">
<logic:iterate id="afid" name="fil290Form" property="fil290CabinetSv">
  <input type="hidden" name="fil290CabinetSv" value="<bean:write name="afid" />">
</logic:iterate>
</logic:notEmpty>

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>


<table cellpadding="5" cellspacing="0" width="100%">
<tr>
<td width="100%" align="center">

  <table  cellpadding="0" cellspacing="0"width="70%">
  <tr>
  <td align="center">

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
    <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="cmn.filekanri" />　<gsmsg:write key="fil.150" /> ]</td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
      <input type="button" name="btn_add" class="btn_ok1" value="OK" onClick="buttonPush('fil290ok');">
      <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onclick="buttonPush('fil290back');">
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

    <logic:messagesPresent message="false">
    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr><td width="100%"><html:errors /></td></tr>
    </table>
    </logic:messagesPresent>

    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">


    <table cellpadding="10" cellspacing="0" border="0" width="100%" class="tl_u2">

    <!-- 個人キャビネット使用  -->
    <tr>
    <td valign="middle" align="left" class="td_sub_title3" width="15%" nowrap>
      <span class="text_bb1"><gsmsg:write key="fil.fil290.1" /></span><span class="text_r2">※</span>
    </td>
    <td valign="middle" align="left" class="td_wt" width="100%" width="85%">
      <html:radio name="fil290Form" styleId="verKbn_01" property="fil290CabinetUseKbn" value="<%= cabUse %>" onclick="showOrHide();" /><label for="verKbn_01"><span class="text_base7"><gsmsg:write key="fil.fil290.2" /></span></label>&nbsp;
      <html:radio name="fil290Form" styleId="verKbn_02" property="fil290CabinetUseKbn" value="<%= cabNotUse %>" onclick="showOrHide();" /><label for="verKbn_02"><span class="text_base7"><gsmsg:write key="fil.fil290.3" /></span></label>
        <div id="hide0">
          <!-- 個人キャビネット使用設定 使用しない -->
        </div>

        <div id="show0">
          <!-- 個人キャビネット使用設定 使用する -->
          <span class="text_r2"><gsmsg:write key="fil.fil290.4" /></span>
        </div>
    </td>
    </tr>

    <!-- キャビネット使用許可  -->
    <tr id="rowCabinetAuth">
      <td valign="middle" align="left" class="td_sub_title3" width="0%" nowrap>
        <span class="text_bb1"><gsmsg:write key="fil.fil290.5" /></span><span class="text_r2">※</span>
      </td>
      <td valign="middle" align="left" class="td_wt" width="100%">
        <html:radio name="fil290Form" property="fil290CabinetAuthKbn" styleId="okini0" value="<%= cabAuthAll %>" onclick="showOrHide();"/>
        <span class="text_base7"><label for="okini0"><gsmsg:write key="fil.fil290.6" /></label></span>&nbsp;
        <html:radio name="fil290Form" property="fil290CabinetAuthKbn" styleId="okini1" value="<%= cabAuthUser %>" onclick="showOrHide();"/>
        <span class="text_base7"><label for="okini1"><gsmsg:write key="fil.fil290.7" /></label>&nbsp;</span>
        <div id="hide1">
          <!-- 「全ユーザに許可する」選択 → コンボボックス非表示 -->
        </div>
        <div id="show1">
          <!-- 「指定ユーザだけ許可する」選択 → コンボボックス表示  -->
        <table width="100%" border="0">
        <tr>
          <td width="40%" class="td_sub_title3" align="center"><span class="text_bb1"><gsmsg:write key="fil.fil290.8" /></span></td>
          <td width="20%" align="center">&nbsp;</td>
          <td width="40%" align="left">
            <input class="btn_group_n1" value="<gsmsg:write key="cmn.sel.all.group" />" onclick="return openAllGroup(this.form.fil290CabinetSltGroup,'fil290CabinetSltGroup','<bean:write name="fil290Form" property="fil290CabinetSltGroup" />','0','changeGrp','fil290CabinetSv','-1','1');"  type="button"><br>
            <html:select name="fil290Form" property="fil290CabinetSltGroup" styleClass="select01" onchange="return buttonPush('changeGrp');" style="width: 150px;">
              <logic:notEmpty name="fil290Form" property="fil290CabinetGroupLabel">
                <html:optionsCollection name="fil290Form" property="fil290CabinetGroupLabel" value="value" label="label" />
              </logic:notEmpty>
            </html:select>
            <input type="button" onclick="openGroupWindow(this.form.fil290CabinetSltGroup, 'fil290CabinetSltGroup', '0', 'changeGrp')" class="group_btn2" value="&nbsp;&nbsp;" id="fil290GroupBtn">
            <span class="text_base">
            <input type="checkbox" name="fil290CabinetAllSlt" value="1" id="select_user" onclick="return selectAccessList();" />
            <label for="select_user"><gsmsg:write key="cmn.select" /></label></span>
          </td>
        </tr>

        <tr>
          <td align="center">
            <html:select name="fil290Form" property="fil290CabinetAuth" size="13" multiple="true" styleClass="select01" style="width:220px;">
              <logic:notEmpty name="fil290Form" property="fil290CabinetAuthLabel">
                <logic:iterate id="user" name="fil290Form" property="fil290CabinetAuthLabel" type="UsrLabelValueBean">
                  <html:option value="<%= user.getValue() %>" styleClass="<%=user.getCSSClassNameOption() %>"><bean:write name="user" property="label"/></html:option>
                </logic:iterate>
              </logic:notEmpty>
              <option value="-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
            </html:select>
          </td>

          <td align="center">
            <input type="button" class="btn_base1add" value="<gsmsg:write key="cmn.add"/>" name="adduserBtn" onClick="buttonPush('fil290AddUser');">
            <br><br>
            <input type="button" class="btn_base1del" value="<gsmsg:write key="cmn.delete" />" name="deluserBtn" onClick="buttonPush('fil290DelUser');">
          </td>

          <td valign="top">
            <html:select name="fil290Form" property="fil290CabinetRight" size="13" multiple="true" styleClass="select01" style="width:220px;">
              <logic:notEmpty name="fil290Form" property="fil290CabinetRightLabel">
                <logic:iterate id="user" name="fil290Form" property="fil290CabinetRightLabel" type="UsrLabelValueBean">
                  <html:option value="<%= user.getValue() %>" styleClass="<%=user.getCSSClassNameOption() %>"><bean:write name="user" property="label"/></html:option>
                </logic:iterate>
              </logic:notEmpty>
              <option value="-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
            </html:select>
          </td>
        </tr>

        </table>
      </div>
    </td>
    </tr>

    <!-- 容量制限設定  -->
    <tr id="rowCapaKbn">
      <td valign="middle" align="left" class="td_sub_title3" width="0%" nowrap>
        <span class="text_bb1"><gsmsg:write key="fil.3" /></span><span class="text_r2">※</span>
      </td>
      <td valign="middle" align="left" class="td_wt" width="100%">
        <html:radio name="fil290Form" property="fil290CapaKbn" styleId="disksize0" value="<%= capaKbnOff %>" onclick="showOrHide();"/><span class="text_base7"><label for="disksize0"><gsmsg:write key="cmn.noset" /></label></span>&nbsp;
        <html:radio name="fil290Form" property="fil290CapaKbn" styleId="disksize1" value="<%= capaKbnOn %>" onclick="showOrHide();"/><span class="text_base7"><label for="disksize1"><gsmsg:write key="cmn.setting.do" /></label>&nbsp;</span>

        <div id="hide2">
          <!-- 容量制限設定 制限しない選択 → 制限容量＋警告設定コンボ は非表示 -->
        </div>

        <div id="show2">
          <!-- 容量制限設定 制限する選択 → 制限容量＋警告設定コンボ を表示 -->
          <br>&nbsp;&nbsp;
          <span class="text_base"><gsmsg:write key="fil.4" />：</span>
          <html:text name="fil290Form" maxlength="8" property="fil290CapaSize" styleClass="text_base" style="width:73px;" />
          <span class="text_base">MB</span>
          <br>&nbsp;&nbsp;
          <span class="text_base"><gsmsg:write key="fil.fil030kn.1" />：</span>
          <html:select name="fil290Form" property="fil290CapaWarn" styleClass="select01" style="width: 80px;">
            <logic:notEmpty name="fil290Form" property="fil290CapaWarnLavel">
              <html:optionsCollection name="fil290Form" property="fil290CapaWarnLavel" value="value" label="label" />
            </logic:notEmpty>
          </html:select>
          <br>
          <span class="text_r2">※<gsmsg:write key="cmn.not.specified.nowarn" /></span>
        </div>
      </td>
    </tr>

    <!-- バージョン管理  -->
    <logic:equal name="fil290Form" property="fil290VerVisible" value="<%= verKbnOn %>" >
    <tr id="rowVerKbn">
      <td valign="middle" align="left" class="td_sub_title3" width="0%" nowrap>
        <span class="text_bb1"><gsmsg:write key="fil.5" /></span><span class="text_r2">※</span>
      </td>
      <td valign="middle" align="left" class="td_wt" width="100%">
        <span class="text_base">&nbsp;&nbsp;<gsmsg:write key="fil.fil030.3" />：</span>
        <html:select name="fil290Form" property="fil290VerKbn" styleClass="select01" style="width: 80px;">
          <logic:notEmpty name="fil290Form" property="fil290VerKbnLavel">
            <html:optionsCollection name="fil290Form" property="fil290VerKbnLavel" value="value" label="label" />
          </logic:notEmpty>
        </html:select>
      </td>
    </tr>
    </logic:equal>

    </table>

    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
    <td align="right">
      <input type="button" name="btn_add" class="btn_ok1" value="OK" onClick="buttonPush('fil290ok');">
      <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onclick="buttonPush('fil290back');">
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