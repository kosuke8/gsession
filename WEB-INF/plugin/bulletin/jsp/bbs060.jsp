<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ taglib uri="/WEB-INF/ctag-jsmsg.tld" prefix="gsjsmsg" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%

  int[] sortKeyList = new int[] {
                       jp.groupsession.v2.bbs.GSConstBulletin.SORT_KEY_THRED,
                       jp.groupsession.v2.bbs.GSConstBulletin.SORT_KEY_TOUKOU,
                       jp.groupsession.v2.bbs.GSConstBulletin.SORT_KEY_ETSURAN,
                       jp.groupsession.v2.bbs.GSConstBulletin.SORT_KEY_USER,
                       jp.groupsession.v2.bbs.GSConstBulletin.SORT_KEY_SAISHIN,
                       jp.groupsession.v2.bbs.GSConstBulletin.SORT_KEY_SIZE
                       };
  String[] title_width = new String[] { "50", "7", "7", "13", "18", "5"};
  int order_desc = jp.groupsession.v2.cmn.GSConst.ORDER_KEY_DESC;
  int order_asc = jp.groupsession.v2.cmn.GSConst.ORDER_KEY_ASC;
%>

<html:html>
<head>
<title>[GroupSession] <gsmsg:write key="bbs.9" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<gsjsmsg:js filename="gsjsmsg.js"/>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/jquery.selection-min.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/cmnPic.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../bulletin/js/bbs060.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../bulletin/js/bbsMemPopUp.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/userpopup.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/imageView.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/selectionSearch.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src='../schedule/jquery_ui/js/jquery-ui-1.8.14.custom.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/glayer.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/jtooltip.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../bulletin/css/bulletin.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../common/css/selection.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../schedule/jquery/jquery-theme.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../schedule/jquery_ui/css/jquery.ui.dialog.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../common/css/glayer.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<logic:greaterThan name="bbs060Form" property="threadSid" value="0">
  <%-- 投稿一覧表示 --%>
  <body class="body_03" onload="getList(<bean:write name="bbs060Form" property="bbs010forumSid"/>,<bean:write name="bbs060Form" property="threadSid"/>);" onunload="windowClose();">
</logic:greaterThan>
<logic:lessEqual name="bbs060Form" property="threadSid" value="0">
  <%-- スレッド一覧表示 --%>
  <body class="body_03" onload="getList(<bean:write name="bbs060Form" property="bbs010forumSid"/>,0);" onunload="windowClose();">
</logic:lessEqual>

<html:form styleId="bbs060Form" action="/bulletin/bbs060">
<input type="hidden" name="CMD" value="searchThre" />
<html:hidden name="bbs060Form" property="bbs010page1" />
<html:hidden name="bbs060Form" property="bbs010forumSid" />
<html:hidden name="bbs060Form" property="threadSid" />
<html:hidden name="bbs060Form" property="bbsmainFlg" />
<html:hidden name="bbs060Form" property="bbs060sortKey" />
<html:hidden name="bbs060Form" property="bbs060orderKey" />
<html:hidden name="bbs060Form" property="bbs060page1" />
<html:hidden name="bbs060Form" property="bbs060page2" />

<html:hidden name="bbs060Form" property="searchDspID" />
<html:hidden name="bbs060Form" property="bbs040forumSid" />
<html:hidden name="bbs060Form" property="bbs040keyKbn" />
<html:hidden name="bbs060Form" property="bbs040taisyouThread" />
<html:hidden name="bbs060Form" property="bbs040taisyouNaiyou" />
<html:hidden name="bbs060Form" property="bbs040userName" />
<html:hidden name="bbs060Form" property="bbs040readKbn" />
<html:hidden name="bbs060Form" property="bbs040dateNoKbn" />
<html:hidden name="bbs060Form" property="bbs040fromYear" />
<html:hidden name="bbs060Form" property="bbs040fromMonth" />
<html:hidden name="bbs060Form" property="bbs040fromDay" />
<html:hidden name="bbs060Form" property="bbs040toYear" />
<html:hidden name="bbs060Form" property="bbs040toMonth" />
<html:hidden name="bbs060Form" property="bbs040toDay" />
<html:hidden name="bbs060Form" property="bbs041page1" />

<html:hidden name="bbs060Form" property="bbs060postOrderKey" />
<html:hidden name="bbs060Form" property="bbs060postPage1" />
<html:hidden name="bbs060Form" property="bbs060reply" />
<html:hidden name="bbs060Form" property="bbs060showThreBtn" />
<html:hidden name="bbs060Form" property="bbs060postBinSid" />
<html:hidden name="bbs060Form" property="bbs060postSid" />

