
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="user_menu.jsp" %>
<html>
    <head>
        <title>View All Location</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery-1.12.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="http://maps.googleapis.com/maps/api/js"></script>
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
            var map;
            var zoom_level = 12;
//            var myCenter = new google.maps.LatLng(31.634, 74.8723);
             var myCenter = new google.maps.LatLng(42.26320689654081,-82.93224711055763);
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
                    zoom: zoom_level,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
//                map.setOptions({
//                    styles: style
//                });
                loadAllMarked();
            }
            function loadAllMarked()
            {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var loc = xmlhttp.responseText;
                        var lat_lng = loc.split("^");
//                        console.log("length" + lat_lng.length);
                        if (lat_lng.length > 1)
                        {
                            for (var i = 0; i < lat_lng.length; i = i + 2)
                            {
                                var lat = lat_lng[i].trim().valueOf();
                                var lng = lat_lng[i + 1].trim().valueOf();
                                getLocationDetails(lat, lng, false);
                            }
                        }
                    }
                };
                xmlhttp.open("GET", "./fetch_marked.jsp", true);
                xmlhttp.send();
            }

            function placeMarker(location) {
                var marker = new google.maps.Marker({
                    position: location,
                    map: map,
                });
                addInfoWindow(marker, location);
            }

            function getLocationDetails(latitude, longitude, flag)
            {
                var geocoder;
                geocoder = new google.maps.Geocoder();
                var latlng = new google.maps.LatLng(latitude, longitude);
                 placeMarker(new google.maps.LatLng(latitude, longitude));
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
                            if (flag == false)
                            {
                                placeMarker(new google.maps.LatLng(latitude, longitude));
                            }
                        }
                        else
                        {
                            alert("no address found");
                        }
                    }
//                    else
//                    {
//                        alert("geo coder failed");
//                    }
                }
                );
            }
            function addInfoWindow(marker, location)
            {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        var address = xmlhttp.responseText;

                        marker.info = new google.maps.InfoWindow({
                            content: address
                        });
                        marker.addListener('mouseover', function () {
                            marker.info.open(map, marker);
                        });
                        marker.addListener('mouseout', function () {
                            marker.info.close();
                        });
                    }
                };
                xmlhttp.open("GET", "./fetch_add.jsp?msg=" + location.lat() + "^" + location.lng(), true);
                xmlhttp.send();
            }

            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
    </head>

    <body>
        <div class="w3-container w3-animate-zoom" style="background-color: whitesmoke;">
            <div class="row" style="height: 100px;">
                <div class="jumbotron" style="background-image:url(jbg.jpg); background-size: 100%; color: #ffffff; ">
                    <h2>View All Location</h2>
                </div>
            </div>
            <div id="googleMap" class="img-thumbnail center-block" style="width: 1000px; height:700px" ></div>
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
