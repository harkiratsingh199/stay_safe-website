<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.*" %>
<%
    String msg = request.getParameter("msg");
    String email=(String)session.getAttribute("user_email");
    StringTokenizer st = new StringTokenizer(msg, "^");
    String lat   = st.nextToken();
    String lng = st.nextToken();
    //JDBC CODE
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs= stmt.executeQuery("select * from user_signup,unsafe_place where user_signup.email=unsafe_place.marked_by and lattitude='" + lat +"' and longitude ='"+lng+"'");

    if (rs.next()) 
    {
        out.println(rs.getString("location_address")+"<br> MARKED_BY : "+rs.getString("first_name")+" "+rs.getString("last_name"));
      
    } else {

        out.println("no address found");
    }

%>