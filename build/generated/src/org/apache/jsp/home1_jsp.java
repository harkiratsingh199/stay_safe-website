package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class home1_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/user_menu.jsp");
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

      out.write('\n');
      out.write('\n');
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <link rel=\"stylesheet\" href=\"http://www.w3schools.com/lib/w3.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css\">\n");
      out.write("\n");
      out.write("    <!--<head>\n");
      out.write("        <title></title>style=\"background-color: #005b96;\n");
      out.write("    </head>-->\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div class=\"w3-container\" style=\"background-color: #005b96;\"  >\n");
      out.write("           <div class=\"pull-left\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-sm-6\">\n");
      out.write("                    <label style=\"color: #ffffff;\"> StaySafe</label>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-4\">\n");
      out.write("                    <img src=\"app_icon.png\" width=\"40\" height=\"40\"/>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("           </div>\n");
      out.write("            <div class=\"pull-right\">\n");
      out.write("            <ul class=\"w3-navbar  w3-card-2\" style=\"background-color: #005b96; color:  #ffffff;\">\n");
      out.write("                <li><a class=\"w3-hover-white\" href=\"./user_home2.jsp\" style=\"background-color: #005b96; color:  #ffffff;\">Home</a></li>\n");
      out.write("                <li><a class=\"w3-hover-white\" href=\"./home1.jsp\" style=\"background-color: #005b96; color:  #ffffff;\">Stories</a></li>\n");
      out.write("                <li class=\"w3-dropdown-hover w3-hover-white\" style=\"background-color: #005b96; color:  #ffffff;\">\n");
      out.write("                    <a class=\"w3-hover-white\" href=\"#\" style=\"background-color: #005b96; color:  #ffffff;\">Contacts <i class=\"fa fa-caret-down\"></i></a>\n");
      out.write("                    <div class=\"w3-dropdown-content w3-hoover-white w3-card-4\" style=\"background-color: #005b96; color:  #ffffff;\">\n");
      out.write("                        <a class=\"w3-hover-white\" href=\"./add_contact1.jsp\" style=\"background-color: #005b96; color:  #ffffff;\">Add Contacts</a>\n");
      out.write("                        <a class=\"w3-hover-white\" href=\"./View_contacts.jsp\" style=\"background-color: #005b96; color:  #ffffff;\">View Contacts</a>\n");
      out.write("                    </div>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"w3-dropdown-hover w3-hover-white\" style=\"background-color: #005b96; color:  #ffffff;\">\n");
      out.write("                    <a class=\"w3-hover-white\" href=\"#\" style=\"background-color: #005b96; color:  #ffffff;\">Maps <i class=\"fa fa-caret-down\"></i></a>\n");
      out.write("                    <div class=\"w3-dropdown-content w3-hover-white w3-card-4\" style=\"background-color: #005b96;color:  #ffffff;\">\n");
      out.write("                        <a class=\"w3-hover-white\"  href=\"./map_load.jsp\" style=\"background-color: #005b96; color:  #ffffff;\">Mark Danger Location</a>\n");
      out.write("                        <a class=\"w3-hover-white\" href=\"./view_all_location.jsp\" style=\"background-color: #005b96; color:  #ffffff;\">View All Danger Locations</a>\n");
      out.write("                    </div>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"w3-dropdown-hover w3-hover-white\" style=\"background-color: #005b96;\">\n");
      out.write("                    <a class=\"w3-hover-white\" href=\"#\" style=\"background-color: #005b96; color:  #ffffff;\">Tracking <i class=\"fa fa-caret-down\"></i></a>\n");
      out.write("                    <div class=\"w3-dropdown-content w3-hover-white w3-card-4\" style=\"background-color: #005b96; color:  #ffffff;\">\n");
      out.write("                        <a class=\"w3-hover-white\" href=\"./live_tracking.jsp\" style=\"background-color: #005b96; color:  #ffffff;\">Live Tracking</a>\n");
      out.write("                        <a class=\"w3-hover-white\" href=\"./find_on_date.jsp\" style=\"background-color: #005b96; color:  #ffffff;\">Find Me On Date</a>\n");
      out.write("                    </div>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"w3-dropdown-hover w3-hover-white\" style=\"background-color: #005b96; color:  #ffffff;\">\n");
      out.write("                    <a class=\"w3-hover-white\" href=\"#\" style=\"background-color: #005b96; color:  #ffffff;\">Settings <i class=\"fa fa-caret-down\"></i></a>\n");
      out.write("                    <div class=\"w3-dropdown-content w3-hover-white w3-card-4\" style=\"background-color: #005b96; color:  #ffffff;\">\n");
      out.write("                        <a class=\"w3-hover-white\" href=\"./user_change_password1.jsp\" style=\"background-color: #005b96; color:  #ffffff;\">Change Password</a>\n");
      out.write("                        <a class=\"w3-hover-white\" href=\"./logout.jsp\" style=\"background-color: #005b96; color:  #ffffff;\">Log Out</a>\n");
      out.write("                    </div>\n");
      out.write("                </li>\n");
      out.write("\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("        <script src=\"jquery-1.12.2.min.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("        <title>Home Page</title>\n");
      out.write("\n");
      out.write("        <script src=\"http://maps.googleapis.com/maps/api/js\"></script>\n");
      out.write("        <script>\n");
      out.write("            var map;\n");
      out.write("            var zoom_level = 9;\n");
      out.write("//            var myCenter = new google.maps.LatLng(42.26320689654081,-82.93224711055763);\n");
      out.write("            var myCenter = new google.maps.LatLng(42.26320689654081,-82.93224711055763);\n");
      out.write("\n");
      out.write("            function initialize()\n");
      out.write("            {\n");
      out.write("                var mapProp = {\n");
      out.write("                    center: myCenter,\n");
      out.write("                    zoom: zoom_level,\n");
      out.write("                    mapTypeId: google.maps.MapTypeId.ROADMAP\n");
      out.write("                };\n");
      out.write("                map = new google.maps.Map(document.getElementById(\"googleMap\"), mapProp);\n");
      out.write("                google.maps.event.addListener(map, 'click', function (event)\n");
      out.write("                {\n");
      out.write("                    var ans = confirm(\"Are you sure to mark this as Danger Location ?\");\n");
      out.write("                    if (ans)\n");
      out.write("                    {\n");
      out.write("                        getLocationDetails(event.latLng.lat(), event.latLng.lng());\n");
      out.write("                    }\n");
      out.write("\n");
      out.write("                });\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function placeMarker(location)\n");
      out.write("            {\n");
      out.write("                var marker;\n");
      out.write("\n");
      out.write("                marker = new google.maps.Marker({\n");
      out.write("                    position: location,\n");
      out.write("                    map: map,\n");
      out.write("//                    title: 'click to delete'\n");
      out.write("                });\n");
      out.write("\n");
      out.write("                marker.info = new google.maps.InfoWindow({\n");
      out.write("                    content: location + \"\"\n");
      out.write("                });\n");
      out.write("\n");
      out.write("                marker.addListener('mouseover', function () {\n");
      out.write("                    marker.info.open(map, marker);\n");
      out.write("                });\n");
      out.write("\n");
      out.write("                marker.addListener('mouseout', function () {\n");
      out.write("                    marker.info.close();\n");
      out.write("                });\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function getLocationDetails(latitude, longitude)\n");
      out.write("            {\n");
      out.write("                var geocoder;\n");
      out.write("                geocoder = new google.maps.Geocoder();\n");
      out.write("                var latlng = new google.maps.LatLng(latitude, longitude);\n");
      out.write("                geocoder.geocode({'latLng': latlng}, function (results, status)\n");
      out.write("                {\n");
      out.write("                    if (status == google.maps.GeocoderStatus.OK)\n");
      out.write("                    {\n");
      out.write("                        if (results[0])\n");
      out.write("                        {\n");
      out.write("                            var add = results[0].formatted_address;\n");
      out.write("                            var value = add.split(\",\");\n");
      out.write("                            count = value.length;\n");
      out.write("                            country = value[count - 1];\n");
      out.write("                            state = value[count - 2];\n");
      out.write("                            var city = value[count - 3];\n");
      out.write("                            document.getElementById(\"locationarea\").innerHTML = latitude + \"^\" + longitude + \"^\" + add;\n");
      out.write("                            placeMarker(new google.maps.LatLng(latitude, longitude));\n");
      out.write("\n");
      out.write("                        }\n");
      out.write("                        else\n");
      out.write("                        {\n");
      out.write("                            alert(\"no address found\");\n");
      out.write("                        }\n");
      out.write("                    }\n");
      out.write("                    else\n");
      out.write("                    {\n");
      out.write("//                        console.log(\"geo coder failed with status \" + status);\n");
      out.write("\n");
      out.write("                        alert(\"geo coder failed with status \" + status);\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("                );\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function loadAlreadyMarked(location)\n");
      out.write("            {\n");
      out.write("//                alert(location);\n");
      out.write("                initialize();\n");
      out.write("                var loc = location.split(\"^\");\n");
      out.write("                var lat = loc[0];\n");
      out.write("                var long = loc[1];\n");
      out.write("//                alert(lat+\", \"+long);\n");
      out.write("                placeMarker(new google.maps.LatLng(lat, long));\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function deletePost(pid)\n");
      out.write("            {\n");
      out.write("                var ans = confirm(\"Are you sure to delete this post ?\");\n");
      out.write("                if (ans == true)\n");
      out.write("                {\n");
      out.write("                    var xmlhttp = new XMLHttpRequest();\n");
      out.write("                    xmlhttp.onreadystatechange = function ()\n");
      out.write("                    {\n");
      out.write("                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)\n");
      out.write("                        {\n");
      out.write("                            window.location.reload();\n");
      out.write("                        }\n");
      out.write("                    };\n");
      out.write("                    xmlhttp.open(\"GET\", \"./delete_post.jsp?pid=\" + pid, true);\n");
      out.write("                    xmlhttp.send();\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("            function postComment(pid)\n");
      out.write("            {\n");
      out.write("\n");
      out.write("                if (event.keyCode == 13)\n");
      out.write("                {\n");
      out.write("                    var comment = document.getElementById(\"comment_text\" + pid).value;\n");
      out.write("//                    alert(comment);\n");
      out.write("                    var xml = new XMLHttpRequest();\n");
      out.write("                    xml.onreadystatechange = function ()\n");
      out.write("                    {\n");
      out.write("                        if (xml.readyState == 4 && xml.status == 200)\n");
      out.write("                        {\n");
      out.write("//                            document.getElementById(\"comment_text\").value = \"\";\n");
      out.write("                            window.location.reload();\n");
      out.write("\n");
      out.write("                        }\n");
      out.write("                    };\n");
      out.write("                    xml.open(\"GET\", \"./add_comments.jsp?pid=\" + pid + \"&comment=\" + comment, true);\n");
      out.write("                    xml.send();\n");
      out.write("\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function fetchcommentsonthispost(pid)\n");
      out.write("            {\n");
      out.write("                var xml = new XMLHttpRequest();\n");
      out.write("                xml.onreadystatechange = function ()\n");
      out.write("                {\n");
      out.write("                    if (xml.readyState == 4 && xml.status == 200)\n");
      out.write("                    {\n");
      out.write("                        document.getElementById(\"post_modal_body\").innerHTML = xml.responseText;\n");
      out.write("                    }\n");
      out.write("                };\n");
      out.write("                xml.open(\"GET\", \"./fetchcommentsonthispost.jsp?pid=\" + pid, true);\n");
      out.write("                xml.send();\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            google.maps.event.addDomListener(window, 'load', initialize);\n");
      out.write("        </script>\n");
      out.write("<!--        <style>\n");
      out.write("         html,body\n");
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
      out.write("            }    \n");
      out.write("        \n");
      out.write("        </style>-->\n");
      out.write("            \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            String email = (String) session.getAttribute("user_email");
            String prof_pic = (String) session.getAttribute("user_pic");
            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
            Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rset = st.executeQuery("select * from user_signup where email='" + email + "'");
            if (rset.next()) {
                String myFn = rset.getString("first_name");
                String myLn = rset.getString("last_name");
                String myProfilepic = rset.getString("profile_pic");
//                                String myTime = rset.getString("NOW()");

        
      out.write("\n");
      out.write("        <div class=\"w3-container\" style=\"background-color: whitesmoke;\">\n");
      out.write("\n");
      out.write("            <div class=\"row\"  style=\"height: 110px;\">\n");
      out.write("                <div class=\"jumbotron\" style=\"background-image:url(jbg.jpg); background-size: 100%; ;color: #ffffff; text-transform: uppercase;\">\n");
      out.write("\n");
      out.write("                    <img  class=\"img img-rounded\" src=\"");
      out.print(prof_pic);
      out.write("\" style=\"margin-left: 230px;\"width=\"80\" height=\"75\"/>");
      out.print(myFn);
      out.write(' ');
      out.print(myLn);
      out.write("\n");
      out.write("                 \n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div id=\"sidebar1\" class=\"col-sm-2\" >\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <div id=\"main\" class=\"col-sm-8\" >\n");
      out.write("                    <br>\n");
      out.write("                    <div class=\"row \" style=\"background-color: white; border: 2px navy hidden;\">\n");
      out.write("\n");
      out.write("                        <div class=\"row\" style=\"padding: 10px;\" >\n");
      out.write("                            <div class=\"col-sm-1\" ><img class=\"img img-rounded\" src=\"");
      out.print(myProfilepic);
      out.write("\" width=\"80\" height=\"80\"/></div>\n");
      out.write("                            <div class=\"col-sm-11\" style=\"position: relative;left: 50px;\"><label style=\"text-transform: capitalize; text-decoration-color: #23527c;\"><u>");
      out.print(myFn);
      out.write(' ');
      out.print(myLn);
      out.write("</u></label><br></div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"col-sm-12\" style=\"padding-left: 50px; padding-bottom: 10px;\">\n");
      out.write("                                <form role=\"form\" action=\"add_story2.jsp\" method=\"post\">    \n");
      out.write("                                    <div class=\"form-group\" style=\"padding-right: 10px;\">\n");
      out.write("                                        <input class='form-control'  name=\"title\" type=\"text\" placeholder=\"Enter the title\" required/>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"form-group\">                                    \n");
      out.write("                                        <textarea class=\"form-control\" style=\"width:0 auto;\" name=\"story\" placeholder=\"Post your experiences\" \n");
      out.write("                                                  required></textarea>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <textarea id=\"locationarea\" name=\"location\" style=\"display: none;\"></textarea>\n");
      out.write("\n");
      out.write("                                    <label class=\"btn-link\" data-toggle=\"modal\" data-target=\"#myModal\">Add Location <span class=\"glyphicon glyphicon-map-marker\" ></span></label><br>\n");
      out.write("\n");
      out.write("                                    <input type=\"submit\" class=\"btn  btn-success  pull-right\" style=\"position: relative; top:-5px; left: -15px;\" value=\"post\"/>\n");
      out.write("                                </form>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        ");

                            }
                        
      out.write("\n");
      out.write("                    </div>    \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                    ");

                        // to show all posts\
                        //JDBC CODE
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
                        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        ResultSet rs = stmt.executeQuery("select * from user_signup,viewpost where user_signup.email = viewpost.posted_by order by viewpost.date desc");
                        if (rs.next()) {
                            rs.beforeFirst();
                            while (rs.next()) {
                                int pid = rs.getInt("viewpost.pid");
                                String title = rs.getString("viewpost.title");
                                String story = rs.getString("viewpost.story");
                                String location = rs.getString("viewpost.location");
                                String date_time = rs.getString("viewpost.date");
                                String posted_by = rs.getString("viewpost.posted_by");
                                String firstname = rs.getString("user_signup.first_name");
                                String lastname = rs.getString("user_signup.last_name");
                                String profile_pic = rs.getString("user_signup.profile_pic");
                    
      out.write("\n");
      out.write("                    <br>\n");
      out.write("                    <div class=\"row \" style=\"background-color: white;box-shadow: 5px 5px 5px #245580;\">\n");
      out.write("                        <div class=\"col-sm-12\">\n");
      out.write("                            ");

                                if (posted_by.equals(email)) {
                            
      out.write("\n");
      out.write("                            <img src=\"icons/red_cross.png\" style=\"margin-right: 5px; margin-top: 5px;\" width=\"15\" height=\"15\" class=\" pull-right\" \n");
      out.write("                                 title=\"Delete Post\" onclick=\"deletePost(");
      out.print(pid);
      out.write(")\"/>\n");
      out.write("\n");
      out.write("                            ");

                                }
                            
      out.write("\n");
      out.write("                            <div class=\"row\" style=\"background-color: white;padding: 10px;\">\n");
      out.write("                                <div class=\"col-sm-1\" ><img class=\"img img-rounded\" src=\"");
      out.print(profile_pic);
      out.write("\" \n");
      out.write("                                                            width=\"80\" height=\"80\"/></div>\n");
      out.write("                                <div class=\"col-sm-11\" style=\"position: relative;left: 50px;\">\n");
      out.write("                                    <p class=\"lead\">");
      out.print(firstname);
      out.write(' ');
      out.print(lastname);
      out.write("</p>\n");
      out.write("                                    <p>");
      out.print(date_time);
      out.write("</p>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"row\" style=\"background-color: white;\" >\n");
      out.write("                                <div class=\"col-sm-12\" style=\"text-decoration-color: navy;background-color: navajowhite;text-align-last: center; font-size: medium;\">");
      out.print(title);
      out.write("</div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"row\" style=\"background-color: white;\">\n");
      out.write("                                <div class=\"col-sm-12\" style=\"padding: 30px;\">\n");
      out.write("                                    ");
      out.print(story);
      out.write("\n");
      out.write("                                    <br>    \n");
      out.write("                                    <label class=\"btn-link\" data-toggle=\"modal\" data-target=\"#myModal\" \n");
      out.write("                                           onclick=\"loadAlreadyMarked('");
      out.print(location);
      out.write("')\">Location \n");
      out.write("                                        <span class=\"glyphicon glyphicon-map-marker\" ></span></label>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"row\" style=\"background-color: whitesmoke;\">\n");
      out.write("                                <div class=\"row \">\n");
      out.write("                                    <div class=\"col-sm-12\">\n");
      out.write("                                        <center><label class=\"btn btn-link\" data-toggle=\"modal\" \n");
      out.write("                                                       data-target=\"#postModal\" onclick=\"fetchcommentsonthispost(");
      out.print(pid);
      out.write(")\">view all comments</label></center>\n");
      out.write("                                    </div>\n");
      out.write("                                </div> \n");
      out.write("                                ");

                                    //       load comments on this post
                                    //JDBC CODE
                                    Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                    ResultSet rs1 = stmt1.executeQuery("select * from comment,user_signup where comment.comment_by = user_signup.email and comment.post_id=" + pid + " order by date_time ");
                                    if (rs1.next()) {
                                        //                                    rs1.beforeFirst();
                                        rs1.absolute(-4);
                                        while (rs1.next()) {
                                            String pic = rs1.getString("user_signup.profile_pic");
                                            String fn = rs1.getString("user_signup.first_name");
                                            String ln = rs1.getString("user_signup.last_name");
                                            String comment = rs1.getString("comment.comment");
                                            String commentTime = rs1.getString("comment.date_time");

                                
      out.write("\n");
      out.write("                                <div id=\"comments_div\" class=\"row\" >\n");
      out.write("                                    <div class=\"col-sm-1\">\n");
      out.write("                                        <img src=\"");
      out.print(pic);
      out.write("\" width=\"50\" height=\"50\" />\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"col-sm-11\">\n");
      out.write("                                        <p><b>");
      out.print(fn);
      out.write(' ');
      out.print(ln);
      out.write("</b><sub>\n");
      out.write("                                                ");
      out.print(commentTime);
      out.write("</sub></p>\n");
      out.write("                                        <p>");
      out.print(comment);
      out.write("</p>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <hr>\n");
      out.write("\n");
      out.write("                                ");


                                        }

                                    }
                                
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <!--my comment-->         \n");
      out.write("                            <div id=\"mycomment\" class=\"row\" style=\"background-color: white;padding: 10px;\">\n");
      out.write("                                <div class=\"col-sm-1\" style=\" position: relative; top: -20px;\">\n");
      out.write("                                    <img class=\"img img-rounded\" src=\"");
      out.print(prof_pic);
      out.write("\"\n");
      out.write("                                         style=\"position:relative; top:20px;left:18px;\"\n");
      out.write("                                         width=\"35\" height=\"35\"/>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-sm-11\">        \n");
      out.write("                                    <input id =\"comment_text");
      out.print(pid);
      out.write("\" class=\"form-control\" style=\"width:0 auto;\"\n");
      out.write("                                           type=\"text\" onkeypress=\"postComment(");
      out.print(pid);
      out.write(")\" placeholder=\"Comment\"/>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <br>\n");
      out.write("                    ");

                            }
                        }
                    
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <div class=\"sidebar2 col-sm-2\" >\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- Modal -->\n");
      out.write("            <div id=\"myModal\" class=\"modal fade\" role=\"dialog\">\n");
      out.write("                <div class=\"modal-dialog\">\n");
      out.write("\n");
      out.write("                    <!-- Modal content-->\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                            <h4 class=\"modal-title\">Mark Location</h4>\n");
      out.write("                        </div>\n");
      out.write("                        <div id=\"googleMap\" class=\"modal-body img-thumbnail center-block\" style=\"width:600px; height:500px; padding-top: 10px;\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-footer\">\n");
      out.write("                            <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div> \n");
      out.write("            <div id=\"postModal\" class=\"modal fade\" role=\"dialog\">\n");
      out.write("                <div class=\"modal-dialog\">\n");
      out.write("\n");
      out.write("                    <!-- Modal content-->\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                            <h4 class=\"modal-title\">Comments</h4>\n");
      out.write("                        </div>\n");
      out.write("                        <div id=\"post_modal_body\" class=\"modal-body img-thumbnail center-block\" style=\"height: 500px;overflow: auto\">\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div> \n");
      out.write("\n");
      out.write("        \n");
      out.write("<!--                    \n");
      out.write("                    <div class=\"container-fluid footer\" style=\" color: #000000;\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-sm-12 text-center\" style=\"font-family: 'Open Sans'; font-size: 12px;\"> &copy;2016\n");
      out.write("                        StaySafe. All Rights Reserved\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>-->\n");
      out.write("</div>\n");
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
