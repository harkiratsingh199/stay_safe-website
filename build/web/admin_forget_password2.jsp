
<%@page import="java.sql.*;" %>
<%
    
   String email=(String)session.getAttribute("admin_email");
   String ans=request.getParameter("ans");
   System.out.println(ans);
   
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    System.out.println("select * from admin where email='" + email + "' and security_ans = '"+ans+"'");
    ResultSet rs = stmt.executeQuery("select * from admin where email='" + email + "' and security_ans = '"+ans+"'");
    if (rs.next()) 
    {
        String password= rs.getString("password");
          response.sendRedirect("admin_login1.jsp?msg=Password is"+password);
    }
    else
    {
          response.sendRedirect("admin_login1.jsp?msg=Wrong Information");
    }
    
    
    
    
    
    
    
    
    
    
    
    
    %>