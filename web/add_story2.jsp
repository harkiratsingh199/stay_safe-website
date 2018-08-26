
<%@page import="java.sql.*;" %>

<%

    String email = (String) session.getAttribute("user_email");
     String title = request.getParameter("title");
    String story = request.getParameter("story");
    String location = request.getParameter("location");

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

    ResultSet rs = stmt.executeQuery("select * from viewpost");

    
        rs.moveToInsertRow();
        rs.updateString("title", title);
        rs.updateString("story",story);
         rs.updateString("posted_by", email);
         rs.updateString("location", location);
         rs.insertRow();

            response.sendRedirect("home1.jsp");

          

%>