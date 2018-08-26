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
    ResultSet rs = stmt.executeQuery("select * from user_signup where email='" + email + "'");
    if (rs.next()) {
        session.setAttribute("user_email", email);
        String ques = rs.getString("security_ques");
%>
<form  role="form-control" action="user_forget_password2.jsp" method="post">
    <div class="form-group">
        <input type="text" readonly name="ques" value="<%=ques%>" class="form-control"/>
    </div>
    <div class="form-group">
        <input type="password" required placeholder="Enter the Answer" name="ans" class="form-control"/>
    </div>
    <div class="form-group">
        <input type="submit" value="Submit" class="btn btn-primary" />
    </div>
</form>
<%
} else {
%>

<h5>Wrong Email</h5>   
<%
    }

%>