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


  <table class="tl0 table_td_border2" width="100%" cellpadding="0" cellspacing="0">

  <tr>
  <th width="0%" class="detail_tbl sort_select_area"><input type="checkbox" name="allCheck" onClick="changeChk();"></th>

    <% String[] header_width = new String[] { "27%", "27%", "20%", "27%"}; %>
    <th width="<%= header_width[0] %>" class="detail_tbl sort_select_area">
       <!-- 氏名 -->
       <a href="#" onClick="return sort(<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.SORTKEY_UNAME) %>);">
       <span class="cel_adr_data">
       <logic:equal name="adr330Form" property="adr330searchSVBean.sortKey" value="<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.SORTKEY_UNAME) %>">
          <logic:equal name="adr330Form" property="adr330searchSVBean.orderKey" value="<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.ORDERKEY_ASC) %>" >
               <gsmsg:write key="cmn.name" />▲
          </logic:equal>
          <logic:notEqual name="adr330Form" property="adr330searchSVBean.orderKey" value="<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.ORDERKEY_ASC) %>" >
               <gsmsg:write key="cmn.name" />▼
          </logic:notEqual>
       </logic:equal>
       <logic:notEqual name="adr330Form" property="adr330searchSVBean.sortKey" value="<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.SORTKEY_UNAME) %>">
            <gsmsg:write key="cmn.name" />
       </logic:notEqual>
       </span>
       </a>

       <span class="cel_adr_data">／</span>
   <!-- 役職 -->
       <a href="#" onClick="return sort(<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.SORTKEY_POSITION) %>);">
       <span class="cel_adr_data">
       <logic:equal name="adr330Form" property="adr330searchSVBean.sortKey" value="<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.SORTKEY_POSITION) %>">
          <logic:equal name="adr330Form" property="adr330searchSVBean.orderKey" value="<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.ORDERKEY_ASC) %>" >
               <gsmsg:write key="cmn.post" />▲
          </logic:equal>
          <logic:notEqual name="adr330Form" property="adr330searchSVBean.orderKey" value="<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.ORDERKEY_ASC) %>" >
               <gsmsg:write key="cmn.post" />▼
          </logic:notEqual>
       </logic:equal>
       <logic:notEqual name="adr330Form" property="adr330searchSVBean.sortKey" value="<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.SORTKEY_POSITION) %>">
            <gsmsg:write key="cmn.post" />
       </logic:notEqual>
       </span>
       </a>
    </th>

    <th width="<%= header_width[1] %>" class="detail_tbl sort_select_area">
<!-- 会社名 -->
    <a href="#" onClick="return sort(<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.SORTKEY_CONAME) %>);">
    <span class="cel_adr_data">
    <logic:equal name="adr330Form" property="adr330searchSVBean.sortKey" value="<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.SORTKEY_CONAME) %>">
       <logic:equal name="adr330Form" property="adr330searchSVBean.orderKey" value="<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.ORDERKEY_ASC) %>" >
           <gsmsg:write key="cmn.company.name" />▲
       </logic:equal>
       <logic:notEqual name="adr330Form" property="adr330searchSVBean.orderKey" value="<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.ORDERKEY_ASC) %>" >
           <gsmsg:write key="cmn.company.name" />▼
       </logic:notEqual>
    </logic:equal>
    <logic:notEqual name="adr330Form" property="adr330searchSVBean.sortKey" value="<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.SORTKEY_CONAME) %>">
        <gsmsg:write key="cmn.company.name" />
    </logic:notEqual>
    </span>
    </a>

    <span class="cel_adr_data">／</span>
