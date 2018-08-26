<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="user_menu.jsp" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery-1.12.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <title>Home Page</title>

        <script src="http://maps.googleapis.com/maps/api/js"></script>
        <script>
            var map;
            var zoom_level = 9;
//            var myCenter = new google.maps.LatLng(42.26320689654081,-82.93224711055763);
            var myCenter = new google.maps.LatLng(42.26320689654081,-82.93224711055763);

            function initialize()
            {
                var mapProp = {
                    center: myCenter,
                    zoom: zoom_level,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
                google.maps.event.addListener(map, 'click', function (event)
                {
                    var ans = confirm("Are you sure to mark this as Danger Location ?");
                    if (ans)
                    {
                        getLocationDetails(event.latLng.lat(), event.latLng.lng());
                    }

                });

            }

            function placeMarker(location)
            {
                var marker;

                marker = new google.maps.Marker({
                    position: location,
                    map: map,
//                    title: 'click to delete'
                });

                marker.info = new google.maps.InfoWindow({
                    content: location + ""
                });

                marker.addListener('mouseover', function () {
                    marker.info.open(map, marker);
                });

                marker.addListener('mouseout', function () {
                    marker.info.close();
                });

            }

            function getLocationDetails(latitude, longitude)
            {
                var geocoder;
                geocoder = new google.maps.Geocoder();
                var latlng = new google.maps.LatLng(latitude, longitude);
                geocoder.geocode({'latLng': latlng}, function (results, status)
                {
                    if (status == google.maps.GeocoderStatus.OK)
                    {
                        if (results[0])
                        {
                            var add = results[0].formatted_address;
                            var value = add.split(",");
                            count = value.length;
                            country = value[count - 1];
                            state = value[count - 2];
                            var city = value[count - 3];
                            document.getElementById("locationarea").innerHTML = latitude + "^" + longitude + "^" + add;
                            placeMarker(new google.maps.LatLng(latitude, longitude));

                        }
                        else
                        {
                            alert("no address found");
                        }
                    }
                    else
                    {
//                        console.log("geo coder failed with status " + status);

                        alert("geo coder failed with status " + status);
                    }
                }
                );
            }

            function loadAlreadyMarked(location)
            {
//                alert(location);
                initialize();
                var loc = location.split("^");
                var lat = loc[0];
                var long = loc[1];
//                alert(lat+", "+long);
                placeMarker(new google.maps.LatLng(lat, long));

            }

            function deletePost(pid)
            {
                var ans = confirm("Are you sure to delete this post ?");
                if (ans == true)
                {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function ()
                    {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                        {
                            window.location.reload();
                        }
                    };
                    xmlhttp.open("GET", "./delete_post.jsp?pid=" + pid, true);
                    xmlhttp.send();
                }
            }


            function postComment(pid)
            {

                if (event.keyCode == 13)
                {
                    var comment = document.getElementById("comment_text" + pid).value;
//                    alert(comment);
                    var xml = new XMLHttpRequest();
                    xml.onreadystatechange = function ()
                    {
                        if (xml.readyState == 4 && xml.status == 200)
                        {
//                            document.getElementById("comment_text").value = "";
                            window.location.reload();

                        }
                    };
                    xml.open("GET", "./add_comments.jsp?pid=" + pid + "&comment=" + comment, true);
                    xml.send();

                }
            }

            function fetchcommentsonthispost(pid)
            {
                var xml = new XMLHttpRequest();
                xml.onreadystatechange = function ()
                {
                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        document.getElementById("post_modal_body").innerHTML = xml.responseText;
                    }
                };
                xml.open("GET", "./fetchcommentsonthispost.jsp?pid=" + pid, true);
                xml.send();



            }

            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
