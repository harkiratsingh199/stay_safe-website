
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class mobileusersignup extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
            //System.out.println("hello");

        String email, fn, ln, password, confirmpassword, phone_no, sec_ques, sec_ans;
        PrintWriter out = response.getWriter();
        email = request.getParameter("email");
        System.out.println(email);
        fn = request.getParameter("first");
        ln = request.getParameter("last");
        password = request.getParameter("password");
        confirmpassword = request.getParameter("confirm");
        phone_no = request.getParameter("phoneno");
        sec_ques = request.getParameter("ques");
        sec_ans = request.getParameter("ans");
        int elen = email.length();
        int i = email.indexOf('@');
        int j = email.indexOf('.');
//            if(i!=-1)
//            {
//                String subemail = email.substring(i, elen);
//                int k = subemail.indexOf('.');
//            }

        int plen = password.length();

        if (!email.contains("@")) {
            out.println("Invalid Email");
        } else if (!email.contains(".")) {
            out.println("Invalid Email");
        } else if (j == -1 || j == (i + 1)) {
            out.println("Invalid E-mail");
        } else if (j < i) {
            out.println("Invalid E-mail");
        } else if (i == 0) {
            out.println("Invalid E-mail");
        } else if (fn.isEmpty()) {
            out.println("First Name can't be empty");
        } else if (ln.isEmpty()) {
            out.println("Last Name can't be empty");
        } else if (fn.length() > 15) {
            out.println("First Name can't have more than 15 characters");
        } else if (!CheckStringHasOnlyLetters.isAlpha(fn)) {
            out.println("First Name can't have numbers or special characters");
        } else if (!CheckStringHasOnlyLetters.isAlpha(ln)) {
            out.println("Last Name can't have numbers or special characters");
        } else if (ln.length() > 15) {
            out.println("Last Name can't have more than 15 characters");
        } else if (!phone_no.matches("\\d+")) {
            out.println("phone number must have digits only");
        } else if (password.length() < 8 || password.length() > 20) {
            out.println("password must be 8 to 20 charachters long");
        } else if (confirmpassword.isEmpty()) {
            out.println("confirm password can't be empty");
        } else if (!confirmpassword.equals(password)) {
            out.println("password and confirm password must match");
        } else if (sec_ans.isEmpty()) {
            out.println("Security answer can't be empty");
        } else {
            // pw.println("<html>")
            try {
                ////  ## CODE   //////
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver Loading done");

                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
                System.out.println("Connection Created");

                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

                System.out.println("Statement Created");

                ResultSet rs
                        = stmt.executeQuery("select * from user_signup where email='" + email + "'");

                System.out.println("ResultSet Created");

           ///  ## CODE Ends Here  ////
                if (rs.next()) {
                    out.println("Email ALready exist");
                } else {
                    String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                    SecureRandom rmd = new SecureRandom();
                    StringBuffer sb = new StringBuffer(6);
                    for (int l = 0; l < 8; l++) {
                        sb.append(AB.charAt(rmd.nextInt(AB.length())));
                    }
                    String pwd = sb.toString();

                    rs.moveToInsertRow();
                    rs.updateString("email", email);
                    rs.updateString("first_name", fn);
                    rs.updateString("last_name", ln);
                    rs.updateString("phoneno", phone_no);
                    rs.updateString("security_ques", sec_ques);
                    rs.updateString("security_ans", sec_ans);
                    rs.updateString("password", password);
                    rs.updateString("validation_code", pwd);

                    rs.insertRow();
                    vmm2.SimpleMailDemoo s = new vmm2.SimpleMailDemoo(email, "Welcome new user", "Dear " + fn + ",\nYou have successfully created new account on "
                            + "www.StaySafe.com. Your system generated valiation code is " + pwd + ".Please verify your account with this code .");

                    out.println("Signup successfully"
                            + "Please Verify your account");
                }

            } catch (Exception ex) {
                ex.printStackTrace();
            }

        }
    }
}
