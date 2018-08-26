
<%@page import="java.sql.*;" %>

<%
     String email=(String)session.getAttribute("user_email");
    int id=Integer.parseInt(request.getParameter("pid"));
    String c=request.getParameter("comment");
    System.out.println(id);
    System.out.println(c);
    

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

    ResultSet rs = stmt.executeQuery("select * from comment");

    
        rs.moveToInsertRow();
        rs.updateString("comment",c);
         rs.updateInt("post_id", id);
         rs.updateString("comment_by",email);
         rs.insertRow();


          

%>