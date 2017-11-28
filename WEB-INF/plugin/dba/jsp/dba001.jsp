<%@ page pageEncoding="Windows-31J" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>

<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[Group Session] Database Administrator</title>
<script type="text/javascript" src="../common/js/cmd.js"></script>
<script type="text/javascript" src="../common/js/yui/yuiloader/yuiloader-beta-min.js" charset="utf-8"></script>
<script type="text/javascript" src="../dba/js/main.js" charset="utf-8"></script>
<link rel=stylesheet href="../common/css/default.css" type="text/css">
<style type="text/css">
<!--
body{visibility:hidden;}
// -->
</style>
</head>

<body class="yui-skin-sam">
<html:form action="/dba/dba001">
<input type="hidden" name="CMD" id="CMD" value="001_ok">
<input type="hidden" name="dba001SqlString" id="dba001SqlString">
<html:hidden name="dba001Form" property="dba001GenTableName" />
  <logic:notEmpty name="dba001Form" property="dba001TableInfos" scope="request">
  <logic:iterate id="tableInfo" name="dba001Form" property="dba001TableInfos" scope="request">
      <input type="hidden" id="<bean:write name="tableInfo" property="name" />_select" value="<bean:write name="tableInfo" property="sqlSelectString" />">
      <input type="hidden" id="<bean:write name="tableInfo" property="name" />_update" value="<bean:write name="tableInfo" property="sqlUpdateString" />">
      <input type="hidden" id="<bean:write name="tableInfo" property="name" />_insert" value="<bean:write name="tableInfo" property="sqlInsertString" />">
      <input type="hidden" id="<bean:write name="tableInfo" property="name" />_delete" value="<bean:write name="tableInfo" property="sqlDeleteString" />">
  </logic:iterate>
  </logic:notEmpty>
  <logic:notEmpty name="dba001Form" property="dba001ViewInfos" scope="request">
  <logic:iterate id="viewInfo" name="dba001Form" property="dba001ViewInfos" scope="request">
      <input type="hidden" id="<bean:write name="viewInfo" property="name" />_select" value="<bean:write name="viewInfo" property="sqlSelectString" />">
  </logic:iterate>
  </logic:notEmpty>
  
<div id="top1">
<!-- %@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" % -->
  <table class="tl0" style="margin:5px;">
  <tr>
  <td width="0%"><img src="../dba/images/header_dba.gif" border="0" alt="DBA"></td>
  <td width="0%" class="header_white_bg_text" align="right" valign="middle" nowrap><span style="font-size: 20px!important">DBA</span></td>
  <td width="100%" class="header_white_bg_text"></td>
  <td width="0%"><img src="../common/images/header_white_end.gif" border="0" alt="DBA"></td>
  </tr>
  </table>
</div>
<div id="left1">
  <div id="tableList">
      <ul>
      <logic:notEmpty name="dba001Form" property="dba001TableInfos" scope="request">
      <logic:iterate id="tableInfo" name="dba001Form" property="dba001TableInfos" scope="request">
      <li class="tableLiFlag"><a href="#" onClick="selectData('<bean:write name="tableInfo" property="name" />')"><bean:write name="tableInfo" property="name" /></a></li>
      </logic:iterate>
      </logic:notEmpty>
      </ul>
      <ul>
      <logic:notEmpty name="dba001Form" property="dba001ViewInfos" scope="request">
      <logic:iterate id="tableInfo" name="dba001Form" property="dba001ViewInfos" scope="request">
      <li class="viewLiFlag"><a href="#" onClick="selectData('<bean:write name="tableInfo" property="name" />')"><bean:write name="tableInfo" property="name" /></a></li>
      </logic:iterate>
      </logic:notEmpty>
      </ul>
      <ul>
      <logic:notEmpty name="dba001Form" property="dba001SeqInfos" scope="request">
      <logic:iterate id="tableInfo" name="dba001Form" property="dba001SeqInfos" scope="request">
      <li class="seqLiFlag"><a href="#" onClick="selectSeq('<bean:write name="tableInfo" property="dbaName" />')"><bean:write name="tableInfo" property="dbaName" /></a></li>
      </logic:iterate>
      </logic:notEmpty>
      </ul>
      <ul>
      <logic:notEmpty name="dba001Form" property="dba001IndexInfos" scope="request">
      <logic:iterate id="tableInfo" name="dba001Form" property="dba001IndexInfos" scope="request">
      <li class="idxLiFlag"><a href="#" onClick="selectIndex('<bean:write name="tableInfo" property="indexName" />')"><bean:write name="tableInfo" property="indexName" /></a></li>
      </logic:iterate>
      </logic:notEmpty>
      </ul>
      <ul>
      <li class="setLiFlag"></li>
      </ul>
      
  </div>
</div>

<div id="center1">
<div class="wrap">
  <div id="tableSql">
    <textarea id="dba001SqlStringTextArea"></textarea>
    <span class="btn_run"><a href="#" onClick="doSql();" onfocus="this.blur()">é¿ çs</a></span>
  </div>

  <div id="resultData">
  </div>
</div>
</div>

<!--<div id="bottom1"></div>-->

</html:form>
</body>
</html:html>