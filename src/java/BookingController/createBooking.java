/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BookingController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author End-User
 */
@WebServlet(name = "createBooking", urlPatterns = {"/createBooking"})
public class createBooking extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        HttpSession session = request.getSession();
        String email = (String)session.getAttribute("sessionEmail");
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
            
            String selectUser = "select * from user where email=?";
            PreparedStatement us = conn.prepareStatement(selectUser);
            us.setString(1, email);
            urs = us.executeQuery();
            
            String sqlinsert = "insert into hall(name,location,charge,capacity,description,media)values(?,?,?,?,?,?)";
            
            PreparedStatement ps = conn.prepareStatement(sqlinsert);
            ps.setString(1, name);
            ps.setString(2, location);
            ps.setDouble(3, charge);
            ps.setString(4, capacity);
            ps.setString(5, description);
            out.println("<h1> " + file + "</h1>");
//            ps.setBinaryStream(6, fileContent, (int)file.length());
//            ps.setBlob(6, fileContent);
            ps.setString(6, file);
            ps.executeUpdate();
            
            conn.close();
            
            response.sendRedirect("MainHall.jsp");
            
            
        }
        catch(Exception ex){}
        
    }
}
