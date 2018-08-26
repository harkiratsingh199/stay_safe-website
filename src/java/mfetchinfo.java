
import java.sql.*;
import java.io.PrintWriter;
import javax.servlet.*;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class mfetchinfo extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        String email,p;
       
        email = request.getParameter("email");
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs
                    = stmt.executeQuery("select * from user_signup where email='" + email + "'");
            if (rs.next()) {
          String f=rs.getString("first_name");
          String l=rs.getString("last_name");
          String e=rs.getString("email");
          String n=rs.getString("phoneno");
           p=f + "^" + l + "^" + e + "^" + n;
            out.println(p);
            
            } 
           
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
