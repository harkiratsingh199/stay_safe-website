/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC HP
 */
//@WebServlet(urlPatterns = {"/showdangerlocationservlet"})
public class showdangerlocationservlet extends HttpServlet 
{

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            String email = request.getParameter("email");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/login", "root", "system");
            Statement stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs2 = stmt2.executeQuery("select * from unsafe_place where marked_by='"+email+"'");

            String points = "";

            if (rs2.next())
            {
                rs2.beforeFirst();
                while (rs2.next())
                {
                    String lat=rs2.getString("lattitude");
                    String lng= rs2.getString("longitude");
//                    Double lat = rs2.getDouble("lattitude");
//                    Double lng = rs2.getDouble("longitude");
//                    points = points + lat + "^" + lng + "^";
     points = points+lat+"^"+lng+"^";
                }
                out.println(points.substring(0, (points.length() - 1)));
                System.out.println(points.substring(0, (points.length() - 1)));
            }
//            } else
//            {
//                out.println("Cannot track the device on this day");
//            }

        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