<!-- 拠点 -->
    <a href="#" onClick="return sort(<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.SORTKEY_COBASENAME) %>);">
    <span class="cel_adr_data">
    <logic:equal name="adr330Form" property="adr330searchSVBean.sortKey" value="<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.SORTKEY_COBASENAME) %>">
       <logic:equal name="adr330Form" property="adr330searchSVBean.orderKey" value="<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.ORDERKEY_ASC) %>" >
           <gsmsg:write key="address.10" />▲
       </logic:equal>
       <logic:notEqual name="adr330Form" property="adr330searchSVBean.orderKey" value="<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.ORDERKEY_ASC) %>" >
           <gsmsg:write key="address.10" />▼
       </logic:notEqual>
    </logic:equal>
    <logic:notEqual name="adr330Form" property="adr330searchSVBean.sortKey" value="<%= String.valueOf(jp.groupsession.v2.adr.adr010.Adr010Const.SORTKEY_COBASENAME) %>">
        <gsmsg:write key="address.10" />
    </logic:notEqual>
    </span>
    </a>
    </th>
    <!-- 電話番号 -->
    <th width="<%= header_width[2] %>" class="detail_tbl sort_select_area" nowrap><span class="cel_adr_data"><gsmsg:write key="cmn.tel" /></span></th>
    <!-- E-MAIL -->
    <th width="<%= header_width[3] %>" class="detail_tbl sort_select_area" nowrap><span class="cel_adr_data">E-MAIL</span></th>

  </tr>


  <logic:iterate id="detailMdl" name="adr330Form" property="detailList">
  <tr class="td_type1">
  <td><html:multibox name="adr330Form" property="adr330selectSid"><bean:write name="detailMdl"  property="adrSid" /></html:multibox></td>
    <td>
     <logic:notEmpty name="detailMdl" property="positionName" >
           <span style="font-size:85%;"><bean:write name="detailMdl" property="positionName" /><br></span>
     </logic:notEmpty>

     <a href="#" onClick="return editAddress('<%= String.valueOf(jp.groupsession.v2.adr.GSConstAddress.PROCMODE_EDIT) %>', '<bean:write name="detailMdl" property="adrSid" />')"><span class="text_link"><bean:write name="detailMdl" property="userName" /></span></a>
     <logic:notEmpty name="detailMdl" property="viewLabelName">
        <br>
        <span class="label_style"><bean:write name="detailMdl" property="viewLabelName" /></span>
     </logic:notEmpty>

     </td>
<!-- 会社名／拠点 -->
     <td><a href="#" onClick="return viewCompany('<bean:write name="detailMdl" property="acoSid" />');"><span class="text_link"><bean:write name="detailMdl" property="companyName" /></span></a>
        <logic:notEmpty name="detailMdl" property="companyBaseName">
        <br>&nbsp;&nbsp;<bean:write name="detailMdl" property="companyBaseName" />
        </logic:notEmpty>

     </td>

     <!-- 電話番号 -->
     <td>
     <logic:notEmpty name="detailMdl" property="tel1">
       <span style="white-space: nowrap">
       <bean:write name="detailMdl" property="tel1" />
       <logic:notEmpty name="detailMdl" property="telCmt1">&nbsp;<span style="font-size: 80%;">(<bean:write name="detailMdl" property="telCmt1" />)</span></logic:notEmpty>
       </span><br>
     </logic:notEmpty>
     <logic:notEmpty name="detailMdl" property="tel2">
       <span style="white-space: nowrap">
       <bean:write name="detailMdl" property="tel2" />
       <logic:notEmpty name="detailMdl" property="telCmt2">&nbsp;<span style="font-size: 80%;">(<bean:write name="detailMdl" property="telCmt2" />)</span></logic:notEmpty>
       </span><br>
     </logic:notEmpty>
     <logic:notEmpty name="detailMdl" property="tel3">
       <span style="white-space: nowrap">
       <bean:write name="detailMdl" property="tel3" />
       <logic:notEmpty name="detailMdl" property="telCmt1">&nbsp;<span style="font-size: 80%;">(<bean:write name="detailMdl" property="telCmt3" />)</span></logic:notEmpty>
       </span>
     </logic:notEmpty>
     </td>

     <!-- E-MAIL -->
     <td>
     <logic:notEmpty name="detailMdl" property="mail1">
       <a href="mailto:<bean:write name="detailMdl" property="mail1" />"><span class="normal_link"><bean:write name="detailMdl" property="mail1" /></span></a>
       <logic:notEmpty name="detailMdl" property="mailCmt1">&nbsp;<span style="font-size: 80%;">(<bean:write name="detailMdl" property="mailCmt1" />)</span></logic:notEmpty>
       <br>
     </logic:notEmpty>
     <logic:notEmpty name="detailMdl" property="mail2">
       <a href="mailto:<bean:write name="detailMdl" property="mail2" />"><span class="normal_link"><bean:write name="detailMdl" property="mail2" /></span></a>
       <logic:notEmpty name="detailMdl" property="mailCmt2">&nbsp;<span style="font-size: 80%;">(<bean:write name="detailMdl" property="mailCmt2" />)</span></logic:notEmpty>
       <br>
     </logic:notEmpty>
     <logic:notEmpty name="detailMdl" property="mail3">
       <a href="mailto:<bean:write name="detailMdl" property="mail3" />"><span class="normal_link"><bean:write name="detailMdl" property="mail3" /></span></a>
       <logic:notEmpty name="detailMdl" property="mailCmt3">&nbsp;<span style="font-size: 80%;">(<bean:write name="detailMdl" property="mailCmt3" />)</span></logic:notEmpty>
       <br>
     </logic:notEmpty>
     </td>

  </tr>
  </logic:iterate>

  </table>
