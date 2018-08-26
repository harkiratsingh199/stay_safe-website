
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class maddcontact extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String email, name, number, rel;
        email = request.getParameter("email");
        name = request.getParameter("name");
         String no = request.getParameter("phoneno");
         number=no.trim();
        rel = request.getParameter("relation");
        System.out.println(email+"^"+name+"^"+rel+"^"+number);

        int rowcount = 5;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

            ResultSet rs = stmt.executeQuery("select count(user_email) from contacts where user_email='" + email + "'");

            rs.next();
            rowcount = rs.getInt("count(user_email)");
            System.out.println(rowcount);

            if (rowcount == 5) {

                out.println("Contacts Limit Reached");

            } else {
                Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

                ResultSet rs1 = stmt1.executeQuery("select * from contacts where user_email='" + email + "' and contact_no='" + number + "'");

                if (rs1.next()) {
                    out.println("Contact Number Already Added");

                } else {
                    Statement stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs2 = stmt2.executeQuery("select * from contacts");

                    rs2.moveToInsertRow();
                    rs2.updateString("contact_name", name);
                    rs2.updateString("contact_no", number);
                    rs2.updateString("user_email", email);
                    rs2.updateString("relation", rel);
                    rs2.insertRow();

                    out.println("Contacts Added Successfully");
                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
