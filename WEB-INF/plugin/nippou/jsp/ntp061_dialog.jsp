<%@ page pageEncoding="Windows-31J" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>

<%
    String thisFormName = request.getParameter("thisFormName");
    pageContext.setAttribute("thisForm", request.getAttribute(request.getParameter("thisFormName")));
%>

<%-------------------------------- �A�h���X�� --------------------------------%>
<logic:equal name="thisForm" property="ntp061AdrKbn" value="0">
<div id="adrArea" style="position:absolute;bottom:0;display:none;z-index:10;width:100%;height:100%;">
</logic:equal>
<logic:notEqual name="thisForm" property="ntp061AdrKbn" value="0">
<div id="adrArea" style="position:absolute;bottom:0;display:block;z-index:10;width:100%;height:100%;">
</logic:notEqual>

<link rel=stylesheet href="../address/css/address.css?<%= GSConst.VERSION_PARAM %>" type="text/css">
<logic:equal name="thisForm" property="ntp061PopKbn" value="0">
<div class="adrSelArea" align="center" style="background-color:#cccccc;padding:3px;">
</logic:equal>
<logic:notEqual name="thisForm" property="ntp061PopKbn" value="0">
<div class="adrSelArea2" align="center" style="background-color:#cccccc;padding:3px;">
</logic:notEqual>

<html:hidden property="ntp061AdrIndex" />
<html:hidden property="ntp061AdrStr" />
<html:hidden property="ntp061Adrpage" />
<html:hidden property="ntp061AdrparentPageId" />
<html:hidden property="ntp061AdrCompanySid" />
<html:hidden property="ntp061AdrCompanyBaseSid" />
<html:hidden property="ntp061AdrCompanyCode" />
<html:hidden property="ntp061AdrCompanyName" />
<html:hidden property="ntp061Adrmode" />
<html:hidden property="ntp061AdrProAddFlg" />
<html:hidden property="ntp061AdrProAddErrFlg" />
<html:hidden property="ntp061AdrRowNumber" />
<html:hidden property="ntp061AdrPrsMode" />
<html:hidden property="ntp061svAdrCode" />
<html:hidden property="ntp061svAdrCoName" />
<html:hidden property="ntp061svAdrCoNameKn" />
<html:hidden property="ntp061svAdrCoBaseName" />
<html:hidden property="ntp061svAdrAtiSid" />
<html:hidden property="ntp061svAdrTdfk" />
<html:hidden property="ntp061svAdrBiko" />
<html:hidden property="ntp061SearchMode" />

<input type="hidden" name="ntp061Adrtanto" value="0">
<table width="100%" style="background-color:#ffffff;">
<tr>
<td width="100%" align="center">
  <table width="800" id="companyTable">
  <tr>
  <td align="left">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../address/images/header_address_01.gif" border="0" alt="<gsmsg:write key="cmn.addressbook" />"></td>
    <td width="0%" class="header_white_bg_text" align="right" valign="middle" nowrap><span class="plugin_ttl"><gsmsg:write key="cmn.addressbook" /></span></td>
    <td width="0%" class="header_white_bg_text">&nbsp;</td>
    <td width="100%" class="header_white_bg">&nbsp;</td>
    <td width="0%"><img src="../common/images/header_white_end.gif" border="0" alt="<gsmsg:write key="cmn.addressbook" />"></td>
    </tr>
    </table>
    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">
