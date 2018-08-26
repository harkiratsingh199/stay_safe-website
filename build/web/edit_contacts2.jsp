<%@page import="java.sql.*;" %>

<%
    int cid = Integer.parseInt(request.getParameter("cid"));
    String name = request.getParameter("contactname");
    String no =request.getParameter("contactnumber");
    String re =request.getParameter("relation");
    System.out.println(cid);
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from contacts where cid='" + cid +"'");
    if(rs.next())
    {
        rs.updateString("contact_name", name);
        rs.updateString("contact_no",no);
        rs.updateString("relation",re);
        rs.updateRow();
        response.sendRedirect("View_contacts.jsp?msg=Recored updated Successfully");
    }
    else
    {
        response.sendRedirect("View_contacts.jsp?msg=Record not found");
    }
    
    
%>