package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class WEBFINAL_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("        <script src=\"jquery-1.12.2.min.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <style>\n");
      out.write("            html,body\n");
      out.write("            {\n");
      out.write("                height:100%;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #wrap\n");
      out.write("            {\n");
      out.write("                min-height: 100%; \n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #main\n");
      out.write("            {\n");
      out.write("                overflow:auto;\n");
      out.write("                padding-bottom:150px; /* this needs to be bigger than footer height*/\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .footer \n");
      out.write("            {\n");
      out.write("                position: relative;\n");
      out.write("                margin-top: -50px; /* negative value of footer height */\n");
      out.write("                height: 50px;\n");
      out.write("                clear:both;\n");
      out.write("                padding-top:20px;\n");
      out.write("                color:#fff;\n");
      out.write("            } \n");
      out.write("            h2 {\n");
      out.write("                width: 100%; \n");
      out.write("                text-align: center; \n");
      out.write("                border-bottom: 1px solid #000; \n");
      out.write("                line-height: 0.1em;\n");
      out.write("                margin: 10px 0 20px; \n");
      out.write("            } \n");
      out.write("\n");
      out.write("            h2 span { \n");
      out.write("                background:#fff; \n");
      out.write("                padding:0 10px; \n");
      out.write("            }\n");
      out.write("            #top{\n");
      out.write("                background-color: #000000;\n");
      out.write("                color: #fff;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        <title>User home</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--        <div id=\"top\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"pull-left\">\n");
      out.write("                        <p >MySearchEngine</p>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                   \n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>-->\n");
      out.write("\n");
      out.write("        \n");
      out.write("            <div  id=\"main\">\n");
      out.write("\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"row section\" style=\"text-align:center;border:1px solid white\">\n");
      out.write("                      \n");
      out.write("                        <br>\n");
      out.write("                        \n");
      out.write("                            \n");
      out.write("                                <form action=\"./web2.jsp\">\n");
      out.write("    <img src=\"search.jpg\"  style=\"width:40%\" >\n");
      out.write("     \n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("    <input type=\"text\" required placeholder=\"Search\" name=\"\" id=\"search\" >\n");
      out.write("<!--            <button type=\"submit\" class=\"btn btn-primary w3-hover-white\"><i class=\"fa fa-search\"></i></button>-->\n");
      out.write("            \n");
      out.write("            <!--<input class=\"btn btn-primary w3-hover-white\" type=\"submit\" value=\"My Search<i class='fa fa-search'></i>\">-->\n");
      out.write("   <button  class=\"btn btn-primary w3-hover-white\" type=\"submit\"><i class=\"fa fa-search\"></i> MySearch</button>\n");
      out.write(" \n");
      out.write("        \n");
      out.write("                     \n");
      out.write("  </form>\n");
      out.write("                        \n");
      out.write("\n");
      out.write("                      \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("</div>\n");
      out.write("                \n");
      out.write("           \n");
      out.write("       \n");
      out.write("        \n");
      out.write("        <div class=\"container-fluid footer\" style=\" color: #000000;\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-sm-12 text-center\" style=\"font-family: 'Open Sans'; font-size: 12px;\"> &copy;2018\n");
      out.write("                        MySearchEngine. All Rights Reserved\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("                 \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
