
<%@page import="java.security.SecureRandom"%>
<%@page import="java.sql.*;" %>
<%
    
   String email=(String)session.getAttribute("user_email");
   String ans=request.getParameter("ans");
   String ques=request.getParameter("ques");
   System.out.println(ans);
   
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
//    System.out.println("select * from user_signup where email='" + email + "' and security_ans = '"+ans+"'");
    ResultSet rs = stmt.executeQuery("select * from user_signup where email='" + email + "'and security_ques='"+ ques +"'and security_ans = '"+ans+"'");
    if (rs.next()) 
    {
        String password = rs.getString("password");
        String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        SecureRandom rmd = new SecureRandom();
        StringBuffer sb = new StringBuffer(6);
        for (int i = 0; i < 8; i++)
        {
            sb.append(AB.charAt(rmd.nextInt(AB.length())));
        }
        String pwd = sb.toString();
        rs.updateString("password",pwd);
        rs.updateRow();
         vmm2.SimpleMailDemoo s = new vmm2.SimpleMailDemoo(email, "Welcome new user", "Dear user,\nYour system generated password is " + pwd + ".Please login with this password .\nDo change your password after login .");

        response.sendRedirect("user_login1.jsp?msg=Your Password is sent to registered email");
}
    else
    {
          response.sendRedirect("user_login1.jsp?msg=Wrong Information");
    }
    
    
    
  %>