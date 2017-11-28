<%@page import="jp.groupsession.v2.usr.GSConstUser"%>
<%@page import="jp.groupsession.v2.rsv.GSConstReserve"%>
<%@page import="jp.groupsession.v2.usr.UserUtil"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-jqText.tld" prefix="jquery" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>

  <ul data-role="listview" data-inset="true" data-theme="d" data-dividertheme="c">
    <li>
      <div class="font_xsmall">■<gsmsg:write key="cmn.facility.group" /></div>
      <bean:write name="mbhRsv030Form" property="rsv030GrpName" />
    </li>

    <li>
      <div class="font_xsmall">■<gsmsg:write key="cmn.facility.name" /></div>
      <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030SisetuName" /></span>
    </li>

    <li>
      <div class="font_xsmall">■<gsmsg:write key="cmn.registant" /></div>
      <%-- 新規登録者 --%>
          <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= GSConstReserve.PROC_MODE_EDIT %>">
            <span class="font_xsmail"><gsmsg:write key="reserve.178" />：</span>
          </logic:equal>
          <bean:define id="usrUkoFlg" name="mbhRsv030Form" property="rsv030TorokusyaUkoFlg" type="Integer" />
          <logic:equal value="<%=String.valueOf(GSConstUser.USER_JTKBN_DELETE) %>" name="mbhRsv030Form" property="rsv030TorokusyaJkbn">
          <span class="text_base_rsv "><del><bean:write name="mbhRsv030Form" property="rsv030Torokusya" /></del></span>
          </logic:equal>
          <logic:notEqual value="<%=String.valueOf(GSConstUser.USER_JTKBN_DELETE) %>" name="mbhRsv030Form" property="rsv030TorokusyaJkbn">
          <span class="text_base_rsv <%=UserUtil.getCSSClassNameNormal(usrUkoFlg)%>"><bean:write name="mbhRsv030Form" property="rsv030Torokusya" /></span>
          </logic:notEqual>
        <%-- 最終更新者 --%>
        <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= GSConstReserve.PROC_MODE_EDIT %>">
            <br><span class="font_xsmail"><gsmsg:write key="reserve.179" />：</span>
          <bean:define id="usrUkoFlg" name="mbhRsv030Form" property="rsv030KoshinsyaUkoFlg" type="Integer" />
          <logic:equal value="<%=String.valueOf(GSConstUser.USER_JTKBN_DELETE) %>" name="mbhRsv030Form" property="rsv030KoshinsyaJkbn">
          <span class="text_base_rsv "><del><bean:write name="mbhRsv030Form" property="rsv030Koshinsya" /></del></span>
          </logic:equal>
          <logic:notEqual value="<%=String.valueOf(GSConstUser.USER_JTKBN_DELETE) %>" name="mbhRsv030Form" property="rsv030KoshinsyaJkbn">
          <span class="text_base_rsv <%=UserUtil.getCSSClassNameNormal(usrUkoFlg)%>"><bean:write name="mbhRsv030Form" property="rsv030Koshinsya" /></span>
          </logic:notEqual>
        </logic:equal>
    </li>

  </ul>