<bean:define id="procMode" name="thisForm" property="ntp061SearchMode" />
<% int sMode = ((Integer) procMode).intValue(); %>
<% if (sMode == 0) { %>
    <table class="tab_table" width="100%" height="34px" border="0" cellpadding="0" cellspacing="0">
    <tr>
    <td class="tab_bg_image_1_on" nowrap>
    <div class="tab_text_area">
    <a href="javascript:change061Tab('<%= String.valueOf(jp.groupsession.v2.adr.GSConstAddress.SEARCH_COMPANY_MODE_50) %>');"><gsmsg:write key="address.adr100.1" /></a>
    </div>
    </td>
    <td class="tab_space" nowrap>&nbsp;</td>
    <td class="tab_bg_image_1_off" nowrap>
    <div class="tab_text_area_right">
    <a href="javascript:change061Tab('<%= String.valueOf(jp.groupsession.v2.adr.GSConstAddress.SEARCH_COMPANY_MODE_DETAIL) %>');"><gsmsg:write key="cmn.advanced.search" /></a>
    </div>
    </td>
    <td class="tab_space" nowrap>&nbsp;</td>
    <td class="tab_bg_underbar" width="100%" align="right" valign="top" nowrap></td>
    <td width="0%" class="tab_head_end"><img src="../common/images/damy.gif" width="10" height="10" border="0" alt=""></td>
    </tr>
    </table>
<div id="select_index">
    <table width="0%" class="tl0" border="0" cellpadding="0">
    <tr class="select_tr">
      <logic:equal name="thisForm" property="ntp061AdrIndex" value="-1">
        <td class="back_select_index2"><span class="select_font_bbt_all"><gsmsg:write key="cmn.all" /></span></td>
      </logic:equal>
      <logic:notEqual name="thisForm" property="ntp061AdrIndex" value="-1">
        <td class="back_index2">
        <a href="javascript:void(0);" onClick="return selectLine('-1');">
        <span class="select_font_blue_all"><gsmsg:write key="cmn.all" /></span>
        </a>
        </td>
      </logic:notEqual>

    <logic:notEmpty name="thisForm" property="ntp061AdrIndexList">
    <logic:iterate id="lineLabel" name="thisForm" property="ntp061AdrIndexList">
      <logic:equal name="lineLabel" property="value" value="0">
        <td class="back_index">
        <a href="javascript:void(0);" onClick="return selectLine('<bean:write name="lineLabel" property="label" />');">
        <span class="select_font_blue"><bean:write name="lineLabel" property="label" /></span>
        </a>
        </td>
      </logic:equal>
      <logic:equal name="lineLabel" property="value" value="1">
        <td class="back_index"><span class="select_font_black"><bean:write name="lineLabel" property="label" /></span></td>
      </logic:equal>
      <logic:equal name="lineLabel" property="value" value="2">
        <td class="back_select_index"><span class="select_font_blue_bbt"><bean:write name="lineLabel" property="label" /></span></td>
      </logic:equal>
    </logic:iterate>
    </logic:notEmpty>
      <logic:equal name="thisForm" property="ntp061AdrIndex" value="99">
        <td style="width:90px!important;" class="back_select_index" nowrap><span class="select_font_bbt_company"><gsmsg:write key="address.adr240.1" /></span></td>
      </logic:equal>
      <logic:notEqual name="thisForm" property="ntp061AdrIndex" value="99">
        <td style="width:90px!important;" class="back_index" nowrap>
        <a href="javascript:void(0);" onClick="return selectLine('99');">
        <span class="select_font_blue_company"><gsmsg:write key="address.adr240.1" /></span>
        </a>
        </td>
      </logic:notEqual>
    </tr>
    </table>
    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">
    <table width="0" class="tl0" border="0" cellpadding="0">
    <tr class="select_detail_tr">
      <logic:equal name="thisForm" property="ntp061AdrStr" value="-1">
        <td class="back_select_index_detail2"><span class="select_font_bbt_all"><gsmsg:write key="cmn.all" /></span></td>
      </logic:equal>
      <logic:notEqual name="thisForm" property="ntp061AdrStr" value="-1">
        <td class="back_index_detail">
        <a href="javascript:void(0);" onClick="return selectStr('-1');"><span class="select_font_blue_all"><gsmsg:write key="cmn.all" /></span></a>
        </td>
      </logic:notEqual>

    <logic:notEmpty name="thisForm" property="ntp061AdrStrList">
    <logic:iterate id="strLabel" name="thisForm" property="ntp061AdrStrList">

      <logic:equal name="strLabel" property="value" value="0">
        <td class="back_index_detail">
        <a href="javascript:void(0);" onClick="return selectStr('<bean:write name="strLabel" property="label" />');">
        <span class="select_font_blue"><bean:write name="strLabel" property="label" /></span>
        </a>
        </td>
      </logic:equal>
      <logic:equal name="strLabel" property="value" value="1">
        <td class="back_index_detail"><span class="select_font_black"><bean:write name="strLabel" property="label" /></span></td>
      </logic:equal>
      <logic:equal name="strLabel" property="value" value="2">
        <td class="back_select_index_detail"><span class="select_font_blue_bbt"><bean:write name="strLabel" property="label" /></span></td>
      </logic:equal>

    </logic:iterate>
    </logic:notEmpty>
    </tr>
    </table>
</div>

<% } else if (sMode == 1) { %>
    <table class="tab_table" width="100%" height="34px" border="0" cellpadding="0" cellspacing="0">
    <tr>
    <td class="tab_bg_image_1_off" nowrap>
    <div class="tab_text_area_right">
    <a href="javascript:change061Tab('<%= String.valueOf(jp.groupsession.v2.adr.GSConstAddress.SEARCH_COMPANY_MODE_50) %>');"><gsmsg:write key="address.adr100.1" /></a>
    </div>
    </td>
    <td class="tab_space" nowrap>&nbsp;</td>
    <td class="tab_bg_image_1_on" nowrap>
    <div class="tab_text_area">
    <a href="javascript:change061Tab('<%= String.valueOf(jp.groupsession.v2.adr.GSConstAddress.SEARCH_COMPANY_MODE_DETAIL) %>');"><gsmsg:write key="cmn.advanced.search" /></a>
    </div>
    </td>
    <td class="tab_bg_underbar" width="100%" align="right" valign="top" nowrap></td>
    <td width="0%" class="tab_head_end"><img src="../common/images/damy.gif" width="10" height="10" border="0" alt=""></td>
    </tr>
    </table>
<div id="select_index">
    <table width="100%" class="tl0 add_tbl_base">
    <tr>
    <th width="10%" class="td_gray text_bb2 srh_ttl_pad" align="left" nowrap><gsmsg:write key="address.7" /></th>
    <td class="td_type1">
      <html:text property="ntp061code" maxlength="20" style="width:275px;" />
    </td>
    <th width="10%" class="td_gray text_bb2 srh_ttl_pad" align="left" nowrap><gsmsg:write key="address.11" /></th>
    <td width="40%" class="td_type1">
      <logic:notEmpty name="thisForm" property="atiCmbList">
        <html:select name="thisForm" property="ntp061atiSid">
          <html:optionsCollection name="thisForm" property="atiCmbList" value="value" label="label" />
        </html:select>
      </logic:notEmpty>
    </td>
    </tr>
    <tr>
    <th width="10%" class="td_gray text_bb2 srh_ttl_pad" align="left" nowrap><gsmsg:write key="cmn.company.name" /></th>
    <td width="40%" class="td_type1">
      <html:text property="ntp061coName" maxlength="50" style="width:275px;" />
    </td>
    <th width="10%" class="td_gray text_bb2 srh_ttl_pad" align="left" nowrap><gsmsg:write key="cmn.prefectures" /></th>
    <td width="40%" class="td_type1">
        <logic:notEmpty name="thisForm" property="tdfkCmbList">
          <html:select name="thisForm" property="ntp061tdfk">
            <html:optionsCollection name="thisForm" property="tdfkCmbList" value="value" label="label" />
          </html:select>
        </logic:notEmpty>
    </td>
    </tr>
    <tr>
    <th width="10%" class="td_gray text_bb2 srh_ttl_pad" align="left" nowrap><gsmsg:write key="address.9" /></th>
    <td class="td_type1"><html:text property="ntp061coNameKn" maxlength="100" style="width:275px;" /></td>
    <th width="10%" class="td_gray text_bb2 srh_ttl_pad" align="left" nowrap><gsmsg:write key="cmn.memo" /></th>
    <td class="td_type1"><html:text property="ntp061biko" maxlength="1000" style="width:275px;" /></td>
    </tr>
    <tr>
    <th width="10%" class="td_gray text_bb2 srh_ttl_pad" align="left" nowrap><gsmsg:write key="address.10" /></th>
    <td class="td_type1" colspan="3"><html:text property="ntp061coBaseName" maxlength="50" style="width:275px;" /></td>
    </tr>
    </table>
    <table cellpadding="5" width="100%">
    <tr>
    <td align="center" width="100%">
      <span><input type="button" value="<gsmsg:write key="cmn.search" />" class="btn_search_n1" onClick="buttonPush('search');"></span>
    </td>
    </tr>
    </table>
</div>
<% }  %>

    <logic:notEmpty name="thisForm" property="ntp061AdrCompanyList">
    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">
    <% String[] tdClass = {"td_type1", "td_type_usr"}; %>
    <logic:notEmpty  name="thisForm" property="pageCmbList">
    <table width="100%" cellpadding="5" cellspacing="0">
    <td align="right">
      <img src="../common/images/arrow2_l.gif" alt="<gsmsg:write key="cmn.previous.page" />" class="img_bottom" width="20" height="20" onClick="return buttonPush('prevPage');" style="cursor:pointer;">
      <html:select name="thisForm" property="ntp061AdrpageTop" styleClass="text_i adrselectbox" onchange="buttonPush('changePageTop');">
        <html:optionsCollection name="thisForm" property="pageCmbList" value="value" label="label" />
      </html:select>
      <img src="../common/images/arrow2_r.gif" alt="<gsmsg:write key="cmn.next.page" />" class="img_bottom" width="20" height="20" onClick="return buttonPush('nextPage');" style="cursor:pointer;">
    </td>
    </tr>
    </table>
    </logic:notEmpty>

  <logic:equal name="thisForm" property="ntp061AdrProAddFlg" value="1">
  <logic:messagesPresent message="false">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tl0">
    <tr>
    <td align="left"><html:errors/><br></td>
    </tr>
    </table>
  </logic:messagesPresent>
  </logic:equal>
