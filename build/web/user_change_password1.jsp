

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="user_menu.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
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
            function go()
            {
                var np = document.getElementById("newpassword").value;
                var cp = document.getElementById("confirmpassword").value;
                if (np != cp)
                {
                    alert("new password and confirm password don't match !");
                    return false;
                }
                else
                {
                    return true;
                }

            }

            function goToHomePage()
            {
                window.location.href = "./user_home2.jsp";
            }
        </script>
    </head>
    <body>

        <%
            String email = (String) session.getAttribute("user_email");
        %>

        <div class="w3-container w3-animate-zoom" id="main">
            <div class="row" style="height: 165px;">
                <div class="jumbotron" style="background-image:url(jbg.jpg); background-size: 100%; color: #ffffff; ">
                    
                    <h1>Change Password</h1>
                   
                </div>
            </div>
            <form action="user_change_password2.jsp" onsubmit="return go()">

                <div class="form-group">
                    <input class="form-control"  type="text" name="email" value="<%=email%>" readonly/>
                </div>

                <div class="form-group">
                    <input class="form-control" type="password" name="oldpassword" placeholder="Old Password" required/>
                </div>

                <div class="form-group">      
                    <input class="form-control" type="password" id="newpassword" name="newpassword" placeholder="New Password" required/>
                </div>

                <div class="form-group">
                    <input class="form-control" type="password"  id = "confirmpassword" placeholder="Confirm Password" required/>
                </div>

                <div class="form-group">
                    <input class="btn btn-primary w3-hover-white" type="submit" value="Change"/>
                </div>
            </form>
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
