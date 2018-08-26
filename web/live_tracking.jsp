
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
        <title>Live Tracking</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery-1.12.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link href="w3.css" rel="stylesheet" type="text/css"/>
        <!--<script  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCPLfsvGRakObGiqEM6C4mUsSP9pkSixDo"></script>-->
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
            var y;
            var z;
//            var zoom_level = 9;
//            var myCenter = new google.maps.LatLng(31.633980, 74.872261);

            var pointArray = [];
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
//                    center: myCenter,
                    zoom: 9,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
                map.setOptions({
                    styles: style
                });
            }
            function fetchPoints()
            {
                setInterval(function ()
                {
                    pointArray.splice(0, pointArray.length);
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function ()
                    {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                        {
                            document.getElementById("googleMap").style.display = "block";
                            document.getElementById("spinning_icon").style.display = "none";
                            var loc = xmlhttp.responseText;
                            var lat_lng = loc.split("^");
//                        console.log("length" + lat_lng.length);
                            if (lat_lng.length > 1)
                            {
                                for (var i = 0; i < lat_lng.length; i = i + 2)
                                {
                                    var lat = lat_lng[i].trim().valueOf();
                                    var lng = lat_lng[i + 1].trim().valueOf();
                                    var x = new google.maps.LatLng(lat, lng);
                                    map.setCenter(x);
                                    y = x;
                                    if (i == 0)
                                    {
                                        z = x;
                                        var marker = new google.maps.Marker({
                                            position: z,
                                            map: map,
                                        });
                                    }
                                    map.setZoom(14);
                                    pointArray[pointArray.length] = x;
                                }
                                var marker = new google.maps.Marker({
                                    position: x,
                                    map: map,
                                });
                            }
                            else {
                                alert("Not able To track Currently ");
                            }
                        }
                        var path = new google.maps.Polyline({
                            path: pointArray,
                            strokeColor: "#FF0000",
                            strokeOpacity: 0.8,
                            strokeWeight: 3
                        });
                        path.setMap(map);
                    };
                    xmlhttp.open("GET", "./fetchlatlng?email=<%=email%>", true);
                    xmlhttp.send();
                }, 10000);
            }

            google.maps.event.addDomListener(window, 'load', initialize);</script>

    </head>
    <body onload="fetchPoints()">
        <div class="w3-container w3-animate-zoom" style="background-color: whitesmoke;">

            <div class="row">
                <div class="jumbotron" style="background-image:url(jbg.jpg); background-size: 100%; color: #ffffff; ">
                    <h1>Live Tracking</h1>
                </div>
            </div>

            <center> <p id="spinning_icon" class="center-block"><i class="fa fa-spinner w3-spin" style="font-size:120px"></i></p></center>


            <div id="googleMap" class="img-thumbnail center-block" style="width: 1200px; height:600px; 
                 display: none; padding-top: 10px;" ></div>

        </div>
        <br>
        <br>
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
