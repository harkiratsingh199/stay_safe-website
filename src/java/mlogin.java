
import java.sql.*;
import java.io.PrintWriter;
import javax.servlet.*;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class mlogin extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        String email, password;
        email = request.getParameter("email");
        password = request.getParameter("password");
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs
                    = stmt.executeQuery("select * from user_signup where email='" + email + "'and password='" + password + "'");
            if (rs.next()) {
               String valid = rs.getString("verified_act");
                if (valid.equals("yes"))
                {
                    out.println("Login Successful");
                } 
                else if(valid.equals("NO"))
                {
                    out.println("Login failed, verify your account first");
                }
            } 
            else
            {
                out.println("Incorrect EmailId or Password");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
