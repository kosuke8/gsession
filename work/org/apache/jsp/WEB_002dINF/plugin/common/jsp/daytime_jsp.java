/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.47
 * Generated at: 2017-11-24 06:17:38 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.plugin.common.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class daytime_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/WEB-INF/ctag-bean.tld", Long.valueOf(1503020598000L));
    _jspx_dependants.put("/WEB-INF/struts-logic.tld", Long.valueOf(1503020668000L));
    _jspx_dependants.put("/WEB-INF/struts-html.tld", Long.valueOf(1503020668000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fhtml_005fhtml;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005flogic_005fnotEqual_0026_005fvalue_005fproperty_005fname;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fbean_005fdefine_0026_005fvalue_005fid_005fnobody;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fhtml_005fhtml = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005flogic_005fnotEqual_0026_005fvalue_005fproperty_005fname = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fbean_005fdefine_0026_005fvalue_005fid_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fhtml_005fhtml.release();
    _005fjspx_005ftagPool_005flogic_005fnotEqual_0026_005fvalue_005fproperty_005fname.release();
    _005fjspx_005ftagPool_005fbean_005fdefine_0026_005fvalue_005fid_005fnobody.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
 jp.co.sjts.util.date.UDate now = new jp.co.sjts.util.date.UDate(); 
      out.write('\r');
      out.write('\n');
      //  html:html
      org.apache.struts.taglib.html.HtmlTag _jspx_th_html_005fhtml_005f0 = (org.apache.struts.taglib.html.HtmlTag) _005fjspx_005ftagPool_005fhtml_005fhtml.get(org.apache.struts.taglib.html.HtmlTag.class);
      boolean _jspx_th_html_005fhtml_005f0_reused = false;
      try {
        _jspx_th_html_005fhtml_005f0.setPageContext(_jspx_page_context);
        _jspx_th_html_005fhtml_005f0.setParent(null);
        int _jspx_eval_html_005fhtml_005f0 = _jspx_th_html_005fhtml_005f0.doStartTag();
        if (_jspx_eval_html_005fhtml_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\r\n");
            out.write("<head></head>\r\n");
            out.write("<body onload=\"Realdate();\">\r\n");
            out.write("<div id=\"clock\">\r\n");
            out.write("  <div>\r\n");
            out.write("\r\n");
            out.write("    ");
 boolean manStsFlg = true; 
            out.write("\r\n");
            out.write("    ");
            //  logic:notEqual
            org.apache.struts.taglib.logic.NotEqualTag _jspx_th_logic_005fnotEqual_005f0 = (org.apache.struts.taglib.logic.NotEqualTag) _005fjspx_005ftagPool_005flogic_005fnotEqual_0026_005fvalue_005fproperty_005fname.get(org.apache.struts.taglib.logic.NotEqualTag.class);
            boolean _jspx_th_logic_005fnotEqual_005f0_reused = false;
            try {
              _jspx_th_logic_005fnotEqual_005f0.setPageContext(_jspx_page_context);
              _jspx_th_logic_005fnotEqual_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_html_005fhtml_005f0);
              // /WEB-INF/plugin/common/jsp/daytime.jsp(14,4) name = name type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
              _jspx_th_logic_005fnotEqual_005f0.setName("man001Form");
              // /WEB-INF/plugin/common/jsp/daytime.jsp(14,4) name = property type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
              _jspx_th_logic_005fnotEqual_005f0.setProperty("man001mainStatus");
              // /WEB-INF/plugin/common/jsp/daytime.jsp(14,4) name = value type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
              _jspx_th_logic_005fnotEqual_005f0.setValue("1");
              int _jspx_eval_logic_005fnotEqual_005f0 = _jspx_th_logic_005fnotEqual_005f0.doStartTag();
              if (_jspx_eval_logic_005fnotEqual_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                do {
 manStsFlg = false; 
                  int evalDoAfterBody = _jspx_th_logic_005fnotEqual_005f0.doAfterBody();
                  if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                    break;
                } while (true);
              }
              if (_jspx_th_logic_005fnotEqual_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
                return;
              }
              _005fjspx_005ftagPool_005flogic_005fnotEqual_0026_005fvalue_005fproperty_005fname.reuse(_jspx_th_logic_005fnotEqual_005f0);
              _jspx_th_logic_005fnotEqual_005f0_reused = true;
            } finally {
              org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_logic_005fnotEqual_005f0, _jsp_getInstanceManager(), _jspx_th_logic_005fnotEqual_005f0_reused);
            }
            out.write("\r\n");
            out.write("\r\n");
            out.write("    ");
 if (manStsFlg) { 
            out.write("<a href=\"http://biz.gs.sjts.co.jp/worldclock/clock.html\" target=\"_blank\">");
 } 
            out.write("\r\n");
            out.write("    <p class=\"clock-year\"><span id=\"clock-year\"></span></p>\r\n");
            out.write("    <p class=\"clock-time\"><span id=\"clock-day\"></span><span id=\"clock-time\"></span></p>\r\n");
            out.write("    ");
 if (manStsFlg) { 
            out.write("</a>");
 } 
            out.write("\r\n");
            out.write("  </div>\r\n");
            out.write("</div>\r\n");
            out.write("<br>\r\n");
            out.write("\r\n");
            //  bean:define
            org.apache.struts.taglib.bean.DefineTag _jspx_th_bean_005fdefine_005f0 = (org.apache.struts.taglib.bean.DefineTag) _005fjspx_005ftagPool_005fbean_005fdefine_0026_005fvalue_005fid_005fnobody.get(org.apache.struts.taglib.bean.DefineTag.class);
            boolean _jspx_th_bean_005fdefine_005f0_reused = false;
            try {
              _jspx_th_bean_005fdefine_005f0.setPageContext(_jspx_page_context);
              _jspx_th_bean_005fdefine_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_html_005fhtml_005f0);
              // /WEB-INF/plugin/common/jsp/daytime.jsp(24,0) name = id type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
              _jspx_th_bean_005fdefine_005f0.setId("stringMessage");
              // /WEB-INF/plugin/common/jsp/daytime.jsp(24,0) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
              _jspx_th_bean_005fdefine_005f0.setValue("こんばんは");
              int _jspx_eval_bean_005fdefine_005f0 = _jspx_th_bean_005fdefine_005f0.doStartTag();
              if (_jspx_th_bean_005fdefine_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
                return;
              }
              _005fjspx_005ftagPool_005fbean_005fdefine_0026_005fvalue_005fid_005fnobody.reuse(_jspx_th_bean_005fdefine_005f0);
              _jspx_th_bean_005fdefine_005f0_reused = true;
            } finally {
              org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_bean_005fdefine_005f0, _jsp_getInstanceManager(), _jspx_th_bean_005fdefine_005f0_reused);
            }
            java.lang.String stringMessage = null;
            stringMessage = (java.lang.String) _jspx_page_context.findAttribute("stringMessage");
            out.write("\r\n");
            out.write("\r\n");
            out.write("</body>\r\n");
            int evalDoAfterBody = _jspx_th_html_005fhtml_005f0.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_html_005fhtml_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return;
        }
        _005fjspx_005ftagPool_005fhtml_005fhtml.reuse(_jspx_th_html_005fhtml_005f0);
        _jspx_th_html_005fhtml_005f0_reused = true;
      } finally {
        org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_html_005fhtml_005f0, _jsp_getInstanceManager(), _jspx_th_html_005fhtml_005f0_reused);
      }
      out.write("\r\n");
      out.write("<!-- Day and Time -->\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("<!--\r\n");
      out.write("\r\n");
      out.write("timerID = 0;\r\n");
      out.write("\r\n");
 jp.groupsession.v2.struts.msg.GsMessage gsMsg = new jp.groupsession.v2.struts.msg.GsMessage(); 
      out.write('\r');
      out.write('\n');
 String sunday = gsMsg.getMessage(request, "cmn.sunday"); 
      out.write('\r');
      out.write('\n');
 String monday = gsMsg.getMessage(request, "cmn.Monday"); 
      out.write('\r');
      out.write('\n');
 String tuesday = gsMsg.getMessage(request, "cmn.tuesday"); 
      out.write('\r');
      out.write('\n');
 String wednesday = gsMsg.getMessage(request, "cmn.wednesday"); 
      out.write('\r');
      out.write('\n');
 String thursday = gsMsg.getMessage(request, "cmn.thursday"); 
      out.write('\r');
      out.write('\n');
 String friday = gsMsg.getMessage(request, "cmn.friday"); 
      out.write('\r');
      out.write('\n');
 String saturday = gsMsg.getMessage(request, "cmn.saturday"); 
      out.write("\r\n");
      out.write("\r\n");
      out.write("var dayarray=new Array('");
      out.print( sunday );
      out.write("',\r\n");
      out.write("                       '");
      out.print( monday );
      out.write("',\r\n");
      out.write("                       '");
      out.print( tuesday );
      out.write("',\r\n");
      out.write("                       '");
      out.print( wednesday );
      out.write("',\r\n");
      out.write("                       '");
      out.print( thursday );
      out.write("',\r\n");
      out.write("                       '");
      out.print( friday );
      out.write("',\r\n");
      out.write("                       '");
      out.print( saturday );
      out.write("');\r\n");
      out.write("\r\n");
      out.write("//サーバ時間\r\n");
      out.write("var serverdate = new Date(");
      out.print( now.getYear() );
      out.write(',');
      out.write(' ');
      out.print( now.getMonth() );
      out.write("-1, ");
      out.print( now.getIntDay() );
      out.write(',');
      out.write(' ');
      out.print( now.getIntHour() );
      out.write(',');
      out.write(' ');
      out.print( now.getIntMinute() );
      out.write(',');
      out.write(' ');
      out.print( now.getIntSecond() );
      out.write(");\r\n");
      out.write("//サーバ時間(ミリ秒)\r\n");
      out.write("var servertime = serverdate.getTime();\r\n");
      out.write("\r\n");
      out.write("//表示開始時間\r\n");
      out.write("var start = new Date();\r\n");
      out.write("\r\n");
      out.write("function Realdate() {\r\n");
      out.write("\r\n");
      out.write("    //ローカル現在時間\r\n");
      out.write("    var nowdate = new Date();\r\n");
      out.write("    //経過時間 (現在時間と表示開始時間の差)\r\n");
      out.write("    var keika = parseInt((nowdate.getTime() - start.getTime()));\r\n");
      out.write("\r\n");
      out.write("    //表示時間 (サーバ時間 + 経過時間)\r\n");
      out.write("    var showdate = new Date();\r\n");
      out.write("    showdate.setTime(servertime + keika);\r\n");
      out.write("\r\n");
      out.write("    //年\r\n");
      out.write("    var fyear=showdate.getFullYear();\r\n");
      out.write("    //月\r\n");
      out.write("    var month=showdate.getMonth()+1;\r\n");
      out.write("    //日\r\n");
      out.write("    var daym=showdate.getDate();\r\n");
      out.write("    //曜日\r\n");
      out.write("    var day=showdate.getDay();\r\n");
      out.write("\r\n");
      out.write("    //表示文字列 月/日(曜)\r\n");
      out.write("    var rday = month+\"/\"+daym+\"(\"+dayarray[day]+\") \";\r\n");
      out.write("    //表示文字列 時:分\r\n");
      out.write("    (showdate.getHours()<10)?M=\"0\"+showdate.getHours():M=showdate.getHours();\r\n");
      out.write("    (showdate.getMinutes()<10)?S=\"0\"+showdate.getMinutes():S=showdate.getMinutes();\r\n");
      out.write("    var rtime = M+\":\"+S;\r\n");
      out.write("\r\n");
      out.write("    //表示文字列セット\r\n");
      out.write("    document.getElementById(\"clock-year\").innerHTML = fyear;\r\n");
      out.write("    document.getElementById(\"clock-day\").innerHTML = rday;\r\n");
      out.write("    document.getElementById(\"clock-time\").innerHTML = rtime;\r\n");
      out.write("\r\n");
      out.write("    clearTimeout(timerID);\r\n");
      out.write("    timerID = setTimeout(\"Realdate()\",1000*60);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("//10秒毎に再セット\r\n");
      out.write("window.setInterval(\"Realdate()\", 1000*10);\r\n");
      out.write("Realdate();\r\n");
      out.write("// -->\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}