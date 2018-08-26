<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="jquery-1.12.2.min.js"></script>
  <script src="js/bootstrap.min.js"></script>

    </head>
    <body>
         <h1>LOGIN</h1>
        <br>
        <div class="container">
        <form action="admin_login2.jsp">
            
          <input type="text"  required placeholder="Enter email here" name="email" class="form-control">
          <br>
          <br>
          <input type="password" required placeholder="Enter the password" name="pass" class="form-control">
          <br>
          <br>
          <input type="Submit" value="Submit" class="btn btn-primary">
          <br>
          <br>
          <a href="admin_forget_password1.jsp"><h5>Forget Password?</h5></a>
          </form>
        </div>
          <%
              String msg=request.getParameter("msg");
              if(msg!=null)
              {
                %>
                
                <label><%=msg%></label>
                
                <%
                  
              }
              
            
            %>
        
    </body>
</html>
