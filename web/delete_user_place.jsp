<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.*" %>
<%

    String email = (String) session.getAttribute("user_email");
   String msg = request.getParameter("msg") ;
     System.out.println("msg = "+msg);
     StringTokenizer st = new StringTokenizer (msg,"^");
     String lat = st.nextToken();
     String lng = st.nextToken();
//     String fn = st.nextToken();
//     String ln = st.nextToken();
//     System.out.println("***** "+lat+lng+fn+ln);
//    //JDBC CODE
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from unsafe_place where lattitude = '"+lat+"' and longitude='"+lng+"' and marked_by ='"+email+"'");
//    ResultSet rs1 = stmt.executeQuery("delete from unsafe_place where lattitude = '"+lat+"' and longitude='"+lng+"' and marked_by ='"+email+"'");
    
    if(rs.next())
    {
        rs.deleteRow();
        out.println("Row deleted Successfully");
        response.sendRedirect("map_load.jsp");
    }
    else
    {
        out.println("no reocord found");
    response.sendRedirect("map_load.jsp");
    }
%>