<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<%@ page import="jp.groupsession.v2.ntp.ntp088.Ntp088Const" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<html:html>
<head>
  <title>[GroupSession]<gsmsg:write key="schedule.sch080.10" /></title>
  <meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS">
  <theme:css filename="theme.css"/>
  <link rel="stylesheet" href="../common/css/default.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
  <link rel="stylesheet" href="../webmail/css/webmail.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
  <script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
  <script language="JavaScript" src="../common/js/check.js?<%= GSConst.VERSION_PARAM %>"></script>
  <script language="JavaScript" src="../nippou/js/ntp088.js?<%= GSConst.VERSION_PARAM %>"></script>
  <script language="JavaScript" src="../common/js/grouppopup.js?<%= GSConst.VERSION_PARAM %>"></script>
  <script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
</head>

<body class="body_03">

<html:form action="/nippou/ntp088">
<input type="hidden" name="CMD" value="">
<input type="hidden" name="ntp088editMode" value="">
<input type="hidden" name="ntp088editData" value="">
<html:hidden property="ntp088svKeyword" />
<html:hidden property="ntp088sortKey" />
<html:hidden property="ntp088order" />

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>
<table align="center"  cellpadding="5" cellspacing="0" border="0" width="100%">
<tr>
<td width="100%" align="center">

  <table cellpadding="0" cellspacing="0" border="0" width="60%">
  <tr>
  <td>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt=""></td>
        <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
        <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="schedule.sch230.01" /> ]</td>
        <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt=""></td>
      </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td width="50%"></td>
        <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
        <td class="header_glay_bg" width="50%">
          <input type="button" name="btn_add" class="btn_add_n1" value="<gsmsg:write key="cmn.add" />" onClick="buttonPush('addSpAccess', 0);">
          <input type="button" name="btn_del" class="btn_dell_n1" value="<gsmsg:write key="cmn.delete" />" onClick="buttonPush('spAccessDelete');">
          <input type="button" name="btn_facilities_mnt" class="btn_back_n3" value="<gsmsg:write key="cmn.back.admin.setting" />" onClick="buttonPush('ntp088back');">
        </td>
        <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
      </tr>
    </table>

  </td>
  </tr>


  <tr>
  <td>

    <p class="type_p">
    <html:text name="ntp088Form" property="ntp088keyword" maxlength="50" style="width:183px;" />
    <input type="button" onclick="buttonPush('search');" class="btn_base0" value="<gsmsg:write key="cmn.search" />">
    </p>

    <table class="tl0" cellpadding="5" cellspacing="0" border="0" width="100%">
    <tr>
      <td align="left" width="100%">&nbsp;</td>

      <logic:notEmpty name="ntp088Form" property="pageCombo">
      <td align="right" nowrap>
          <a href="#" onClick="buttonPush('prevPage');"C:/Apache24/conf/test.txt""><img alt="<gsmsg:write key="cmn.previous.page" />" src="../common/images/arrow2_l.gif" border="0" height="20" width="20"></a>
          <html:select name="ntp088Form" property="ntp088pageTop" styleClass="text_i" onchange="changePage(0);">
          <html:optionsCollection name="ntp088Form" property="pageCombo" />
          </html:select>
          <a href="#" onClick="buttonPush('nextPage');"><img alt="<gsmsg:write key="cmn.next.page" />" src="../common/images/arrow2_r.gif" border="0" height="20" width="20"></a>
      </td>
      </logic:notEmpty>
    </tr>
    </table>


    <logic:notEmpty name="ntp088Form" property="spAccessList">

    <bean:define id="orderValue" name="ntp088Form" property="ntp088order" type="java.lang.Integer" />
    <%  jp.groupsession.v2.struts.msg.GsMessage gsMsg = new jp.groupsession.v2.struts.msg.GsMessage();
        String destList = gsMsg.getMessage(request, "schedule.sch240.04");
        String user = gsMsg.getMessage(request, "cmn.employer");
        String down = gsMsg.getMessage(request, "tcd.tcd040.23");
        String up = gsMsg.getMessage(request, "tcd.tcd040.22");
    %>
    <% String orderLeft = ""; %>
    <% String orderRight = up; %>
    <%
        String nextOrder = String.valueOf(Ntp088Const.ORDER_DESC);
    %>
    <%
        if (orderValue.intValue() == Ntp088Const.ORDER_DESC) {
    %>
    <%
        orderLeft = "";
    %>
    <%
        orderRight = down;
    %>
    <%
        nextOrder = String.valueOf(Ntp088Const.ORDER_ASC);
    %>
    <%
        }
    %>

    <bean:define id="sortValue" name="ntp088Form" property="ntp088sortKey" type="java.lang.Integer" />
    <%
        String[] orderList = {String.valueOf(Ntp088Const.ORDER_ASC)};
    %>
    <%
        String[] titleList = {destList};
    %>
    <%
        int titleIndex = 0;
    %>
    <%
        if (sortValue.intValue() == Ntp088Const.SKEY_USER) { titleIndex = 1; }
    %>
    <%
        titleList[titleIndex] = orderLeft + titleList[titleIndex] + orderRight;
    %>
    <%
        orderList[titleIndex] = nextOrder;
    %>

    <table class="tl0 table_td_border" cellpadding="5" cellspacing="0" border="0" width="100%">
    <tr>
    <th class="table_bg_7D91BD" width="1%">
    <input type="checkbox" name="ntp088AllCheck" value="1" onClick="chgCheckAll('ntp088AllCheck', 'ntp088selectSpAccessList');chgCheckAllChange('ntp088AllCheck', 'ntp088selectSpAccessList');">
    </th>
    <th align="center" class="table_bg_7D91BD" width="45%">
    <a href="#" onClick="return sort(<%=String.valueOf(Ntp088Const.SKEY_ACCOUNTNAME)%>, <%= orderList[0] %>);"><span class="text_tlw"><%= titleList[0] %></span></a>
    </th>
    <th align="center" class="table_bg_7D91BD" width="54%"><span class="text_tlw"><gsmsg:write key="cmn.memo" /></span></th>
    </tr>

    <logic:iterate id="accessData" name="ntp088Form" property="spAccessList" indexId="idx" type="jp.groupsession.v2.ntp.ntp088.Ntp088SpAccessModel">

    <bean:define id="backclass" value="td_line_color" />
    <bean:define id="backclass_no_edit" value="td_line_no_edit_color" />
    <bean:define id="backpat" value="<%= String.valueOf((idx.intValue() % 2) + 1) %>" />
    <bean:define id="back" value="<%= String.valueOf(backclass) + String.valueOf(backpat) %>" />
    <bean:define id="back_no_edit" value="<%= String.valueOf(backclass_no_edit) + String.valueOf(backpat) %>" />

    <tr class="<%= String.valueOf(back) %>" id="<bean:write name="accessData" property="ssaSid" />">

    <td class="prj_td" align="center">

      <% if (Integer.valueOf(backpat) == 1) { %>
        <html:multibox name="ntp088Form" property="ntp088selectSpAccessList" onclick="backGroundSetting(this, '1');">
          <bean:write name="accessData" property="ssaSid" />
        </html:multibox>
      <% } else { %>
        <html:multibox name="ntp088Form" property="ntp088selectSpAccessList" onclick="backGroundSetting(this, '2');">
          <bean:write name="accessData" property="ssaSid" />
        </html:multibox>
      <% } %>

    </td>

    <td align="left" class="prj_td">
      <a href="#" onClick="return editAccess(<bean:write name="accessData" property="ssaSid" />)"; class="text_link"><bean:write name="accessData" property="name" /></a>
    </td>
    <td align="left" class="prj_td"><span class="text_base"><bean:write name="accessData" property="viewBiko" filter="false" /></span></td>
    </tr>
    </logic:iterate>

    </table>
    </logic:notEmpty>
  </td>
  </tr>

  <tr><td>&nbsp;</td></tr>

  <logic:notEmpty name="ntp088Form" property="pageCombo">
    <tr>
    <td align="right" nowrap>
        <a href="#" onClick="buttonPush('prevPage');"><img alt="<gsmsg:write key="cmn.previous.page" />" src="../common/images/arrow2_l.gif" border="0" height="20" width="20"></a>
        <html:select name="ntp088Form" property="ntp088pageBottom" styleClass="text_i" onchange="changePage(1);">
        <html:optionsCollection name="ntp088Form" property="pageCombo" />
        </html:select>
        <a href="#" onClick="buttonPush('nextPage');"><img alt="<gsmsg:write key="cmn.next.page" />" src="../common/images/arrow2_r.gif" border="0" height="20" width="20"></a>
    </td>
    </tr>
  </logic:notEmpty>

  <tr>
  <td>
    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td width="100%" align="right">&nbsp;</td>
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