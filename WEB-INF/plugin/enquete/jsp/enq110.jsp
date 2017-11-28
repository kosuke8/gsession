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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<gsjsmsg:js filename="gsjsmsg.js" />
<script type="text/javascript" src="../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>"></script>
<script type="text/javascript" src="../common/js/calendar.js?<%= GSConst.VERSION_PARAM %>"></script>
<script type="text/javascript" src="../common/js/popup.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='../common/js/jquery.bgiframe.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src='../schedule/jquery_ui/js/jquery-ui-1.8.14.custom.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script type="text/javascript" src="../common/js/cmn110.js?<%= GSConst.VERSION_PARAM %>"></script>
<script type="text/javascript" src="../enquete/js/enquete.js?<%= GSConst.VERSION_PARAM %>"></script>
<script type="text/javascript" src="../enquete/js/enqDelCheck.js?<%= GSConst.VERSION_PARAM %>"></script>
<script type="text/javascript" src="../enquete/js/enq110.js?<%= GSConst.VERSION_PARAM %>"></script>

<theme:css filename="theme.css" />
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../schedule/jquery/jquery-theme.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../schedule/jquery_ui/css/jquery.ui.dialog.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../common/css/glayer.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../enquete/css/enquete.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>

<title>[GroupSession] <gsmsg:write key="enq.plugin" /></title>
</head>
<body class="body_03" onload="initImageView('enqImgName');" >
<html:form styleId="enqForm" action="/enquete/enq110" >
<input type="hidden" name="CMD" value="">
<input type="hidden" name="enq110DownloadFlg" value="">
<input type="hidden" name="enq110BinSid" value="">
<input type="hidden" name="enq110PreTempDirKbn" value="">
<input type="hidden" name="enq110TempDir" value="">

<html:hidden property="cmd" />
<html:hidden property="ansEnqSid" />
<html:hidden property="enq210editMode" />
<html:hidden property="enq110DspMode" />
<html:hidden property="enq110queDate" />
<html:hidden property="enq210DescText" />
<input type="hidden" name="enq210DelAnsFlg" value="false">

<jsp:include page="/WEB-INF/plugin/enquete/jsp/enq210_hiddenParams.jsp" />
<logic:notEmpty name="enq110Form" property="enq230selectEnqSid">
  <logic:iterate id="sv230SelectEnqSid" name="enq110Form" property="enq230selectEnqSid">
    <input type="hidden" name="enq230selectEnqSid" value="<bean:write name='sv230SelectEnqSid' />" >
  </logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="enq110Form" property="enq230priority">
  <logic:iterate id="sv230Priority" name="enq110Form" property="enq230priority">
    <input type="hidden" name="enq230priority" value="<bean:write name='sv230Priority' />">
  </logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="enq110Form" property="enq010priority">
<logic:iterate id="svPriority" name="enq110Form" property="enq010priority">
  <input type="hidden" name="enq010priority" value="<bean:write name="svPriority" />">
</logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="enq110Form" property="enq010status">
<logic:iterate id="svStatus" name="enq110Form" property="enq010status">
  <input type="hidden" name="enq010status" value="<bean:write name="svStatus" />">
</logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="enq110Form" property="enq010statusAnsOver">
<logic:iterate id="svStatusAnsOver" name="enq110Form" property="enq010statusAnsOver">
  <input type="hidden" name="enq010statusAnsOver" value="<bean:write name="svStatusAnsOver" />">
</logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="enq110Form" property="enq010svPriority">
<logic:iterate id="svPriority" name="enq110Form" property="enq010svPriority">
  <input type="hidden" name="enq010svPriority" value="<bean:write name="svPriority" />">
</logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="enq110Form" property="enq010svStatus">
<logic:iterate id="svStatus" name="enq110Form" property="enq010svStatus">
  <input type="hidden" name="enq010svStatus" value="<bean:write name="svStatus" />">
</logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="enq110Form" property="enq010svStatusAnsOver">
<logic:iterate id="svStatusAnsOver" name="enq110Form" property="enq010svStatusAnsOver">
  <input type="hidden" name="enq010svStatusAnsOver" value="<bean:write name="svStatusAnsOver" />">
</logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="enq110Form" property="enq210answerList">
<logic:iterate id="answerUser" name="enq110Form" property="enq210answerList">
  <input type="hidden" name="enq210answerList" value="<bean:write name="answerUser" />">
</logic:iterate>
</logic:notEmpty>


<html:hidden property="tempClickBtn" />
<html:hidden property="answerDataReset" />

