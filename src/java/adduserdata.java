
import java.io.*;
import java.security.SecureRandom;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.sql.*;

@MultipartConfig
public class adduserdata extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         PrintWriter out = response.getWriter();

        String x = request.getParameter("email");
        String email = request.getParameter("email");
        int p=0;
    char t[]=x.toCharArray();
    for(int i=0;i<x.length();i++)
   {
  
     
     if(!(t[i]>='A'&&t[i]<='Z'||t[i]>='a'&&     t[i]<='z'||t[i]>='0'&&t[i]<='9'||t[i]=='.'|| t[i]=='_'||t[i]=='@')||t[0]>='0'&&t[0]<='9'||t[x.length()-1]>='0'&&t[x.length()-1]<='9'||t[i]=='@'&&t[i+1]=='@'||t[i]=='.'&&t[i+1]=='.'||t[i]=='@'&&t[i+1]=='.'||t[i]=='.'&&t[i+1]=='@'||t[x.length()-1]=='.'||t[x.length()-1]=='_'||t[x.length()-1]=='@'||!((x.lastIndexOf('.'))-(x.indexOf('@'))>1))
     {
      
        p=1;
        break;
     }
   }
     if(p==1)
     response.sendRedirect("user_signup.jsp?msg=Invalid Email");
     else
     {
        String firstname = request.getParameter("firstname");
        String secondname = request.getParameter("secondname");
        String phoneno = request.getParameter("phoneno");
        String ques = request.getParameter("select");
        String ans = request.getParameter("securityans");
        String pass = request.getParameter("password");

        String filename = "";

        response.setContentType("text/html;charset=UTF-8");
       
        try {

            //Part part1= request.getPart("f");
            //Get List of Multiple files(part) and write in folder
            Collection<Part> parts = request.getParts();

            String absolutepath = request.getServletContext().getRealPath("/myuploads");
            System.out.println(absolutepath);
            String f = "";
            System.out.println("1");
            for (Part p1 : parts) {
                filename = vmm2.FileUploader.savefileonserver(p1, absolutepath);

                if (!filename.equals("")) {
                    f = f + filename;
                    System.out.println("1");
                }
            //    else
                // {
                //   response.sendRedirect("user_signup.jsp?msg=not a file");
                //}
            }

            ////  ## CODE   //////out.println("1");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from user_signup where email='" + email + "'");
            ///  ## CODE Ends Here  ////
            if (rs.next()) {
                response.sendRedirect("user_signup.jsp?msg=EmailId Already Registered");
            } else {

                String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                SecureRandom rmd = new SecureRandom();
                StringBuffer sb = new StringBuffer(6);
                for (int i = 0; i < 8; i++) {
                    sb.append(AB.charAt(rmd.nextInt(AB.length())));
                }
                String pwd = sb.toString();
                rs.moveToInsertRow();
                System.out.println("3");
                System.out.println(email);
                rs.updateString("email", email);
                rs.updateString("first_name", firstname);
                rs.updateString("last_name", secondname);
                rs.updateString("phoneno", phoneno);
                rs.updateString("security_ques", ques);
                rs.updateString("security_ans", ans);
                rs.updateString("password", pass);
                rs.updateString("validation_code", pwd);
                rs.updateString("profile_pic", "myuploads/" + filename);
                rs.insertRow();
                // session.setAttribute("admin_email", email);
               vmm2.SimpleMailDemoo s= new vmm2.SimpleMailDemoo(email,"Welcome new user","Dear "+firstname+",\nYou have successfully created new account on "
                                                                                    + "www.staysafe.com. Your system generated valiation code is "+pwd+".Please verify your account with this code .");
                response.sendRedirect("user_login1.jsp?msg=Your verification has been sent to registered email.Login after Verfying your account."); response.sendRedirect("user_home.jsp?msg=<h1>SignUp Successfully</h1>");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    }
}
