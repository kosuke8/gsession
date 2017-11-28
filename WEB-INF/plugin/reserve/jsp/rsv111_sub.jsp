<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<%@ page import="jp.groupsession.v2.rsv.GSConstReserve"%>
<%@ page import="jp.groupsession.v2.rsv.rsv310.Rsv310Form" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

<% String maxLengthNaiyo = String.valueOf(GSConstReserve.MAX_LENGTH_NAIYO); %>

<%-- 時間マスタ --%>
      &nbsp;&nbsp;
      <span class="text_base">
        <a href="javaScript:void(0);" onclick="setAmTime();"><gsmsg:write key="cmn.am" />
        <span class="tooltips">
          <bean:write name="rsv111Form" property="rsv110AmFrHour" format="00" />:<bean:write name="rsv111Form" property="rsv110AmFrMin" format="00" />～<bean:write name="rsv111Form" property="rsv110AmToHour" format="00" />:<bean:write name="rsv111Form" property="rsv110AmToMin" format="00" />
        </span>
        </a>
      </span>
      &nbsp;&nbsp;
      <span class="text_base"><a href="javaScript:void(0);" onclick="setPmTime();"><gsmsg:write key="cmn.pm" />
        <span class="tooltips">
          <bean:write name="rsv111Form" property="rsv110PmFrHour" format="00" />:<bean:write name="rsv111Form" property="rsv110PmFrMin" format="00" />～<bean:write name="rsv111Form" property="rsv110PmToHour" format="00" />:<bean:write name="rsv111Form" property="rsv110PmToMin" format="00" />
        </span>
        </a>
      </span>
      &nbsp;&nbsp;
      <span class="text_base"><a href="javaScript:void(0);" onclick="setAllTime();"><gsmsg:write key="cmn.allday" />
        <span class="tooltips">
          <bean:write name="rsv111Form" property="rsv110AllDayFrHour" format="00" />:<bean:write name="rsv111Form" property="rsv110AllDayFrMin" format="00" />～<bean:write name="rsv111Form" property="rsv110AllDayToHour" format="00" />:<bean:write name="rsv111Form" property="rsv110AllDayToMin" format="00" />
        </span>
        </a>
      </span>
    </td>
    </tr>
    <html:hidden styleId="rsv111AmFrHour" property="rsv110AmFrHour"/>
    <html:hidden styleId="rsv111AmFrMin" property="rsv110AmFrMin"/>
    <html:hidden styleId="rsv111AmToHour" property="rsv110AmToHour"/>
    <html:hidden styleId="rsv111AmToMin" property="rsv110AmToMin"/>
    <html:hidden styleId="rsv111PmFrHour" property="rsv110PmFrHour"/>
    <html:hidden styleId="rsv111PmFrMin" property="rsv110PmFrMin"/>
    <html:hidden styleId="rsv111PmToHour" property="rsv110PmToHour"/>
    <html:hidden styleId="rsv111PmToMin" property="rsv110PmToMin"/>
    <html:hidden styleId="rsv111AllDayFrHour" property="rsv110AllDayFrHour"/>
    <html:hidden styleId="rsv111AllDayFrMin" property="rsv110AllDayFrMin"/>
    <html:hidden styleId="rsv111AllDayToHour" property="rsv110AllDayToHour"/>
    <html:hidden styleId="rsv111AllDayToMin" property="rsv110AllDayToMin"/>
    </td>
    </tr>

<tr>
    <td colspan="2" class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.content" /></span></td>
    <td align="left" class="td_type1">
    <%-- textareaの先頭行に入力した改行を反映させるため、開始タグの直後には必ず改行をいれること。 --%>
      <textarea styleClass="text_base_rsv" name="rsv111RsrBiko" style="width:489px;" rows="6" onkeyup="showLengthStr(value, <%= maxLengthNaiyo %>, 'inputlength');" id="inputstr">
<bean:write name="rsv111Form" property="rsv111RsrBiko" /></textarea>
      <br>
      <span class="font_string_count"><gsmsg:write key="cmn.current.characters" />:</span><span id="inputlength" class="font_string_count">0</span>&nbsp;<span class="font_string_count_max">/&nbsp;<%= maxLengthNaiyo %>&nbsp;<gsmsg:write key="cmn.character" /></span>
    </td>
    </tr>

 <tr>
    <td colspan="2" class="table_bg_A5B4E1" nowrap><span class="text_bb1"><gsmsg:write key="cmn.edit.permissions" /></span><span class="text_r2"><gsmsg:write key="cmn.comments" /></span></td>
    <td align="left" class="td_type1">
      <span class="text_base_rsv"><gsmsg:write key="cmn.comments" /><gsmsg:write key="reserve.89" /><br>
      ※<gsmsg:write key="reserve.90" /><br>
      &nbsp;&nbsp;<gsmsg:write key="reserve.91" /></span>
      <br><br>
      <html:radio styleId="lvl1" name="rsv111Form" property="rsv111RsrEdit" value="<%= String.valueOf(GSConstReserve.EDIT_AUTH_NONE) %>" /><label for="lvl1"><gsmsg:write key="cmn.nolimit" /></label>&nbsp;
      <html:radio styleId="lvl2" name="rsv111Form" property="rsv111RsrEdit" value="<%= String.valueOf(GSConstReserve.EDIT_AUTH_PER_AND_ADU) %>" /><label for="lvl2"><gsmsg:write key="cmn.only.principal.or.registant" /></label>&nbsp;
      <html:radio styleId="lvl3" name="rsv111Form" property="rsv111RsrEdit" value="<%= String.valueOf(GSConstReserve.EDIT_AUTH_GRP_AND_ADU) %>" /><label for="lvl3"><gsmsg:write key="cmn.only.affiliation.group.membership" /></label>
    </td>
    </tr>

    <%-- 公開区分 --%>
    <tr>
    <td colspan="2" class="table_bg_A5B4E1" nowrap>
        <span class="text_bb1"><gsmsg:write key="cmn.public.kbn" /></span><logic:equal name="rsv111Form" property="rsv110EditAuth" value="true"><logic:notEqual name="rsv111Form" property="rsv110ProcMode" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PROC_MODE_POPUP) %>"><span class="text_r2"><gsmsg:write key="cmn.comments" /></span></logic:notEqual></logic:equal>
    </td>
    <td align="left" class="td_type1">
        <html:radio name="rsv111Form" property="rsv111RsrPublic" styleId="rsv111Public0" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PUBLIC_KBN_ALL) %>" /><span class="text_base2"><label for="rsv111Public0"><gsmsg:write key="cmn.public" /></label></span>&nbsp;
        <html:radio name="rsv111Form" property="rsv111RsrPublic" styleId="rsv111Public1" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PUBLIC_KBN_PLANS) %>" /><span class="text_base2"><label for="rsv111Public1"><gsmsg:write key="reserve.175" /></label></span>&nbsp;
        <html:radio name="rsv111Form" property="rsv111RsrPublic" styleId="rsv111Public2" value="<%= String.valueOf(jp.groupsession.v2.rsv.GSConstReserve.PUBLIC_KBN_GROUP) %>" /><span class="text_base2"><label for="rsv111Public2"><gsmsg:write key="reserve.176" /></label></span>
    </td>
    </tr>