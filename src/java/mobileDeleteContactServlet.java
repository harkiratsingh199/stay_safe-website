
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class mobileDeleteContactServlet extends HttpServlet
{

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            int id = Integer.parseInt(request.getParameter("id"));
            //JDBC CODE
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from contacts where cid = " + id );
            if (rs.next())
            {
               rs.deleteRow();
               out.println("Contact Deleted successfully");
            }
            else
            {
                out.println("No_Contact_to_delete");
            }

        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }

}
