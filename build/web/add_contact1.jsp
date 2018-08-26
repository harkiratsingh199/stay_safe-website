<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="user_menu.jsp" %>

<html>
    <head>
        <title>Add Contact</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery-1.12.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <style>
            .footer 
            {
                position: fixed;
                bottom: 0px;
                padding-top:20px;
                color:#fff;
            }</style>
        <script>
            function checkLimitOfContacts()
            {
            <%
                String userEmail = (String) session.getAttribute("user_email");
                //JDBC CODE
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select count(*) from contacts where user_email = '" + userEmail + "'");

                if (rs.next()) {
                    int count = rs.getInt(1);
                    if (count == 5) {
                        response.sendRedirect("user_home2.jsp?msg=Cannot Add more contacts");
            %>
                return false;
            <%
            } else {
            %>
                return true;
            <%
                    }
                }

            %>
            }

            function validation()
            {
                var name = document.getElementById("contact_name").value;
                var num = document.getElementById("contact_no").value;
                if (!/^[a-zA-Z]+$/.test(name))
                {
                    alert("Name cannot have number or special character");
                    return false;
                }
                else if (name.length > 15)
                {
                    alert("Name cannot be of more than 15 characters");
                    return false;
                }
                else if (num.length > 10 || num.length<10)
                {
                    alert("Number cannot be of more than 10 characters");
                    return false;
                }
                else if (isNaN(num))
                {
                    alert("invalid contact number");
                    return false;
                }
                else
                {
                    return true;
                }
            }

        </script>

    </head>
    <body  onload="return checkLimitOfContacts()">
        <div class="w3-container w3-animate-zoom" id="main">

            <div class="row" style="height: 150px;">
                <div class="jumbotron" style="background-image:url(jbg.jpg); background-size: 100%; color: #ffffff; ">
                    <h2>Add New Contact..</h2>
                </div>
            </div>

            <div class="container">
                <form action="add_contact2.jsp">
                    <input type="text" required placeholder="Enter the Contacts Name" name="contactname" id="contact_name" class="form-control"/> <br><br>        
                    <input type="text" required placeholder="Enter the Contact Number" name="phoneno"  id="contact_no" class="form-control"/>         <br><br>
                    <select name="select"   class="form-control">
                        <option>Friends</option>
                        <option>Family</option>
                        <option>Sibling</option>
                        <option>Business</option>
                        <option>Other</option>
                    </select><br>
                    <br>
                    <input class="btn btn-primary w3-hover-white" type="submit" value="Add" 
                           onclick="return validation()"/>


                </form>

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
