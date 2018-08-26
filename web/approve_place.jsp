<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.*" %>
<%

    //String email = (String) session.getAttribute("user_email");
    String msg = request.getParameter("msg");
    System.out.println("msg = " + msg);
    StringTokenizer st = new StringTokenizer(msg, "^");
    String lat = st.nextToken();
    String lng = st.nextToken();
    String fn = st.nextToken();
    String ln = st.nextToken();
    System.out.println("***** " + lat + lng + fn + ln);

    //JDBC CODE
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from unsafe_place where lattitude='"+lat+"'and longitude='"+lng+"' and marked_by=(select marked_by from user_signup,unsafe_place where user_signup.email = unsafe_place.marked_by and lattitude='" + lat + "' and longitude='" + lng + "' and first_name='" + fn + "' and last_name='" + ln + "')");

    if(rs.next())
    {
        rs.updateString("staus","approved");
        rs.updateRow();
    }


%>