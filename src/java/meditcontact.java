
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

public class meditcontact extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        String email, name, number, rel, cid;

        email = request.getParameter("cid");
        System.out.println(email);
        name = request.getParameter("name");
        number = request.getParameter("number");
        rel = request.getParameter("relation");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

            ResultSet rs = stmt.executeQuery("select * from contacts where cid='" + email + "'");
            if (rs.next()) {
                rs.updateString("contact_name", name);
                rs.updateString("contact_no", number);
                rs.updateString("relation", rel);
                rs.updateRow();
                out.println("Contact Updated Successfully ");
            } else {
                out.println("Not Updated Contact");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