<%-- 印刷 --%>
    <logic:equal name="mbhRsv030Form" property="rsv030SisetuKbn" value="<%= String.valueOf(GSConstReserve.RSK_KBN_CAR) %>">
      <logic:equal name="mbhRsv030Form" property="rsvPrintUseKbn" value="<%= String.valueOf(GSConstReserve.RSV_PRINT_USE_YES) %>">
      <div class="font_small">■<gsmsg:write key="reserve.print" /></div>
      <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:equal name="mbhRsv030Form" property="rsv030PrintKbn" value="1"><span class="font_xsmall"><gsmsg:write key="reserve.print.yes" /></span></logic:equal>
        <logic:notEqual name="mbhRsv030Form" property="rsv030PrintKbn" value="1"><span class="font_xsmall"><gsmsg:write key="reserve.print.no" /></span></logic:notEqual>
      </logic:notEqual>
      <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <html:checkbox name="mbhRsv030Form" property="rsv030PrintKbn" value="1" styleId="print"/><label for="print" class="text_base"><span class="font_xsmall"><gsmsg:write key="reserve.print.yes" /></span></label>
        </logic:notEqual>
        <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <logic:equal name="mbhRsv030Form" property="rsv030PrintKbn" value="1"><span class="font_xsmall"><gsmsg:write key="reserve.print.yes" /></span></logic:equal>
          <logic:notEqual name="mbhRsv030Form" property="rsv030PrintKbn" value="1"><span class="font_xsmall"><gsmsg:write key="reserve.print.no" /></span></logic:notEqual>
        </logic:equal>
      </logic:equal>
      </logic:equal>
    </logic:equal>

    <div class="font_small">■<gsmsg:write key="reserve.72" /></div>


    <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
      <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Mokuteki" /></span>
    </logic:notEqual>

    <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
      <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
        <html:text name="mbhRsv030Form" property="rsv030Mokuteki" size="40" maxlength="50" styleClass="text_base_rsv" />
      </logic:notEqual>
      <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
        <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Mokuteki" /></span>
      </logic:equal>
    </logic:equal>

    <logic:equal name="mbhRsv030Form" property="rsv030SisetuKbn" value="<%= String.valueOf(GSConstReserve.RSK_KBN_HEYA) %>">

    <div class="font_small">■<gsmsg:write key="reserve.use.kbn" /></div>
    <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
      <logic:equal name="mbhRsv030Form" property="rsv030UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_NOSET) %>"><gsmsg:write key="reserve.use.kbn.noset" /></logic:equal>
      <logic:equal name="mbhRsv030Form" property="rsv030UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_KAIGI) %>"><gsmsg:write key="reserve.use.kbn.meeting" /></logic:equal>
      <logic:equal name="mbhRsv030Form" property="rsv030UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_KENSYU) %>"><gsmsg:write key="reserve.use.kbn.training" /></logic:equal>
      <logic:equal name="mbhRsv030Form" property="rsv030UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_OTHER) %>"><gsmsg:write key="reserve.use.kbn.other" /></logic:equal>
    </logic:notEqual>
    <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
      <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
      <html:select property="rsv030UseKbn">
        <html:optionsCollection name="mbhRsv030Form" property="rsv030UseKbnLavel" value="value" label="label" />
      </html:select>
      </logic:notEqual>
      <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
        <logic:equal name="mbhRsv030Form" property="rsv030UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_NOSET) %>"><gsmsg:write key="reserve.use.kbn.noset" /></logic:equal>
        <logic:equal name="mbhRsv030Form" property="rsv030UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_KAIGI) %>"><gsmsg:write key="reserve.use.kbn.meeting" /></logic:equal>
        <logic:equal name="mbhRsv030Form" property="rsv030UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_KENSYU) %>"><gsmsg:write key="reserve.use.kbn.training" /></logic:equal>
        <logic:equal name="mbhRsv030Form" property="rsv030UseKbn" value="<%= String.valueOf(GSConstReserve.RSY_USE_KBN_OTHER) %>"><gsmsg:write key="reserve.use.kbn.other" /></logic:equal>
      </logic:equal>
    </logic:equal>

    </logic:equal>

    <bean:define id="rsvSisKbn" name="mbhRsv030Form" property="rsv030SisetuKbn" type="java.lang.Integer" />
    <% int sisKbn = rsvSisKbn; %>

    <% if (sisKbn ==GSConstReserve.RSK_KBN_HEYA
            || sisKbn == GSConstReserve.RSK_KBN_CAR) { %>

    <div class="font_small">■<gsmsg:write key="reserve.contact" /></div>
      <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Contact" /></span>
      </logic:notEqual>
      <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <html:text name="mbhRsv030Form" property="rsv030Contact" size="20" maxlength="20" styleClass="text_base_rsv" />
        </logic:notEqual>
        <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Contact" /></span>
        </logic:equal>
      </logic:equal>

    <% } %>

    <logic:equal name="mbhRsv030Form" property="rsv030SisetuKbn" value="<%= String.valueOf(GSConstReserve.RSK_KBN_HEYA) %>">
      <div class="font_small">■<gsmsg:write key="reserve.guide" /></div>
      <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Guide" /></span>
      </logic:notEqual>
      <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <html:text name="mbhRsv030Form" property="rsv030Guide" size="20" maxlength="20" styleClass="text_base_rsv" />
        </logic:notEqual>
        <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Guide" /></span>
        </logic:equal>
      </logic:equal>

      <div class="font_small">■<gsmsg:write key="reserve.park.num" /></div>
      <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030ParkNum" /></span>
      </logic:notEqual>
      <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <html:text name="mbhRsv030Form" property="rsv030ParkNum" size="20" maxlength="20" styleClass="text_base_rsv" />
        </logic:notEqual>
        <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030ParkNum" /></span>
        </logic:equal>
      </logic:equal>
    </logic:equal>

    <logic:equal name="mbhRsv030Form" property="rsv030SisetuKbn" value="<%= String.valueOf(GSConstReserve.RSK_KBN_CAR) %>">
    <%-- 行先 --%>
      <div class="font_small">■<gsmsg:write key="reserve.dest" /></div>
      <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Dest" /></span>
      </logic:notEqual>
      <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <html:text name="mbhRsv030Form" property="rsv030Dest" size="20" maxlength="20" styleClass="text_base_rsv" />
        </logic:notEqual>
        <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Dest" /></span>
        </logic:equal>
      </logic:equal>
    </logic:equal>

    <div class="font_small">■<gsmsg:write key="cmn.start" /></div>


    <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
      <span class="text_base"><bean:write name="mbhRsv030Form" property="yoyakuFrString" /></span>
    </logic:notEqual>

    <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">

      <jquery:jqtext id="date" name="mbhRsv030Form" property="rsv030FrDate" readonly="true"/>

      <div data-role="navbar" align="center">
        <ul>
          <li>
              <html:select property="rsv030SelectedHourFr">
                <logic:notEmpty name="mbhRsv030Form" property="rsv030HourComboList">
                  <html:optionsCollection name="mbhRsv030Form" property="rsv030HourComboList" value="value" label="label" />
                </logic:notEmpty>
              </html:select>
              <gsmsg:write key="cmn.hour.input" />
          </li>
          <li>
              <html:select property="rsv030SelectedMinuteFr">
                <logic:notEmpty name="mbhRsv030Form" property="rsv030MinuteComboList">
                  <html:optionsCollection name="mbhRsv030Form" property="rsv030MinuteComboList" value="value" label="label" />
                </logic:notEmpty>
              </html:select><gsmsg:write key="cmn.minute.input" />
         </li>
        </ul>
      </div>

    </logic:equal>

    <div class="font_small">■<gsmsg:write key="cmn.end" /></div>

    <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
      <span class="text_base"><bean:write name="mbhRsv030Form" property="yoyakuToString" /></span>
    </logic:notEqual>

    <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
      <jquery:jqtext id="date2" name="mbhRsv030Form" property="rsv030ToDate" readonly="true"/>
      <div data-role="navbar" align="center">
        <ul>
          <li>
              <html:select property="rsv030SelectedHourTo">
                <logic:notEmpty name="mbhRsv030Form" property="rsv030HourComboList">
                  <html:optionsCollection name="mbhRsv030Form" property="rsv030HourComboList" value="value" label="label" />
                </logic:notEmpty>
              </html:select>
              <gsmsg:write key="cmn.hour.input" />
          </li>
          <li>
              <html:select property="rsv030SelectedMinuteTo">
                <logic:notEmpty name="mbhRsv030Form" property="rsv030MinuteComboList">
                  <html:optionsCollection name="mbhRsv030Form" property="rsv030MinuteComboList" value="value" label="label" />
                </logic:notEmpty>
              </html:select>
              <gsmsg:write key="cmn.minute.input" />
         </li>
        </ul>
      </div>
    </logic:equal>
    <br>

    <div class="font_small">■<gsmsg:write key="cmn.content" /></div>


      <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Naiyo" filter="false" /></span>
      </logic:notEqual>

      <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
          <textarea styleClass="text_base_rsv" name="rsv030Naiyo" cols="25" rows="6"" id="inputstr"><bean:write name="mbhRsv030Form" property="rsv030Naiyo" /></textarea>

        </logic:notEqual>

      </logic:equal>

