<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*" %>

<%
    
    String email = (String) session.getAttribute("user_email");
    response.setContentType("text/plain");
        //JDBC CODE
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login","root","system");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
//    ResultSet rs = stmt.executeQuery("select * from unsafe_place where marked_by='"+email+"'");
    ResultSet rs = stmt.executeQuery("select * from unsafe_place");
    String points="";
    int count=0;
    if(rs.next())
    {
        rs.beforeFirst();
        while(rs.next())
        {
            
//            String latitude  = rs.getString("lattitude");
//            String longitude  = rs.getString("longitude");
//            points = points+latitude+"^"+longitude+"^";
                    Double lat = rs.getDouble("lattitude");
                    Double lng = rs.getDouble("longitude");
                    points = points + lat + "^" + lng + "^";
//                    out.println(points);
        }
        out.println(points.substring(0, (points.length()-1)));
    }

%>