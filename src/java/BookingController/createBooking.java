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
        String status = "Not confirmed";
//        out.println("/ncubaan penanda");
        int booking_id = 0;
        int getRecordId = 0;
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("sessionEmail");
        int userID = 0;
        int promoID = 0;
        double priceDisc = 0;
        Booking b = new Booking();
//        out.println("cubaan");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");

            String checkDate = "select * from dateavailability where hallBooked=? and startDate>=? and endDate<=?";
//            out.println("cubaan");
            PreparedStatement check = conn.prepareStatement(checkDate);
//            out.println("cubaan");
            check.setInt(1, hallID);
//            out.println(startDate);
//            out.println(endDate);
            check.setDate(2, java.sql.Date.valueOf(startDate));
            check.setDate(3, java.sql.Date.valueOf(endDate));
            ResultSet cas = check.executeQuery();
            if (cas.next()) {
//                out.println("cubaan dalam checking");
                out.println("<p style=\"color:red;\">Chosen dates are unavailable </p>");
                request.getRequestDispatcher("BookingView/createBooking.jsp").include(request, response);
            } else {

                String selectUser = "select * from user where email=?";
                PreparedStatement us = conn.prepareStatement(selectUser);
                us.setString(1, email);
                ResultSet urs = us.executeQuery();
//            out.println("cubaan");
                if (urs.next()) {
                    userID = urs.getInt("user_id");
                }

                String sqlPromo = "select * from promotion where promo_id=?";
                PreparedStatement ps_promo = conn.prepareStatement(sqlPromo);
                ps_promo.setInt(1, promo_id);
                ResultSet promo = ps_promo.executeQuery();

                String selectHall = "select charge from hall where hall_id=?";
                PreparedStatement ps_hall = conn.prepareStatement(selectHall);
                ps_hall.setInt(1, hallID);
                ResultSet rs_hall = ps_hall.executeQuery();

                if (promo.next()) {
                    //                   out.println("/ncubaan penanda");
                    promoID = promo.getInt("promo_id");
//                    out.println(promoID);
                    double disc = promo.getDouble("discount") / 100;
                    if (rs_hall.next()) {
                        priceDisc = rs_hall.getDouble("charge") - (rs_hall.getDouble("charge") * disc);
                    }
                } else {

                    if (rs_hall.next()) {
                        priceDisc = rs_hall.getDouble("charge");
                    }

                }

                BookingDAO dao = new BookingDAOImpl();
                b = new Booking(priceDisc,status,hallID,userID,promoID);

//                b.setTotalPrice(priceDisc);
//                b.setStatus(status);
//                b.setHallBooked(hallID);
//                b.setCustomer(userID);
//                b.setPromo_id(promoID);

                booking_id = dao.createBooking(b, hallID, promo_id, startDate, endDate, status, email, userID, promoID, priceDisc, getRecordId);
//                dao.createBooking(b, hallID, promo_id, startDate, endDate, dateStart, dateEnd, status, email, userID, promoID, priceDisc, getRecordId);

                // berjaya
//                String sqlinsertBooking = "insert into booking(totalPrice,status,hallBooked,customer,promo_id)values(?,?,?,?,?)";
//            PreparedStatement ps = conn.prepareStatement(sqlinsertBooking, Statement.RETURN_GENERATED_KEYS);
//            ps.setDouble(1, b.getTotalPrice());
//            ps.setString(2, b.getStatus());
//            ps.setInt(3, b.getHallBooked());
//            ps.setInt(4, b.getCustomer());
//            ps.setInt(5, b.getPromo_id());
//            ps.executeUpdate();
//            ResultSet rs = ps.getGeneratedKeys();
//            if (rs.next()) {
//                getRecordId = rs.getInt(1);
//            }
//
//            String sqlinsertDateAvailability = "insert into dateAvailability(startDate, endDate, hallBooked, bookingID)values(?,?,?,?)";
//
//             PreparedStatement ps_date = conn.prepareStatement(sqlinsertDateAvailability);
//
//            ps_date.setDate(1, java.sql.Date.valueOf(startDate));
//            ps_date.setDate(2, java.sql.Date.valueOf(endDate));
//            ps_date.setInt(3, hallID);
//            ps_date.setInt(4, getRecordId);
//            ps_date.executeUpdate();
            
            // end berjaya
            
            //untuk cubaan output di exception, uncomment below statement
//            BookigDAO do = new BookingDAOImpl();  
            
            conn.close();
                    response.sendRedirect("BookingView/BookingPayment.jsp?booking=" + booking_id);

            }
            

        } catch (Exception e) {
        out.println("in exception");
        out.println(b.getTotalPrice());
        out.println(userID);
        out.println(promoID);
        out.println(userID);
        out.println(priceDisc);
        out.println(booking_id);
        out.println(getRecordId);
        }
          
        
    }
}
