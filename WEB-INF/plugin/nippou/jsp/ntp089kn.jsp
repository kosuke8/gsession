<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<bean:define id="ntpEditMode" name="ntp089knForm" property="ntp088editMode" type="java.lang.Integer" />

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

<html:form action="/nippou/ntp089kn">
<input type="hidden" name="CMD" value="">
<html:hidden property="ntp089initFlg" />
<html:hidden property="ntp089name" />
<html:hidden property="ntp089biko" />
<html:hidden property="ntp089position" />
<html:hidden property="ntp089positionAuth" />
<html:hidden property="ntp089accessGroup" />

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

<logic:equal name="ntp089knForm" property="ntp088editMode" value="0">
  <input type="hidden" name="helpPrm" value="0">
</logic:equal>
<logic:notEqual name="ntp089knForm" property="ntp088editMode" value="0">
  <input type="hidden" name="helpPrm" value="1">
</logic:notEqual>

<logic:notEmpty name="ntp089knForm" property="ntp089subject">
  <logic:iterate id="subject" name="ntp089knForm" property="ntp089subject">
    <input type="hidden" name="ntp089subject" value="<bean:write name="subject"/>">
  </logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="ntp089knForm" property="ntp089editUser">
  <logic:iterate id="editUser" name="ntp089knForm" property="ntp089editUser">
    <input type="hidden" name="ntp089editUser" value="<bean:write name="editUser"/>">
  </logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="ntp089knForm" property="ntp089accessUser">
  <logic:iterate id="accessUser" name="ntp089knForm" property="ntp089accessUser">
    <input type="hidden" name="ntp089accessUser" value="<bean:write name="accessUser"/>">
  </logic:iterate>
</logic:notEmpty>

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>

<table align="center"  cellpadding="5" cellspacing="0" border="0" width="100%">
<tr>
<td width="100%" align="center">

  <table cellpadding="0" cellspacing="0" border="0" width="80%">
  <tr>
  <td>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
          <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt=""></td>
          <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
          <% if (editMode == 0) { %>
        <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="schedule.sch240kn.01" /> ]</td>
        <% } else if (editMode == 1) { %>
        <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="schedule.sch240kn.02" /> ]</td>
        <% } %>
          <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt=""></td>
      </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td width="50%"></td>
        <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
        <td class="header_glay_bg" width="50%">
          <input type="button" value="<gsmsg:write key="man.final" />" class="btn_base1" onClick="buttonPush('doRegister');">
          <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onClick="buttonPush('ntp089knback');">
        </td>
        <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
      </tr>
    </table>

  </td>
  </tr>

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
        <td class="table_bg_A5B4E1" width="150" nowrap><span class="text_bb1"><gsmsg:write key="schedule.sch240.04" /></span></td>
        <td align="left" class="webmail_td1" width="850">
          <bean:write name="ntp089knForm" property="ntp089name" />
        </td>
      </tr>

      <tr>
        <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="schedule.sch240.05" /></span></td>
        <td align="left" class="webmail_td1">
          <logic:notEmpty name="ntp089knForm" property="ntp089subjectSelectCombo">

            <logic:iterate id="subject" name="ntp089knForm" property="ntp089subjectSelectCombo" scope="request">

              <logic:equal name="subject" property="usrUkoFlg" value="1">
                <span class="mukouser"><bean:write name="subject" property="label" /><br></span>
              </logic:equal>
              <logic:notEqual name="subject" property="usrUkoFlg" value="1">
                <span><bean:write name="subject" property="label" /><br></span>
              </logic:notEqual>

            </logic:iterate>

          </logic:notEmpty>
        </td>
      </tr>

      <tr>
        <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.post" /></span></td>
        <td align="left" class="webmail_td1">
          <bean:write name="ntp089knForm" property="ntp089knpositionName" />
          <logic:greaterThan name="ntp089knForm" property="ntp089position" value="0">
            <br>
            <logic:equal name="ntp089knForm" property="ntp089positionAuth" value="0">
            <gsmsg:write key="cmn.reading.permit" />
            </logic:equal>
          </td>
          </logic:greaterThan>
        </td>
      </tr>

      <tr>
        <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="schedule.sch240.03" /></span></td>
        <td align="left" class="webmail_td1">

          <table width="60%" cellpadding="0" cellspacing="5" border="0" class="tl_u2">
          <tr>
          <td width="40%" class="td_sub_title3" align="center"><span class="text_bb1"><gsmsg:write key="cmn.reading" /></span></td>
          </tr>
          <tr>
          <td align="left" class="td_type1">
            <logic:notEmpty name="ntp089knForm" property="ntp089accessSelectCombo">
            <logic:iterate id="accessUser" name="ntp089knForm" property="ntp089accessSelectCombo" scope="request">
              <logic:equal name="accessUser" property="usrUkoFlg" value="1">
                <span class="mukouser text_base"><bean:write name="accessUser" property="label" /><br></span>
              </logic:equal>
              <logic:notEqual name="accessUser" property="usrUkoFlg" value="1">
                <span class="text_base"><bean:write name="accessUser" property="label" /><br></span>
              </logic:notEqual>

            </logic:iterate>
            </logic:notEmpty>
            <logic:empty name="ntp089knForm" property="ntp089accessSelectCombo">&nbsp;</logic:empty>
          </td>
          </tr>
          </table>

        </td>
      </tr>

      <tr>
        <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.memo" /></span></td>
        <td align="left" class="webmail_td1">
          <bean:write name="ntp089knForm" property="ntp089knBiko" filter="false" />
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
          <input type="button" value="<gsmsg:write key="man.final" />" class="btn_base1" onClick="buttonPush('doRegister');">
          <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onClick="buttonPush('ntp089knback');">
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