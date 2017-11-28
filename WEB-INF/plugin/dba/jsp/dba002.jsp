<%@ page pageEncoding="Windows-31J" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>

      <logic:notEmpty name="dba001Form" property="resultMessage" scope="request">
      <!-- Messages -->
      <span><bean:write name="dba001Form" property="resultMessage" /></span>
      </logic:notEmpty>
  	  <logic:notEmpty name="dba001Form" property="dba001ResultHeaderName" scope="request">

      <logic:notEmpty name="dba001Form" property="sqlExeTime" scope="request"><bean:write name="dba001Form" property="sqlExeTime" /></logic:notEmpty>

      <!-- Header Name -->
	  <table>
	  <tr>
	  <logic:iterate id="rheadName" name="dba001Form" property="dba001ResultHeaderName" scope="request">
	  <th nowrap><bean:write name="rheadName" /></th>
	  </logic:iterate>
	  </tr>
      <!-- Data Table -->
	  <logic:iterate id="row" name="dba001Form" property="dba001ResultData" scope="request" indexId="idx">
	  <bean:define id="tdColor" value="" />
	  <% String[] tdColors = new String[] {"kisu", "gusu"}; 
	  %><% tdColor = tdColors[(idx.intValue() % 2)]; %>
	  <tr class="<%= tdColor %>">
	  <logic:iterate id="data" name="row">
	  <td><bean:write name="data" /></td>
	  </logic:iterate>
	  </tr>
	  </logic:iterate>
	  </table>

	  </logic:notEmpty>