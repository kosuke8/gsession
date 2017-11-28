<%@page import="jp.groupsession.v2.usr.model.UsrLabelValueBean"%>
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
<title>[GroupSession] <gsmsg:write key="cmn.filekanri" /> <gsmsg:write key="fil.52" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<theme:css filename="theme.css"/>
<link rel=stylesheet href="../common/css/default.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
<link rel=stylesheet href="../file/css/file.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
<link rel=stylesheet href="../file/css/dtree.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/cmn110.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../file/js/file.js?<%= GSConst.VERSION_PARAM %>"></script>
</head>

<body class="body_03">

<html:form action="/file/fil290kn">
<input type="hidden" name="CMD" value="">
<input type="hidden" name="fileSid" value="">
<html:hidden property="cmnMode" />
<html:hidden property="admVerKbn" />
<html:hidden property="backDsp" />
<html:hidden property="backScreen" />
<html:hidden property="filSearchWd" />
<html:hidden property="fil010SelectCabinet" />
<html:hidden property="fil010SelectDirSid" />
<html:hidden property="fil040SelectDel" />
<html:hidden property="fil010SelectDelLink" />

<html:hidden property="fil290CabinetUseKbn" />
<html:hidden property="fil290CabinetAuthKbn" />
<html:hidden property="fil290CapaKbn" />
<html:hidden property="fil290CapaSize" />
<html:hidden property="fil290CapaWarn" />
<html:hidden property="fil290VerKbn" />
<html:hidden property="fil290VerVisible" />
<html:hidden property="fil290initFlg" />

<logic:notEmpty name="fil290knForm" property="fil290CabinetSv">
<logic:iterate id="afid" name="fil290knForm" property="fil290CabinetSv">
  <input type="hidden" name="fil290CabinetSv" value="<bean:write name="afid" />">
</logic:iterate>
</logic:notEmpty>

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>

<!-- BODY -->

<table align="center"  cellpadding="5" cellspacing="0" border="0" width="100%">
<tr>
<td width="100%" align="center">

  <table cellpadding="0" width="70%" class="tl0">
  <tr>
  <td align="center">

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>

    <td width="0%">
      <img src="../file/images/header_project_01.gif" border="0" alt="<gsmsg:write key="cmn.filekanri" />"></td>
    <td width="0%" class="header_white_bg_text" align="right" valign="middle" nowrap><span class="plugin_ttl"><gsmsg:write key="cmn.filekanri" /></span></td>
    <td width="100%" class="header_white_bg_text">[ <gsmsg:write key="fil.151" /> ]</td>
    <td width="0%" class="header_white_bg">
      <img src="../common/images/header_white_end.gif" border="0" alt=""></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
    <input type="button" class="btn_ok1" value="OK" onclick="buttonPush('fil290knok');">
    <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onclick="buttonPush('fil290knback');">
    </td>
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

    <logic:messagesPresent message="false">
      <table width="100%">
      <tr>
        <td align="left"><span class="TXT02"><html:errors/></span></td>
      </tr>
      </table>
    </logic:messagesPresent>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <table cellpadding="10" cellspacing="0" border="0" width="100%" class="tl_u2">

    <!-- 個人キャビネット使用  -->
    <tr>
      <td valign="middle" align="left" class="td_sub_title3" width="15%" nowrap>
        <span class="text_bb1"><gsmsg:write key="fil.fil290.1" /></span><span class="text_r2">※</span>
      </td>
      <td valign="middle" align="left" class="td_wt" width="85%">
        <logic:equal name="fil290knForm" property="fil290CabinetUseKbn" value="<%= cabUse %>">
          <span class="text_base7"><gsmsg:write key="fil.fil290.2" /></span>
        </logic:equal>
        <logic:equal name="fil290knForm" property="fil290CabinetUseKbn" value="<%= cabNotUse %>">
          <span class="text_base7"><gsmsg:write key="fil.fil290.3" /></span>
        </logic:equal>
      </td>
    </tr>

    <!-- キャビネット使用許可  -->
    <logic:equal name="fil290knForm" property="fil290CabinetUseKbn" value="<%= cabUse %>">
    <tr>
      <td valign="middle" align="left" class="td_sub_title3" width="0%" nowrap>
        <span class="text_bb1"><gsmsg:write key="fil.fil290.5" /></span><span class="text_r2">※</span>
      </td>
      <td valign="middle" align="left" class="td_wt" width="100%">
        <logic:equal name="fil290knForm" property="fil290CabinetAuthKbn" value="<%= cabAuthAll %>">
          <span class="text_base7"><gsmsg:write key="fil.fil290.6" /></span>
        </logic:equal>
        <logic:equal name="fil290knForm" property="fil290CabinetAuthKbn" value="<%= cabAuthUser %>">
          <span class="text_base7"><gsmsg:write key="fil.fil290kn.1" /><br>
            <logic:notEmpty name="fil290knForm" property="fil290CabinetAuthLabel">
              <logic:iterate id="user" name="fil290knForm" property="fil290CabinetAuthLabel" type="UsrLabelValueBean" >
                <br>・<bean:write name="user" property="label"/>
              </logic:iterate>
            </logic:notEmpty>
          </span>
        </logic:equal>
      </td>
    </tr>

    <!-- 容量制限設定  -->
    <tr>
      <td valign="middle" align="left" class="td_sub_title3" width="0%" nowrap>
        <span class="text_bb1"><gsmsg:write key="fil.3" /></span><span class="text_r2">※</span>
      </td>
      <td valign="middle" align="left" class="td_wt" width="100%">
        <logic:equal name="fil290knForm" property="fil290CapaKbn" value="<%= capaKbnOff %>">
          <span class="text_base7"><gsmsg:write key="cmn.noset" /></span>
        </logic:equal>
        <logic:equal name="fil290knForm" property="fil290CapaKbn" value="<%= capaKbnOn %>">
          <span class="text_base"><gsmsg:write key="fil.4" />：<b><bean:write name="fil290knForm" property="fil290CapaSize" />
          <span class="text_base">MB</span></b></span>
          <logic:notEqual name="fil290knForm" property="fil290CapaWarn" value="0">
            <br><span class="text_base"><gsmsg:write key="fil.fil030kn.1" />：<b><bean:write name="fil290knForm" property="fil290CapaWarn" />%</b></span>
          </logic:notEqual>
        </logic:equal>
      </td>
    </tr>

    <!-- バージョン管理  -->
    <logic:equal name="fil290knForm" property="fil290VerVisible" value="<%= verKbnOn %>" >
    <tr>
      <td valign="middle" align="left" class="td_sub_title3" width="0%" nowrap>
        <span class="text_bb1"><gsmsg:write key="fil.5" /></span><span class="text_r2">※</span>
      </td>
      <td valign="middle" align="left" class="td_wt" width="100%">
        <span class="text_base"><gsmsg:write key="fil.fil030.3" />：<bean:write name="fil290knForm" property="fil290VerKbn" /> </span>
      </td>
    </tr>
    </logic:equal>

    </logic:equal>
    </table>

  </td>
  </tr>
  <tr>
    <td><img src="../common/images/spacer.gif" width="1px" height="10px" border="0"></td>
  </tr>

  <tr>
  <td align="right">
    <input type="button" class="btn_ok1" value="OK" onclick="buttonPush('fil290knok');">
    <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onclick="buttonPush('fil290knback');">
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