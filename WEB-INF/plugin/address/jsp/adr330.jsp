<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ taglib uri="/WEB-INF/ctag-jsmsg.tld" prefix="gsjsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>

<%@ page import="jp.groupsession.v2.adr.GSConstAddress" %>
<%@ page import="jp.groupsession.v2.adr.adr010.Adr010Const" %>

<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[Group Session] <gsmsg:write key="cmn.addressbook" /></title>
<link rel=stylesheet href="../common/css/default.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
<link rel=stylesheet href='../common/css/container.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../address/css/freeze.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href="../address/css/address.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
<link rel=stylesheet href="../address/css/adrEntry.css?<%= GSConst.VERSION_PARAM %>" type="text/css">

<gsjsmsg:js filename="gsjsmsg.js"/>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/yui/yahoo/yahoo.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/yui/event/event.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/yui/dom/dom.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/yui/dragdrop/dragdrop.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/yui/container/container.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/calendar.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../address/js/adrcommon.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../address/js/adr330.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/grouppopup.js?<%= GSConst.VERSION_PARAM %>"></script>

<theme:css filename="theme.css"/>


</head>


<body class="body_03" onunload="calWindowClose();">
<div id="FreezePane">

<html:form action="/address/adr330">
<html:hidden property="backScreen" />

<jsp:include page="/WEB-INF/plugin/address/jsp/adr010_roopHiddenParams.jsp" >
<jsp:param value="adr330Form" name="thisFormName"/>
</jsp:include>
<jsp:include page="/WEB-INF/plugin/address/jsp/adr010_hiddenParams.jsp" />




<span id="adr010labelArea">
</span>

<jsp:include page="/WEB-INF/plugin/common/jsp/header001.jsp"  />

<input type="hidden" name="CMD" value="">

<html:hidden property="adr330searchFlg" />
<html:hidden property="adr330back" value="1" />

<%--前回検索パラメータ --%>
<jsp:include page="/WEB-INF/plugin/address/jsp/adr330_searchHiddenParams.jsp" >
<jsp:param value="adr330Form" name="thisFormName"/>
<jsp:param value="adr330searchSVBean" name="searchParamName"/>
</jsp:include>

<input type="hidden" name="adr020ProcMode" value="<%= String.valueOf(jp.groupsession.v2.adr.GSConstAddress.PROCMODE_ADD) %>">


<input type="hidden" name="adr100backFlg" value="">
<input type="hidden" name="adr110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.adr.GSConstAddress.PROCMODE_EDIT) %>">
<input type="hidden" name="adr110editAcoSid" value="">

<%
  jp.groupsession.v2.struts.msg.GsMessage gsMsg = new jp.groupsession.v2.struts.msg.GsMessage(request);
%>

