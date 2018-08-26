
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Change Password</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="jquery-1.12.2.min.js"></script>
  <script src="js/bootstrap.min.js"></script>

    </head>
    <body>
        <h1>Change Password</h1>
         <%
         String email=(String)session.getAttribute("admin_email");   
        %>
        <br>
        <div class="container">
        <form action="admin_change_password2.jsp" onsubmit="return go()">
            
          <input type="text"  name="email" readonly value="<%=email%>" class="form-control"> 
          <br>
          <br>
          <input type="password" required placeholder="Enter the old password" name="oldpass" id="p1" class="form-control">
          <br>
          <br>
          <input type="password" required placeholder="Enter the new password" name="newpass" id="p2" class="form-control">
          <br>
          <br>
          <input type="password" required placeholder="Confirm password" name="confirmpass" id="p3" class="form-control">
          <br>
          <br>
          <input type="submit" value="Change Passwword" class="btn btn-primary" />
         </form>
        </div>
          <script>
              function go()
            {
               if(document.getElementById("p2").value!=document.getElementById("p3").value)
                {
                   alert("Wrong Password Combination");
                   return false;
                }
                else
                {
                return true;
            
                }
            }
         </script>
        
    </body>
</html>
