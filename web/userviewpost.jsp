
<%@page import="java.util.StringTokenizer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery-1.12.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <style>
            .modal-header, h4, .close {
                background-color: #5cb85c;
                color:white !important;
                text-align: center;
                font-size: 30px;
            }
            .modal-footer {
                background-color: #66afe9;
            }
        </style>
        <script src="http://maps.googleapis.com/maps/api/js"></script>
        <script>
            var map;
            var myCenter = new google.maps.LatLng(31.634, 74.8723);


            function initialize()
            {
                var mapProp = {
                    center: myCenter,
                    zoom: 15,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };

                map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

                google.maps.event.addListener(map, 'click', function (event) {
                    var ans = confirm("Are you sure to mark this as Danger Location ?");
                    if (ans)
                    {
                        getLocationDetails(event.latLng.lat(), event.latLng.lng(), true);

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

            function loadAlreadyMarked(location)
            {
//                alert(location);
                initialize();
                var loc = location.split("^");
                var lat = loc[0];
                var long = loc[1];
//                alert(lat+", "+long);
                placeMarker(new google.maps.LatLng(lat, long), initialize());

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

            google.maps.event.addDomListener(window, 'load', initialize);

        </script>
        <script>
            var pid_new;
            function go(pid)
            {
                pid_new = pid;
            }
             function vcmt(pid)
            {
                var pId = pid;
                alert(pId);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        document.getElementById("view_comments").innerHTML = xmlhttp.responseText;
                    }
                };
                xmlhttp.open("GET", "./view_comments.jsp?pid=" + pId, true);
                xmlhttp.send();
            }
            function edit()
            {
                
        var t=document.getElementById("etitle").value;
        var s=document.getElementById("estory").value;
                       
        alert(pid_new);
        alert(t);
                alert(s);

                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        
                         window.location.reload();
                            alert(xmlhttp.responseText);
                    }
                };
                xmlhttp.open("GET", "./edit_story.jsp?pid=" + pid_new + "&title=" + t + "&story=" + s, true);
                xmlhttp.send();
            }
             
       function go1()
            {
                
                        alert(pid_new);
                    var c=document.getElementById("cmmt").value;

        alert(c);

                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        alert(xmlhttp.responseText);
                          window.location.reload();
                    }
                };
                xmlhttp.open("GET", "./add_comments.jsp?pid=" + pid_new + "&comment=" + c , true);
                xmlhttp.send();
            }
        </script>
        <title>View Post</title>
    </head>
    <body>

        <div class="container" style="background-color:lavenderblush;">
            <br>
            <h1 style="text-align:center">View Post</h1>
            <br>
            <!-- Trigger the modal with a button -->
            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Add A story</button>

            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header" style="padding:10px 10px;">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4><span class="glyphicon glyphicon-plus"></span> Add Story</h4>
                        </div>
                        <div class="modal-body" style="padding:20px 20px;">
                            <form role="form" action="add_story2.jsp" method="post">
                                <br>
                                <input type="text"  required placeholder="Title" name="title" class="form-control">
                                <br>
                                <TEXTAREA NAME="textarea" required placeholder="Story" ROWS="5" class="form-control"></TEXTAREA>       
                                 <textarea id="locationarea" name="location" style="display: none;"></textarea>           
                              <br>
                              <button type="button" data-toggle="modal" data-target="#Map" style="outline: none; border: 0; background: transparent;" >Add Location<span class="glyphicon glyphicon-map-marker"></span></button>
                             <br>

                             <button type="submit" class="btn btn-success btn-block">Post</button>
                            </form>
                         </div>

                    </div>
      
                 </div>
            </div>
            <!-- Modal -->
              
                <!--<div id="Map" style="width:0 auto; height: 500px; position: fixed; padding: 10px; background-color: transparent; border-radius: 5px">-->
                <!--</div>-->



            <%                try {

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
                    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs = stmt.executeQuery("select * from user_signup,viewpost where user_signup.email=viewpost.posted_by Order By viewpost.date Desc");
                    if (rs.next()) {
                        rs.beforeFirst();

                        while (rs.next()) {
                            int pid = rs.getInt("viewpost.pid");
                            String title = rs.getString("viewpost.title");
                            String story = rs.getString("viewpost.story");
                            String photo = rs.getString("user_signup.profile_pic");
                            String name = rs.getString("user_signup.first_name");
                            String last = rs.getString("user_signup.last_name");
                            String date = rs.getString("viewpost.date");
                            String per = rs.getString("viewpost.posted_by");
                            String location = rs.getString("viewpost.location");
                            String email = (String) session.getAttribute("user_email");
                            String prof_pic = (String) session.getAttribute("user_pic");

//                        
            %>

      
            <div class="row" style="width: 60%; margin: 0 auto; background-color: #ffffff; border: 1px #2e6da4 ridge; " >
                <div class="col-sm-7">
                    <br>
                    <img src="<%=photo%>"  class="img-responsive img-thumbnail" alt="Profile Pic" width="50" height="50"/>
                    &nbsp;&nbsp;
                    <label><u><%=name%></u>&nbsp;<u><%=last%></u><br>
                        <%=date%></label>
                    <br>
                </div>
                  <div  class="row">
                    <div class="col-sm-12">
                    
                    <br>
                    <div  class="row">
                        <div class="col-sm-12 btn-primary" style=" white-space: nowrap; text-align:center; font-size: medium;">
                            <strong><%=title%></strong>
                     </div>
                    </div>
                    <br>
                    <input type="hidden"  id="pidd" value="<%=pid%>" >
                    </div>
                  </div>
                    <div  class="row">
                        <div class="col-sm-12">
                        
                        <%=story%>
                                
                        </div>
                    </div>
 
<div id="edit_contact" style="display: none; ">
                    </div>
<button type="button"  class="btn-link" data-toggle="modal" data-target="#cmt" onclick="go('<%=pid%>')" style="outline: none; border: 0; background: transparent;"><label>Comments</label></Button>
<button type="button" onclick="vcmt('<%=pid%>')" class="btn-link"   data-toggle="modal" data-target="#view" style="outline: none; border: 0; background: transparent;"><span class="glyphicon glyphicon-comment"></span></Button>
<div class="modal fade" id="cmt" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header" style="padding:10px 10px;">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4><span class="glyphicon glyphicon-plus"></span> Comments</h4>
                        </div>
                        <div class="modal-body" style="padding:20px 20px;">
                            <form role="form" onsubmit="go1()" method="post">
                                <br>
                                <div class="row">

                                    <div class="col-sm-2">
       <img src="<%=prof_pic%>"  class="img-responsive img-rounded" alt="Profile Pic" width="50" height="50"/>
                                     </div>
                          <div class="col-sm-10">
      <input type="text"  required placeholder="Enter your Comments" id="cmmt" class="form-control" >
                               </div>                                
            
                             <button type="submit" class="btn btn-success btn-block">Post</button>
                                </div>                    
                            </form>
                         </div>

                    </div>
      
                 </div>
          </div>

                <%
                    if (!location.equals("no location")) {
                %>
<button type="button" class="btn-link" data-toggle="modal" data-target="#Map" style="outline: none; border: 0; background: transparent;" onclick="loadAlreadyMarked('<%=location%>')"><span class="glyphicon glyphicon-map-marker"></span></button>
    
                
                <%
                    }
                    if (per.equals(email)) {
                %>
                <button type="button"  class="btn-link" data-toggle="modal" data-target="#Edit" onclick="go('<%=pid%>')" style="outline: none; border: 0; background: transparent;"><span class="glyphicon glyphicon-pencil"></span> </button>
                <div class="modal fade" id="Edit" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header" style="padding:5px 5px;">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4><span class="glyphicon glyphicon-plus"></span> Edit Story</h4>
                        </div>
                        <div class="modal-body" style="padding:30px 30px;">
                            <form role="form"  onsubmit="edit()" method="post">
                                <br>
                                <input type="text"  required placeholder="Title" id="etitle" class="form-control">
                                <br>
                                <TEXTAREA id="estory" required placeholder="Story" ROWS="5" class="form-control"></TEXTAREA>       
                                            
                             <button type="submit" class="btn btn-success btn-block">Post</button>
                            </form>
                             </div>
                    </div>
      
                 </div>
            </div>

                
                <%
                    }
                %>
                                  
            </div>
                       <br>
                       

            <%                        }
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            %> 
                    
                       </div>

            
               
              <div class="modal fade" id="Map" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header" style="padding:10px 10px;">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4><span class="glyphicon glyphicon-plus"></span> Add Location</h4>
                        </div>
                        <div class="modal-body" id="googleMap" style="padding:20px 20px; width:598px;height:380px; margin:0 auto;">

                        </div>

                    </div>

                </div>
            </div>
             <div class="modal fade" id="view" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">View Comments</h4>
                    </div>
                    
                    <div id="view_comments" class="modal-body "></div>
                    
                    <!--<div class="modal-footer"></div>-->
                    <br>
                    <br>
                </div>

                    </div>

                </div>
    </body>
</html>