<table cellpadding="5" cellspacing="0" width="100%">
<tr>
<td width="100%" align="left">

  <table cellpadding="0" cellspacing="0" border="0" width="100%">
  <tr>
  <td>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="address.adr330.1" />"></td>
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
    <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="address.adr330.1" /> ]</td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="address.adr330.1" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
    <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('adr330back');">
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

  </td>
  </tr>
  </table>

  <table cellpadding="5" cellspacing="0" width="100%">
  <tr>
  <td align="right">
  </td>
  </tr>
  </table>

  <table width="100%" class="tl0"  style="table-layout: fixed;">
  <tr>
  <td valign="top" style="padding-left:5px;width:auto;">
  <logic:messagesPresent message="false">
  <IMG SRC="../common/images/spacer.gif" width="1px" height="5px" border="0">
  <table cellpadding="0" cellspacing="0" border="0" width="100%">
  <tr><td width="100%"><html:errors /></td></tr>
  </table>
  </logic:messagesPresent>

  <jsp:include page="/WEB-INF/plugin/address/jsp/adr330_detailed.jsp" >
  <jsp:param value="adr330searchBean" name="searchParamName"/>
  </jsp:include>
 <bean:define id="beanName" value="adr330searchBean" />
    <%-- ソート項目 --%>
 <html:hidden property="<%=beanName + \".sortKey\" %>" />
    <%-- 並び順 --%>
 <html:hidden property="<%=beanName + \".orderKey\" %>" />
    <%-- ページ --%>
 <html:hidden property="<%=beanName + \".page\" %>" />


  <logic:notEmpty name="adr330Form" property="detailList">

  <table width="100%" class="tl5">
  <tr>
  <td>
    <IMG SRC="../common/images/spacer.gif" width="1px" height="3px" border="0">
  </td>
  </tr>
  <tr>
  <td align="left" width="100%" rowspan="2">
    <span class="text_search_title"><gsmsg:write key="cmn.search.criteria" /></span><br>
      <logic:empty name="adr330Form" property="adr010searchParamString">
        <% String allSearchOth = gsMsg.getMessage(request, "address.adr010.7"); %>
        <span class="text_search_key"><gsmsg:write key="address.38" arg0="<%= allSearchOth %>" /></span>
      </logic:empty>
      <logic:notEmpty name="adr330Form" property="adr010searchParamString">
      <bean:define id="searchPrmOth" name="adr330Form" property="adr010searchParamString" type="java.lang.String" />
      <span class="text_search_key"><gsmsg:write key="address.38" arg0="<%= searchPrmOth %>" /></span>
      </logic:notEmpty>
  </td>

  <td width="0%" nowrap>
    <input type="button" value="<gsmsg:write key="cmn.delete" />" class="btn_dell_n1" onClick="buttonPush('adrDelete');">
    <input type="button" name="btn_usrimp" class="btn_csv_n2" value="<gsmsg:write key="cmn.export" />" onClick="buttonPush('export');">
  </td>
  </tr>

  <logic:notEmpty name="adr330Form" property="pageCmbList">
  <tr>
  <td align="right" width="0%">
    <table width="0%" cellpadding="0" cellspacing="0" border="0">
    <td align="right"><img src="../common/images/arrow2_l.gif" alt="<gsmsg:write key="cmn.previous.page" />" class="img_bottom" width="20" height="20" onClick="buttonPush('prevPage');" style="cursor:pointer;">&nbsp;</td>
    <td align="right">
      <html:select name="adr330Form" property="adr330searchSVBean.page" styleClass="text_i" onchange="changePage(this.value);">
        <html:optionsCollection name="adr330Form" property="pageCmbList" value="value" label="label" />
      </html:select>
    </td>
    <td align="right">&nbsp;<img src="../common/images/arrow2_r.gif" alt="<gsmsg:write key="cmn.next.page" />" class="img_bottom" width="20" height="20" onClick="buttonPush('nextPage');" style="cursor:pointer;"></td>
    </tr>
    </table>
  </td>
  </tr>
  </logic:notEmpty>

  </table>

  <table width="100%" class="tl5">
  <tr>
  <td width="100%">
    <jsp:include page="/WEB-INF/plugin/address/jsp/adr330address.jsp" />
  </td>
  </tr>
  </table>

  <logic:notEmpty name="adr330Form" property="pageCmbList">
  <table width="100%" class="tl5">
  <tr>
  <td width="100%">&nbsp;</td>
  <td align="right">

    <table width="0%" cellpadding="0" cellspacing="0" border="0">
    <td align="right"><img src="../common/images/arrow2_l.gif" alt="<gsmsg:write key="cmn.previous.page" />" class="img_bottom" width="20" height="20" onClick="buttonPush('prevPage');" style="cursor:pointer;">&nbsp;</td>
    <td align="right">
      <html:select name="adr330Form" property="adr330searchSVBean.page" styleClass="text_i" onchange="changePage(this.value);">
        <html:optionsCollection name="adr330Form" property="pageCmbList" value="value" label="label" />
      </html:select>
    </td>
    <td align="right">&nbsp;<img src="../common/images/arrow2_r.gif" alt="<gsmsg:write key="cmn.next.page" />" class="img_bottom" width="20" height="20" onClick="buttonPush('nextPage');" style="cursor:pointer;"></td>
    </tr>
    </table>

  </td>
  </tr>
  </table>
  </logic:notEmpty>
  </logic:notEmpty>


</td>
  </tr>
  </table>

</td>
</tr>
</table>


</html:form>

<jsp:include page="/WEB-INF/plugin/common/jsp/footer001.jsp"/>
</div>


</body>
</html:html>