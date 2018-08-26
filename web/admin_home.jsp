
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Home</title>
    </head>
    <body>
        <%
         String email=(String)session.getAttribute("admin_email");   
        %>
            
        <h1>Welcome <%=email%></h1>
        <div class="container">
            <a href="admin_change_password1.jsp"><h5>Change Password</h5></a>
        <a href="admin_map.jsp"><h5>View All Pending Location</h5></a>
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