<!--        <style>
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
        
        </style>-->
            
    </head>
    <body>
        <%
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

        %>
        <div class="w3-container" style="background-color: whitesmoke;">

            <div class="row"  style="height: 110px;">
                <div class="jumbotron" style="background-image:url(jbg.jpg); background-size: 100%; ;color: #ffffff; text-transform: uppercase;">

                    <img  class="img img-rounded" src="<%=prof_pic%>" style="margin-left: 230px;"width="80" height="75"/><%=myFn%> <%=myLn%>
                 

                </div>
            </div>
            <div class="row">
                <div id="sidebar1" class="col-sm-2" >

                </div>
                <div id="main" class="col-sm-8" >
                    <br>
                    <div class="row " style="background-color: white; border: 2px navy hidden;">

                        <div class="row" style="padding: 10px;" >
                            <div class="col-sm-1" ><img class="img img-rounded" src="<%=myProfilepic%>" width="80" height="80"/></div>
                            <div class="col-sm-11" style="position: relative;left: 50px;"><label style="text-transform: capitalize; text-decoration-color: #23527c;"><u><%=myFn%> <%=myLn%></u></label><br></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12" style="padding-left: 50px; padding-bottom: 10px;">
                                <form role="form" action="add_story2.jsp" method="post">    
                                    <div class="form-group" style="padding-right: 10px;">
                                        <input class='form-control'  name="title" type="text" placeholder="Enter the title" required/>
                                    </div>
                                    <div class="form-group">                                    
                                        <textarea class="form-control" style="width:0 auto;" name="story" placeholder="Post your experiences" 
                                                  required></textarea>
                                    </div>

                                    <textarea id="locationarea" name="location" style="display: none;"></textarea>

                                    <label class="btn-link" data-toggle="modal" data-target="#myModal">Add Location <span class="glyphicon glyphicon-map-marker" ></span></label><br>

                                    <input type="submit" class="btn  btn-success  pull-right" style="position: relative; top:-5px; left: -15px;" value="post"/>
                                </form>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>    



                    <%
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
                    %>
                    <br>
                    <div class="row " style="background-color: white;box-shadow: 5px 5px 5px #245580;">
                        <div class="col-sm-12">
                            <%
                                if (posted_by.equals(email)) {
                            %>
                            <img src="icons/red_cross.png" style="margin-right: 5px; margin-top: 5px;" width="15" height="15" class=" pull-right" 
                                 title="Delete Post" onclick="deletePost(<%=pid%>)"/>

                            <%
                                }
                            %>
                            <div class="row" style="background-color: white;padding: 10px;">
                                <div class="col-sm-1" ><img class="img img-rounded" src="<%=profile_pic%>" 
                                                            width="80" height="80"/></div>
                                <div class="col-sm-11" style="position: relative;left: 50px;">
                                    <p class="lead"><%=firstname%> <%=lastname%></p>
                                    <p><%=date_time%></p>
                                </div>

                            </div>
                            <div class="row" style="background-color: white;" >
                                <div class="col-sm-12" style="text-decoration-color: navy;background-color: navajowhite;text-align-last: center; font-size: medium;"><%=title%></div>
                            </div>
                            <div class="row" style="background-color: white;">
                                <div class="col-sm-12" style="padding: 30px;">
                                    <%=story%>
                                    <br>    
                                    <label class="btn-link" data-toggle="modal" data-target="#myModal" 
                                           onclick="loadAlreadyMarked('<%=location%>')">Location 
                                        <span class="glyphicon glyphicon-map-marker" ></span></label>
                                </div>
                            </div>
                            <div class="row" style="background-color: whitesmoke;">
                                <div class="row ">
                                    <div class="col-sm-12">
                                        <center><label class="btn btn-link" data-toggle="modal" 
                                                       data-target="#postModal" onclick="fetchcommentsonthispost(<%=pid%>)">view all comments</label></center>
                                    </div>
                                </div> 
                                <%
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

                                %>
                                <div id="comments_div" class="row" >
                                    <div class="col-sm-1">
                                        <img src="<%=pic%>" width="50" height="50" />
                                    </div>
                                    <div class="col-sm-11">
                                        <p><b><%=fn%> <%=ln%></b><sub>
                                                <%=commentTime%></sub></p>
                                        <p><%=comment%></p>
                                    </div>
                                </div>
                                <hr>

                                <%

                                        }

                                    }
                                %>
                            </div>
                            <!--my comment-->         
                            <div id="mycomment" class="row" style="background-color: white;padding: 10px;">
                                <div class="col-sm-1" style=" position: relative; top: -20px;">
                                    <img class="img img-rounded" src="<%=prof_pic%>"
                                         style="position:relative; top:20px;left:18px;"
                                         width="35" height="35"/>
                                </div>
                                <div class="col-sm-11">        
                                    <input id ="comment_text<%=pid%>" class="form-control" style="width:0 auto;"
                                           type="text" onkeypress="postComment(<%=pid%>)" placeholder="Comment"/>
                                </div>

                            </div>

                        </div>
                    </div>
                    <br>
                    <%
                            }
                        }
                    %>

                </div>
                <div class="sidebar2 col-sm-2" >

                </div>

            </div>

            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Mark Location</h4>
                        </div>
                        <div id="googleMap" class="modal-body img-thumbnail center-block" style="width:600px; height:500px; padding-top: 10px;">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div> 
            <div id="postModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Comments</h4>
                        </div>
                        <div id="post_modal_body" class="modal-body img-thumbnail center-block" style="height: 500px;overflow: auto">

                        </div>

                    </div>

                </div>
            </div> 

        
<!--                    
                    <div class="container-fluid footer" style=" color: #000000;">
            <div class="container">

                <div class="row">
                    <div class="col-sm-12 text-center" style="font-family: 'Open Sans'; font-size: 12px;"> &copy;2016
                        StaySafe. All Rights Reserved
                    </div>
                </div>
            </div>

        </div>-->
</div>

    </body>
</html>