<%-- 編集権限 --%>
      <div class="font_small">■<gsmsg:write key="cmn.edit.permissions" /></div>
      <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <html:select property="rsv030RsyEdit">
          <html:optionsCollection name="mbhRsv030Form" property="rsv030EditLavel" value="value" label="label" />
        </html:select>
      </logic:equal>

      <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:equal name="mbhRsv030Form" property="rsv030RsyEdit" value="<%= String.valueOf(GSConstReserve.EDIT_AUTH_NONE) %>"><gsmsg:write key="cmn.nolimit" /></logic:equal>
        <logic:equal name="mbhRsv030Form" property="rsv030RsyEdit" value="<%= String.valueOf(GSConstReserve.EDIT_AUTH_PER_AND_ADU) %>"><gsmsg:write key="cmn.only.principal.or.registant" /></logic:equal>
        <logic:equal name="mbhRsv030Form" property="rsv030RsyEdit" value="<%= String.valueOf(GSConstReserve.EDIT_AUTH_GRP_AND_ADU) %>"><gsmsg:write key="cmn.only.affiliation.group.membership" /></logic:equal>
      </logic:notEqual>

      <br>

<%-- 公開区分 --%>
      <div class="font_small">■<gsmsg:write key="cmn.public.kbn" /></div>
      <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <html:select property="rsv030Public">
          <html:optionsCollection name="mbhRsv030Form" property="rsv030PublicLavel" value="value" label="label" />
        </html:select>
      </logic:equal>

      <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
        <logic:equal name="mbhRsv030Form" property="rsv030Public" value="<%= String.valueOf(GSConstReserve.PUBLIC_KBN_ALL) %>"><gsmsg:write key="cmn.public" /></logic:equal>
        <logic:equal name="mbhRsv030Form" property="rsv030Public" value="<%= String.valueOf(GSConstReserve.PUBLIC_KBN_PLANS) %>"><gsmsg:write key="reserve.175" /></logic:equal>
        <logic:equal name="mbhRsv030Form" property="rsv030Public" value="<%= String.valueOf(GSConstReserve.PUBLIC_KBN_GROUP) %>"><gsmsg:write key="reserve.176" /></logic:equal>
      </logic:notEqual>

      <br>


