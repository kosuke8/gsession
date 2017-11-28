<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html:html>
<head>

<title>[GroupSession] <gsmsg:write key="main.man002.66" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src='../common/js/jquery.jcarousel.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../main/js/man230.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../main/css/main.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>

</head>

<body class="body_03">
<html:form action="/main/man230">

<input type="hidden" name="CMD" value="">

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>
<!--　BODY -->
<table width="100%" cellpadding="5" cellspacing="0">
<tr>
<td width="100%" align="center">

  <table width="70%" cellpadding="0" cellspacing="0">
  <tr>
  <td align="left">

    <!-- <gsmsg:write key="cmn.title" /> -->
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
    <td width="50%" class="header_ktool_bg_text2">[ <gsmsg:write key="main.man002.66" /> ]</td>
    <td width="50%" class="header_ktool_bg" align="right"></td>
    <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
    </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="50%"></td>
    <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
    <td class="header_glay_bg" width="50%">

    <logic:equal name="man230Form" property="man230SupportLimitFlag" value="0">
      <input type="button" class="btn_base1" value="<gsmsg:write key="cmn.reports" />" onClick="sendSystemInfo();">
    </logic:equal>

      <input type="button" value="<gsmsg:write key="cmn.reload" />" class="btn_reload_n1" onClick="buttonPush('reload');">
      <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('backKtool');">
    </td>
    <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
    </tr>
    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <logic:equal name="man230Form" property="man230SupportLimitFlag" value="0">
      <span class="text_base8"><gsmsg:write key="main.man230.8" /></span>
    </logic:equal>

    <table width="100%" class="tl0" border="0" cellpadding="5">

      <tr>
      <td class="table_bg_A5B4E1" width="0%" nowrap><span class="text_bb1"><gsmsg:write key="main.man002.66" /></span></td>
      <td align="left" class="td_wt2">
      <table border="0" cellpadding="2">

      <!-- Support License -->
      <th align="left"><gsmsg:write key="cmn.license.info" /></th>
       <tr>
       <td nowrap><span class="text_gray">・<gsmsg:write key="cmn.serial.number" /></span></td>
       <td>
         <logic:notEmpty name="man230Form" property="gsUid">
           <span class="text_gray"><bean:write name="man230Form" property="gsUid" /></span>
         </logic:notEmpty>
       </td>
       </tr>

       <logic:notEmpty name="man230Form" property="licenseId">
       <tr>
       <td nowrap><span class="text_gray">・<gsmsg:write key="main.man150.3" /></span></td>
       <td>
           <span class="text_gray"><bean:write name="man230Form" property="licenseId" /></span>
       </td>
       </tr>
       </logic:notEmpty>

       <logic:notEmpty name="man230Form" property="licenseCom">
       <tr>
       <td nowrap><span class="text_gray">・<gsmsg:write key="cmn.company.name" /></span></td>
       <td>
         <span class="text_gray"><bean:write name="man230Form" property="licenseCom" /></span>
       </td>
       </tr>
       </logic:notEmpty>

       <logic:iterate id="plugin" name="man230Form" property="pluginList" scope="request" indexId="cnt">
       <tr>
       <td nowrap><span class="text_gray">・<bean:write name="plugin" property="pluginName" /></span></td>
       <td><span class="text_gray"><gsmsg:write key="cmn.period2" />&nbsp;<bean:write name="plugin" property="licenseLimit" /></span></td>
       </tr>
       </logic:iterate>

       <tr>
       <bean:define id="manCnt" name="man230Form" property="userCount" type="java.lang.String" />
       <td nowrap><span class="text_gray">・<gsmsg:write key="anp.anp110.02" /><gsmsg:write key="rss.25" /></span></td> 
       <td><span class="text_gray"><gsmsg:write key="bmk.23" arg0="<%= manCnt %>" /></span></td>
       </tr>

       <!-- space  -->
       <tr>
       <td width="0%" nowrap><span class="text_gray"><img src="../common/images/spacer.gif" width="1px" height="30px" border="0"></span></td>
       <td width="100%"><span class="txt_status"></span></td>
       </tr>

       <th align="left"><gsmsg:write key="cmn.main.server.info" /></th>
       <tr>
       <td width="0%" nowrap><span class="text_gray">・Version</span></td>
       <td width="100%"><span class="text_gray"><%= jp.groupsession.v2.cmn.GSConst.VERSION %>&nbsp;(<bean:write name="man230Form" property="man230GSVersionDB" />)</span></td>
       </tr>

       <tr>
       <td width="0%" nowrap><span class="text_gray">・OS</span></td>
       <td width="100%"><span class="text_gray"><bean:write name="man230Form" property="man230Os" /></span></td>
       </tr>

       <tr>
       <td width="0%" nowrap><span class="text_gray">・<gsmsg:write key="main.man230.9" /></span></td>
       <td width="100%"><span class="text_gray"><bean:write name="man230Form" property="man230CpuCoreNum" />Core</span></td>
       </tr>

       <tr>
       <td width="0%" nowrap><span class="text_gray">・<gsmsg:write key="main.man230.10" /></span></td>
       <td width="100%"><span class="text_gray"><bean:write name="man230Form" property="man230JvmBitMode" /></span></td>
       </tr>

       <tr>
       <td nowrap><span class="text_gray">・<gsmsg:write key="main.man230.2" /></span></td>
       <td><span class="text_gray"><bean:write name="man230Form" property="man230J2ee" /></span></td>
       </tr>

       <tr>
       <td nowrap><span class="text_gray">・Java</span></td>
       <td><span class="text_gray"><bean:write name="man230Form" property="man230Java" /></span></td>
       </tr>

       <tr>
       <td nowrap><span class="text_gray">・<gsmsg:write key="main.man230.4" /></span></td>
       <td><span class="text_gray"><bean:write name="man230Form" property="man230MemoryUse" />&nbsp;(<bean:write name="man230Form" property="man230MemoryUsePer" />%)</span></td>
       </tr>

       <tr>
       <td nowrap><span class="text_gray">・<gsmsg:write key="main.man230.5" /></span></td>
       <td><span class="text_gray"><bean:write name="man230Form" property="man230MemoryMax" /></span></td>
       </tr>

       <logic:equal name="man230Form" property="man230DbKbn" value="0">
       <tr>
       <td nowrap><span class="text_gray">・<gsmsg:write key="main.man230.6" /></span></td>
       <td><span class="text_gray"><bean:write name="man230Form" property="man230FreeDSpace" /></span></td>
       </tr>
       </logic:equal>


       <!-- space  -->
       <tr>
       <td width="0%" nowrap><span class="text_gray"><img src="../common/images/spacer.gif" width="1px" height="30px" border="0"></span></td>
       <td width="100%"><span class="text_gray"></span></td>
       </tr>

       <tr>
       <td width="0%" nowrap><span class="text_gray">・<gsmsg:write key="main.man230.7" /></span></td>
       <td width="100%"><span class="text_gray"><bean:write name="man230Form" property="man230ConnectionCount" /></span></td>
       </tr>

       <logic:equal name="man230Form" property="man230DbKbn" value="0">

       <!-- space  -->
       <tr>
       <td width="0%" nowrap><span class="text_gray"><img src="../common/images/spacer.gif" width="1px" height="30px" border="0"></span></td>
       <td width="100%"><span class="txt_status"></span></td>
       </tr>

       <th align="left"><gsmsg:write key="cmn.main.h2connection" /></th>
       <!-- ConnectionOption -->
       <bean:define name="man230Form" property="man230ConnectionOp" id="connectionOp"/>
       <tr>
         <td nowrap><span class="text_gray">・LOCK_MODE</span></td>
         <td><span class="text_gray"><bean:write name="connectionOp" property="lockMode"/></span></td>
       </tr>

       <tr>
         <td nowrap><span class="text_gray">・LOCK_TIMEOUT</span></td>
         <td><span class="text_gray"><bean:write name="connectionOp" property="lockTimeOut"/></span></td>
       </tr>

       <tr>
         <td nowrap><span class="text_gray">・DEFAULT_LOCK_TIMEOUT</span></td>
         <td><span class="text_gray"><bean:write name="connectionOp" property="defLockTimeOut"/></span></td>
       </tr>

       <tr>
         <td nowrap><span class="text_gray">・MULTI_THREADED</span></td>
         <td><span class="text_gray"><bean:write name="connectionOp" property="multiThreaded"/></span></td>
       </tr>

       <tr>
         <td nowrap><span class="text_gray">・IFEXISTS</span></td>
         <td><span class="text_gray"><bean:write name="connectionOp" property="ifExists"/></span></td>
       </tr>

       <tr>
         <td nowrap><span class="text_gray">・AUTOCOMMIT</span></td>
         <td><span class="text_gray"><bean:write name="connectionOp" property="autoCommit"/></span></td>
       </tr>

       <tr>
         <td nowrap><span class="text_gray">・DB_CLOSE_ON_EXIT</span></td>
         <td><span class="text_gray"><bean:write name="connectionOp" property="dbCloseOnExit"/></span></td>
       </tr>

       <tr>
         <td nowrap><span class="text_gray">・CACHE_SIZE</span></td>
         <td><span class="text_gray"><bean:write name="connectionOp" property="cacheSize"/></span></td>
       </tr>

       <tr>
         <td nowrap><span class="text_gray">・PAGE_SIZE</span></td>
         <td><span class="text_gray"><bean:write name="connectionOp" property="pageSize"/></span></td>
       </tr>

       <tr>
         <td nowrap><span class="text_gray">・MAX_LENGTH_INPLACE_LOB</span></td>
         <td><span class="text_gray"><bean:write name="connectionOp" property="maxLengthImplace"/></span></td>
       </tr>

       <tr>
         <td nowrap><span class="text_gray">・CACHE_TYPE</span></td>
         <td><span class="text_gray"><bean:write name="connectionOp" property="cacheType"/></span></td>
       </tr>

       <tr>
         <td nowrap><span class="text_gray">・MVCC</span></td>
         <td><span class="text_gray"><bean:write name="connectionOp" property="mvcc"/></span></td>
       </tr>

       <tr>
         <td nowrap><span class="text_gray">・QUERY_TIMEOUT</span></td>
         <td><span class="text_gray"><bean:write name="connectionOp" property="queryTimeOut"/></span></td>
       </tr>

       <tr>
         <td nowrap><span class="text_gray">・QUERY_TIMEOUT_BATCH</span></td>
         <td><span class="text_gray"><bean:write name="connectionOp" property="queryTimeOutBatch"/></span></td>
       </tr>

       <tr>
         <td nowrap><span class="text_gray">・MAX_LOG_SIZE</span></td>
         <td><span class="text_gray"><bean:write name="connectionOp" property="maxLogSize"/></span></td>
       </tr>

       </logic:equal>

       <logic:equal name="man230Form" property="man230DbKbn" value="0">
       <!-- space  -->
       <tr>
       <td width="0%" nowrap><span class="text_gray"><img src="../common/images/spacer.gif" width="1px" height="30px" border="0"></span></td>
       <td width="100%"><span class="txt_status"></span></td>
       </tr>

       <!-- gsdata.conf -->
       <th align="left"><gsmsg:write key="project.prj170.2"/></th>
       <bean:define name="man230Form" property="man230GsdataConf" id="gsdata"/>
       <tr>
         <td nowrap><span class="text_gray">・GSDATA_DIR</span></td>
         <td><span class="text_gray"><span class="txt_gray"><bean:write name="gsdata" property="gsDataDir" /></span></td>
       </tr>

       <tr>
         <td nowrap><span class="text_gray">・BACKUP_DIR</span></td>
         <td><span class="text_gray"><bean:write name="gsdata" property="backUpDir" /></span></td>
       </tr>

       <tr>
         <td nowrap><span class="text_gray">・FILEKANRI_DIR</span></td>
         <td><span class="text_gray"><bean:write name="gsdata" property="fileKanriDir" /></span></td>
       </tr>

       <tr>
         <td nowrap><span class="text_gray">・WEBMAIL_DIR</span></td>
         <td><span class="text_gray"><bean:write name="gsdata" property="webMailDir" /></span></td>
       </tr>

       </logic:equal>

       <!-- space  -->
       <tr>
       <td width="0%" nowrap><span class="text_gray"><img src="../common/images/spacer.gif" width="1px" height="30px" border="0"></span></td>
       <td width="100%"><span class="txt_status"></span></td>
       </tr>

       <!-- BackUpConf -->
       
       <% jp.groupsession.v2.struts.msg.GsMessage gsMsg = new jp.groupsession.v2.struts.msg.GsMessage(); %>
       <% String[] dayOfWeekNameList = {gsMsg.getMessage(request, "cmn.sunday3"), gsMsg.getMessage(request, "cmn.monday3"),
       gsMsg.getMessage(request, "cmn.tuesday3"), gsMsg.getMessage(request, "cmn.wednesday3"),
       gsMsg.getMessage(request, "cmn.thursday3"), gsMsg.getMessage(request, "main.src.man080.7"),
       gsMsg.getMessage(request, "cmn.saturday3")}; %>

       <th align="left"><gsmsg:write key="cmn.autobackup.setting"/></th>

       <logic:notEmpty name="man230Form" property="man230BackUpConf">
         <bean:define name="man230Form" property="man230BackUpConf" id="backUp"/>
         <logic:notEqual name="backUp" property="bucInterval" value="0">
         <tr>

           <td nowrap><span class="text_gray">・<gsmsg:write key="cmn.main.backup.interval"/></span></td>

           <logic:equal name="backUp" property="bucInterval" value="1">
             <td><span class="text_gray"><gsmsg:write key="cmn.everyday"/></span></td>
           </logic:equal>

           <logic:equal name="backUp" property="bucInterval" value="2">
             <bean:define name="backUp" property="bucDow" id="dayOfWeek"/>
             <td>
             <span class="text_gray"><gsmsg:write key="cmn.weekly2"/>
             <%= dayOfWeekNameList[((Integer) dayOfWeek).intValue() - 1] %>
             </span>
             </td>
           </logic:equal>

           <logic:equal name="backUp" property="bucInterval" value="3">
             <bean:define name="backUp" property="bucWeekMonth" id="weekMonth"/>
             <bean:define name="backUp" property="bucDow" id="dayOfWeek"/>
             <td>
             <span class="text_gray">
             <gsmsg:write key="cmn.monthly.2"/>
             <gsmsg:write key="main.src.man025.3"/><%= String.valueOf(weekMonth) %>
             <%= dayOfWeekNameList[((Integer) dayOfWeek).intValue() - 1] %>
             </span>
             </td>
           </logic:equal>

         </tr>

         <logic:notEqual name="backUp" property="bucInterval" value="1">
         <span class="text_gray"><bean:define name="backUp" property="bucDow" id="dayOfWeek"/></span>
         </logic:notEqual>

          <logic:notEqual name="backUp" property="bucInterval" value="0">
          <tr>
            <td nowrap><span class="text_gray">・<gsmsg:write key="man.number.generations"/></span></td>
            <td><span class="text_gray"><bean:write name="backUp" property="bucGeneration"/><gsmsg:write key="fil.6"/></span></td>
          </tr>
          </logic:notEqual>

         <tr>
          <td nowrap><span class="text_gray">・<gsmsg:write key="main.output"/></span></td>
          <logic:equal name="backUp" property="bucZipout" value="1">
          <td><span class="text_gray"><gsmsg:write key="main.zip.format.output"/></span></td>
          </logic:equal>
          <logic:equal name="backUp" property="bucZipout" value="0">
          <td><span class="text_gray"><gsmsg:write key="cmn.not.compress"/></span></td>
          </logic:equal>
         </tr>

       </logic:notEqual>

       <logic:equal name="backUp" property="bucInterval" value="0">
        <tr>
          <td nowrap><span class="text_gray">・<gsmsg:write key="cmn.main.backup.interval"/></span></td>
          <td><span class="text_gray"><gsmsg:write key="reserve.use.kbn.noset" /></span></td>
        </tr>
       </logic:equal>
       </logic:notEmpty>

       <logic:empty name="man230Form" property="man230BackUpConf">
       <tr>
         <td nowrap><span class="text_gray">・<gsmsg:write key="cmn.main.backup.interval"/></span></td>
         <td><span class="text_gray"><gsmsg:write key="reserve.use.kbn.noset" /></span></td>
       </tr>
       </logic:empty>


       <!-- space  -->
       <tr>
       <td width="0%" nowrap><span class="text_gray"><img src="../common/images/spacer.gif" width="1px" height="30px" border="0"></span></td>
       <td width="100%"><span class="txt_status"></span></td>
       </tr>

       <!-- BatchInfo -->
       <th align="left"><gsmsg:write key="main.man040.1" /></th>
       <logic:notEmpty name="man230Form" property="man230CmnBatchJob">

         <bean:define name="man230Form" property="man230CmnBatchJob" id="batchJob"/>
         <tr>
           <td nowrap><span class="text_gray">・<gsmsg:write key="main.src.18" /></span></td>
           <td><span class="text_gray"><bean:write name="batchJob" property="batFrDate"/><gsmsg:write key="tcd.running.time" /></span></td>
         </tr>

       </logic:notEmpty>
       <logic:empty name="man230Form" property="man230CmnBatchJob">
       <tr>
         <td nowrap><span class="text_gray">・<gsmsg:write key="main.man002.34" /></span></td>
         <td><span class="text_gray"><gsmsg:write key="reserve.use.kbn.noset" /></span></td>
       </tr>
       </logic:empty>


       <!-- space  -->
       <tr>
       <td width="0%" nowrap><span class="text_gray"><img src="../common/images/spacer.gif" width="1px" height="30px" border="0"></span></td>
       <td width="100%"><span class="txt_status"></span></td>
       </tr>

       <!-- Plugin Info -->
       <th align="left"><gsmsg:write key="cmn.plugin.info" /></th>
       <logic:iterate name="man230Form" property="man230PluginList" id="pluginList" indexId="idx">

       <% int iterateNum = idx%2; %>
       <% if (iterateNum == 0) { %>

       <tr>
       <td nowrap><span class="text_gray">・<bean:write name="pluginList"/></span></td>

       <% } %>
       <% if (iterateNum == 1) { %>
       <logic:equal name="pluginList" value="1">
       <td><span class="text_gray"><gsmsg:write key="cmn.unused" /></span></td>
       </logic:equal>
       <logic:equal name="pluginList" value="0">
       <td><span class="text_gray"><gsmsg:write key="cmn.use" /></span></td>
       </logic:equal>
       </tr>

       <% } %>

       </logic:iterate>

       <!-- space  -->
       <tr>
       <td width="0%" nowrap><span class="text_gray"><img src="../common/images/spacer.gif" width="1px" height="30px" border="0"></span></td>
       <td width="100%"><span class="txt_status"></span></td>
       </tr>

       <!-- Temporary directory -->
       <th align="left"><gsmsg:write key="cmn.main.temp.path" /></th>
        <tr>
        <td nowrap><span class="text_gray">・<gsmsg:write key="cmn.main.temp.path" /></span></td>
        <td>
          <logic:notEmpty name="man230Form" property="gsUid">
            <span class="text_gray"><bean:write name="man230Form" property="man230TempPath" /></span>
          </logic:notEmpty>
        </td>
        </tr>

       <!-- space  -->
       <tr>
       <td width="0%" nowrap><span class="text_gray"><img src="../common/images/spacer.gif" width="1px" height="30px" border="0"></span></td>
       <td width="100%"><span class="txt_status"></span></td>
       </tr>

       <th align="left">gsMobileSuiteVersion.conf</th>
       <bean:define name="man230Form" property="man230GsMobSuiteVer" id="gsMob"/>
        <tr>
        <td nowrap><span class="text_gray">・COMPLIANT_VERSION</span></td>
        <td>
          <logic:notEmpty name="gsMob" property="compliantVer">
            <span class="text_gray"><bean:write name="gsMob" property="compliantVer" /></span>
          </logic:notEmpty>
        </td>
        </tr>

        <tr>
        <td nowrap><span class="text_gray">・GS_MBA_IOS_VERSION</span></td>
        <td>
          <logic:notEmpty name="gsMob" property="gsMbaIosVer">
            <span class="text_gray"><bean:write name="gsMob" property="gsMbaIosVer" /></span>
          </logic:notEmpty>
        </td>
        </tr>

        <tr>
        <td nowrap><span class="text_gray">・GS_CAL_IOS_VERSION</span></td>
        <td>
          <logic:notEmpty name="gsMob" property="gsCalIosVer">
            <span class="text_gray"><bean:write name="gsMob" property="gsCalIosVer" /></span>
          </logic:notEmpty>
        </td>
        </tr>

        <tr>
        <td nowrap><span class="text_gray">・GS_ADR_IOS_VERSION</span></td>
        <td>
          <logic:notEmpty name="gsMob" property="gsAdrIosVer">
            <span class="text_gray"><bean:write name="gsMob" property="gsAdrIosVer" /></span>
          </logic:notEmpty>
        </td>
        </tr>

        <tr>
        <td nowrap><span class="text_gray">・GS_SML_IOS_VERSION</span></td>
        <td>
          <logic:notEmpty name="gsMob" property="gsSmlIosVer">
            <span class="text_gray"><bean:write name="gsMob" property="gsSmlIosVer" /></span>
          </logic:notEmpty>
        </td>
        </tr>

        <tr>
        <td nowrap><span class="text_gray">・GS_WML_IOS_VERSION</span></td>
        <td>
          <logic:notEmpty name="gsMob" property="gsWmlIosVer">
            <span class="text_gray"><bean:write name="gsMob" property="gsWmlIosVer" /></span>
          </logic:notEmpty>
        </td>
        </tr>

       <!-- space  -->
       <tr>
       <td width="0%" nowrap><span class="text_gray"><img src="../common/images/spacer.gif" width="1px" height="30px" border="0"></span></td>
       <td width="100%"><span class="txt_status"></span></td>
       </tr>

       <th align="left">filesearch.conf</th>
        <tr>
        <td nowrap><span class="text_gray">・FIL_ALL_SEARCH_USE</span></td>
        <td>
          <logic:notEmpty name="man230Form" property="man230FileSearch">
            <span class="text_gray"><bean:write name="man230Form" property="man230FileSearch" /></span>
          </logic:notEmpty>
        </td>
        </tr>

       <!-- space  -->
       <tr>
       <td width="0%" nowrap><span class="text_gray"><img src="../common/images/spacer.gif" width="1px" height="30px" border="0"></span></td>
       <td width="100%"><span class="txt_status"></span></td>
       </tr>

       <th align="left">mailserverl.conf</th>
        <tr>
        <td nowrap><span class="text_gray">・MAIL_PORT_NUMBER</span></td>
        <td>
          <logic:notEmpty name="man230Form" property="man230MailServer">
            <span class="text_gray"><bean:write name="man230Form" property="man230MailServer" /></span>
          </logic:notEmpty>
        </td>
        </tr>

       <!-- space  -->
       <tr>
       <td width="0%" nowrap><span class="text_gray"><img src="../common/images/spacer.gif" width="1px" height="30px" border="0"></span></td>
       <td width="100%"><span class="txt_status"></span></td>
       </tr>

       <th align="left">portal.conf</th>
        <tr>
        <td nowrap><span class="text_gray">・PORTLET_MAXLENGTH</span></td>
        <td>
          <logic:notEmpty name="man230Form" property="man230Portal">
            <span class="text_gray"><bean:write name="man230Form" property="man230Portal" /></span>
          </logic:notEmpty>
        </td>
        </tr>

       <!-- space  -->
       <tr>
       <td width="0%" nowrap><span class="text_gray"><img src="../common/images/spacer.gif" width="1px" height="30px" border="0"></span></td>
       <td width="100%"><span class="txt_status"></span></td>
       </tr>

       <th align="left">reserve.conf</th>
        <tr>
        <td nowrap><span class="text_gray">・RSV_PRINT_USE</span></td>
        <td>
          <logic:notEmpty name="man230Form" property="man230RsvPrintUse">
            <span class="text_gray"><bean:write name="man230Form" property="man230RsvPrintUse" /></span>
          </logic:notEmpty>
        </td>
        </tr>

       <!-- space  -->
       <tr>
       <td width="0%" nowrap><span class="text_gray"><img src="../common/images/spacer.gif" width="1px" height="30px" border="0"></span></td>
       <td width="100%"><span class="txt_status"></span></td>
       </tr>

       <bean:define name="man230Form" property="man230WebMailModel" id="webmailInfo"/>
       <th align="left">webmail.conf</th>
        <tr>
        <td nowrap><span class="text_gray">・MAILRECEIVE_THREAD_MAXCOUNT</span></td>
        <td>
          <logic:notEmpty name="webmailInfo" property="mailReceiveThreadMaxCount">
            <span class="text_gray"><bean:write name="webmailInfo" property="mailReceiveThreadMaxCount" /></span>
          </logic:notEmpty>
        </td>
        </tr>

        <tr>
        <td nowrap><span class="text_gray">・MAILRECEIVE_MAXCOUNT</span></td>
        <td>
          <logic:notEmpty name="webmailInfo" property="mailReceiveMaxCount">
            <span class="text_gray"><bean:write name="webmailInfo" property="mailReceiveMaxCount" /></span>
          </logic:notEmpty>
        </td>
        </tr>

        <tr>
        <td nowrap><span class="text_gray">・MAILRECEIVE_CONNECTTIMEOUT</span></td>
        <td>
          <logic:notEmpty name="webmailInfo" property="mailReceiveConnectTimeOut">
            <span class="text_gray"><bean:write name="webmailInfo" property="mailReceiveConnectTimeOut" /></span>
          </logic:notEmpty>
        </td>
        </tr>

        <tr>
        <td nowrap><span class="text_gray">・MAILRECEIVE_TIMEOUT</span></td>
        <td>
          <logic:notEmpty name="webmailInfo" property="mailReceiveTimeOut">
            <span class="text_gray"><bean:write name="webmailInfo" property="mailReceiveTimeOut" /></span>
          </logic:notEmpty>
        </td>
        </tr>

        <tr>
        <td nowrap><span class="text_gray">・MAILRECEIVE_RCVSVR_CHECKTIME</span></td>
        <td>
          <logic:notEmpty name="webmailInfo" property="mailReceiveRcvSvrChecktime">
            <span class="text_gray"><bean:write name="webmailInfo" property="mailReceiveRcvSvrChecktime" /></span>
          </logic:notEmpty>
        </td>
        </tr>

        <tr>
        <td nowrap><span class="text_gray">・MAILBODY_LIMIT</span></td>
        <td>
          <logic:notEmpty name="webmailInfo" property="mailBodyLimit">
            <span class="text_gray"><bean:write name="webmailInfo" property="mailBodyLimit" /></span>
          </logic:notEmpty>
        </td>
        </tr>

      </table>
      </td>
      </tr>

    </td>
    </tr>
    </table>

    <img src="../common/images/spacer.gif" width="1px" height="10px" border="0">




    <table width="100%">
    <tr>
    <td width="100%" align="right" cellpadding="5" cellspacing="0">
      <input type="button" class="btn_back_n1" value="<gsmsg:write key="cmn.back" />" onClick="buttonPush('backKtool');"></td>
    </td>
    </tr>
    </table>

  </td>
  </tr>
  </table>

</td>
</tr>
</table>

<%@ include file="/WEB-INF/plugin/common/jsp/footer001.jsp" %>

</html:form>
</body>
</html:html>