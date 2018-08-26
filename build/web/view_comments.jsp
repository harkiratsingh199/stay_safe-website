<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Contacts</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="jquery-1.12.2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <style>
            .modal-header, h4, .close {
                background-color: #5cb85c;
                color:white !important;
                text-align: center;
                font-size: 30px;
            }
            .modal-footer {
                background-color: #66afe9;
            }
        </style>
                </head>

    <body>
        
        <%
            int pid = Integer.parseInt(request.getParameter("pid"));
            System.out.println(pid);
            String email = (String) session.getAttribute("user_email");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs1 = stmt.executeQuery("select * from comment,user_signup where comment.comment_by = user_signup.email and post_id=" + pid + " order by date_time ");
                                if (rs1.next())
                                {
                                    rs1.beforeFirst();
                                    
                                    while (rs1.next())
                                    {
                                        String picc = rs1.getString("profile_pic");
                                        String fn = rs1.getString("first_name");
                                        String ln = rs1.getString("last_name");
                                        String comment = rs1.getString("comment");
                                        String commentTime = rs1.getString("date_time");

                            %>
                            <form class="role">
                    <div  class="row" >
                                <div class="col-sm-1">
                                    <img src="<%=picc%>" width="50" height="50" />
                                </div>
                                <div class="col-sm-11">
                                    <p><b><%=fn%> <%=ln%></b><sub>
                                        <%=commentTime%></sub></p>
                                    <p><%=comment%></p>
                                </div>
                            </div>
                            </form>
                            
                            <%
                                    }
                                }
                                %>
    </body>
</html>