<%-- 担当部署/使用者名/人数 --%>
    <% if (sisKbn ==GSConstReserve.RSK_KBN_HEYA
            || sisKbn == GSConstReserve.RSK_KBN_CAR) { %>
    <% String headName="";
           jp.groupsession.v2.struts.msg.GsMessage gsMsg = new jp.groupsession.v2.struts.msg.GsMessage(request);
           String msgTanto = gsMsg.getMessage("reserve.use.name.1");
           String msgUser = gsMsg.getMessage("reserve.use.name.2");
           %>

           <logic:equal name="mbhRsv030Form" property="rsv030SisetuKbn" value="<%= String.valueOf(GSConstReserve.RSK_KBN_HEYA) %>">
           <% headName= msgTanto; %>
           </logic:equal>
           <logic:equal name="mbhRsv030Form" property="rsv030SisetuKbn" value="<%= String.valueOf(GSConstReserve.RSK_KBN_CAR) %>">
           <% headName= msgUser; %>
           </logic:equal>

           <%-- 部署 --%>
           <div class="font_small">■<gsmsg:write key="reserve.busyo" /></div>
           <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
             <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Busyo" /></span>
           </logic:notEqual>
           <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
             <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
               <html:text name="mbhRsv030Form" property="rsv030Busyo" size="20" maxlength="20" styleClass="text_base_rsv" />
             </logic:notEqual>
             <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
               <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030Busyo" /></span>
             </logic:equal>
           </logic:equal>

           <div class="font_small">■<%= headName %></div>
           <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
             <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030UseName" /></span>
           </logic:notEqual>
           <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
             <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
               <html:text name="mbhRsv030Form" property="rsv030UseName" size="20" maxlength="20" styleClass="text_base_rsv" />
             </logic:notEqual>
             <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
               <span class="text_base_rsv"><bean:write name="mbhRsv030Form" property="rsv030UseName" /></span>
             </logic:equal>
           </logic:equal>

           <div class="font_small">■<gsmsg:write key="reserve.use.num" /></div>
           <logic:notEqual name="mbhRsv030Form" property="rsv030EditAuth" value="true">
             <span class="text_base_rsv">他&nbsp;<bean:write name="mbhRsv030Form" property="rsv030UseNum" />人</span>
           </logic:notEqual>
           <logic:equal name="mbhRsv030Form" property="rsv030EditAuth" value="true">
             <logic:notEqual name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
               他&nbsp;<html:text name="mbhRsv030Form" property="rsv030UseNum" size="5" maxlength="5" styleClass="text_base_rsv" style="width:50%; display:inline;"/>人
             </logic:notEqual>
             <logic:equal name="mbhRsv030Form" property="rsv030ProcMode" value="<%= String.valueOf(GSConstReserve.PROC_MODE_POPUP) %>">
               <span class="text_base_rsv">他&nbsp;<bean:write name="mbhRsv030Form" property="rsv030UseNum" />人</span>
             </logic:equal>
           </logic:equal>


    <% } %>