<!-- HEADER -->
<jsp:include page="/WEB-INF/plugin/common/jsp/header001.jsp" />
<bean:define id="enq210editMode" name="enq110Form" property="enq210editMode" type="java.lang.Integer" />
<% int editMode = enq210editMode; %>
<% if (editMode == Enq210Form.EDITMODE_TEMPLATE) { %>
  <input type="hidden" name="helpPrm" value="<%= String.valueOf(Enq210Form.EDITMODE_TEMPLATE) %>">
<% } else { %>
  <input type="hidden" name="helpPrm" value='<bean:write name="enq110Form" property="enq110DspMode" />'>
<% } %>

<table align="center" cellpadding="0" cellspacing="5" border="0" width="70%">
<tr>
<td width="100%" align="center" colspan="2">

  <table cellpadding="0" cellspacing="0" border="0" width="100%">
  <tr>
  <td>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%">
      <img src="../enquete/images/header_enquete_01.gif" border="0" alt="<gsmsg:write key="enq.plugin" />"></td>
    <td width="0%" class="header_white_bg_text" align="right" valign="middle" nowrap><span class="plugin_ttl"><gsmsg:write key="enq.plugin" /></span></td>
    <logic:equal name="enq110Form" property="enq110DspMode" value="0">
    <td width="0%" class="header_white_bg_text" align="right" valign="middle" nowrap>[ <gsmsg:write key="enq.enq110.01" /> ]</td>
    </logic:equal>
    <logic:notEqual name="enq110Form" property="enq110DspMode" value="0">
    <td width="0%" class="header_white_bg_text" align="right" valign="middle" nowrap>[ <gsmsg:write key="cmn.preview" /> ]</td>
    </logic:notEqual>
    <td width="100%" class="header_white_bg">
    </td>
    <td width="0%">
    <img src="../common/images/header_white_end.gif" border="0" alt="<gsmsg:write key='cmn.header' />"></td>
    </tr>
    </table>
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tbody><tr>
    <td width="50%">
    </td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt="<gsmsg:write key='cmn.header' />"></td>
    <td class="header_glay_bg" width="50%">
      <logic:equal name="enq110Form" property="enq110DspMode" value="<%= String.valueOf(Enq110Const.DSP_MODE_ANSWER) %>">
      <input type="button" value="OK" class="btn_ok1" onclick="buttonPush('enq110answer');">
      </logic:equal>
      <logic:equal name="enq110Form" property="enq110DspMode" value="<%= String.valueOf(Enq110Const.DSP_MODE_PREVIEW) %>">
        <logic:equal name="enq110Form" property="enq210editMode" value="<%= String.valueOf(Enq210Form.EDITMODE_TEMPLATE) %>" >
          <input type="button" value="<gsmsg:write key='man.final' />" class="btn_base1" onclick="buttonPush('enq110commit');">
        </logic:equal>
        <logic:notEqual name="enq110Form" property="enq210editMode" value="<%= String.valueOf(Enq210Form.EDITMODE_TEMPLATE) %>" >
        <input type="button" value="<gsmsg:write key='enq.05' />" id="kakuteibtn" class="btn_add_n1">
        </logic:notEqual>
      </logic:equal>
      <input type="button" value="<gsmsg:write key='cmn.back2' />" class="btn_back_n1" onclick="buttonPush('enq110back');">
    </td>
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt="<gsmsg:write key='cmn.header' />"></td>
    </tr>
    </tbody></table>

    <!-- エラーメッセージ -->
    <div style="text-align:left; padding-top:5px;">
    <html:errors/>
    </div>

  </td>
  </tr>
  </table>

</td>
</tr>


<!-- BODY -->
<tr>
  <!-- 基本情報 タイトル -->
  <td width="99%">
    <table width="100%" cellspacing="0" cellpadding="5">
    <tr>
      <td width="1%"><img src="../enquete/images/enquete_title.gif" alt="<gsmsg:write key='enq.plugin' />"></td>
      <td width="99%" class="text_bb4 enq_title" style="padding-left: 10px;"><bean:write name="enq110Form" property="enq110Title" /></td>
    </tr>
    </table>
  </td>
</tr>

<tr>
<td colspan="2" width="100%" align="center" class="wrap_table">

