

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery-1.12.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <style>
            html,body
            {
                height:100%;
            }

            #wrap
            {
                min-height: 100%; 
            }

            #main
            {
                overflow:auto;
                padding-bottom:150px; /* this needs to be bigger than footer height*/
            }

            .footer 
            {
                position: relative;
                margin-top: -50px; /* negative value of footer height */
                height: 50px;
                clear:both;
                padding-top:20px;
                color:#fff;
            } 
            h2 {
                width: 100%; 
                text-align: center; 
                border-bottom: 1px solid #000; 
                line-height: 0.1em;
                margin: 10px 0 20px; 
            } 

            h2 span { 
                background:#fff; 
                padding:0 10px; 
            }
            #top{
                background-color: #000000;
                color: #fff;

            }
        </style>
        <title>User home</title>
    </head>
    <body>
        <%@include file="user_menu.jsp" %> 
        <br>
<%
    String email=(String)session.getAttribute("user_email");
    String Prof=(String)session.getAttribute("user_pic");
%>
<label> WELCOME:<%=email%></label>

        <%@include file="carousel.jsp" %>
        <br>
        <br>
        
            <div  id="main">

                <div class="container">
                    <div class="row section">
                        <h2 class="headings">
                            <span>About our Website</span>
                        </h2>
                        <br>
                        <div class="col-sm-12">
                            <p>
                                <b>StaySafe</b>,is an emergency App that,at the click of the power button of your smartphone 4 times sends out the alert messages to your contacts that you feed into the app as the designated receivers or guardians.The message says 'I am in danger.My google location is.The receiver will receive will receive a link to your location giving them your location.The app also prompts you on entering a potential danger location,showing you the danger location on map and sets your phone on vibration.Also the user can press the SMS button in order to send there location to the designated receivers.
                            </p>

                        </div>
                    </div>
                </div>

                <br>
                <div class="container">

                    <h2 class="headings">
                        <span>Features</span>
                    </h2>
                    <div class="row facility-row">
                        <br>
                        <div class="col-sm-3 col-sm-offset-2 col-xs-6 text-center secondrow">
                            <span class="glyphicon glyphicon-map-marker"></span>
                            <h4>Add Danger Location</h4>
                        </div>
                        <div class="col-sm-3 col-xs-6 text-center">

                            <span class="glyphicon glyphicon-calendar"></span>
                            <h4>Track Previous Location</h4>
                        </div>
                        <div class="col-sm-3 col-xs-6 text-center">
                            <span class="glyphicon glyphicon-plus"></span>
                            <h4>View Stories</h4>
                        </div>
                    </div>
                    <br>

                    <div class="row facility-row">
                        <div class="col-sm-3 col-sm-offset-2 col-xs-6 text-center secondrow">
                            <span class="glyphicon glyphicon-camera"></span>
                            <h4>Live Tracking</h4>
                        </div>
                        <div class="col-sm-3 col-xs-6 text-center">
                            <span class="glyphicon glyphicon-phone"></span>
                            <h4>Add/View Contacts</h4>
                        </div>
                        <div class="col-sm-3 col-xs-6 text-center">
                            <span class="glyphicon glyphicon-bell"></span>
                            <h4>Message Facilities</h4>
                        </div>
                    </div>
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
        <div class="container-fluid footer" style="background-color: #03396c; color: #ffffff;">
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
