<%@page import="java.sql.*" %>
<%
    int pid = Integer.parseInt(request.getParameter("pid"));

    //       load comments on this post
    //JDBC CODE
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login","root","system");
    Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs1 = stmt1.executeQuery("select * from comment,user_signup where comment.comment_by = user_signup.email and comment.post_id=" + pid + " order by date_time ");
    if (rs1.next())
    {
        rs1.beforeFirst();
        while (rs1.next())
        {
            String pic = rs1.getString("user_signup.profile_pic");
            String fn = rs1.getString("user_signup.first_name");
            String ln = rs1.getString("user_signup.last_name");
            String comment = rs1.getString("comment.comment");
            String commentTime = rs1.getString("comment.date_time");
            
            %>
            <div id="comments_div" class="row" >
                                <div class="col-sm-2">
                                    <img src="<%=pic%>" width="50" height="50" />
                                </div>
                                <div class="col-sm-10">
                                    <p><b><%=fn%> <%=ln%></b><sub>
                                        <%=commentTime%></sub></p>
                                    <p><%=comment%></p>
                                </div>
                            </div>
                            <hr>

<%

        }
    }  
    else
    {
        %>
        <p>No comments to show</p>
<%
    }
%>