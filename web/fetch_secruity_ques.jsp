<%@page import="java.sql.*;" %>
 <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="jquery-1.12.2.min.js"></script>
  <script src="js/bootstrap.min.js"></script>

<%

    String email = request.getParameter("email");
    //System.out.println(email);
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from admin where email='" + email + "'");
    if (rs.next()) {
        session.setAttribute("admin_email", email);
        String ques = rs.getString("security_ques");
%>
<div class="container">
<form action="admin_forget_password2.jsp">
    <br>
    <br>
    <input type="text" readonly  value="<%=ques%>" class="form-control"/>
    <br>
    <br>
    <input type="password" required placeholder="Enter the Answer" name="ans" class="form-control"/>
    <br>
    <br>   
    <input type="submit" value="Submit" class="btn btn-primary" />

</form>
</div>
<%
} else {
%>

<h5>Wrong Email</h5>   
<%
    }

%>