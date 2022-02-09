/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BookingController;

import DAO.BookingDAO;
import DAO.BookingDAOImpl;
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
@WebServlet(name = "UpdatePaymentStatus", urlPatterns = {"/UpdatePaymentStatus"})
@MultipartConfig
public class UpdatePaymentStatus extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        BookingDAO dao = new BookingDAOImpl();
        String paymentStatus = request.getParameter("paymentStatus");
        String bank = request.getParameter("bank");
        String referenceNo = request.getParameter("referenceNo");
        String status = request.getParameter("bookingStatus");
        int booking_id = Integer.parseInt(request.getParameter("bookingID"));
//        Part filePart = request.getPart("PaymentSlip");
//        String file = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
        dao.updatePaymentStatus(paymentStatus, bank, referenceNo, status, booking_id);
         response.sendRedirect("BookingView/myBooking.jsp");
    }
        
    
}
