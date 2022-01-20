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
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        Date dateStart = null;
        Date dateEnd = null;
//        try { 
//            dateStart =new SimpleDateFormat("yyyy-mm-dd").parse(startDate);
//            dateEnd =new SimpleDateFormat("yyyy-mm-dd").parse(endDate);
//        } catch (ParseException ex) {
//            Logger.getLogger(createBooking.class.getName()).log(Level.SEVERE, null, ex);
//        }
        HttpSession session = request.getSession();
        String email = (String)session.getAttribute("sessionEmail");
        int userID = 0;
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
                userID = urs.getInt("id");
            }
            //check date availability
            String checkDate = "select * from dateavailability where hallBooked=? and startDate>=? and endDate<=?";
//            out.println("cubaan");
            PreparedStatement check = conn.prepareStatement(checkDate);
//            out.println("cubaan");
            check.setInt(1, hallID);
//            out.println(startDate);
//            out.println(endDate);
//            check.setDate(2, (java.sql.Date) dateStart);
//            check.setDate(3, (java.sql.Date) dateEnd);
            check.setDate(2,java.sql.Date.valueOf(startDate));
            check.setDate(3,java.sql.Date.valueOf(endDate));
//            out.println("/ncubaan penanda");
            ResultSet cas = check.executeQuery();
            if(cas.next()){
//                out.println("cubaan dalam checking");
                out.println("<p style=\"color:red;\">Chosen dates are unavailable </p>");                
                request.getRequestDispatcher("BookingView/createBooking.jsp").include(request, response);
            }
            else{
                String sqlinsertBooking = "insert into booking(hallBooked,customer)values(?,?)";          
                PreparedStatement ps = conn.prepareStatement(sqlinsertBooking);
                ps.setInt(1, hallID);
                ps.setInt(2, userID);
                ps.executeUpdate();
                String sqlinsertDateAvailability = "insert into dateAvailability(startDate, endDate, hallBooked)values(?,?,?)";
                PreparedStatement ps_date = conn.prepareStatement(sqlinsertDateAvailability);

    //            ps_date.setDate(1, (java.sql.Date) dateStart);
    //            ps_date.setDate(2, (java.sql.Date) dateEnd);
                ps_date.setDate(1,java.sql.Date.valueOf(startDate));
                ps_date.setDate(2,java.sql.Date.valueOf(endDate));
                ps_date.setInt(3,hallID);
                ps_date.executeUpdate();

                conn.close();

                response.sendRedirect("BookingView/myBooking.jsp");
            }       
            
        }
        catch(Exception ex){}
        
    }
}
