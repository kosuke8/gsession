<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<%@ page import="jp.groupsession.v2.adr.GSConstAddress" %>

<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="../common/js/changestyle.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script type="text/javascript" src="../common/js/grouppopup.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../address/css/address.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<title>[Group Session] <gsmsg:write key="cmn.addressbook" /></title>
</head>

<body class="body_03" >
<html:form action="/address/adr320kn">
<input type="hidden" name="CMD" value="">
<html:hidden name="adr320knForm" property="backScreen" />
<html:hidden name="adr320knForm" property="adr320initFlg" />
<html:hidden name="adr320knForm" property="adr320AacArestKbn" />


<logic:notEmpty name="adr320knForm" property="adr320AdrArestList" scope="request">
    <logic:iterate id="ulBean" name="adr320knForm" property="adr320AdrArestList" scope="request">
    <input type="hidden" name="adr320AdrArestList" value="<bean:write name="ulBean" />">
    </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="adr320knForm" property="adr010SearchTargetContact" scope="request">
  <logic:iterate id="target" name="adr320knForm" property="adr010SearchTargetContact" scope="request">
    <input type="hidden" name="adr010SearchTargetContact" value="<bean:write name="target"/>">
  </logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="adr320knForm" property="adr010svSearchTargetContact" scope="request">
  <logic:iterate id="svTarget" name="adr320knForm" property="adr010svSearchTargetContact" scope="request">
    <input type="hidden" name="adr010svSearchTargetContact" value="<bean:write name="svTarget"/>">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="adr320knForm" property="adr010selectSid">
<logic:iterate id="adrSid" name="adr320knForm" property="adr010selectSid">
  <input type="hidden" name="adr010selectSid" value="<bean:write name="adrSid" />">
</logic:iterate>
</logic:notEmpty>

<%@ include file="/WEB-INF/plugin/address/jsp/adr010_hiddenParams.jsp" %>

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>

<!--　BODY -->

<table align="center"  cellpadding="5" cellspacing="0" border="0" width="100%">
<tr>
<td width="100%" align="center">

  <table cellpadding="0" cellspacing="0" border="0" width="70%">
  <tr>
  <td>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="address.adr320.1" />"></td>
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="address.adr320.1" /></span></td>
    <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="address.adr320.1" /> ]</td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="address.adr320.1" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">
    <input type="button" class="btn_ok1" value="OK" onClick="return buttonPush('ok');">
    <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('adr320knback');">
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

  </td>
  </tr>

  <tr>
  <td><img src="../common/images/spacer.gif" style="width:100px; height:10px;" border="0" alt=""></td>
  </tr>

  <tr>
  <td>
    <!-- エラーメッセージ -->
    <div style="text-align:left">
    <html:errors/>
    </div>

    <table class="tl0" width="100%" cellpadding="5">
    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" width="20%" nowrap>
      <span class="text_bb1"><gsmsg:write key="address.adr320.4"/></span>
    </td>
    <td align="left" class="td_wt" width="80%">
      <span class="text_base">
        <logic:equal name="adr320knForm" property="adr320AacArestKbn" value="<%= String.valueOf(GSConstAddress.ARESTKBN_NONE) %>">
        <!-- 制限なし -->
        <gsmsg:write key="wml.31" /><br />
        </logic:equal>
        <logic:equal name="adr320knForm" property="adr320AacArestKbn" value="<%= String.valueOf(GSConstAddress.ARESTKBN_SELECT_ABLE) %>">
        <!-- ユーザグループを指定 -->
          <gsmsg:write key="wml.32" /><br />
        </logic:equal>
      </span>
    </td>
    </tr>
    <logic:equal name="adr320knForm" property="adr320AacArestKbn" value="<%= String.valueOf(GSConstAddress.ARESTKBN_SELECT_ABLE) %>">
    <tr>
    <td class="table_bg_A5B4E1" width="20%" nowrap><span class="text_bb1"><gsmsg:write key="address.adr320.3" /></span></td>
    <td align="left" class="td_type20">
        <!-- ユーザグループを指定 -->
          <!-- 対象者リスト -->
          <logic:notEmpty name="adr320knForm" property="adr320AdrArestSelectLabel" scope="request">
            <logic:iterate id="labelValueBean" name="adr320knForm" property="adr320AdrArestSelectLabel" scope="request">
              <bean:write name="labelValueBean" property="label"/><br />
            </logic:iterate>
          </logic:notEmpty>
    </td>
    </tr>
    </logic:equal>

    </table>

    <img src="../common/images/spacer.gif" style="width:1px; height:10px;" border="0" alt="">

    <table width="100%">
    <tr>
    <td width="100%" align="right" cellpadding="5" cellspacing="0">
    <input type="button" class="btn_ok1" value="OK" onClick="return buttonPush('adr320kakunin');">
    <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="return buttonPush('adr320back');">
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