<table width="100%" class="tl_companyPopup">
<tr>
<th width="60%" class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="address.118" /></span></th>
<logic:equal name="thisForm" property="ntp061Adrmode" value="0">
<th width="40%" class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.staff" /></span></th>
</logic:equal>

<tr>
<td valign="top">
    <table width="100%" class="tl0 tl_companyPopup" border="0" cellpadding="0">
    <logic:iterate id="companyModel" name="thisForm" property="ntp061AdrCompanyList" indexId="idx">
    <tr>
      <bean:define id="coData" name="companyModel" type="jp.groupsession.v2.adr.adr240.model.Adr240Model" />
      <% String companyId = String.valueOf(coData.getAcoSid()) + ":" + String.valueOf(coData.getAbaSid()); %>
      <% String companyId2 = String.valueOf(coData.getAcoSid()) + "_" + String.valueOf(coData.getAbaSid()); %>
      <td class="comp_select_area" id="<%= companyId %>" style="border-right:none;cursor:pointer;" onClick="return setParent('<%= companyId %>');">
        <input type="hidden" name="ntp061selectCompanyCode<%= companyId2 %>" value="<bean:write name="companyModel" property="acoCode" />">
        <input type="hidden" name="ntp061selectCompanyName<%= companyId %>" value="<bean:write name="companyModel" property="acoName" /> <bean:write name="companyModel" property="abaName" />">
        <bean:write name="companyModel" property="acoName" /> <bean:write name="companyModel" property="abaName" />
      </td>
    </tr>
    </logic:iterate>
    </table>
    </logic:notEmpty>
