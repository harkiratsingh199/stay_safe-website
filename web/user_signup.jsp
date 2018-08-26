<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User SignUp</title>
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

            history.pushState(null, null, '');
            window.addEventListener('popstate', function (event) {
                history.pushState(null, null, 'user_signup.jsp')
            });
        </script>

        <script>
            function validate()
            {
                var email = document.getElementById("email").value;
                var fn = document.getElementById("firstname").value;
                var ln = document.getElementById("lastname").value;
                var ulen = fn.length;
                var ph = document.getElementById("phone_no").value;

                var pwd = document.getElementById("password").value;
                var cpwd = document.getElementById("confirmpassword").value;
                var elen = email.length;
                var i = email.indexOf('@');
                var j = email.indexOf('.');
                var subemail = email.substring(i, elen);
//                var k = subemail.indexOf('.');
                var plen = pwd.length;
                //alert(plen);
                if (ulen > 15)
                {
                    alert("First name cannot be of more than 15 characters");
                    return false;
                }
                else if (ln.length > 15)
                {
                    alert("Last name cannot be of more than 15 characters");
                    return false;
                }
                else if (!/^[a-zA-Z]+$/.test(fn))
                {
                    alert("First name cannot have number ");
                    return false;
                }
                else if (!/^[a-zA-Z]+$/.test(ln))
                {
                    alert("Last name cannot have number");
                    return false;
                }

                else if (plen < 8 || plen > 20)
                {
                    alert("Password length must be between 8 to 20 characters");
                    return false;
                }
                else if (pwd !== cpwd)
                {

                    alert("Password and confirm password should match");
                    return false;

                }
//                else if ( j === (i + 1))
//                {
//
//                    alert(j);
//                    alert("Invalid E-mail format");
//                    return false;
//
//                }
//                else if ( j === -1 || i === 0)
//                {
//                    alert("Invalid E-mail format");
//                    return false;
//                }
//                else if (i === 0)
//                {
//                    alert("Invalid E-mail format");
//                    return false;
//                }
                else if (isNaN(ph) || ph.length<10)
                {
                    alert("invalid phone number");
                    //alert(ph);
                    return false;
                }
                else
                {
                    return true;
                }

            }
        </script>

    </head>
    <body id="body">
        <%@include file="mnav_menu.jsp" %>
        <br>
        <div class="row" id="main">
            <div class="col-sm-1"></div>
            <div class="col-sm-6">
                <div class="w3-card-8" style="width:0auto; height: 400px;">
                    <div class="modal-header" style=" background-color:#005b96; padding:5px 5px;">
                        <h4 style="color: #ffffff;"><span class="glyphicon glyphicon-log-out"></span>Sign Up</h4>
                    </div>
                    <br>
                    <form action="adduserdata" method="post"  enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input type="text" name="firstname" id="firstname" required class="form-control input-sm floatlabel" placeholder="First Name">
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input type="text" name="lastname" id="lastname" required="" class="form-control input-sm" placeholder="Last Name">
                                </div>
                            </div>
                        </div>
                        <input type="text" required placeholder="Email" name="email" required  id="email" class="form-control"/> <br>       
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input type="password" name="password" id="password" required class="form-control input-sm" placeholder="Password">
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input type="password" name="password_confirmation" id="confirmpassword" required  class="form-control input-sm" placeholder="Confirm Password">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <select name="select"   class="form-control">
                                        <option>Which is your Favourite City?</option>
                                        <option>Which is your Favourite Hero?</option>
                                        <option>What is your Birth place?</option>
                                        <option>What is your Dog Name?</option>
                                        <option>What is your Father Name?</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input type="text" required placeholder="Security Answer"  required name="securityans" class="form-control input-sm"/>        

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input type="text" required placeholder="Phone Number" name="phoneno"   required id="phone_no" class="form-control input-sm"/>  

                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input type="file"   required name="file"  class="form-control input-sm"/>  

                                </div>
                            </div>
                        </div>

                        <input type="submit" value="Register" onclick="return validate()" class="btn btn-primary btn-block">
                    </form>

                    <%
                        String msg = request.getParameter("msg");
                        if (msg != null) {
                    %>
                    <label style="color: red; font-style: italic;"><%=msg%></label>
                    <%
                        }
                    %>
                </div>
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
