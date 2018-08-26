
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.*;" %>

<%
    try
    {
   
     int id=Integer.parseInt(request.getParameter("pid"));
     String t=request.getParameter("title");
     String s=request.getParameter("story");
     String email=(String)session.getAttribute("user_email");
//     String p=msg+"";
     System.out.println(id);
    System.out.println(t);
    System.out.println(s);
//    int y=Integer.parseInt(id);
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

    ResultSet rs = stmt.executeQuery("select * from viewpost where pid='" +id+"' and  posted_by='"+email+"'");
    System.out.println("select * from viewpost where pid='" +id+"'");

    if(rs.next())
    {
        rs.updateString("title",t);
        
       System.out.println("1");
        rs.updateString("story",s);
              System.out.println("2");
//              rs.updateString("date","");
       rs.updateRow();
        response.sendRedirect("userviewpost.jsp");
               

    }

    }
    catch(Exception ex)
    {
        ex.printStackTrace();
    }

%>