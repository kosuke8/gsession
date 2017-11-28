<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html:html>
<head>
<title>[GroupSession] <gsmsg:write key="bbs.1" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../bulletin/js/bbs020.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/jtooltip.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../bulletin/css/bulletin.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<body class="body_03">

<html:form action="/bulletin/bbs020">
<input type="hidden" name="CMD" value="">
<html:hidden name="bbs020Form" property="backScreen" />
<html:hidden name="bbs020Form" property="s_key" />
<html:hidden name="bbs020Form" property="bbs010page1" />
<html:hidden name="bbs020Form" property="bbs020forumSid" />

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>
<!-- BODY -->

<!--
<table align="center"  cellpadding="5" cellspacing="0" border="0" width="100%">
<tr>
<td width="100%" align="center">
 -->
<!--
  <table cellpadding="0" cellspacing="0" border="0" width="100%">
  <tr>
  <td>
 -->

    <logic:messagesPresent message="false">

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
      <td align="left"><span class="TXT02"><html:errors/></span></td>
    </tr>
    </table>

    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">

    </logic:messagesPresent>


    <!-- 操作ヘッダー部 -->
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td width="0%"><img src="../common/images/header_ktool_01.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
        <td width="0%" class="header_ktool_bg_text2" align="left" valign="middle" nowrap><span class="settei_ttl"><gsmsg:write key="cmn.admin.setting" /></span></td>
        <td width="100%" class="header_ktool_bg_text2">[ <gsmsg:write key="cmn.bulletin" />-<gsmsg:write key="bbs.14" /> ]</td>
        <td width="0%"><img src="../common/images/header_ktool_05.gif" border="0" alt="<gsmsg:write key="cmn.admin.setting" />"></td>
      </tr>
    </table>

    <!-- フォーラム一覧ヘッダー -->
    <table cellpadding="5" cellspacing="0" width="100%">
      <tr>
        <td align="left">
        <input type="button" class="btn_base0" value="<gsmsg:write key="cmn.up" />" onClick="buttonPush('up');">
        <input type="button" class="btn_base0" value="<gsmsg:write key="cmn.down" />" onClick="buttonPush('down');">
        </td>
        <td align="right">
        <input type="button" class="btn_add_n1" name="new" value="<gsmsg:write key="cmn.add" />" onClick="buttonPush('addForum');">
        <input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onClick="buttonPush('confMenu');"></span>
        </td>
      </tr>
    </table>

    <logic:notEmpty name="bbs020Form" property="forumList">
    <bean:size id="count1" name="bbs020Form" property="bbsPageLabel" scope="request" />
    <logic:greaterThan name="count1" value="1">
    <!-- フォーラム一覧ページング -->
    <table width="100%" cellpadding="5" cellspacing="0">
      <tr>
      <td align="right">
        <img src="../common/images/arrow2_l.gif" alt="<gsmsg:write key="cmn.previous.page" />" class="img_bottom" height="20" width="20" onClick="buttonPush('prevPage');"><html:select property="bbs020page1" onchange="changePage(0);" styleClass="paging_box text_i">
          <html:optionsCollection name="bbs020Form" property="bbsPageLabel" value="value" label="label" />
        </html:select><img src="../common/images/arrow2_r.gif" alt="<gsmsg:write key="cmn.next.page" />" class="img_bottom" height="20" width="20" onClick="buttonPush('nextPage');">
      </td>
      </tr>
    </table>
    </logic:greaterThan>
    </logic:notEmpty>

    <!-- フォーラム一覧ヘッダー -->
    <table width="100%" cellpadding="5" cellspacing="0">
      <tr>
      <td align="right">
    <ul class="none_mark_list">

      <li class="forum_list_header">
        <div class="forum_tit_left forum_li_forumname_manage"><gsmsg:write key="bbs.4" /></div>
        <div class="forum_tit_right forum_li_right_manage_header">
          <div class="forum_tit_left forum_li_postnumber_manage"><gsmsg:write key="bbs.5" /></div>
          <div class="forum_tit_left forum_li_reply_manage"><gsmsg:write key="bbs.6" /></div>
          <div class="forum_tit_left forum_li_size_manage"><gsmsg:write key="cmn.size" /></div>
          <div class="forum_li_button"></div>
        </div>
        <div style="clear: both;"/>
      </li>

      <logic:notEmpty name="bbs020Form" property="forumList">

      <logic:iterate id="forumMdl" name="bbs020Form" property="forumList" indexId="idx">
      <bean:define id="tdColor" value="" />
      <% String[] tdColors = new String[] {"td_type20", "td_type25_2"}; %>
      <% tdColor = tdColors[(idx.intValue() % 2)]; %>
      <bean:define id="bfiSid" name="forumMdl" property="bfiSid" />

      <bean:define id="fLevel" name="forumMdl" property="forumLevel" />
      <% int intLevel = ((Integer) fLevel).intValue(); %>
      <% int dep = 36 * intLevel - 36; %>
      <li class="forum_list_content" style="margin-left:<%= dep %>;">

        <!-- フォーラム左 -->
        <div class="forum_tit_left">

        <!-- ラジオボタン -->
        <html:radio property="bbs020indexRadio" value="<%= String.valueOf(bfiSid) %>" styleId="<%= String.valueOf(bfiSid) %>" styleClass="forum_li_radio" />

          <label for="<%= String.valueOf(bfiSid) %>">
          <%-- フォーラム画像default --%>
          <div class="forum_li_icon_top">
          <logic:equal name="forumMdl" property="imgBinSid" value="0">
            <img width="30" height="30" src="../bulletin/images/cate_icon01.gif" alt="<gsmsg:write key="bbs.3" />">
          </logic:equal>

          <%-- フォーラム画像original --%>
          <logic:notEqual name="forumMdl" property="imgBinSid" value="0">
            <img width="30" height="30" src="../bulletin/bbs010.do?CMD=getImageFile&bbs010BinSid=<bean:write name="forumMdl" property="imgBinSid" />&bbs010ForSid=<bean:write name="forumMdl" property="bfiSid" />" alt="<gsmsg:write key="bbs.3" />">
          </logic:notEqual>
          </div>
          </label>

        </div>

        <%-- フォーラム右 --%>
        <div class="forum_tit_right forum_li_right_manage_content">
          <!-- 投稿数 -->
          <div class="forum_tit_left forum_li_postnumber_manage forum_li_text">
            <bean:write name="forumMdl" property="writeCnt" />
          </div>
          <!-- 返信許可 -->
          <div class="forum_tit_left forum_li_reply_manage forum_li_text">
            <logic:equal name="forumMdl" property="bfiReply" value="<%= String.valueOf(jp.groupsession.v2.bbs.GSConstBulletin.BBS_THRE_REPLY_YES) %>"><gsmsg:write key="cmn.accepted" /></logic:equal>
          <logic:equal name="forumMdl" property="bfiReply" value="<%= String.valueOf(jp.groupsession.v2.bbs.GSConstBulletin.BBS_THRE_REPLY_NO) %>"><gsmsg:write key="cmn.not" /></logic:equal>
          </div>
          <!-- サイズ -->
          <div class="forum_tit_left forum_li_size_manage forum_li_text">
            <bean:write name="forumMdl" property="viewBfsSize" />
          </div>

          <div class="forum_li_button">
            <logic:equal name="forumMdl" property="numberOfChild" value="0">
              <!-- 削除ボタン -->
              <input type="button" value="<gsmsg:write key="cmn.delete" />" class="btn_dell_n3" onClick="buttonPushWithId('delForum', '<bean:write name="forumMdl" property="bfiSid" />');">
            </logic:equal>

            <!-- 編集ボタン -->
            <input type="button" value="<gsmsg:write key="cmn.edit" />" class="btn_edit_n3" onClick="buttonPushWithId('editForum', '<bean:write name="forumMdl" property="bfiSid" />');">
          </div>
        </div>

        <!-- フォーラムタイトル -->
        <label for="<%= String.valueOf(bfiSid) %>">
        <div class="forum_li_title_manage">
          <a><span class="tooltips"><gsmsg:write key="bbs.2" />:<bean:write name="forumMdl" property="bfsThreCnt" />&nbsp;&nbsp;<gsmsg:write key="bbs.16" />:<bean:write name="forumMdl" property="writeCnt" /><br><bean:write name="forumMdl" property="bfiCmtView" filter="false" /></span><span><bean:write name="forumMdl" property="bfiName" /></span></a>
        </div>
        </label>

        <div style="clear: both;"/>

      </li>

      </logic:iterate>
      </logic:notEmpty>
    </ul>
      </td>
      </tr>
    </table>

    <!-- フォーラム一覧ページング -->
    <logic:notEmpty name="bbs020Form" property="forumList">
    <bean:size id="count1" name="bbs020Form" property="bbsPageLabel" scope="request" />
    <logic:greaterThan name="count1" value="1">
    <table width="100%" cellpadding="5" cellspacing="0">
      <tr>
      <td align="right">
        <img src="../common/images/arrow2_l.gif" alt="<gsmsg:write key="cmn.previous.page" />" class="img_bottom" height="20" width="20" onClick="buttonPush('prevPage');"><html:select property="bbs020page2" onchange="changePage(1);" styleClass="paging_box text_i">
          <html:optionsCollection name="bbs020Form" property="bbsPageLabel" value="value" label="label" />
        </html:select><img src="../common/images/arrow2_r.gif" alt="<gsmsg:write key="cmn.next.page" />" class="img_bottom" height="20" width="20" onClick="buttonPush('nextPage');">
      </td>
      </tr>
    </table>
    </logic:greaterThan>
    </logic:notEmpty>
<!--
  </td>
  </tr>
  </table>
   -->
<!--
</td>
</tr>
</table>
 -->
</html:form>

<%@ include file="/WEB-INF/plugin/common/jsp/footer001.jsp" %>
</body>
</html:html>
