<%@page import="java.sql.*;" %>
<%
    String email=(String)session.getAttribute("user_email");
    String oldpassword=request.getParameter("oldpassword");
    String newpassword=request.getParameter("newpassword");;    
  Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from user_signup where email='"+email+"' and password='"+oldpassword+"'");
    if(rs.next())
    {
         rs.updateString("password",newpassword);
         rs.updateRow();
               
        response.sendRedirect("user_home2.jsp?msg=Password Changed Successfully");
    }
    else
    {
        session.removeAttribute("admin_email");
        response.sendRedirect("user_login1.jsp?msg=Wrong Information");
    }
      




%>
