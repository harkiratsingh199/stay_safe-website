package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class user_005fhome_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/home_menu.jsp");
    _jspx_dependants.add("/carousel.jsp");
  }

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
      out.write("        <div id=\"top\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"pull-left\">\n");
      out.write("                        <p >Contact us on staysafe.web199@gmail.com.</p>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <div class=\"pull-right\">\n");
      out.write("                        <a href=\"user_login1.jsp\"><span class=\"glyphicon glyphicon-log-in\"></span>Sign in</a>\n");
      out.write("                        <a href=\"user_signup.jsp\"><span class=\"glyphicon glyphicon-log-out\"></span>Sign up</a>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        ");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <link rel=\"stylesheet\" href=\"http://www.w3schools.com/lib/w3.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css\">\n");
      out.write("\n");
      out.write("    <!--<head>\n");
      out.write("        <title></title>style=\"background-color: #005b96;\n");
      out.write("    </head>-->\n");
      out.write("    <body>\n");
      out.write("        <div class=\"w3-container\" style=\"background-color: #005b96;\" >\n");
      out.write("            <div class=\"pull-left\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-sm-6\">\n");
      out.write("                        <label style=\"color: #ffffff;\"> StaySafe</label>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-sm-4\">\n");
      out.write("                        <img src=\"app_icon.png\" width=\"40\" height=\"40\"/>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <ul class=\"w3-navbar  w3-card-2\" style=\"background-color: #005b96; color:  #ffffff;\">\n");
      out.write("                <li><a class=\"w3-hover-white\" href=\"./user_home.jsp\" style=\"background-color: #005b96;\">Home</a></li>\n");
      out.write("\n");
      out.write("            </ul>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write(" \n");
      out.write("        <br>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("       <div id=\"carousel-example-generic\" class=\"carousel slide\" data-ride=\"carousel\">\n");
      out.write("        <!-- Indicators -->\n");
      out.write("        <ol class=\"carousel-indicators\">\n");
      out.write("            <li data-target=\"#carousel-example-generic\" data-slide-to=\"0\" class=\"active\"></li>\n");
      out.write("            <li data-target=\"#carousel-example-generic\" data-slide-to=\"1\"></li>\n");
      out.write("            <li data-target=\"#carousel-example-generic\" data-slide-to=\"2\"></li>\n");
      out.write("            <li data-target=\"#carousel-example-generic\" data-slide-to=\"3\"></li>\n");
      out.write("            <li data-target=\"#carousel-example-generic\" data-slide-to=\"4\"></li>\n");
      out.write("        </ol>\n");
      out.write("\n");
      out.write("        <!-- Wrapper for slides -->\n");
      out.write("        <div class=\"carousel-inner\" role=\"listbox\">\n");
      out.write("            <div class=\"item active\">\n");
      out.write("                <img src=\"c5_1.jpg\" alt=\"Deluxe Room  -Hotel Veenus International\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"item\">\n");
      out.write("                <img src=\"cc1.jpg\" alt=\"Super Deluxe Room  -Hotel Veenus International\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"item\">\n");
      out.write("                <img src=\"markerm.jpg\"\n");
      out.write("                     alt=\"Family Room 3 Bed -Hotel Veenus International\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"item\">\n");
      out.write("                <img src=\"cc2.jpg\"\n");
      out.write("                     alt=\"Two Double Bed Room -Hotel Veenus International\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"item\">\n");
      out.write("                <img src=\"cc4.jpg\"\n");
      out.write("                     alt=\"Hotel Reception -Hotel Veenus International\">\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- Controls -->\n");
      out.write("        <a class=\"left carousel-control\" href=\"#carousel-example-generic\" role=\"button\" data-slide=\"prev\">\n");
      out.write("            <span class=\"glyphicon glyphicon-chevron-left\" aria-hidden=\"true\"></span>\n");
      out.write("            <span class=\"sr-only\">Previous</span>\n");
      out.write("        </a>\n");
      out.write("        <a class=\"right carousel-control\" href=\"#carousel-example-generic\" role=\"button\" data-slide=\"next\">\n");
      out.write("            <span class=\"glyphicon glyphicon-chevron-right\" aria-hidden=\"true\"></span>\n");
      out.write("            <span class=\"sr-only\">Next</span>\n");
      out.write("        </a>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <br>\n");
      out.write("        <br>\n");
      out.write("        \n");
      out.write("            <div  id=\"main\">\n");
      out.write("\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"row section\">\n");
      out.write("                        <h2 class=\"headings\">\n");
      out.write("                            <span>About our Website</span>\n");
      out.write("                        </h2>\n");
      out.write("                        <br>\n");
      out.write("                        <div class=\"col-sm-12\">\n");
      out.write("                            <p>\n");
      out.write("                                <b>StaySafe</b>,is an emergency App that,at the click of the power button of your smartphone 4 times sends out the alert messages to your contacts that you feed into the app as the designated receivers or guardians.The message says 'I am in danger.My google location is.The receiver will receive will receive a link to your location giving them your location.The app also prompts you on entering a potential danger location,showing you the danger location on map and sets your phone on vibration.Also the user can press the SMS button in order to send there location to the designated receivers.\n");
      out.write("                            </p>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <br>\n");
      out.write("                <div class=\"container\">\n");
      out.write("\n");
      out.write("                    <h2 class=\"headings\">\n");
      out.write("                        <span>Features</span>\n");
      out.write("                    </h2>\n");
      out.write("                    <div class=\"row facility-row\">\n");
      out.write("                        <br>\n");
      out.write("                        <div class=\"col-sm-3 col-sm-offset-2 col-xs-6 text-center secondrow\">\n");
      out.write("                            <span class=\"glyphicon glyphicon-map-marker\"></span>\n");
      out.write("                            <h4>Add Danger Location</h4>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-sm-3 col-xs-6 text-center\">\n");
      out.write("\n");
      out.write("                            <span class=\"glyphicon glyphicon-calendar\"></span>\n");
      out.write("                            <h4>Track Previous Location</h4>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-sm-3 col-xs-6 text-center\">\n");
      out.write("                            <span class=\"glyphicon glyphicon-plus\"></span>\n");
      out.write("                            <h4>View Stories</h4>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <br>\n");
      out.write("\n");
      out.write("                    <div class=\"row facility-row\">\n");
      out.write("                        <div class=\"col-sm-3 col-sm-offset-2 col-xs-6 text-center secondrow\">\n");
      out.write("                            <span class=\"glyphicon glyphicon-camera\"></span>\n");
      out.write("                            <h4>Live Tracking</h4>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-sm-3 col-xs-6 text-center\">\n");
      out.write("                            <span class=\"glyphicon glyphicon-phone\"></span>\n");
      out.write("                            <h4>Add/View Contacts</h4>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-sm-3 col-xs-6 text-center\">\n");
      out.write("                            <span class=\"glyphicon glyphicon-bell\"></span>\n");
      out.write("                            <h4>Message Facilities</h4>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("       \n");
      out.write("\n");
      out.write("        <div class=\"container-fluid footer\" style=\" color: #000000;\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-sm-12 text-center\" style=\"font-family: 'Open Sans'; font-size: 12px;\"> &copy;2018\n");
      out.write("                        StaySafe. All Rights Reserved\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
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
