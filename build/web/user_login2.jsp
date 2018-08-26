<%@page import="java.sql.*;" %>

<%

    String email = request.getParameter("email");

    String password = request.getParameter("pass");

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from user_signup where email='" + email + "' and password='" + password + "'");
    if (rs.next()) {
        String user_name = rs.getString("first_name") + " " + rs.getString("last_name");
        String prof_pic = rs.getString("profile_pic");
        String valid = rs.getString("verified_act");
        if (valid.equals("yes")) {
            session.setAttribute("user_email", email);
            session.setAttribute("user_pic", prof_pic);
            session.setAttribute("user_name", user_name);
            response.sendRedirect("user_home2.jsp");
        } else {
            response.sendRedirect("user_login1.jsp?msg=First verfiy, to access your account");

        }

    } else {
        response.sendRedirect("user_login1.jsp?msg=Invalid Username/Password");
    }

%>