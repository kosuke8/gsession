<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.Integer" %>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ taglib uri="/WEB-INF/ctag-jsmsg.tld" prefix="gsjsmsg" %>

<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html:html>
<head>
<title>[GroupSession] <gsmsg:write key="bbs.bbs010.1" /></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<gsjsmsg:js filename="gsjsmsg.js"/>
<script language="JavaScript" src='../common/js/jquery-1.5.2.min.js?<%= GSConst.VERSION_PARAM %>'></script>
<script language="JavaScript" src="../common/js/cmd.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../bulletin/js/bbs010.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/imageView.js?<%= GSConst.VERSION_PARAM %>"></script>
<script language="JavaScript" src="../common/js/jtooltip.js?<%= GSConst.VERSION_PARAM %>"></script>
<theme:css filename="theme.css"/>
<link rel=stylesheet href='../common/css/default.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
<link rel=stylesheet href='../bulletin/css/bulletin.css?<%= GSConst.VERSION_PARAM %>' type='text/css'>
</head>

<body class="body_03">

<html:form styleId="bbs010Form" action="/bulletin/bbs010">
<input type="hidden" name="CMD" value="search">
<html:hidden name="bbs010Form" property="bbs010forumSid" />

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
        <td width="0%" class="header_white_bg_text">[ <gsmsg:write key="bbs.1" /> ]</td>
        <td width="100%" class="header_white_bg">
          <logic:equal name="bbs010Form" property="bbs010AdminFlg" value="1">
            <input type="button" name="btn_prjadd" class="btn_setting_admin_n1" value="<gsmsg:write key="cmn.admin.setting" />" onClick="buttonPush('confMenu');">
          </logic:equal>
          <input type="button" name="btn_prjadd" class="btn_setting_n1" value="<gsmsg:write key="cmn.preferences2" />" onClick="buttonPush('personal');">
        </td>
        <td width="0%"><img src="../common/images/header_white_end.gif" border="0" alt="<gsmsg:write key="cmn.bulletin" />"></td>
      </tr>
    </table>

    <table cellpadding="5" cellspacing="0" width="100%">
      <tr>
        <td align="right">
          <img src="../common/images/search.gif" alt="<gsmsg:write key="cmn.search" />" class="img_bottom">
          <html:text name="bbs010Form" property="s_key" maxlength="50" style="width:185px;"/>
          <input type="submit" name="btn_prjadd" class="btn_base1s" value="<gsmsg:write key="cmn.search" />" onClick="buttonPush('search');">
          <input type="button" name="btn_prjadd" class="btn_search_n1" value="<gsmsg:write key="cmn.advanced.search" />" onClick="buttonPush('searchDtl');">
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

    <table width="100%" class="tl0">
    <tr>

      <logic:notEmpty name="bbs010Form" property="shinThredList">

    <td width="250" valign="top" class="tl0">
      <table class="tl0"  style="border: solid 1px #cccccc;">
      <tr>
      <td>
        <table class="tl0 bbs_forum_header_left" width="250">
        <tr>

        <td width="0%">
          <img src="../bulletin/images/cate_icon02_bdr.gif" alt="<gsmsg:write key="bbs.2" />">
        </td>

        <td width="100%" nowrap>
          <span class="text_base3"><gsmsg:write key="bbs.bbs010.2" /></span>
        </td>

        </tr>
        </table>


        <logic:iterate id="thredMdl" name="bbs010Form" property="shinThredList" indexId="idy">
        <table class="tl0 shintyaku_tbl2 body_05" width="250px">
          <tr>
            <td align="left" width="100%">
              <table width="100%" cellpadding="" cellspacing="">
                <tr>
                  <%-- 未読・既読のスタイル --%>
                    <bean:define id="tdColor2" value="" />
                    <% String[] tdColors2 = new String[] {"td_type20", "td_type25_2"}; %>
                    <% tdColor2 = tdColors2[(idy.intValue() % 2)]; %>

                    <% String fTitleClass = "forum_link"; %>
                    <% String tTitleClass = "thred_link"; %>
                    <logic:equal name="thredMdl" property="f_ReadFlg" value="1">
                      <% fTitleClass = "forum_link2"; %>
                    </logic:equal>
                    <logic:equal name="thredMdl" property="t_ReadFlg" value="1">
                      <% tTitleClass = "thred_link2"; %>
                    </logic:equal>

                  <%-- フォーラム画像default --%>
                  <logic:equal name="thredMdl" property="imgBinSid" value="0">
                    <td class="text_left forum_img_top" width="20"><img width="20" height="20" src="../bulletin/images/cate_icon01.gif" alt="<gsmsg:write key="bbs.3" />"></td>
                  </logic:equal>

                  <%-- フォーラム画像original --%>
                  <logic:notEqual name="thredMdl" property="imgBinSid" value="0">
                    <td class="text_left forum_img_top" width="20">
                    <img width="20" height="20" src="../bulletin/bbs010.do?CMD=getImageFile&bbs010BinSid=<bean:write name="thredMdl" property="imgBinSid" />&bbs010ForSid=<bean:write name="thredMdl" property="bfiSid" />" alt="<gsmsg:write key="bbs.3" />"></td>
                  </logic:notEqual>

                  <%-- フォーラム名 --%>
                  <td class="forum_img_top" width="210">
                  <a href="javascript:clickForum(<bean:write name="thredMdl" property="bfiSid" />);">
                  <span class="<%= fTitleClass %>"><bean:write name="thredMdl" property="bfiName" filter="false" /></span></a>
                  </td>

                </tr>
                <tr>
                <td colspan="2">
                <a href="../bulletin/bbs060.do?bbs010forumSid=<bean:write name="thredMdl" property="bfiSid" />&threadSid=<bean:write name="thredMdl" property="btiSid" />">
                <span class="<%= tTitleClass %>">
                  <!-- 重要度 -->
                  <logic:equal name="thredMdl" property="threImportance" value="1">
                    <img src="../smail/images/zyuu.gif" alt="<gsmsg:write key="sml.61" />" border="0" class="img_bottom">
                  </logic:equal>
                  <logic:equal name="thredMdl" property="btsTempflg" value="1">
                    <img src="../bulletin/images/icon_file.gif" alt="<gsmsg:write key="cmn.attach.file" />" class="attach_file_icon">
                  </logic:equal>
                  <bean:write name="thredMdl" property="btiTitle" filter="false" />
                  </span></a></td>
                </tr>
                <tr>
                  <td colspan="2" style="padding: 0!important;">
                  <table width="100%">
                    <tr>
                    <td class="text_base9_left">
                    <bean:define id="cbGrpSid" name="thredMdl" property="grpSid" type="java.lang.Integer" />
                    <% if (cbGrpSid.intValue() > 0) { %>
                      <logic:equal name="thredMdl" property="grpJkbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.JTKBN_DELETE) %>">
                        <s><bean:write name="thredMdl" property="grpName" /></s>
                      </logic:equal>
                      <logic:notEqual name="thredMdl" property="grpJkbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.JTKBN_DELETE) %>">
                        <bean:write name="thredMdl" property="grpName" />
                      </logic:notEqual>
                    <% } else { %>
                      <logic:equal name="thredMdl" property="userJkbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.JTKBN_DELETE) %>">
                        <s><bean:write name="thredMdl" property="userName" /></s>
                      </logic:equal>
                      <logic:notEqual name="thredMdl" property="userJkbn" value="<%= String.valueOf(jp.groupsession.v2.cmn.GSConst.JTKBN_DELETE) %>">
                        <bean:define id="yukoFlg" name="thredMdl" property="userYukoKbn" type="java.lang.Integer"/>
                        <% if (yukoFlg.intValue() == 1) { %>
                        <span class="mukouser"><bean:write name="thredMdl" property="userName" /></span>
                        <% } else { %>
                        <span><bean:write name="thredMdl" property="userName" /></span>
                        <% } %>
                      </logic:notEqual>
                    <% } %>
                    </td>
                    <td class="text_base9"><bean:write name="thredMdl" property="strWriteDate" /></td>
                    </tr>
                  </table>
                </tr>
              </table></td></tr>
        </table>
        </logic:iterate>
        </td>
        </tr>
        </table>
      </td>
      </logic:notEmpty>
      <td width="0%"><img src="../common/images/spacer.gif" width="10" height="20" border="0" alt=""></td>

      <td width="100%" valign="top" align="right">

        <logic:notEmpty name="bbs010Form" property="forumList">
        <bean:size id="count1" name="bbs010Form" property="bbsPageLabel" scope="request" />
        <logic:greaterThan name="count1" value="1">
        <table width="100%" cellpadding="5" cellspacing="0">
          <tr>
            <td align="right">
              <img src="../common/images/arrow2_l.gif" alt="<gsmsg:write key="cmn.previous.page" />" class="img_bottom" height="20" width="20" onClick="buttonPush('prevPage');"><html:select property="bbs010page1" onchange="changePage(0);" styleClass="paging_box text_i">
                <html:optionsCollection name="bbs010Form" property="bbsPageLabel" value="value" label="label" />
              </html:select><img src="../common/images/arrow2_r.gif" alt="<gsmsg:write key="cmn.next.page" />" class="img_bottom" height="20" width="20" onClick="buttonPush('nextPage');">
            </td>
          </tr>
        </table>
        </logic:greaterThan>
        </logic:notEmpty>

        <ul class="none_mark_list">

          <li class="forum_list_header">
            <div class="forum_tit_left forum_li_forumname_top"><gsmsg:write key="bbs.3" /></div>
            <div class="forum_tit_right forum_list_right">
              <div class="forum_tit_left forum_li_writedate_header"><gsmsg:write key="bbs.bbs010.3" /></div>
              <div class="forum_tit_right forum_li_member"><gsmsg:write key="cmn.member" /></div>
            </div>
            <div style="clear: both;"/>
          </li>

          <logic:notEmpty name="bbs010Form" property="forumList">
            <% int saveParentSid = 0; %>
            <% int saveLevel = 1; %>
            <% ArrayList<Integer> parentForumList = new ArrayList<Integer>(); %>
            <% boolean initFlg = true; %>
          <logic:iterate id="forumMdl" name="bbs010Form" property="forumList" indexId="idx">
            <bean:define id="tdColor" value="" />
            <% String[] tdColors = new String[] {"td_type20", "td_type25_2"}; %>
            <% tdColor = tdColors[(idx.intValue() % 2)]; %>

            <% String titleClass = "forum_li_title_top_read"; %>
            <% String valueClass = "sc_ttl_sat"; %>
            <logic:equal name="forumMdl" property="readFlg" value="1">
              <% titleClass = "forum_li_title_top_unread"; %>
              <% valueClass = "text_p"; %>
            </logic:equal>
            <bean:define id="fLevel" name="forumMdl" property="forumLevel" />
            <% int intLevel = ((Integer) fLevel).intValue(); %>
            <bean:define id="pfsid" name="forumMdl" property="parentForumSid" type="java.lang.Integer" />

            <% if (initFlg) { %>
            <% initFlg = false; %>

            <% } else { %>

            <% if (saveLevel > intLevel) { %>
            <% int levelReminder = saveLevel - intLevel; %>

            <% for (int j=0;j<levelReminder;++j) { %>
              <%-- </li> --%>
            </ul>
            <% } %>

            <% } else if (saveLevel == intLevel && saveParentSid != pfsid) { %>
              </li></ul>

            <%-- <% } else { %>
              </li> --%>
            <% }} %>


            <logic:notEqual name="forumMdl" property="parentForumSid" value="0">
              <% if (!parentForumList.contains(pfsid)) { %>
                <li><ul class="none_mark_list child_forum_block <bean:write name="forumMdl" property="parentForumSid" />_child" >
              <% } %>
            </logic:notEqual>


            <li class="forum_list_content" id="<bean:write name="forumMdl" property="bfiSid"/>">

              <!-- フォーラム左 -->
              <div class="forum_tit_left">

                <%-- 開閉ボタン --%>
                <logic:notEqual name="forumMdl" property="numberOfChild" value="0">
                  <span href="#" class="forum_button opened_button" id="forum_button_<bean:write name="forumMdl" property="bfiSid"/>" >-</span>
                </logic:notEqual>
                <logic:equal name="forumMdl" property="numberOfChild" value="0">
                  <span class="level_indent">-</span>
                </logic:equal>

                <%-- フォーラム画像 --%>
                <div class="forum_li_icon_top">
                  <logic:equal name="forumMdl" property="imgBinSid" value="0">
                  <%-- フォーラム画像default --%>
                    <a href="javascript:clickForum(<bean:write name="forumMdl" property="bfiSid" />);">
                      <img width="30" height="30" src="../bulletin/images/cate_icon01.gif" alt="<gsmsg:write key="bbs.3" />">
                    </a>
                  </logic:equal>
                  <logic:notEqual name="forumMdl" property="imgBinSid" value="0">
                  <%-- フォーラム画像original --%>
                    <a href="javascript:clickForum(<bean:write name="forumMdl" property="bfiSid" />);">
                      <img width="30" height="30" src="../bulletin/bbs010.do?CMD=getImageFile&bbs010BinSid=<bean:write name="forumMdl" property="imgBinSid" />&bbs010ForSid=<bean:write name="forumMdl" property="bfiSid" />" alt="<gsmsg:write key="bbs.3" />">
                    </a>
                  </logic:notEqual>
                </div>

              </div>

              <%-- フォーラム右 --%>
              <div class="forum_tit_right forum_list_right">
                <%-- 最終書き込み日時 --%>
                <span class="text_base8 forum_tit_left forum_li_writedate"><bean:write name="forumMdl" property="strWriteDate" /></span>

                <%-- メンバー --%>
                <a href="#" class="forum_li_icon_top_member" onclick="clickMemBtn(<bean:write name="forumMdl" property="bfiSid"/>);"><img src="../common/images/groupicon.gif" alt="<gsmsg:write key="cmn.member" />" width="20" height="20" class="img_bottom"></a>
              </div>
              <%-- フォーラムタイトル --%>
              <div class="forum_li_title">
                <a href="javascript:clickForum(<bean:write name="forumMdl" property="bfiSid" />);"><span class="tooltips"><gsmsg:write key="bbs.2" />:<bean:write name="forumMdl" property="bfsThreCnt" />&nbsp;&nbsp;<gsmsg:write key="bbs.16" />:<bean:write name="forumMdl" property="writeCnt" /><br><bean:write name="forumMdl" property="bfiCmtView" filter="false" /></span><span class="<%= titleClass %>"><bean:write name="forumMdl" property="bfiName" /></span></a>

                <%-- 掲示予定あり --%>
                <logic:greaterThan name="forumMdl" property="rsvThreCnt" value="0">
                  <a><span class="tooltips"><gsmsg:write key="bbs.bbs010.4" />:<bean:write name="forumMdl" property="rsvThreCnt"/></span><img src="../bulletin/images/icon_scheduled_post.png" class="forum_icon" width="20" height="20" alt="<gsmsg:write key="bbs.bbs010.4" />" border="1"></a>
                </logic:greaterThan>

                <%-- フォーラムnew画像 --%>
                <logic:equal name="forumMdl" property="newFlg" value="1">
                  <span class="forum_img_new"><img src="../bulletin/images/icon_new.gif" class="forum_icon" height="15" alt="new<gsmsg:write key="cmn.icon" />" border="1"></span>
                </logic:equal>
              </div>

              <div style="clear: both;"></div>
            </li>

            <% parentForumList.add(pfsid); %>
            <% saveParentSid = pfsid; %>
            <% saveLevel = intLevel; %>

          </logic:iterate>
          </logic:notEmpty>
        </li>
        </ul>
      </li>
      </ul>

      <logic:notEmpty name="bbs010Form" property="forumList">

    <bean:size id="count2" name="bbs010Form" property="bbsPageLabel" scope="request" />
    <logic:greaterThan name="count2" value="1">
    <table width="100%" cellpadding="5" cellspacing="0">
      <tr>
        <td align="right">
          <img src="../common/images/arrow2_l.gif" alt="<gsmsg:write key="cmn.previous.page" />" class="img_bottom" height="20" width="20" onClick="buttonPush('prevPage');"><html:select property="bbs010page2" onchange="changePage(1);" styleClass="paging_box text_i">
          <html:optionsCollection name="bbs010Form" property="bbsPageLabel" value="value" label="label" />
        </html:select><img src="../common/images/arrow2_r.gif" alt="<gsmsg:write key="cmn.next.page" />" class="img_bottom" height="20" width="20" onClick="buttonPush('nextPage');">
      </td>
    </tr>
    </table>
    </logic:greaterThan>
    </logic:notEmpty>
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