</td>

<logic:equal name="thisForm" property="ntp061Adrmode" value="0">
<td valign="top">
<div id="tantoArea">
</div>
</td>
</logic:equal>
</tr>
</table>
    <logic:notEmpty  name="thisForm" property="pageCmbList">
    <table width="100%" cellpadding="5" cellspacing="0">
    <td align="right">
      <img src="../common/images/arrow2_l.gif" alt="<gsmsg:write key="cmn.previous.page" />" class="img_bottom" width="20" height="20" onClick="buttonPush('prevPage');" style="cursor:pointer;">
      <html:select name="thisForm" property="ntp061AdrpageBottom" styleClass="text_i adrselectbox" onchange="buttonPush('changePageBottom');">
        <html:optionsCollection name="thisForm" property="pageCmbList" value="value" label="label" />
      </html:select>
      <img src="../common/images/arrow2_r.gif" alt="<gsmsg:write key="cmn.next.page" />" class="img_bottom" width="20" height="20" onClick="buttonPush('nextPage');" style="cursor:pointer;">
    </td>
    </tr>
    </table>
    </logic:notEmpty>
    <IMG SRC="../common/images/spacer.gif" width="1px" height="10px" border="0">
    <table width="100%" class="tl0" border="0" cellpadding="0">
    <tr>
      <td align="center">
      <input type="button" value="<gsmsg:write key="cmn.close" />" class="btn_close_n1" id="adrClose">
      </td>
    </tr>
    </table>
  </td>
  </tr>
  </table>
</td>
</tr>
</table>
</div>
</div>

<%-------------------------------- ���i�I�� --------------------------------%>
<logic:equal name="thisForm" property="ntp061ItmKbn" value="0">
<div id="itmArea" style="position:absolute;bottom:0;display:none;z-index:100;width:100%;height:100%;">
</logic:equal>
<logic:notEqual name="thisForm" property="ntp061ItmKbn" value="0">
<div id="itmArea" style="position:absolute;bottom:0;display:block;z-index:100;width:100%;height:100%;">
</logic:notEqual>
<logic:equal name="thisForm" property="ntp061PopKbn" value="0">
<div class="itmSelArea" align="center" style="background-color:#cccccc;padding:3px;">
</logic:equal>
<logic:notEqual name="thisForm" property="ntp061PopKbn" value="0">
<div class="itmSelArea2" align="center" style="background-color:#cccccc;padding:3px;">
</logic:notEqual>
<logic:notEmpty name="thisForm" property="ntp061ItmSvChkShohinSidList" >
<logic:iterate id="item" name="thisForm" property="ntp061ItmSvChkShohinSidList" >
  <input type="hidden" name="ntp061ItmSvChkShohinSidList" value="<bean:write name="item"/>">
</logic:iterate>
</logic:notEmpty>
<logic:notEmpty name="thisForm" property="ntp061ItmSelectedSid" >
<logic:iterate id="item" name="thisForm" property="ntp061ItmSelectedSid" >
  <input type="hidden" name="ntp061ItmChkShohinSidList" value="<bean:write name="item"/>">
</logic:iterate>
</logic:notEmpty>

<html:hidden property="ntp061ItmNhnSid" />
<html:hidden property="ntp061ItmProcMode" />
<html:hidden property="ntp061ItmReturnPage" />
<html:hidden property="ntp061ItmDspMode" />
<html:hidden property="ntp061ItmInitFlg" />

