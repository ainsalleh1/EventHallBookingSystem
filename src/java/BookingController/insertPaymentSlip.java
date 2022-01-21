/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BookingController;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author End-User
 */
@WebServlet(name = "insertPaymentSlip", urlPatterns = {"/insertPaymentSlip"})
@MultipartConfig
public class insertPaymentSlip extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        
        
        String status = request.getParameter("paymentStatus");
        int booking_id = Integer.parseInt(request.getParameter("bookingID"));
        Part filePart = request.getPart("PaymentSlip");
        String file = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
            
            String sqlupdate = "update booking set paymentSlip=?,status=? where id=?";
            
            PreparedStatement ps = conn.prepareStatement(sqlupdate);
       
            ps.setString(1, file);
            ps.setString(2, status);
            ps.setInt(3, booking_id);
            ps.executeUpdate();
            
            conn.close();
            
            response.sendRedirect("../BookingView/myBooking.jsp");
            
            
        }
        catch(Exception ex){}
    }
        
    
}