<input type="hidden" name="helpPrm" />

<%@ include file="/WEB-INF/plugin/common/jsp/header001.jsp" %>
<!-- BODY -->
<table align="center"  cellpadding="5" cellspacing="0" border="0" width="100%">
<tr>
<td width="100%" align="center">

  <table cellpadding="0" cellspacing="0" border="0" width="100%">
  <tr>
  <td>

    <table cellpadding="0" cellspacing="0" border="0" width="100%">
      <tr>
        <td width="0%">
        <img src="../bulletin/images/header_bulletin_01.gif" border="0" alt="<gsmsg:write key="cmn.bulletin" />"></td>
        <td width="0%" class="header_white_bg_text" align="right" valign="middle" nowrap><span class="plugin_ttl"><gsmsg:write key="cmn.bulletin" /></span></td>
        <td width="100%" class="header_white_bg_text" id="bbs060screenName">[ <gsmsg:write key="bbs.9" /> ]</td>
        <td width="0%">
        <img src="../common/images/header_white_end.gif" border="0" alt="<gsmsg:write key="cmn.bulletin" />"></td>
      </tr>
    </table>

    <table cellpadding="5" cellspacing="0" width="100%" height="37px;">
      <tr>

        <%-- スレッド一覧のメニュー --%>
        <td align="right" id="list_menu_thread" style="display:none;" nowrap>
          <img src="../common/images/search.gif" alt="<gsmsg:write key="cmn.search" />" class="img_bottom">&nbsp;<input type="text" name="s_key" value="<bean:write name="bbs060Form" property="s_key" />" maxlength="50" style="width:185px;" />&nbsp;<input type="submit" name="btn_prjadd" class="btn_base1s" value="<gsmsg:write key="cmn.search" />" onClick="buttonPushSearch();">&nbsp;<input type="button" name="btn_prjadd" class="btn_search_n1" value="<gsmsg:write key="cmn.advanced.search" />" onClick="buttonPushSearchDtl();">&nbsp;<span class="damy_add_thread_button" id="damy_add_thread_button" style="display:none;" ></span><input type="button" value="<gsmsg:write key="bbs.bbs060.1" />" class="btn_add_n2" id="add_thread_button" onClick="buttonPush('addThread');">&nbsp;<input type="button" value="<gsmsg:write key="cmn.back" />" class="btn_back_n1" onClick="buttonPush('backBBSList');">
        </td>

        <%-- 投稿一覧のメニュー --%>
        <td align="right" id="list_menu_post" style="display:none;" nowrap>

        </td>
      </tr>
    </table>

    <logic:messagesPresent message="false">
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="left"><html:errors/><br></td>
        </tr>
      </table>
    </logic:messagesPresent>

    <div id="loading_pop" title="" style="display:none">
      <table width="100%" height="100%">
        <tr>
          <td class="loading_area" valign="middle" width="110%">
            <img src="../smail/images/ajax-loader.gif" />
          </td>
        </tr>
      </table>
    </div>

    <table width="100%" id="main_content_block">

    <tr>
    <td valign="top" align="left" class="tl0">


      <!-- フォーラム一覧 -->
      <table width="250px" class="tl0" id="subForumList" style="margin-bottom: 15px; display: none;">
        <tr valign="top" align="left" class="tl0 bbs_forum_header_left">
          <td width="100%" class="menu_text" style="text-align:center" nowrap>
            <span class="text_base3"><gsmsg:write key="bbs.1" /></span>
          </td>
        </tr>

        <tr>
          <td>
            <%-- フォーラム一覧階層部 START --%>
            <div id="side_forum_list">
            </div>
            <%-- フォーラム一覧階層部 END --%>

          </td>
        </tr>

      </table>

      <!-- 未読スレッド一覧 START-->
      <table width="250px" style="margin-bottom: 15px; display: none;" class="tl0" id="notReadThreadListTable"></table>
      <!-- 未読スレッド一覧 END-->

      <%-- 全て既読にするボタン START --%>
      <table width="250px" style="display: none;" class="tl0" id="markAllReadBlock">
      </table>
      <%-- 全て既読にするボタン END --%>

    </td>
    <td width="0%"><img src="../common/images/spacer.gif" width="8" height="20" border="0" alt=""></td>


    <!-- スレッド一覧 表示部 START-->
    <td valign="top" width="100%" id="thread_list_block"></td>
    <!-- スレッド一覧 表示部 END-->

    <!-- 投稿一覧 表示部 START-->
    <td width="100%" align="left" valign="top" id="post_list_block" nowrap></td>
    <!-- 投稿一覧 表示部 END-->


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
