
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget Password</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery-1.12.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <script>
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
    </head>
    <body>
        <div class="container">
            <br>
            <br>
            <input type="text" required placeholder="Enter the Email" id="email" class="form-control" />
            <br>
            <input type="button" value="Click" onclick="go()" class="btn btn-primary"/>
            <br><hr>
            <div id="div1" style="border: 2px solid white; display: none;" class="btn"></div>
        
        </div>
    </body>


</html>

