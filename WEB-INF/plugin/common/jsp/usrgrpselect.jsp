<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/ctag-css.tld" prefix="theme" %>
<%@ taglib uri="/WEB-INF/ctag-message.tld" prefix="gsmsg" %>
<%@ page import="jp.groupsession.v2.cmn.GSConst" %>
<%@ page import="jp.groupsession.v2.usr.model.UsrLabelValueBean"%>
<%@ page import="jp.groupsession.v2.cmn.formmodel.UserGroupSelectModel"%>
<%@ page import="java.util.HashMap"%>

<script language="JavaScript" src="../common/js/usrgrpselect.js?<%= GSConst.VERSION_PARAM %>"></script>

<%
    String thisFormName = request.getParameter("thisFormName");
    pageContext.setAttribute("thisFormName", thisFormName);
    pageContext.setAttribute("thisForm", request.getAttribute(request.getParameter("thisFormName")));
    String id = request.getParameter("id");
%>
<bean:define id="thisSelect" name="thisForm" property="<%=id %>" type="UserGroupSelectModel"></bean:define>
<%
    String[] selectListKeys = thisSelect.getKeys();
    HashMap<String, String> dspListTitleMap = thisSelect.getSelectedListName();
    pageContext.setAttribute("selectListKeys", selectListKeys);