<table class="clear_table" width="100%" cellspacing="0" cellpading="5">
  <tr>

    <td class="content_area">

      <!-- 基本情報 -->
      <jsp:include page="/WEB-INF/plugin/enquete/jsp/enq110_kihoninfo.jsp" />
      <img src="../common/images/spacer.gif" width="1" height="15" border="0" alt="<gsmsg:write key='cmn.spacer' />">

      <!-- 回答部 -->
        <logic:notEmpty name="enq110Form" property="enq110QueList">
        <% String[] quePrmName = {"emnSid", "eqmSeq", "eqmDspSec", "eqmQueKbn", "eqmRequire",
                                  "eqmRngStrNum", "eqmRngEndNum", "eqmRngStrDat", "eqmRngEndDat", "eqmQueSec",
                                  "eqsSeq", "eqsDspName", "eqmOther", "eqmUnitNum"}; %>
        <% String[] ansPrmName = {"eqmAnsText", "eqmAnsTextarea", "eqmAnsNum", "eqmSelectAnsYear", "eqmSelectAnsMonth", "eqmSelectAnsDay", "eqmSelOther", "eqmSelRbn", "eqmSelChk"}; %>
        <% int qnoAuto = 1; %>
        <logic:iterate id="mainList" name="enq110Form" property="enq110QueList" indexId="mIdx" scope="request">

        <% String mIndex = String.valueOf(mIdx); %>
        <% String formName = "enq110QueList[" + mIndex + "]."; %>

        <!-- パラメータを保持 -->
        <html:hidden property="<%= formName + quePrmName[0] %>" />
        <html:hidden property="<%= formName + quePrmName[1] %>" />
        <html:hidden property="<%= formName + quePrmName[2] %>" />
        <html:hidden property="<%= formName + quePrmName[3] %>" />
        <html:hidden property="<%= formName + quePrmName[4] %>" />
        <html:hidden property="<%= formName + quePrmName[5] %>" />
        <html:hidden property="<%= formName + quePrmName[6] %>" />
        <html:hidden property="<%= formName + quePrmName[7] %>" />
        <html:hidden property="<%= formName + quePrmName[8] %>" />
        <html:hidden property="<%= formName + quePrmName[9] %>" />
        <html:hidden property="<%= formName + quePrmName[12] %>" />
        <html:hidden property="<%= formName + quePrmName[13] %>" />

        <logic:equal name="mainList" property="eqmQueKbn" value="<%= String.valueOf(GSConstEnquete.SYURUI_COMMENT) %>" >
        <!-- コメント -->

        <jsp:include page="/WEB-INF/plugin/enquete/jsp/enq110_quet_comment.jsp" >
	    <jsp:param value="<%=mIdx %>" name="mIdx"/>
        </jsp:include>
        </logic:equal>

        <logic:notEqual name="mainList" property="eqmQueKbn" value="<%= String.valueOf(GSConstEnquete.SYURUI_COMMENT) %>" >
        <!-- コメント以外 -->
        <jsp:include page="/WEB-INF/plugin/enquete/jsp/enq110_quet_other.jsp" >
	    <jsp:param value="<%=mIdx %>" name="mIdx"/>
        </jsp:include>
        </logic:notEqual>

        </logic:iterate>
        </logic:notEmpty>
    </td>

  </tr>
  <tr>
    <td align="right">
      <logic:equal name="enq110Form" property="enq110DspMode" value="0">
      <input type="button" value="OK" class="btn_ok1" onclick="buttonPush('enq110answer');">
      </logic:equal>
      <logic:equal name="enq110Form" property="enq110DspMode" value="<%= String.valueOf(Enq110Const.DSP_MODE_PREVIEW) %>">
        <logic:equal name="enq110Form" property="enq210editMode" value="<%= String.valueOf(Enq210Form.EDITMODE_TEMPLATE) %>" >
          <input type="button" value="<gsmsg:write key='man.final' />" class="btn_base1" onclick="buttonPush('enq110commit');">
        </logic:equal>
        <logic:notEqual name="enq110Form" property="enq210editMode" value="<%= String.valueOf(Enq210Form.EDITMODE_TEMPLATE) %>" >
        <input type="button" value="<gsmsg:write key='enq.05' />" id="kakuteibtn" class="btn_add_n1">
        </logic:notEqual>
      </logic:equal>
      <input type="button" value="<gsmsg:write key='cmn.back2' />" class="btn_back_n1" onclick="buttonPush('enq110back');">
    </td>
  </tr>
</table>

</td>
</tr>
</table>
<!-- 回答済みかつ設問情報が変更されていない場合ダイアログ -->
<div id="enqAnswerReset" title="" style="display:none;">
  <p>
    <div>
       <span class="ui-icon ui-icon-info" style="float:left; margin:0 7px 20px 0;"></span>
       <b><gsmsg:write key="enq.enq210kn.05" /></b><br><br>
    </div>
  </p>
</div>

<!-- 回答済みかつ設問情報が変更されていた場合ダイアログ -->
<div id="enqAnswerDelete" title="" style="display:none;">
  <p>
    <div>
       <span class="ui-icon ui-icon-info" style="float:left; margin:0 7px 20px 0;"></span>
       <b><gsmsg:write key="enq.enq210kn.06" /></b><br><br>
    </div>
  </p>
</div>

<!-- 処理中 -->
<div id="loading_pop" title="" style="display:none">
  <table width="100%" height="100%">
    <tr>
      <td class="loading_area" valign="middle" width="110%">
        <img src="../smail/images/ajax-loader.gif" />
      </td>
    </tr>
  </table>
</div>

</html:form>
<jsp:include page="/WEB-INF/plugin/common/jsp/footer001.jsp" />
</body>
</html:html>
