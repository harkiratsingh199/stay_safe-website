
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sun.security.pkcs11.wrapper.Functions;

public class fetchlatlng extends HttpServlet
{

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            String email = request.getParameter("email");
            System.out.println(email);
            String currentdate = null;
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
            Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs1 = stmt1.executeQuery("select CURDATE()");
            if (rs1.next())
            {
                currentdate = rs1.getDate("CURDATE()").toString();
            }
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from latlong where email = '" + email + "' and date_time like '" + currentdate + "%'");

            String points = "";

            if (rs.next())
            {
                rs.beforeFirst();
                while (rs.next())
                {
                    Double lat = rs.getDouble("latitude");
                    Double lng = rs.getDouble("longitude");
                    points = points + lat + "^" + lng + "^";
                }
                out.println(points.substring(0, (points.length() - 1)));

            } else
            {
                out.println("Cannot track the device at this moment");
            }

        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
