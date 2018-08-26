<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="user_menu.jsp" %>
<!DOCTYPE html>
<%
    String email = (String) session.getAttribute("user_email");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tracking</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery-1.12.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link href="w3.css" rel="stylesheet" type="text/css"/>
        <script src="http://maps.googleapis.com/maps/api/js"></script>
        <style>
            .footer 
            {
                position: fixed;
                bottom: 0px;
                padding-top:20px;
                color:#fff;
            }</style>
        <script>
            var map;
            var zoom_level = 9;
//            var myCenter = new google.maps.LatLng(31.633980, 74.872261);
             var myCenter = new google.maps.LatLng(42.26320689654081,-82.93224711055763);
            var pointArray = [];
            var i = 0;
            var style = [{
                    "stylers": [{
                            "visibility": "off"
                        }]
                }, {
                    "featureType": "road",
                    "stylers": [{
                            "visibility": "on"
                        }, {
                            "color": "#ffffff"
                        }]
                }, {
                    "featureType": "road.arterial",
                    "stylers": [{
                            "visibility": "on"
                        }, {
                            "color": "#fee379"
                        }]
                }, {
                    "featureType": "road.highway",
                    "stylers": [{
                            "visibility": "on"
                        }, {
                            "color": "#fee379"
                        }]
                }, {
                    "featureType": "landscape",
                    "stylers": [{
                            "visibility": "on"
                        }, {
                            "color": "#f3f4f4"
                        }]
                }, {
                    "featureType": "water",
                    "stylers": [{
                            "visibility": "on"
                        }, {
                            "color": "#7fc8ed"
                        }]
                }, {}, {
                    "featureType": "road",
                    "elementType": "labels",
                    "stylers": [{
                            "visibility": "on"
                        }]
                }, {
                    "featureType": "poi.park",
                    "elementType": "geometry.fill",
                    "stylers": [{
                            "visibility": "on"
                        }, {
                            "color": "#83cead"
                        }]
                }, {
                    "elementType": "labels",
                    "stylers": [{
                            "visibility": "on"
                        }]
                }, {
                    "featureType": "landscape.man_made",
                    "elementType": "geometry",
                    "stylers": [{
                            "weight": 0.9
                        }, {
                            "visibility": "off"
                        }]
                }]

            function initialize()
            {
                var mapProp = {
                    center: myCenter,
                    zoom: 9,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
                map.setOptions({
                    styles: style
                });
                if (i == 1)
                {
                    fetchPoints();
                }
            }

            function incrementI()
            {
                var date = document.getElementById("date").value;

                if (date.length === 0)
                {
                    alert("Select a date first");
                }
                else
                {
                    i = 1;
                    initialize();
                }

            }

            function fetchPoints()
            {
                var date = document.getElementById("date").value;

                pointArray.splice(0, pointArray.length);

                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var loc = xmlhttp.responseText;
//                        alert(loc);
//                        if (loc === "Cannot track the device on this day")
//                        {
//                            alert(loc);
//                        }
//                        else
                        {
                            var lat_lng = loc.split("^");
                            if (lat_lng.length > 1)
                            {
                                for (var i = 0; i < lat_lng.length; i = i + 2)
                                {
                                    var lat = lat_lng[i].trim().valueOf();
                                    var lng = lat_lng[i + 1].trim().valueOf();
                                    var x = new google.maps.LatLng(lat, lng);


                                    map.setCenter(x);
                                    map.setZoom(18);
                                    pointArray[pointArray.length] = x;
                                    if (pointArray.length == 1)
                                    {
                                        var marker = new google.maps.Marker({
                                            position: x,
                                            map: map
                                        });
                                    }

                                }
                            }

                            else
                            {
                                alert("Cannot track the device on this date")
                            }
                        }
                    }
                    var path = new google.maps.Polyline({
                        path: pointArray,
                        strokeColor: "#FF0000",
                        strokeOpacity: 0.8,
                        strokeWeight: 3
                    });

                    path.setMap(map);
                }
                ;
                xmlhttp.open("GET", "./fetchlatlngonSpecificDateServlet?email=<%=email%>&date=" + date, true);
                xmlhttp.send();
            }
            google.maps.event.addDomListener(window, 'load', initialize);
        </script>

    </head>
    <body >
<div  id="main">
        <div class="w3-container w3-animate-zoom" style="background-color: whitesmoke;">

            <div class="row" style="height: 185px;">
                <div class="jumbotron" style="background-image:url(jbg.jpg); background-size: 100%; color: #ffffff; ">

                    <div class="row" style="color: #000;">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-8">
                            <h1>Find Me on Date</h1>

                            <input id="date" type="date"/>
                            <button class="btn btn-primary w3-hover-white" onclick="incrementI()">go</button>
                        </div>
                    </div>
                </div>
            </div>


            <div id="googleMap" class="img-thumbnail center-block" style="width: 1000px; height:700px; 
                 padding-top: 10px;" ></div>


        </div>
</div>
        <br>
        <br>
        <div class="container-fluid footer" style=" background-color:#005b96;width: 100%;  color: #000000;">
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
