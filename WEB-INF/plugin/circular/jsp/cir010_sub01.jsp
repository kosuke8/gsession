<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<gsmsg:define id="title" msgkey="cmn.title" />
<gsmsg:define id="kakunin" msgkey="cmn.check" />
<gsmsg:define id="nitiji" msgkey="cmn.date" />
<gsmsg:define id="hassinsya" msgkey="cir.2" />

<%
  int[] sortKeyList01 = new int[] {
                       jp.groupsession.v2.cir.GSConstCircular.SORT_TITLE,
                       0,
                       jp.groupsession.v2.cir.GSConstCircular.SORT_DATE,
                       jp.groupsession.v2.cir.GSConstCircular.SORT_USER
                       };
  String[] title_width01 = new String[] { "56", "5", "18", "18" };
  String[] titleList01 = new String[] {
          title,
          kakunin,
          nitiji,
          hassinsya
                       };
  String cif_show_open = String.valueOf(jp.groupsession.v2.cir.GSConstCircular.CIR_INIT_SAKI_PUBLIC);
%>

    <tr>

    <!-- 表タイトル -->
    <!-- 全選択・全解除チェックボックス -->
    <td width="3%" class="td_cir_header2"><input type="checkbox" name="allChk" onClick="changeChk();"></td>

<%
    for (int i = 0; i < sortKeyList01.length; i++) {
      if (i == 1) {
%>
        <th width="<%= title_width01[i] %>%" class="td_cir_header" nowrap><span class="text_base3"><gsmsg:write key="cmn.check" /></span></th>
<%
        continue;
      }

      if (iSortKbn == sortKeyList01[i]) {
        if (iOrderKey == order_desc) {
%>
        <th width="<%= title_width01[i] %>%" class="td_cir_header"><a href="javascript:void(0);" onClick="return onTitleLinkSubmit(<%= sortKeyList01[i] %>, <%= order_asc %>);"><span class="text_base3"><%= titleList01[i] %>▼</span></a></th>
<%
        } else {
%>
        <th width="<%= title_width01[i] %>%" class="td_cir_header"><a href="javascript:void(0);" onClick="return onTitleLinkSubmit(<%= sortKeyList01[i] %>, <%= order_desc %>);"><span class="text_base3"><%= titleList01[i] %>▲</span></a></th>
<%
        }
      } else {
%>
        <th width="<%= title_width01[i] %>%" class="td_cir_header"><a href="javascript:void(0);" onClick="return onTitleLinkSubmit(<%= sortKeyList01[i] %>, <%= order_asc %>);"><span class="text_base3"><%= titleList01[i] %></span></a></th>
<%
      }
    }
%>
    </tr>


  <!-- 表BODY -->
  <logic:notEmpty name="cir010Form" property="cir010CircularList" scope="request">
  <logic:iterate id="cirMdl" name="cir010Form" property="cir010CircularList" scope="request" indexId="idx">
  <bean:define id="backclass" value="smail_td" />
  <bean:define id="backpat" value="<%= String.valueOf((idx.intValue() % 2) + 1) %>" />
  <bean:define id="back" value="<%= String.valueOf(backclass) + String.valueOf(backpat) %>" />

<%
  String font = "";
  String titleFont = "";
%>

  <logic:equal name="cirMdl" property="cvwConf" value="<%= unopen %>">
<%
  font = "sc_ttl_sat";
  titleFont = "text_link";
%>
  </logic:equal>

  <logic:notEqual name="cirMdl" property="cvwConf" value="<%= unopen %>">
<%
  font = "text_p";
  titleFont = "text_p";
%>
  </logic:notEqual>

  <tr>
  <!-- チェックボックス -->
  <td class="<%= String.valueOf(back) %>" align="center">
    <html:multibox name="cir010Form" property="cir010delInfSid">
       <bean:write name="cirMdl" property="cifSid" />-<bean:write name="cirMdl" property="jsFlg" />
    </html:multibox>
  </td>

  <!-- タイトル -->
  <td class="<%= String.valueOf(back) %>"><a href="javascript:void(0)" onClick="return buttonPush('view', '<bean:write name="cirMdl" property="cifSid" />');"><span class="<%= String.valueOf(titleFont) %>"><bean:write name="cirMdl" property="cifTitle" /></span></a></td>

  <td class="<%= String.valueOf(back) %>" align="center">
  <span class="<%= String.valueOf(font) %>">
  <logic:equal name="cirMdl" property="cifShow" value="<%= cif_show_open %>"><bean:write name="cirMdl" property="openCount" />/<bean:write name="cirMdl" property="allCount" /></logic:equal>
  <logic:notEqual name="cirMdl" property="cifShow" value="<%= cif_show_open %>">-</logic:notEqual>
  </span>
  </td>

  <!-- 日付 -->
  <td class="<%= String.valueOf(back) %>" align="center"><span class="<%= String.valueOf(font) %>"><bean:write name="cirMdl" property="dspCifAdate" /></span></td>

  <!-- 発信者 -->
  <td class="<%= String.valueOf(back) %>">
    <logic:equal name="cirMdl" property="cacJkbn" value="<%= String.valueOf(jp.groupsession.v2.cir.GSConstCircular.CAC_JKBN_NORMAL) %>">
    <bean:define id="mukouserClass" value=""/>
    <logic:equal name="cirMdl" property="usrUkoFlg" value="1"><bean:define id="mukouserClass" value="mukouser" /></logic:equal>

    <span class="<%= String.valueOf(font) %> <%=mukouserClass%>"><bean:write name="cirMdl" property="cacName" /></span>
    </logic:equal>
    <logic:notEqual name="cirMdl" property="cacJkbn" value="<%= String.valueOf(jp.groupsession.v2.cir.GSConstCircular.CAC_JKBN_NORMAL) %>">
    <del><span class="<%= String.valueOf(font) %>"><bean:write name="cirMdl" property="cacName" /></span></del>
    </logic:notEqual>
  </td>
  </tr>

  </logic:iterate>
  </logic:notEmpty>