<%--�@BODY --%>
<table width="100%" cellpadding="5" cellspacing="0" style="background-color:#ffffff;">
<tr>
<td width="100%" align="center">
  <table width="99%" cellpadding="0" cellspacing="0">
  <%-- <table width="70%" cellpadding="0" cellspacing="0"> --%>
  <tr>
  <td align="left">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
    <td width="0%"><img src="../nippou/images/header_nippou_02.gif" border="0" alt="<gsmsg:write key="ntp.1" />"></td>
    <td width="0%" class="header_white_bg_text" nowrap>[ <gsmsg:write key="ntp.58" /><gsmsg:write key="cmn.list" /> ]</td>
    <td width="100%" class="header_white_bg">
    <td width="0%"><img src="../common/images/header_white_end.gif" border="0" alt="<gsmsg:write key="ntp.1" />"></td>
    </tr>
    </table>
  </td>
  </tr>
  <tr>
  <td><img src="../common/images/spacer.gif" style="width:100px; height:10px;" border="0" alt=""></td>
  </tr>
  <logic:messagesPresent message="false">
  <tr><td align="left"><span class="TXT02"><html:errors/></span></td></tr>
  <tr><td><img src="../common/images/spacer.gif" style="width:100px; height:10px;" border="0" alt=""></td></tr>
  </logic:messagesPresent>

  <tr>
  <td align="left">
    <table width="100%" class="tl0" border="0" cellpadding="5">
      <tr>
        <td align="center" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb2"><gsmsg:write key="cmn.category" /></span></td>
        <td align="left" class="td_type20" width="85%" colspan="3">
          <html:select name="thisForm" property="ntp061CatSid" styleClass="select01" style="width:200px;">
          <logic:notEmpty name="thisForm" property="ntp061CategoryList">
          <html:optionsCollection name="thisForm" property="ntp061CategoryList" value="value" label="label" />
          </logic:notEmpty>
          </html:select>
        </td>
      </tr>
      <tr>
        <td align="center" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb2"><gsmsg:write key="ntp.122" /></span></td>
        <td align="left" class="td_type20" width="85%" colspan="3"><html:text name="thisForm" property="ntp061ItmNhnCode" maxlength="13" style="width:131px;" /></td>
      </tr>
      <tr>
        <td align="center" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb2"><gsmsg:write key="ntp.154" /></span></td>
        <td align="left" class="td_type20" width="85%" colspan="3"><html:text name="thisForm" property="ntp061ItmNhnName" maxlength="100" style="width:515px;" /></td>
      </tr>
      <tr>
        <td align="center" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb2"><gsmsg:write key="ntp.76" /></span></td>
        <td align="left" class="td_type20"><html:text name="thisForm" property="ntp061ItmNhnPriceSale" maxlength="12" style="text-align:right; width:113px;" />&nbsp;<span class="text_base7"><gsmsg:write key="project.103" /></span>
          <html:radio name="thisForm" property="ntp061ItmNhnPriceSaleKbn" styleId="ntp061ItmNhnPriceSaleKbn1" value="<%= String.valueOf(jp.groupsession.v2.ntp.ntp130.Ntp130Biz.PRICE_MORE) %>" /><span class="text_base7"><label for="ntp061ItmNhnPriceSaleKbn1"><gsmsg:write key="ntp.66" /></label></span>&nbsp;
          <html:radio name="thisForm" property="ntp061ItmNhnPriceSaleKbn" styleId="ntp061ItmNhnPriceSaleKbn2" value="<%= String.valueOf(jp.groupsession.v2.ntp.ntp130.Ntp130Biz.PRICE_LESS) %>" /><span class="text_base7"><label for="ntp061ItmNhnPriceSaleKbn2"><gsmsg:write key="ntp.67" /></label></span>&nbsp;
      </td>
        <td align="center" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb2"><gsmsg:write key="ntp.77" /></span></td>
        <td align="left" class="td_type20" nowrap><html:text name="thisForm" property="ntp061ItmNhnPriceCost" maxlength="12" style="text-align:right; width:113px;" />&nbsp;<span class="text_base7"><gsmsg:write key="project.103" /></span>
          <html:radio name="thisForm" property="ntp061ItmNhnPriceCostKbn" styleId="ntp061ItmNhnPriceCostKbn1" value="<%= String.valueOf(jp.groupsession.v2.ntp.ntp130.Ntp130Biz.PRICE_MORE) %>" /><span class="text_base7"><label for="ntp061ItmNhnPriceCostKbn1"><gsmsg:write key="ntp.66" /></label></span>&nbsp;
          <html:radio name="thisForm" property="ntp061ItmNhnPriceCostKbn" styleId="ntp061ItmNhnPriceCostKbn2" value="<%= String.valueOf(jp.groupsession.v2.ntp.ntp130.Ntp130Biz.PRICE_LESS) %>" /><span class="text_base7"><label for="ntp061ItmNhnPriceCostKbn2"><gsmsg:write key="ntp.67" /></label></span>&nbsp;
        </td>
      </tr>
      <tr>
        <td align="center" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb2"><gsmsg:write key="cmn.sortkey" />�P</span></td>
        <td align="left" class="td_type20" width="35%" nowrap>
          <html:select name="thisForm" property="ntp061ItmSortKey1" styleClass="select01" style="width: 100px;">
          <logic:notEmpty name="thisForm" property="ntp061ItmSortList">
          <html:optionsCollection name="thisForm" property="ntp061ItmSortList" value="value" label="label" />
          </logic:notEmpty>
          </html:select>
          <html:radio name="thisForm" property="ntp061ItmOrderKey1" styleId="ntp061ItmOrderKey11" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.ORDER_KEY_ASC) %>" /><span class="text_base7"><label for="ntp061ItmOrderKey11"><gsmsg:write key="cmn.order.asc" /></label></span>&nbsp;
          <html:radio name="thisForm" property="ntp061ItmOrderKey1" styleId="ntp061ItmOrderKey12" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.ORDER_KEY_DESC) %>" /><span class="text_base7"><label for="ntp061ItmOrderKey12"><gsmsg:write key="cmn.order.desc" /></label></span>&nbsp;
        </td>
        <td align="center" class="table_bg_A5B4E1" width="15%" nowrap><span class="text_bb2"><gsmsg:write key="cmn.sortkey" />�Q</span></td>
        <td align="left" class="td_type20" width="35%" nowrap>
          <html:select name="thisForm" property="ntp061ItmSortKey2" styleClass="select01" style="width: 100px;">
          <logic:notEmpty name="thisForm" property="ntp061ItmSortList">
          <html:optionsCollection name="thisForm" property="ntp061ItmSortList" value="value" label="label" />
          </logic:notEmpty>
          </html:select>
          <html:radio name="thisForm" property="ntp061ItmOrderKey2" styleId="ntp061ItmOrderKey21" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.ORDER_KEY_ASC) %>" /><span class="text_base7"><label for="ntp061ItmOrderKey21"><gsmsg:write key="cmn.order.asc" /></label></span>&nbsp;
          <html:radio name="thisForm" property="ntp061ItmOrderKey2" styleId="ntp061ItmOrderKey22" value="<%= String.valueOf(jp.groupsession.v2.ntp.GSConstNippou.ORDER_KEY_DESC) %>" /><span class="text_base7"><label for="ntp061ItmOrderKey22"><gsmsg:write key="cmn.order.desc" /></label></span>&nbsp;
        </td>
      </tr>
    </table>
  </td>
  </tr>
  <tr>
  <td><img src="../common/images/spacer.gif" style="width:100px; height:10px;" border="0" alt=""></td>
  </tr>
  <tr>
  <td align="center">
  <input type="button" name="btn_search" class="btn_search_n1" value="<gsmsg:write key="cmn.search" />" onClick="return itemSearchPush('itmsearch');">
  </td>
  </tr>
  <tr>
  <td><img src="../common/images/spacer.gif" style="width:100px; height:10px;" border="0" alt=""></td>
  </tr>

  <logic:notEmpty name="thisForm" property="ntp061ItmShohinList">
  <tr>
  <td align="right">
    <bean:size id="count1" name="thisForm" property="ntp061ItmPageCmbList"  />
    <logic:greaterThan name="count1" value="1">
    <table width="100%" cellpadding="5" cellspacing="0">
      <td align="right">
        <img src="../common/images/arrow_w2.gif" alt="<gsmsg:write key="cmn.previous.page" />" width="13" height="13" onClick="buttonPush('itmprevPage');">
        <html:select property="ntp061ItmPageTop" onchange="itmChangePage(0);" styleClass="itmselectbox">
          <html:optionsCollection name="thisForm" property="ntp061ItmPageCmbList" value="value" label="label" />
        </html:select>
        <img src="../common/images/arrow_w.gif" alt="<gsmsg:write key="project.48" />" width="13" height="13" onClick="buttonPush('itmnextPage');"></td>
      </tr>
    </table>
    </logic:greaterThan>
  </td>
  </tr>
  </logic:notEmpty>
  <tr>
  <td align="left">
    <table class="tl0 table_td_border2" cellpadding="5" cellspacing="0" border="0" width="100%">
    <tr>
      <logic:notEqual name="thisForm" property="ntp061ItmDspMode" value="search">
         <th align="center" class="table_bg_7D91BD" width="5%" nowrap><span class="text_tlw"></span></th>
      </logic:notEqual>
      <th align="center" class="table_bg_7D91BD" width="10%" nowrap><span class="text_tlw"><gsmsg:write key="ntp.122" /></span></th>
      <th align="center" class="table_bg_7D91BD" width="25%" nowrap><span class="text_tlw"><gsmsg:write key="ntp.154" /></span></th>
      <th align="center" class="table_bg_7D91BD" width="10%" nowrap><span class="text_tlw"><gsmsg:write key="ntp.76" /></span></th>
      <th align="center" class="table_bg_7D91BD" width="10%" nowrap><span class="text_tlw"><gsmsg:write key="ntp.77" /></span></th>
      <th align="center" class="table_bg_7D91BD" width="10%" nowrap><span class="text_tlw"><gsmsg:write key="bmk.15" /></span></th>
      <th align="center" class="table_bg_7D91BD" width="10%" nowrap><span class="text_tlw"><gsmsg:write key="ntp.155" /></span></th>
    </tr>
    <logic:notEmpty name="thisForm" property="ntp061ItmShohinList">
    <bean:define id="tdColor" value="" />
    <% String[] tdColors = new String[] {"td_type1", "td_type_usr"}; %>
    <logic:iterate id="syohinMdl" name="thisForm" property="ntp061ItmShohinList" indexId="idx">

    <% tdColor = tdColors[(idx.intValue() % 2)]; %>
    <bean:define id="backclass" value="td_line_color" />
    <bean:define id="backclass_no_edit" value="td_line_no_edit_color" />
    <bean:define id="backpat" value="<%= String.valueOf((idx.intValue() % 2) + 1) %>" />
    <bean:define id="back" value="<%= String.valueOf(backclass) + String.valueOf(backpat) %>" />
    <bean:define id="back_no_edit" value="<%= String.valueOf(backclass_no_edit) + String.valueOf(backpat) %>" />
    <bean:define id="sid" name="syohinMdl" property="nhnSid" type="java.lang.Integer" />

    <% if (Integer.valueOf(backpat) == 1) { %>
    <tr align="center" style="cursor:pointer;" class="<%= String.valueOf(back) %>" id="tr_<%= Integer.toString(sid.intValue()) %>" onclick="clickShohinName('1', <%= Integer.toString(sid.intValue()) %>);">
    <% } else { %>
    <tr align="center" style="cursor:pointer;" class="<%= String.valueOf(back) %>" id="tr_<%= Integer.toString(sid.intValue()) %>" onclick="clickShohinName('2', <%= Integer.toString(sid.intValue()) %>);">
    <% } %>

    <td align="center"><%-- �`�F�b�N�{�b�N�X --%>
    <% if (Integer.valueOf(backpat) == 1) { %>
      <html:multibox property="ntp061ItmChkShohinSidList" value="<%= Integer.toString(sid.intValue()) %>" styleId="1" onclick="clickMulti();"/>
    <% } else { %>
      <html:multibox property="ntp061ItmChkShohinSidList" value="<%= Integer.toString(sid.intValue()) %>" styleId="2" onclick="clickMulti();"/>
    <% } %>
    </td>

    <td align="left"><%-- ���i�R�[�h --%>
    <table><tr><td class="shohin_category">
    <div><bean:write name="syohinMdl" property="nscName" /></div>
    </td></tr></table>
    <logic:equal name="thisForm" property="ntp061ItmDspMode" value="search">
    <a href="#" onclick="return buttonSubmit('edit','<bean:write name="syohinMdl" property="nhnSid" />') ">
    <span class="text_link"><bean:write name="syohinMdl" property="nhnCode" /></span>
    </a>
    </logic:equal>
    <logic:notEqual name="thisForm" property="ntp061ItmDspMode" value="search">
    <span class="text_base7"><bean:write name="syohinMdl" property="nhnCode" /></span>
    </logic:notEqual>
    </td>
    <td align="left"><%-- ���i�� --%>
      <logic:equal name="thisForm" property="ntp061ItmDspMode" value="search">
      <a href="#" onclick="return buttonSubmit('edit','<bean:write name="syohinMdl" property="nhnSid" />') ">
      <span class="text_link"><bean:write name="syohinMdl" property="nhnName" /></span>
      </a>
      </logic:equal>
      <logic:notEqual name="thisForm" property="ntp061ItmDspMode" value="search">
      <span class="text_base7"><bean:write name="syohinMdl" property="nhnName" /></span>
      </logic:notEqual>
    </td>
    <%-- �̔����z --%>
    <td align="right"><span class="text_base7">��<bean:write name="syohinMdl" property="ntp130PriceSale" /></span></td>
    <%-- �������z --%>
    <td align="right"><span class="text_base7">��<bean:write name="syohinMdl" property="ntp130PriceCost" /></span></td>
    <%-- �o�^�� --%>
    <td align="right"><span class="text_base7"><bean:write name="syohinMdl" property="ntp130ADate" /></span></td>
    <%-- �X�V�� --%>
    <td align="right"><span class="text_base7"><bean:write name="syohinMdl" property="ntp130EDate" /></span></td>
    </tr>
    </logic:iterate>
    </logic:notEmpty>
    </table>
  </td>
  </tr>

  <logic:notEmpty name="thisForm" property="ntp061ItmShohinList">
  <tr>
  <td align="right">
    <bean:size id="count1" name="thisForm" property="ntp061ItmPageCmbList"  />
    <logic:greaterThan name="count1" value="1">
      <table width="100%" cellpadding="5" cellspacing="0">
        <td align="right">
          <img src="../common/images/arrow_w2.gif" alt="<gsmsg:write key="cmn.previous.page" />" width="13" height="13" onClick="buttonPush('itmprevPage');">
          <html:select property="ntp061ItmPageBottom" onchange="itmChangePage(1);" styleClass="itmselectbox">
            <html:optionsCollection name="thisForm" property="ntp061ItmPageCmbList" value="value" label="label" />
          </html:select>
          <img src="../common/images/arrow_w.gif" alt="<gsmsg:write key="project.48" />" width="13" height="13" onClick="buttonPush('itmnextPage');"></td>
        </tr>
      </table>
    </logic:greaterThan>
  </td>
  </tr>
  </logic:notEmpty>
  </table>

  <input type="button" class="btn_base1" value="<gsmsg:write key="cmn.select" />" onClick="return itemSelectPush('itmok');">
  <input type="button" value="<gsmsg:write key="cmn.close" />" class="btn_close_n1" id="itmClose">
</td>
</tr>
</table>
</div>
</div>

<%-------------------------------- �A�h���X���_�C�A���O���J�ڎ� --------------------------------%>
<logic:notEqual name="thisForm" property="ntp061AdrKbn" value="0">
<script type="text/javascript">
Glayer.show();
$(".adrselectbox").css('visibility','visible');
</script>
</logic:notEqual>

<%-------------------------------- ���i�_�C�A���O���J�ڎ� --------------------------------%>
<logic:notEqual name="thisForm" property="ntp061ItmKbn" value="0">
<script type="text/javascript">
Glayer.show();
$(".itmselectbox").css('visibility','visible');
</script>
</logic:notEqual>

<%-------------------------------- �o�^�m�F�_�C�A���O --------------------------------%>
<logic:notEqual name="thisForm" property="ntp061PopKbn" value="0" >
<logic:notEqual name="thisForm" property="ntp061AddFlg" value="0" >
<div id="dialogAddOk" title="<gsmsg:write key="cmn.entry" /><gsmsg:write key="cmn.check" />" style="display:none">
    <p>
      <span class="ui-icon ui-icon-info" style="float:left; margin:0 7px 20px 0;"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><gsmsg:write key="ntp.78" /></b>
    </p>
</div>
<script type="text/javascript">
addOkOpen();
</script>
</logic:notEqual>
</logic:notEqual>

<%-------------------------------- �o�^�����_�C�A���O --------------------------------%>
<logic:notEqual name="thisForm" property="ntp061PopKbn" value="0">
<logic:notEqual name="thisForm" property="ntp061AddCompFlg" value="0">
<div id="dialogAddComp" title="<gsmsg:write key="cmn.entry" /><gsmsg:write key="ntp.75" />" style="display:none">
    <p>
      <span class="ui-icon ui-icon-info" style="float:left; margin:0 7px 20px 0;"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><gsmsg:write key="ntp.79" /></b>
    </p>
</div>
<script type="text/javascript">
addCompOpen();
</script>
</logic:notEqual>
</logic:notEqual>



<%-------------------------------- ���i�������G���[�_�C�A���O --------------------------------%>
<div id="dialog_error" class="error_dialog" title="" style="display:none">
    <p>
      <table>
        <tr>
          <td class="ui-icon ui-icon-alert" valign="middle"></td>
          <td id="error_msg" valign="middle" style="padding-left:20px;" class="shohinErrorStr"></td>
        </tr>
      </table>
    </p>
</div>

<div id="mikomidoPop" title="<gsmsg:write key="ntp.84" />" style="display:none;">
  <p>
    <div style="border:solid 1px;border-color:#9a9a9a;height:300px;overflow-y: scroll">
      <table class="table_td_border2" width="100%" cellpadding="0" cellspacing="0">
        <logic:notEmpty name="thisForm" property="ntp061MikomidoMsgList">
          <logic:iterate id="mmdMdl" name="thisForm" property="ntp061MikomidoMsgList">
            <tr>
              <td class="table_bg_A5B4E1" width="20%" align="center">
                <span style="font-size:16px;font-weight:bold;color:#333333;"><bean:write name="mmdMdl" property="nmmName" /></span>
              </td>

              <td width="80%">
                <span style="font-size:14px;font-weight:bold;color:#333333;"><bean:write name="mmdMdl" property="nmmMsg" filter="false" /></span>
              </td>
            </tr>
          </logic:iterate>
        </logic:notEmpty>
      </table>
    </div>
  </p>
</div>
