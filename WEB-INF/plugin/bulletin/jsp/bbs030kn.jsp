<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<%@ page import="jp.groupsession.v2.cmn.GSConstBBS" %>
<%@ page import="jp.groupsession.v2.bbs.GSConstBulletin" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html:html>
<head>
<title>[GroupSession] <gsmsg:write key="bbs.bbs030kn.1" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/imageView.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../bulletin/js/bbs030kn.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../bulletin/css/bulletin.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<body class="body_03">

<html:form action="/bulletin/bbs030kn">

<input type="hidden" name="CMD" value="">
<html:hidden name="bbs030knForm" property="backScreen" />
<html:hidden name="bbs030knForm" property="bbs020indexRadio" />
<html:hidden name="bbs030knForm" property="s_key" />
<html:hidden name="bbs030knForm" property="tempDirId" />

<html:hidden name="bbs030knForm" property="bbs010page1" />
<html:hidden name="bbs030knForm" property="bbs020page1" />
<html:hidden name="bbs030knForm" property="bbs020forumSid" />
<html:hidden name="bbs030knForm" property="bbs030cmdMode" />
<html:hidden name="bbs030knForm" property="bbs030forumName" />
<html:hidden name="bbs030knForm" property="bbs030comment" />
<html:hidden name="bbs030knForm" property="bbs030groupSid" />
<html:hidden name="bbs030knForm" property="bbs030reply" />
<html:hidden name="bbs030knForm" property="bbs030read" />
<html:hidden name="bbs030knForm" property="bbs030ImageName" />
<html:hidden name="bbs030knForm" property="bbs030ImageSaveName" />
<html:hidden name="bbs030knForm" property="bbs030mread" />
<html:hidden name="bbs030knForm" property="bbs030templateKbn" />
<html:hidden name="bbs030knForm" property="bbs030template" />
<html:hidden name="bbs030knForm" property="bbs030templateWriteKbn" />
<html:hidden name="bbs030knForm" property="bbs030templateType" />
<html:hidden name="bbs030knForm" property="bbs030templateHtml" />
<html:hidden name="bbs030knForm" property="bbs030diskSize" />
<html:hidden name="bbs030knForm" property="bbs030diskSizeLimit" />
<html:hidden name="bbs030knForm" property="bbs030warnDisk" />
<html:hidden name="bbs030knForm" property="bbs030warnDiskThreshold" />

<html:hidden name="bbs030knForm" property="bbs030LimitDisable" />
<html:hidden name="bbs030knForm" property="bbs030Limit" />
<html:hidden name="bbs030knForm" property="bbs030LimitDate" />
<html:hidden name="bbs030knForm" property="bbs030TimeUnit" />
<html:hidden name="bbs030knForm" property="bbs030Keep" />
<html:hidden name="bbs030knForm" property="bbs030KeepDateY" />
<html:hidden name="bbs030knForm" property="bbs030KeepDateM" />
<html:hidden name="bbs030knForm" property="bbs030ForumLevel" />
<html:hidden name="bbs030knForm" property="bbs030ParentForumSid" />
<html:hidden name="bbs030knForm" property="bbs030knForumName" />
<html:hidden name="bbs030knForm" property="bbs030AdaptChildMemFlg" />
<html:hidden name="bbs030knForm" property="bbs030HaveChildForumFlg" />
<html:hidden name="bbs030knForm" property="bbs030FollowParentMemFlg" />

<logic:notEmpty name="bbs030knForm" property="bbs030memberSid">
<logic:iterate id="usid" name="bbs030knForm" property="bbs030memberSid">
  <input type="hidden" name="bbs030memberSid" value="<bean:write name="usid" />">
</logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="bbs030knForm" property="bbs030memberSidRead">
<logic:iterate id="usid" name="bbs030knForm" property="bbs030memberSidRead">
  <input type="hidden" name="bbs030memberSidRead" value="<bean:write name="usid" />">
</logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="bbs030knForm" property="bbs030memberSidAdm">
<logic:iterate id="usid" name="bbs030knForm" property="bbs030memberSidAdm">
  <input type="hidden" name="bbs030memberSidAdm" value="<bean:write name="usid" />">
</logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="bbs030knForm" property="bbs030UserListWriteReg">
<logic:iterate id="usid" name="bbs030knForm" property="bbs030UserListWriteReg">
  <input type="hidden" name="bbs030UserListWriteReg" value="<bean:write name="usid" />">
</logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="bbs030knForm" property="bbs030UserListReadReg">
<logic:iterate id="usid" name="bbs030knForm" property="bbs030UserListReadReg">
  <input type="hidden" name="bbs030UserListReadReg" value="<bean:write name="usid" />">
</logic:iterate>
</logic:notEmpty>

<logic:notEmpty name="bbs030knForm" property="bbs030UserListAdmReg">
<logic:iterate id="usid" name="bbs030knForm" property="bbs030UserListAdmReg">
  <input type="hidden" name="bbs030UserListAdmReg" value="<bean:write name="usid" />">
</logic:iterate>
</logic:notEmpty>

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>
<!-- BODY -->
<table align="center"  cellpadding="5" cellspacing="0" border="0" width="100%">
<tr>
<td width="100%" align="center">

  <table cellpadding="0" cellspacing="0" border="0" width="70%">
  <tr>
  <td>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
        <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
        <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="cmn.bulletin" />-<gsmsg:write key="bbs.bbs030kn.1" /> ]</td>
        <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
      </tr>
    </table>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td width="50%"></td>
        <td width="0%"><img src="../common/images/header_glay_1.gif" border="0" alt=""></td>
        <td class="header_glay_bg" width="50%">
          <input type="button" value="<gsmsg:write key="cmn.final" />" class="btn_ok1" onClick="buttonPush('decision');">
          <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onClick="buttonPush('backToInput');">
        </td>
        <td width="0%"><img src="../common/images/header_glay_3.gif" border="0" alt=""></td>
      </tr>
    </table>

    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">

    <logic:messagesPresent message="false">

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
      <td align="left"><span class="TXT02"><html:errors/></span></td>
    </tr>
    </table>

    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">

    </logic:messagesPresent>

    <table width="100%" class="tl0" border="0" cellpadding="5">

    <tr>
    <td class="table_bg_A5B4E1" width="0%" nowrap><span class="text_bb1"><gsmsg:write key="bbs.4" /></span></td>
    <td align="left" class="td_type20" width="100%"><bean:write name="bbs030knForm" property="bbs030forumName" /></td>
    </tr>

    <tr>
    <td class="table_bg_A5B4E1" width="0%" nowrap><span class="text_bb1"><gsmsg:write key="cmn.comment" /></span></td>
    <td align="left" class="td_type20" width="100%"><bean:write name="bbs030knForm" property="bbs030viewcomment" filter="false" /></td>
    </tr>

    <tr>
    <td class="table_bg_A5B4E1" width="0%" nowrap><span class="text_bb1"><gsmsg:write key="bbs.bbs030.17" /></span></td>
    <td align="left" class="td_type20" width="100%">

      <logic:equal name="bbs030knForm" property="bbs030ParentForumSid" value="0">
        <gsmsg:write key="cmn.no" />
      </logic:equal>

      <logic:notEqual name="bbs030knForm" property="bbs030ParentForumSid" value="0">
        <logic:notEqual name="bbs030knForm" property="bbs030knParentBinSid" value="0">
          <img width="20" height="20" alt="<gsmsg:write key="bbs.3" />"
              src="../bulletin/bbs010.do?CMD=getImageFile&bbs010BinSid=<bean:write name="bbs030knForm" property="bbs030knParentBinSid" />&bbs010ForSid=<bean:write name="bbs030knForm" property="bbs030ParentForumSid" />">
        </logic:notEqual>
        <logic:equal name="bbs030knForm" property="bbs030knParentBinSid" value="0">
          <img width="20" height="20" src="../bulletin/images/cate_icon01.gif" alt="<gsmsg:write key="bbs.3" />">
        </logic:equal>

        <bean:write name="bbs030knForm" property="bbs030knForumName" filter="false" />
      </logic:notEqual>
      </td>
    </tr>

    <tr>
    <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.member" /></span></td>
    <td align="left" class="td_type20">

      <div id="selectFollowParentMemArea" class="display_none">
        <span><gsmsg:write key="bbs.bbs030.22" /></span>
      </div>

      <div id="selectMemberArea" class="display_none">

        <table width="60%" cellpadding="0" cellspacing="5" border="0" class="tl_u2">
          <tr>
            <td width="40%" class="table_bg_A5B4E1" align="center"><span class="text_bb1"><gsmsg:write key="cmn.add.edit.delete" /></span></td>
          </tr>
          <tr>
            <td align="left" class="td_type1">
              <logic:notEmpty name="bbs030knForm" property="bbs030knMemNameList">
                <logic:iterate id="memName" name="bbs030knForm" property="bbs030knMemNameList" >
                  <logic:equal value="1" name="memName" property="usrUkoFlg">
                    <span class="mukouser text_base"><bean:write name="memName" property="label"/></span><br>
                  </logic:equal>
                  <logic:equal value="0" name="memName" property="usrUkoFlg">
                    <span class=" text_base"><bean:write name="memName" property="label"/></span><br>
                  </logic:equal>
                </logic:iterate>
              </logic:notEmpty>
              <logic:empty name="bbs030knForm" property="bbs030knMemNameList">&nbsp;</logic:empty>
            </td>
          </tr>

          <tr>
            <td width="40%" class="table_bg_A5B4E1" align="center"><span class="text_bb1"><gsmsg:write key="cmn.reading" /></span></td>
          </tr>
          <tr>
            <td align="left" class="td_type1">
              <logic:notEmpty name="bbs030knForm" property="bbs030knMemNameListRead">
                <logic:iterate id="memNameRead" name="bbs030knForm" property="bbs030knMemNameListRead" >
                  <logic:equal value="1" name="memNameRead" property="usrUkoFlg">
                    <span class="mukouser text_base"><bean:write name="memNameRead" property="label"/></span><br>
                  </logic:equal>
                  <logic:equal value="0" name="memNameRead" property="usrUkoFlg">
                    <span class=" text_base"><bean:write name="memNameRead" property="label"/></span><br>
                  </logic:equal>
                </logic:iterate>
              </logic:notEmpty>
              <logic:empty name="bbs030knForm" property="bbs030knMemNameListRead">&nbsp;</logic:empty>

            </td>
          </tr>
        </table>

        <logic:equal name="bbs030knForm" property="bbs030cmdMode" value="1">
          <logic:equal name="bbs030knForm" property="bbs030HaveChildForumFlg" value="1">
            <span text-align="left" class="text_base"><gsmsg:write key="bbs.bbs030.21" /></span>&nbsp;:&nbsp;
            <b>
              <logic:equal name="bbs030knForm" property="bbs030AdaptChildMemFlg" value="1"><gsmsg:write key="fil.128" /></logic:equal>
              <logic:notEqual name="bbs030knForm" property="bbs030AdaptChildMemFlg" value="1"><gsmsg:write key="fil.129" /></logic:notEqual>
            </b>
          </logic:equal>
        </logic:equal>

      </div>

    </td>
    </tr>

    <tr>
    <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="bbs.35" /></span></td>
    <td align="left" class="td_type20">
      <logic:notEmpty name="bbs030knForm" property="bbs030knMemNameListAdm">
        <logic:iterate id="memNameAdm" name="bbs030knForm" property="bbs030knMemNameListAdm" >
          <logic:equal value="1" name="memNameAdm" property="usrUkoFlg">
            <span class="mukouser text_base"><bean:write name="memNameAdm" property="label"/></span><br>
          </logic:equal>
          <logic:equal value="0" name="memNameAdm" property="usrUkoFlg">
            <span class=" text_base"><bean:write name="memNameAdm" property="label"/></span><br>
          </logic:equal>
        </logic:iterate>
      </logic:notEmpty>
    </td>
    </tr>

    <tr>
    <td valign="middle" align="left" class="table_bg_A5B4E1" nowrap>
      <span class="text_bb1"><gsmsg:write key="cmn.icon" /></span>
    </td>
    <td valign="middle" align="left" class="td_wt">

      <table width="100%" border="0">
      <tr>
      <td width="0%">
      <logic:equal name="bbs030knForm" property="bbs030ImageName" value="">
        <img src="../bulletin/images/cate_icon01.gif" name="pitctImage" width="30" height="30" alt="<gsmsg:write key="cmn.icon" />" border="1">
      </logic:equal>
      <logic:notEqual name="bbs030knForm" property="bbs030ImageName" value="">
          <img src="../bulletin/bbs030.do?CMD=getImageFile&tempDirId=<bean:write name="bbs030knForm" property="tempDirId" />" name="pitctImage" width="30" height="30" alt="<gsmsg:write key="cmn.icon" />" border="1" onload="initImageView('pitctImage');">
      </logic:notEqual>
      </td>
      </tr>
      </table>
    </td>
    </tr>

    <tr>
    <td class="table_bg_A5B4E1" width="0%" nowrap><span class="text_bb1"><gsmsg:write key="bbs.6" /></span></td>
    <td align="left" class="td_type20" width="100%">
    <logic:equal name="bbs030knForm" property="bbs030reply" value="<%= String.valueOf(jp.groupsession.v2.bbs.GSConstBulletin.BBS_THRE_REPLY_YES) %>"><gsmsg:write key="cmn.permit" /></logic:equal>
    <logic:equal name="bbs030knForm" property="bbs030reply" value="<%= String.valueOf(jp.groupsession.v2.bbs.GSConstBulletin.BBS_THRE_REPLY_NO) %>"><gsmsg:write key="cmn.not.permit" /></logic:equal>
    </td>
    </tr>

    <tr>
    <td class="table_bg_A5B4E1" width="0%" nowrap><span class="text_bb1"><gsmsg:write key="bbs.7" /></span></td>
    <td align="left" class="td_type20" width="100%">
    <logic:equal name="bbs030knForm" property="bbs030read" value="<%= String.valueOf(jp.groupsession.v2.bbs.GSConstBulletin.NEWUSER_THRE_VIEW_NO) %>"><gsmsg:write key="cmn.read.yet" /></logic:equal>
    <logic:equal name="bbs030knForm" property="bbs030read" value="<%= String.valueOf(jp.groupsession.v2.bbs.GSConstBulletin.NEWUSER_THRE_VIEW_YES) %>"><gsmsg:write key="cmn.read.already" /></logic:equal>
    </td>
    </tr>

    <tr>
    <td class="table_bg_A5B4E1" width="0%" nowrap><span class="text_bb1"><gsmsg:write key="cmn.all.read" /></span></td>
    <td align="left" class="td_type20" width="100%">
    <logic:equal name="bbs030knForm" property="bbs030mread" value="<%= String.valueOf(jp.groupsession.v2.bbs.GSConstBulletin.BBS_FORUM_MREAD_YES) %>"><gsmsg:write key="cmn.permit" /></logic:equal>
    <logic:equal name="bbs030knForm" property="bbs030mread" value="<%= String.valueOf(jp.groupsession.v2.bbs.GSConstBulletin.BBS_FORUM_MREAD_NO) %>"><gsmsg:write key="cmn.not.permit" /></logic:equal>
    </td>
    </tr>

    <tr>
    <td class="table_bg_A5B4E1" width="0%" nowrap><span class="text_bb1"><gsmsg:write key="wml.87" /></span></td>
    <td align="left" class="td_type20" width="100%">
      <logic:equal name="bbs030knForm" property="bbs030diskSize" value="<%= String.valueOf(GSConstBulletin.BFI_DISK_NOLIMIT) %>">
      <gsmsg:write key="wml.31" />
      </logic:equal>
      <logic:equal name="bbs030knForm" property="bbs030diskSize" value="<%= String.valueOf(GSConstBulletin.BFI_DISK_LIMITED) %>">
      <gsmsg:write key="wml.32" />&nbsp;&nbsp;<bean:write name="bbs030knForm" property="bbs030diskSizeLimit" />MB
      </logic:equal>
    </td>
    </tr>

    <logic:equal name="bbs030knForm" property="bbs030diskSize" value="<%= String.valueOf(GSConstBulletin.BFI_DISK_LIMITED) %>">
    <tr>
    <td class="table_bg_A5B4E1" width="0%" nowrap><span class="text_bb1"><gsmsg:write key="wml.wml150.15" /></span></td>
    <td align="left" class="td_type20" width="100%">
      <logic:equal name="bbs030knForm" property="bbs030warnDisk" value="<%= String.valueOf(GSConstBulletin.BFI_WARN_DISK_NO) %>">
      <gsmsg:write key="cmn.notset" />
      </logic:equal>
      <logic:equal name="bbs030knForm" property="bbs030warnDisk" value="<%= String.valueOf(GSConstBulletin.BFI_WARN_DISK_YES) %>">
      <gsmsg:write key="cmn.warning2" />&nbsp;&nbsp;
      <gsmsg:write key="cmn.threshold" />&nbsp;<bean:write name="bbs030knForm" property="bbs030warnDiskThreshold" />%
      </logic:equal>
    </td>
    </tr>
    </logic:equal>

    <tr>
    <td class="table_bg_A5B4E1" width="0%" nowrap><span class="text_bb1"><gsmsg:write key="bbs.bbs030.6" /></span></td>
    <td align="left" class="td_type20" width="100%">

      <logic:equal name="bbs030knForm" property="bbs030templateKbn" value="0">
        <gsmsg:write key="cmn.noset" />
      </logic:equal>

      <logic:equal name="bbs030knForm" property="bbs030templateKbn" value="1">
        <gsmsg:write key="cmn.setting.do" />

        <logic:equal name="bbs030knForm" property="bbs030templateWriteKbn" value="1">
          &nbsp;&nbsp;<span class="text_r1"><gsmsg:write key="bbs.bbs030.8" /></span>
        </logic:equal>

        <table width="99%" cellpadding="0" cellspacing="5" border="0" class="tl_u2" style="margin-top: 10px;">
          <tr>
          <td class="table_bg_A5B4E1" align="center">
          <span class="text_bb1"><gsmsg:write key="cmn.template" /></span>
          </td>
          </tr>
          <tr>
          <td align="left" class="td_type1">
            <logic:equal name="bbs030knForm" property="bbs030templateType" value="0"><bean:write name="bbs030knForm" property="bbs030viewTemplate" filter="false" /></logic:equal>
            <logic:equal name="bbs030knForm" property="bbs030templateType" value="1"><bean:write name="bbs030knForm" property="bbs030templateHtml" filter="false" /></logic:equal>
          </td>
          </tr>
        </table>

      </logic:equal>

    </td>
    </tr>

    <tr>
    <td class="table_bg_A5B4E1" width="0%" nowrap><span class="text_bb1"><gsmsg:write key="bbs.12" /></span></td>
    <td align="left" class="td_type20" width="100%">
      <logic:equal name="bbs030knForm" property="bbs030LimitDisable" value="<%= String.valueOf(GSConstBulletin.THREAD_DISABLE) %>">
      <gsmsg:write key="fil.107" />
      </logic:equal>
      <logic:equal name="bbs030knForm" property="bbs030LimitDisable" value="<%= String.valueOf(GSConstBulletin.THREAD_ENABLE) %>">
      <gsmsg:write key="fil.108" />
      </logic:equal>
    </td>
    </tr>

    <logic:equal name="bbs030knForm" property="bbs030LimitDisable" value="<%= String.valueOf(GSConstBulletin.THREAD_ENABLE) %>">
    <tr>
    <td class="table_bg_A5B4E1" width="0%" nowrap><span class="text_bb1"><gsmsg:write key="bbs.bbs030.10" /></span></td>
    <td align="left" class="td_type20" width="100%">
      <logic:equal name="bbs030knForm" property="bbs030Limit" value="<%= String.valueOf(GSConstBulletin.THREAD_LIMIT_NO) %>">
      <gsmsg:write key="cmn.unlimited" />
      </logic:equal>
      <logic:equal name="bbs030knForm" property="bbs030Limit" value="<%= String.valueOf(GSConstBulletin.THREAD_LIMIT_YES) %>">
      <gsmsg:write key="bbs.bbs070.4" />&nbsp;&nbsp;<bean:write name="bbs030knForm" property="bbs030LimitDate" /><gsmsg:write key="cmn.days.after2" />
      </logic:equal>
    </td>
    </tr>

    <tr>
    <td class="table_bg_A5B4E1" width="0%" nowrap><span class="text_bb1"><gsmsg:write key="bbs.bbs030.24" /></span></td>
    <td align="left" class="td_type20" width="100%">
    <logic:equal name="bbs030knForm" property="bbs030TimeUnit" value="<%= String.valueOf(GSConstBBS.MINUTE_DIVISION5) %>">
    <gsmsg:write key="bbs.bbs030.25"/>
    </logic:equal>
    <logic:equal name="bbs030knForm" property="bbs030TimeUnit" value="<%= String.valueOf(GSConstBBS.MINUTE_DIVISION10) %>">
    <gsmsg:write key="bbs.bbs030.26"/>
    </logic:equal>
    <logic:equal name="bbs030knForm" property="bbs030TimeUnit" value="<%= String.valueOf(GSConstBBS.MINUTE_DIVISION15) %>">
    <gsmsg:write key="bbs.bbs030.27"/>
    </logic:equal>
    </td>
    </td>
    </tr>

    <tr>
    <td class="table_bg_A5B4E1" width="0%" nowrap><span class="text_bb1"><gsmsg:write key="bbs.bbs030.11" /></span></td>
    <td align="left" class="td_type20" width="100%">
      <logic:equal name="bbs030knForm" property="bbs030Keep" value="<%= String.valueOf(GSConstBulletin.THREAD_KEEP_NO) %>">
      <gsmsg:write key="cmn.noset" />
      </logic:equal>
      <logic:equal name="bbs030knForm" property="bbs030Keep" value="<%= String.valueOf(GSConstBulletin.THREAD_KEEP_YES) %>">
      <bean:define id="keepMonth" name="bbs030knForm" property="bbs030KeepDateM" />
      <% String strKeepMonth = String.valueOf(keepMonth); %>
      <gsmsg:write key="cmn.setting.do" /><br>
      <gsmsg:write key="bbs.bbs030.14" />&nbsp;<bean:write name="bbs030knForm" property="bbs030KeepDateY" />年<gsmsg:write key="cmn.months" arg0="<%= strKeepMonth %>"/>
      </logic:equal>
    </td>
    </tr>
    </logic:equal>
    </table>

    <table cellpadding="0" cellspacing="0" width="100%" style="padding-top: 10px;">
      <tr>
        <td align="right">
          <input type="button" value="<gsmsg:write key="cmn.final" />" class="btn_ok1" onClick="buttonPush('decision');">
          <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onClick="buttonPush('backToInput');">
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
