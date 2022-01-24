/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BookingController;

import DAO.BookingDAO;
import DAO.BookingDAOImpl;
import Model.Booking;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        int hallID = Integer.parseInt(request.getParameter("hallID"));
        int promo_id = Integer.parseInt(request.getParameter("promotion"));
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        Date dateStart = null;
        Date dateEnd = null;
        String status = "Not confirmed";
        out.println("/ncubaan penanda");
//        try { 
//            dateStart =new SimpleDateFormat("yyyy-mm-dd").parse(startDate);
//            dateEnd =new SimpleDateFormat("yyyy-mm-dd").parse(endDate);
//        } catch (ParseException ex) {
//            Logger.getLogger(createBooking.class.getName()).log(Level.SEVERE, null, ex);
//        }
        HttpSession session = request.getSession();
        String email = (String)session.getAttribute("sessionEmail");
        int userID = 0;
        int promoID = 0;
        double priceDisc = 0;
        int getRecordId = 0;
//        out.println("cubaan");
        BookingDAO dao = new BookingDAOImpl();
        Booking b = new Booking();
        
        b.setTotalPrice(priceDisc);
        b.setStatus(status);
        b.setHallBooked(hallID);
        b.setCustomer(userID);
        b.setPromo_id(promo_id);
        
        dao.createBooking(b,hallID,promo_id,startDate,endDate,dateStart,dateEnd,status,email,userID,promoID,priceDisc,getRecordId);

        response.sendRedirect("BookingView/BookingPayment.jsp?booking="+getRecordId);
}
}
