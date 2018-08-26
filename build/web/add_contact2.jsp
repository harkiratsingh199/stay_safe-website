
<%@page import="java.sql.*;" %>

<%
        String name = request.getParameter("contactname");
        String email = (String) session.getAttribute("user_email");
        String no = request.getParameter("phoneno");
        String rel = request.getParameter("select");
        

        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
  
            ResultSet rs = stmt.executeQuery("select * from contacts ");
            rs.moveToInsertRow();
            rs.updateString("contact_name", name);
            rs.updateString("contact_no", no);
            rs.updateString("user_email", email);
            rs.updateString("relation", rel);
            rs.insertRow();

            response.sendRedirect("View_contacts.jsp?msg=Contacts Added Successfully");

       
    

%>