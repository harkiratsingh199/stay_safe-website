<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Contacts</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery-1.12.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            int cid = Integer.parseInt(request.getParameter("cid"));
            String email = (String) session.getAttribute("user_email");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from contacts where cid='" + cid+"'");
            if (rs.next()) {
                String name = rs.getString("contact_name");
//                String email = rs.getString("user_email");
                String no = rs.getString("contact_no");
                String rel = rs.getString("relation");
        %>
        <form role="form" action="edit_contacts2.jsp?cid=<%=cid%>" method="post">
                <div class="form-group">
                    <input type="text" class="form-control " name="contactname" value="<%=name%>"/>
                </div> 
                     <div class="form-group">

                    <input type="text" class="form-control " name="contactnumber" value="<%=no%>"/>
                </div>
                 <div class="form-group">

                    <select name="relation"   class="btn" required>
                            <option>Friends</option>
                            <option>Family</option>
                            <option>Sibling</option>
                            <option>Business</option>
                            <option>Other</option>
                        </select>
                 </div>
                   <div class="form-group">
                    <input type="submit" class="btn btn-primary pull-right" value="Save"/>
                </div>
            </form>
            <%
                } 
            %>
    </body>
</html>
