
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
                xmlhttp.open("GET", "fetch_secruity_ques.jsp?email=" + email, true);
                xmlhttp.send();
            }
            function hello()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    document.getElementById("d1").innerHTML =
                            xmlhttp.responseText;
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
        <div id="d1">
            <br>
            <br>
        </div>
        </div>
    </body>


</html>