%>

    <%-- usrgroupselect初期化処理 --%>
    <script ><!--
        $(function() {
            $('#<%=id %>').usrgrpselect({cmd:'init',key:[
            <logic:iterate id = "entry" name="thisSelect" property="keys">
               "<bean:write name="entry" />",
            </logic:iterate>
            ],
            titles:[
            <logic:iterate id = "entry" name="thisSelect" property="keys">
               "<%=dspListTitleMap.get(entry)%>",
            </logic:iterate>
            ],
            scroll:<bean:write name="thisSelect" property="scrollY"/>,
            banUsrSid:[
            <logic:iterate id = "banUsrSid" name="thisSelect" property="banUsrSid">
                "<bean:write name="banUsrSid" />",
            </logic:iterate>
            ],
            });
        });
    --></script>

    <div id="<%=id %>" style="<bean:write name="thisSelect" property="styleDisplay" />">
      <table width="0%" border="0">
      <tr>
        <td width="35%"/>
        <td width="20%"/>
      <td width="35%" align="left" rowspan="<%=2 * selectListKeys.length + 1%>">
        <input id="<%=id %>.group.all" class="btn_group_n1" value="<gsmsg:write key="cmn.sel.all.group" />" onclick="" type="button"><br>
          <html:select  property="<%=id + \".group.selected\" %>" >
            <logic:notEmpty name="thisForm" property="<%=id + \".group.list\" %>" >
            <logic:iterate id="gpBean" name="thisForm" property="<%=id + \".group.list\" %>">
              <bean:define id="gpValue" name="gpBean" property="value" type="java.lang.String" />
              <% boolean mygrpFlg = gpValue.indexOf("M") == -1; %>
              <% if (mygrpFlg) { %>
                <html:option value="<%= gpValue %>"><bean:write name="gpBean" property="label" /></html:option>
              <% } else { %>
                <html:option styleClass="select03" value="<%= gpValue %>"><bean:write name="gpBean" property="label" /></html:option>
              <% } %>
            </logic:iterate>
            </logic:notEmpty>
          </html:select>
          <input id="<%=id%>.group.select" type="button"  class="group_btn2" value="&nbsp;&nbsp;" id="<%=id %>.group.button"><br />
        <html:select property="<%=id + \".targetNoSelected\" %>" size="13" styleClass="select01" multiple="true">
         <logic:iterate id="rightUser" name="thisForm" property="<%=id + \".noselectList\" %>" >
           <logic:equal value="1" name="rightUser" property="usrUkoFlg">
            <option value='<bean:write name="rightUser" property="value"/>' class="mukouser_option"><bean:write name="rightUser" property="label"/></option>
           </logic:equal>
           <logic:equal value="0" name="rightUser" property="usrUkoFlg">
            <option value='<bean:write name="rightUser" property="value"/>'><bean:write name="rightUser" property="label"/></option>
           </logic:equal>
          </logic:iterate>
        </html:select>
      </td>
      <td width="10%" align="center" valign="bottom">
      </td>
      </tr>
      <%
        int useCnt = 0;
        for (String key : selectListKeys) {
            if (thisSelect.getSelectedListUse().get(key).equals("true")) {
                useCnt++;
            }
        }
        int selectSize = 5;
        if (useCnt == 1) {
            selectSize = 13;
        }
      %>
      <logic:equal name="thisSelect" property="<%=\"selectedListUse.\" + selectListKeys[0]%>" value="true">
      <tr id="<%=id%>.selectedList(<%=selectListKeys[0]%>).head" >
      </logic:equal>
      <logic:notEqual name="thisSelect" property="<%=\"selectedListUse.\" + selectListKeys[0]%>" value="true">
      <tr id="<%=id%>.selectedList(<%=selectListKeys[0]%>).head" style="display: none">
      </logic:notEqual>
      <td  class="table_bg_A5B4E1" align="center"><span class="text_bb1"><%=dspListTitleMap.get(selectListKeys[0]) %></span></td>
      <td  align="center">&nbsp;</td>
      </tr>
      <logic:equal name="thisSelect" property="<%=\"selectedListUse.\" + selectListKeys[0]%>" value="true">
      <tr id="<%=id%>.selectedList(<%=selectListKeys[0]%>)" >
      </logic:equal>
      <logic:notEqual name="thisSelect" property="<%=\"selectedListUse.\" + selectListKeys[0]%>" value="true">
      <tr id="<%=id%>.selectedList(<%=selectListKeys[0]%>)" style="display: none">
      </logic:notEqual>
      <td align="center">
         <logic:iterate id="leftUser" name="thisForm" property="<%=id + \".selectedList(\" + selectListKeys[0] + \")\" %>" type="UsrLabelValueBean">
            <html:hidden property="<%=id + \".selected(\" + selectListKeys[0] + \")\" %>" value="<%=leftUser.getValue() %>"/>
         </logic:iterate>

        <html:select property="<%=id + \".targetSelected\" %>" size="<%= String.valueOf(selectSize) %>" styleClass="select01" multiple="true" style="width:100%;">
         <logic:iterate id="leftUser" name="thisForm" property="<%=id + \".selectedList(\" + selectListKeys[0] + \")\" %>" >
           <logic:equal value="1" name="leftUser" property="usrUkoFlg">
            <option value='<bean:write name="leftUser" property="value"/>' class="mukouser_option"><bean:write name="leftUser" property="label"/></option>
           </logic:equal>
           <logic:equal value="0" name="leftUser" property="usrUkoFlg">
            <option value='<bean:write name="leftUser" property="value"/>'><bean:write name="leftUser" property="label"/></option>
           </logic:equal>
          </logic:iterate>
        </html:select>
      </td>
      <td align="center">
        <input type="button" class="btn_base1add" value="<gsmsg:write key="cmn.add"/>" name="adduserBtn" onClick="$('#<%=id %>').usrgrpselect({cmd:'setScroll'}); buttonPush('<%=id %>.<%= UserGroupSelectModel.CMDACTION_ADD_SELECT%>(<%= selectListKeys[0] %>)');"><br><br>
        <input type="button" class="btn_base1del" value="<gsmsg:write key="cmn.delete" />" name="deluserBtn" onClick="$('#<%=id %>').usrgrpselect({cmd:'setScroll'}); buttonPush('<%=id %>.<%= UserGroupSelectModel.CMDACTION_REM_SELECT%>(<%= selectListKeys[0] %>)');">
      </td>
      </tr>
      <% if (selectListKeys.length > 1) {%>

      <logic:equal name="thisSelect" property="<%=\"selectedListUse.\" + selectListKeys[1]%>" value="true">
      <tr id="<%=id%>.selectedList(<%=selectListKeys[1]%>).head" >
      </logic:equal>
      <logic:notEqual name="thisSelect" property="<%=\"selectedListUse.\" + selectListKeys[1]%>" value="true">
      <tr id="<%=id%>.selectedList(<%=selectListKeys[1]%>).head" style="display: none">
      </logic:notEqual>
      <td width="40%" class="table_bg_A5B4E1" align="center"><span class="text_bb1"><%=dspListTitleMap.get(selectListKeys[1]) %></span></td>
      <td width="20%" align="center">&nbsp;</td>
      </tr>

      <logic:equal name="thisSelect" property="<%=\"selectedListUse.\" + selectListKeys[1]%>" value="true">
      <tr id="<%=id%>.selectedList(<%=selectListKeys[1]%>)" >
      </logic:equal>
      <logic:notEqual name="thisSelect" property="<%=\"selectedListUse.\" + selectListKeys[1]%>" value="true">
      <tr id="<%=id%>.selectedList(<%=selectListKeys[1]%>)" style="display: none">
      </logic:notEqual>
      <td align="center" valign="top">
         <logic:iterate id="leftUser" name="thisForm" property="<%=id + \".selectedList(\" + selectListKeys[1] + \")\" %>" type="UsrLabelValueBean">
            <html:hidden property="<%=id + \".selected(\" + selectListKeys[1] + \")\" %>" value="<%=leftUser.getValue() %>"/>
         </logic:iterate>

        <html:select property="<%=id + \".targetSelected\" %>" size="<%= String.valueOf(selectSize) %>" styleClass="select01" multiple="true" style="width:100%;">
         <logic:iterate id="user" name="thisForm" property="<%=id + \".selectedList(\" + selectListKeys[1] + \")\" %>" >
           <logic:equal value="1" name="user" property="usrUkoFlg">
            <option value='<bean:write name="user" property="value"/>' class="mukouser_option"><bean:write name="user" property="label"/></option>
           </logic:equal>
           <logic:equal value="0" name="user" property="usrUkoFlg">
            <option value='<bean:write name="user" property="value"/>'><bean:write name="user" property="label"/></option>
           </logic:equal>
          </logic:iterate>
        </html:select>

      </td>

      <td align="center" valign="center">
        <input type="button" class="btn_base1add" value="<gsmsg:write key="cmn.add"/>" name="adduserBtn" onClick="$('#<%=id %>').usrgrpselect({cmd:'setScroll'}); buttonPush('<%=id %>.<%= UserGroupSelectModel.CMDACTION_ADD_SELECT%>(<%=  selectListKeys[1] %>)');"><br><br>
        <input type="button" class="btn_base1del" value="<gsmsg:write key="cmn.delete" />" name="deluserBtn" onClick="$('#<%=id %>').usrgrpselect({cmd:'setScroll'}); buttonPush('<%=id %>.<%= UserGroupSelectModel.CMDACTION_REM_SELECT%>(<%= selectListKeys[1] %>)');">
      </td>
      </tr>
      <% } %>
      </table>
   </div>