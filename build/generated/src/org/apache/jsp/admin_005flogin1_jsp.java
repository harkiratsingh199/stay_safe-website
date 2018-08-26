package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class admin_005flogin1_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Login page</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("  <script src=\"jquery-1.12.2.min.js\"></script>\n");
      out.write("  <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("         <h1>LOGIN</h1>\n");
      out.write("        <br>\n");
      out.write("        <div class=\"container\">\n");
      out.write("        <form action=\"admin_login2.jsp\">\n");
      out.write("            \n");
      out.write("          <input type=\"text\"  required placeholder=\"Enter email here\" name=\"email\" class=\"form-control\">\n");
      out.write("          <br>\n");
      out.write("          <br>\n");
      out.write("          <input type=\"password\" required placeholder=\"Enter the password\" name=\"pass\" class=\"form-control\">\n");
      out.write("          <br>\n");
      out.write("          <br>\n");
      out.write("          <input type=\"Submit\" value=\"Submit\" class=\"btn btn-primary\">\n");
      out.write("          <br>\n");
      out.write("          <br>\n");
      out.write("          <a href=\"admin_forget_password1.jsp\"><h5>Forget Password?</h5></a>\n");
      out.write("          </form>\n");
      out.write("        </div>\n");
      out.write("          ");

              String msg=request.getParameter("msg");
              if(msg!=null)
              {
                
      out.write("\n");
      out.write("                \n");
      out.write("                <label>");
      out.print(msg);
      out.write("</label>\n");
      out.write("                \n");
      out.write("                ");

                  
              }
              
            
            
      out.write("\n");
      out.write("        \n");
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
