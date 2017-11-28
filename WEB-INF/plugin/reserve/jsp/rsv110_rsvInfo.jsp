<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.rsv.GSConstReserve" %>

<div id="longHeader">
  <table class="tl0" cellpadding="5" cellspacing="0" border="0" width="100%">

  <tr>
  <td class="table_bg_A5B4E1" width="20%" nowrap><span class="text_bb1"><gsmsg:write key="cmn.facility.group" /></span></td>
  <td align="left" class="td_type1" width="80%">
    <table width="99%">
    <tr>
    <td align="left" width="100%" class="text_base2" nowrap><span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110GrpName" /></span></td>
    <td align="right" width="0%" nowrap><input type="button" value="<gsmsg:write key="cmn.hide" />" class="btn_base1s" onClick="hideText();">&nbsp;</td>
    </tr>
    </table>
  </td>
  </tr>

  <tr>
  <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="reserve.47" /></span></td>
  <td align="left" class="td_type1"><span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110SisetuKbnName" /></span></td>
  </tr>

  <tr>
  <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.facility.name" /></span></td>
  <td align="left" class="td_type1"><span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110SisetuName" /></span></td>
  </tr>

  <tr>
  <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.asset.register.num" /></span></td>
  <td align="left" class="td_type1"><span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110SisanKanri" /></span></td>
  </tr>

  <logic:notEmpty name="rsv110Form" property="rsv110PropHeaderName4">
  <tr>
  <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><bean:write name="rsv110Form" property="rsv110PropHeaderName4" /></span></td>
  <td align="left" class="td_type1"><span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110Prop4Value" /></span></td>
  </tr>
  </logic:notEmpty>

  <logic:notEmpty name="rsv110Form" property="rsv110PropHeaderName5">
  <tr>
  <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><bean:write name="rsv110Form" property="rsv110PropHeaderName5" /></span></td>
  <td align="left" class="td_type1"><span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110Prop5Value" /></span></td>
  </tr>
  </logic:notEmpty>

  <logic:notEmpty name="rsv110Form" property="rsv110PropHeaderName1">
  <tr>
  <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><bean:write name="rsv110Form" property="rsv110PropHeaderName1" /></span></td>
  <td align="left" class="td_type1"><span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110Prop1Value" /></span></td>
  </tr>
  </logic:notEmpty>

  <logic:notEmpty name="rsv110Form" property="rsv110PropHeaderName2">
  <tr>
  <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><bean:write name="rsv110Form" property="rsv110PropHeaderName2" /></span></td>
  <td align="left" class="td_type1">
    <span class="text_base_rsv">
      <logic:equal name="rsv110Form" property="rsv110Prop2Value" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROP_KBN_KA) %>"><gsmsg:write key="cmn.accepted" /></logic:equal>
      <logic:equal name="rsv110Form" property="rsv110Prop2Value" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROP_KBN_HUKA) %>"><gsmsg:write key="cmn.not" /></logic:equal>
    </span>
  </td>
  </tr>
  </logic:notEmpty>

  <logic:notEmpty name="rsv110Form" property="rsv110PropHeaderName3">
  <tr>
  <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><bean:write name="rsv110Form" property="rsv110PropHeaderName3" /></span></td>
  <td align="left" class="td_type1">
    <span class="text_base_rsv">
      <logic:equal name="rsv110Form" property="rsv110Prop3Value" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROP_KBN_KA) %>"><gsmsg:write key="cmn.accepted" /></logic:equal>
      <logic:equal name="rsv110Form" property="rsv110Prop3Value" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROP_KBN_HUKA) %>"><gsmsg:write key="cmn.not" /></logic:equal>
    </span>
  </td>
  </tr>
  </logic:notEmpty>

  <logic:notEmpty name="rsv110Form" property="rsv110PropHeaderName7">
  <tr>
  <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><bean:write name="rsv110Form" property="rsv110PropHeaderName7" /></span></td>
  <td align="left" class="td_type1">
    <span class="text_base_rsv">
      <logic:equal name="rsv110Form" property="rsv110Prop7Value" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROP_KBN_KA) %>"><gsmsg:write key="cmn.accepted" /></logic:equal>
      <logic:equal name="rsv110Form" property="rsv110Prop7Value" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROP_KBN_HUKA) %>"><gsmsg:write key="cmn.not" /></logic:equal>
    </span>
  </td>
  </tr>
  </logic:notEmpty>

  <logic:notEmpty name="rsv110Form" property="rsv110PropHeaderName6">
  <tr>
  <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><bean:write name="rsv110Form" property="rsv110PropHeaderName6" /></span></td>
  <td align="left" class="td_type1">
    <logic:notEmpty name="rsv110Form" property="rsv110Prop6Value"><span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110Prop6Value" /><gsmsg:write key="cmn.days.after" /></logic:notEmpty></span>
  </td>
  </tr>
  </logic:notEmpty>

  <tr>
  <td class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.memo" /></span></td>
  <td align="left" class="td_type1">
    <span class="text_base_rsv">
      <bean:write name="rsv110Form" property="rsv110Biko" filter="false" /></span>
  </td>
  </tr>

  </table>
</div>

<div id="shortHeader">

  <table class="tl0" cellpadding="5" cellspacing="0" border="0" width="100%">
  <tr>
  <td class="table_bg_A5B4E1" width="20%" nowrap><span class="text_bb1"><gsmsg:write key="cmn.facility.name" /></span></td>
  <td align="left" class="td_type1" width="80%">
    <table width="99%">
    <tr>
    <td align="left" width="100%" class="text_base2" nowrap><span class="text_base_rsv"><bean:write name="rsv110Form" property="rsv110SisetuName" /></span></td>
    <td align="right" width="0%" nowrap><input type="button" value="<gsmsg:write key="cmn.show" />" class="btn_base1s" onClick="showText();">&nbsp;</td>
    </tr>
    </table>
  </tr>
  </table>

</div>