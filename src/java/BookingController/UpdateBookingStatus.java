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

/**
 *
 * @author End-User
 */
@WebServlet(name = "UpdateBookingStatus", urlPatterns = {"/UpdateBookingStatus"})
public class UpdateBookingStatus extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int bookingID = Integer.parseInt(request.getParameter("bookingID"));
        String status = request.getParameter("status");
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
            
            String sqlupdate = "update booking set status=? where id=?";
            
            PreparedStatement ps = conn.prepareStatement(sqlupdate);
            
            ps.setString(1, status);
            ps.setInt(2, bookingID);
            ps.executeUpdate();
            
            conn.close();
            
            response.sendRedirect("BookingView/ManageBooking.jsp");
            
            
        }
        catch(Exception ex){}
        
    }

}
