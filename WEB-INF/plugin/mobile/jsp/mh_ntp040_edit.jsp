<%@ page pageEncoding="UTF-8" contentType="text/html; charset=Shift_JIS"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>

<bean:define id="frhourval" name="mbhNtp040Form" property="ntp040FrHour" type="java.lang.String"/>
<bean:define id="frminval" name="mbhNtp040Form" property="ntp040FrMin" type="java.lang.String"/>
<bean:define id="tohourval" name="mbhNtp040Form" property="ntp040ToHour" type="java.lang.String"/>
<bean:define id="tominval" name="mbhNtp040Form" property="ntp040ToMin" type="java.lang.String"/>


      <html:hidden property="ntp040FrYear" />
      <html:hidden property="ntp040FrMonth" />
      <html:hidden property="ntp040FrDay" />
      <% Integer lastRowNumber = 0; %>

      <bean:define id="colormsg1" value=""/>
      <bean:define id="colormsg2" value=""/>
      <bean:define id="colormsg3" value=""/>
      <bean:define id="colormsg4" value=""/>
      <bean:define id="colormsg5" value=""/>
      <logic:iterate id="mstr" name="mbhNtp040Form" property="ntp040ColorMsgList" indexId="mId" type="java.lang.String">

      <logic:equal name="mId" value="0">
      <% colormsg1 = mstr; %>
      </logic:equal>
      <logic:equal name="mId" value="1">
      <% colormsg2 = mstr; %>
      </logic:equal>
      <logic:equal name="mId" value="2">
      <% colormsg3 = mstr; %>
      </logic:equal>
      <logic:equal name="mId" value="3">
      <% colormsg4 = mstr; %>
      </logic:equal>
      <logic:equal name="mId" value="4">
      <% colormsg5 = mstr; %>
      </logic:equal>
      </logic:iterate>

      <input type="hidden" id="msgCol1" value="<%= colormsg1 %>" />
      <input type="hidden" id="msgCol2" value="<%= colormsg2 %>" />
      <input type="hidden" id="msgCol3" value="<%= colormsg3 %>" />
      <input type="hidden" id="msgCol4" value="<%= colormsg4 %>" />
      <input type="hidden" id="msgCol5" value="<%= colormsg5 %>" />

      <logic:notEmpty name="mbhNtp040Form" property="ntp040DataModelList">
        <logic:iterate id="dataMdl" name="mbhNtp040Form" property="ntp040DataModelList"  indexId="idx">

            <% lastRowNumber =  idx + 1; %>

            <jsp:include page="/WEB-INF/plugin/mobile/jsp/mh_ntp040_edit_split1.jsp" >
               <jsp:param value="<%=idx%>" name="mbhNtp040_edit_page_idx"/>
            </jsp:include>
            <jsp:include page="/WEB-INF/plugin/mobile/jsp/mh_ntp040_edit_split2.jsp" >
               <jsp:param value="<%=idx%>" name="mbhNtp040_edit_page_idx"/>
            </jsp:include>

        </logic:iterate>

        <input type="hidden" id="editLastRowNum" value="<%= lastRowNumber %>" />

      </logic:notEmpty>