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
        
        int hallID = Integer.parseInt(request.getParameter("hallID"));
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        try { 
            Date dateStart =new SimpleDateFormat("yyyy-mm-dd").parse(startDate);
            Date dateEnd =new SimpleDateFormat("yyyy-mm-dd").parse(endDate);
        } catch (ParseException ex) {
            Logger.getLogger(createBooking.class.getName()).log(Level.SEVERE, null, ex);
        }
        HttpSession session = request.getSession();
        String email = (String)session.getAttribute("sessionEmail");
        int userID = 0;
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
            
            String selectUser = "select * from user where email=?";
            PreparedStatement us = conn.prepareStatement(selectUser);
            us.setString(1, email);
            ResultSet urs = us.executeQuery();
//            while(urs.next()){
                userID = urs.getInt("id");
//            }
            
//            String checkAvalaibility = "select * from dateAvailability where hall=?";
//            PreparedStatement ca = conn.prepareStatement(checkAvalaibility);
//            ca.setInt(1, hallID);
//            ResultSet cas = ca.executeQuery();
//            while(cas.next()){
//                
//            }
            
            String sqlinsert = "insert into booking(hallBooked,customer)values(?,?)";
            
            PreparedStatement ps = conn.prepareStatement(sqlinsert);
            ps.setInt(1, hallID);
            ps.setInt(2, userID);
            ps.executeUpdate();
            
            conn.close();
            
            response.sendRedirect("../BookingView/MainBooking.jsp");
            
            
        }
        catch(Exception ex){}
        
    }
}
