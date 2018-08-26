<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="user_menu.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Contacts</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery-1.12.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link href="w3.css" rel="stylesheet" type="text/css"/>
        <style>
            .footer 
            {
                position: fixed;
                bottom: 0px;
                padding-top:20px;
                color:#fff;
            }</style>
        <script>
//            function go1(cid)
//            {
//                var cId = cid;
//                document.getElementById("edit_contact").style.display = "";
//                var xmlhttp = new XMLHttpRequest();
//                xmlhttp.onreadystatechange = function ()
//                {
//                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
//                    {
//                        document.getElementById("edit_contact").innerHTML = xmlhttp.responseText;
//                        var editContactDiv = document.getElementById("edit_contact");
//                        editContactDiv.style.display = "block";
//                        var divWidth = editContactDiv.clientWidth;
//                        var divHeight = editContactDiv.clientHeight;
//                        var screenWidth = window.innerWidth;
//                        var screenHeight = window.innerHeight;
//                       
//
//                        var l = screenWidth / 2 - divWidth/ 2 ;
//                        var t = screenHeight / 2- divHeight / 2;
//                    
//                        editContactDiv.style.left= l + "px";
//                        editContactDiv.style.center= t + "px";
//                       
//                    }
//                };
//                xmlhttp.open("GET", "./edit_contacts.jsp?cid=" + cId, true);
//                xmlhttp.send();
//
//
//
//            }
            function go1(cid)
            {
                var cId = cid;
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        document.getElementById("edit_contact").innerHTML = xmlhttp.responseText;
                    }
                };
                xmlhttp.open("GET", "./edit_contacts.jsp?cid=" + cId, true);
                xmlhttp.send();
            }

            function go2(cid)
            {
                var ans = confirm("Are you sure to delete this contact");
                if (ans == true)
                {
                    var xml = new XMLHttpRequest();
                    xml.onreadystatechange = function ()
                    {
                        if (xml.readyState == 4 && xml.status == 200)
                        {
                            window.location.reload();
                            alert(xml.responseText);
                        }
                    };
                    xml.open("GET", "deleteuserdata?cid=" + cid, true);
                    xml.send();
                }
            }


        </script>

    </head>

    <body>

        <div class="w3-container w3-animate-zoom" id="main">
            <div class="row" style="height: 120px;">
                <div class="jumbotron" style="background-image:url(jbg.jpg); background-size: 100%; color: #ffffff; ">
                    <h2>View Contacts..</h2>
                </div>
            </div>
            <div class="row">
                <%
                    String email = (String) session.getAttribute("user_email");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
                    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs = stmt.executeQuery("select * from contacts where user_email='" + email + "'");
                    if (rs.next()) {
                %>
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                    <table class="w3-border-0" cellpadding="5"  style="margin-top: 12px;">
                        <thead>
                            <tr style="color: #ffffff;">
                                <th>Contact Name</th>
                                <th>Contact Number</th>
                                <th>Email</th>
                                <th>Relation</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <%
                            rs.beforeFirst();
                            while (rs.next()) {
                                int cid = rs.getInt("cid");
                                String Contactname = rs.getString("contact_name");
                                String Contactno = rs.getString("contact_no");
                                String rel = rs.getString("relation");
                        %>
                        <tbody>

                            <tr class="w3-hover-pale-blue">
                                <td><%=Contactname%></td>
                                <td><%=Contactno%></td>
                                <td><%=email%></td>
                                <td><%=rel%></td>
                                <td><label  class="btn btn-link" data-toggle="modal" data-target="#myModal" onclick="go1('<%=cid%>')" style="color : blue; cursor :pointer;">Edit</label></td>
                                <td><label class="btn btn-link" onclick="go2('<%=cid%>')" style="color : blue; cursor :pointer;">Delete</label></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
            <%
            } else {
            %>



            <p style="color: red; font-style: italic">No records found !</p>
            <br>
            <a href="add_contact1.jsp">Add Contacts</a>

            <%
                }
                String msg = request.getParameter("msg");
                if (msg != null) {
            %>
            <div class="alert alert-success fade in">
                <a href="#" class="close" data-dismiss="alert" label="close">&times;</a>
                <strong><%=msg%>!</strong> 
            </div>
            <%
                }

            %>


        </div>   



        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Edit contact</h4>
                    </div>

                    <div id="edit_contact" class="modal-body "></div>

                    <!--<div class="modal-footer"></div>-->
                    <br>
                    <br>
                </div>

            </div>
        </div>   

        <div class="container-fluid footer" style=" background-color: #005b96; width: 100%; color: #000000;">
            <div class="container">

                <div class="row">
                    <div class="col-sm-12 text-center" style="font-family: 'Open Sans'; font-size: 12px;"> &copy;2018
                        StaySafe. All Rights Reserved
                    </div>
                </div>
            </div>

        </div>


    </body>

</html>
