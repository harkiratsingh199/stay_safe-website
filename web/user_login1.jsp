<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery-1.12.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link href="w3.css" rel="stylesheet" type="text/css"/>


        <style> 
            #body {
                background: url(shutterr.jpg) no-repeat center center fixed;  
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;

            }

            .footer 
            {
                position: fixed;
                bottom: 0px;
                padding-top:20px;
                color:#fff;
            }
        </style>
        <script>
            function goToHomePage()
            {
                window.location.href = "./user_login1.jsp";
            }
            history.pushState(null, null, '');
            window.addEventListener('popstate', function (event) {
                history.pushState(null, null, 'user_login1.jsp')
            });
        </script>
        <title>Login</title>
    </head>
    <body id="body">

        <%@include file="nav_menu.jsp" %>
        <br>

        <div class="row" id="main">
            <div class="col-sm-1"></div>
            <div class="col-sm-6">
                <div class="w3-card-4" style="width:0 auto; height: 320px;">

                    <!-- Modal content-->
                    <div class="modal-header" style=" background-color:#005b96; padding:5px 5px;">
                        <center>    <h4 style="color: #ffffff;"><span class="glyphicon glyphicon-log-in"></span> Login</h4></center>
                    </div>
                    <form action="user_login2.jsp">
                        <br>
                        <input type="text"  required placeholder="Email" name="email" class="form-control">
                        <br>
                        <input type="password" required placeholder="Password" name="pass" class="form-control">
                        <br>
                        <input type="Submit" value="Submit" class="btn btn-primary">
                    </form>
                    <hr>
                    <div class="row">
                        <dov class="col-sm-12"><a href="#" data-toggle="modal" data-target="#forget">Forget Password?</a> or <a href="user_signup.jsp">New User?</a></div>
                </div>

                <%
                    String msg = request.getParameter("msg");
                    if (msg != null) {
                %>
                <div class="alert alert-danger fade in" >
                    <a href="#" class="close" data-dismiss="alert" label="close">&times;</a>
                    <strong><%=msg%> !</strong> 

                </div>

                <%

                    }


                %>
            </div>
        </div>
        <div class="container-fluid footer" style=" color: #000000;">
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
