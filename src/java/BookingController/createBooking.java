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
        try{
//            out.println("cubaan");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
            String selectUser = "select * from user where email=?";
            PreparedStatement us = conn.prepareStatement(selectUser);
            us.setString(1, email);
            ResultSet urs = us.executeQuery();
//            out.println("cubaan");
            if(urs.next()){
                userID = urs.getInt("user_id");
            }
            //check date availability
            String checkDate = "select * from dateavailability where hallBooked=? and startDate>=? and endDate<=?";
//            out.println("cubaan");
            PreparedStatement check = conn.prepareStatement(checkDate);
//            out.println("cubaan");
            check.setInt(1, hallID);
//            out.println(startDate);
//            out.println(endDate);
            check.setDate(2,java.sql.Date.valueOf(startDate));
            check.setDate(3,java.sql.Date.valueOf(endDate));
            ResultSet cas = check.executeQuery();
            if(cas.next()){
//                out.println("cubaan dalam checking");
                out.println("<p style=\"color:red;\">Chosen dates are unavailable </p>");                
                request.getRequestDispatcher("BookingView/createBooking.jsp").include(request, response);
            }
            else{

                String sqlPromo = "select * from promotion where promo_id=?";
                PreparedStatement ps_promo = conn.prepareStatement(sqlPromo);
                ps_promo.setInt(1, promo_id);
                ResultSet promo = ps_promo.executeQuery();
                out.println("penanda");
                
                String selectHall = "select charge from hall where hall_id=?";
                PreparedStatement ps_hall = conn.prepareStatement(selectHall);
                ps_hall.setInt(1, hallID);
                ResultSet rs_hall = ps_hall.executeQuery();
                
                if(promo.next()){
                    out.println("/ncubaan penanda");
                    promoID = promo.getInt("promo_id");
                    out.println(promoID);
                    double disc = promo.getDouble("discount")/100;
                    if(rs_hall.next()){
                        priceDisc = rs_hall.getDouble("charge") - (rs_hall.getDouble("charge")*disc);
                    }
                } else{
                    
                    if(rs_hall.next()){
                        priceDisc = rs_hall.getDouble("charge");
                    }
                    
                }
                        
                String sqlinsertBooking = "insert into booking(totalPrice,status,hallBooked,customer,promo_id)values(?,?,?,?,?)";    
//                out.println(status);
                PreparedStatement ps = conn.prepareStatement(sqlinsertBooking, Statement.RETURN_GENERATED_KEYS);
//                out.println("cubaan dalam checking");
                ps.setDouble(1, priceDisc);
                ps.setString(2, status);
//                out.println("cubaan dalam checking");
                ps.setInt(3, hallID);
//                out.println("cubaan dalam checking");
                ps.setInt(4, userID);
//                out.println(hallID);
                ps.setInt(5, promoID);
                ps.executeUpdate();
                out.println("penanda");
                ResultSet rs = ps.getGeneratedKeys();
                out.println("penanda");
                if(rs.next()){
                    getRecordId = rs.getInt(1);
                }
                out.println(getRecordId);                
                
                String sqlinsertDateAvailability = "insert into dateAvailability(startDate, endDate, hallBooked, bookingID)values(?,?,?,?)";
                
                
                PreparedStatement ps_date = conn.prepareStatement(sqlinsertDateAvailability);

    //            ps_date.setDate(1, (java.sql.Date) dateStart);
    //            ps_date.setDate(2, (java.sql.Date) dateEnd);
                ps_date.setDate(1,java.sql.Date.valueOf(startDate));
                ps_date.setDate(2,java.sql.Date.valueOf(endDate));
                ps_date.setInt(3,hallID);
                ps_date.setInt(4,getRecordId);
                ps_date.executeUpdate();
                

                conn.close();

//                response.sendRedirect("BookingView/myBooking.jsp");
                response.sendRedirect("BookingView/BookingPayment.jsp?booking="+getRecordId);
            }       
            
        }
        catch(Exception ex){}
        
    }
}
