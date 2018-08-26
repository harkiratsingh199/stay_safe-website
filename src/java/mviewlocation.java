
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

public class mviewlocation extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String email;
        String e = "approved";

        email = request.getParameter("email");
        System.out.println(email);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

            ResultSet rs = stmt.executeQuery("select * from unsafe_place where staus='" + e + "'");
            String points = "";
            if (rs.next()) {
                rs.beforeFirst();

                while (rs.next()) {
                    String latitude = rs.getString("lattitude");
                    String longitude = rs.getString("longitude");
                    String add = rs.getString("location_address");
                    String name = rs.getString("marked_by");
                    int id = rs.getInt("id");
                    String lname = rs.getString("location_name");

                    points = points + latitude + "^" + longitude + "^" + add + "^" + name + "^" + id + "^" + lname;
                    System.out.println(points);
                    out.println(latitude + "^" + longitude + "^" + add+ "^" + name + "^" + id + "^" + lname);
                }
//   out.println(points.substring(0, (points.length()-1)));
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
