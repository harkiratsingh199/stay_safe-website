<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="jquery-1.12.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="w3.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    <style>
        .modal-header, h4, .close {
            background-color: #005b96;
            color:white !important;
            text-align: center;
            font-size: 30px;
        }
    </style>
    <script>
        function goToHomePage()
        {
            window.location.href = "./user_signup.jsp";
        }
        var xmlhttp = new XMLHttpRequest();
        function go()
        {
            var email = document.getElementById("email").value;
            xmlhttp.onreadystatechange = hello;
            xmlhttp.open("GET", "fetch_user_ques.jsp?email=" + email, true);
            xmlhttp.send();
        }
        function hello()
        {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
            {
                document.getElementById("div1").innerHTML =
                        xmlhttp.responseText;
                document.getElementById("div1").style.display = "block";

            }
        }



    </script>
    <!--<head>
        <title></title>style="background-color: #005b96;
    </head>-->
    <body>

        <div class="w3-navbar w3-card-2  " style="background-color: #005b96;">
            <div class="pull-left">
                <div class="row">
                    <div class="col-sm-6">
                        <label style="color: #ffffff;"> StaySafe</label>
                    </div>
                    <div class="col-sm-4">
                        <img src="app_icon.png" width="40" height="40"/>
                    </div>
                </div>


            </div>
            <div class="pull-right">
                <ul class="w3-navbar  w3-card-2" style="background-color: #005b96; color:  #ffffff;">
                    <li><a class="w3-hover-white" href="./user_login1.jsp" style="background-color: #005b96;" >Login</a></li>
                    <li><a class="w3-hover-white" href="#" style="background-color: #005b96;" data-toggle="modal" data-target="#myModal">Verify Account</a></li>
                    <li><a class="w3-hover-white" href="#" style="background-color: #005b96;" data-toggle="modal" data-target="#forget">Forget Password</a></li>
                    <li><a class="w3-hover-white" href="./user_signup.jsp" style="background-color: #005b96;">Sign Up</a></li>

                </ul>
            </div>
        </div>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" style="padding:10px 10px;">
                        <button type="button" class="close" onclick="goToHomePage()" data-dismiss="modal">&times;</button>
                        <h4><span class="glyphicon glyphicon-plus"></span>Verification Code</h4>
                    </div>
                    <div class="modal-body" style="padding:20px 20px;">
                        <form role="form" action="verify_account2.jsp" method="post">
                            <div class="form-group">
                                <input type="text" name="email" placeholder="enter email" class="form-control" required/>
                            </div>
                            <div class="form-group">
                                <input type="text" name="code" placeholder="enter verification code" class="form-control" required/>
                            </div>
                            <div class="form-group">
                                <input class="btn btn-primary" type="submit" value="Submit"/>
                            </div>


                        </form>
                    </div>

                </div>

            </div>
        </div>
        <div class="modal fade" id="forget" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" style="padding:10px 10px;">
                        <button type="button" class="close" onclick="goToHomePage()" data-dismiss="modal">&times;</button>
                        <h4><span class="glyphicon glyphicon-lock"></span>Forget Password</h4>
                    </div>
                    <div class="modal-body" style="padding:20px 20px;">
                        <div class="form-group">
                            <input type="text" required placeholder="Enter the Email" id="email" class="form-control" /></div>
                        <br>
                        <div class="form-group">
                            <input type="button" value="Click" onclick="go()" class="btn btn-primary"/></div>
                        <hr>
                        <div id="div1" style="border: 2px solid white; display: none;" class="btn"></div>


                    </div>

                </div>

            </div>
        </div>
    </body>
</html>
