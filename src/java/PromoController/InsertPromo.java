/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PromoController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
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
@WebServlet(name = "InsertPromo", urlPatterns = {"/InsertPromo"})
public class InsertPromo extends HttpServlet {

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
        
        String name = request.getParameter("name");
        double discount = Double.parseDouble(request.getParameter("discount"));
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
            
            String sqlinsert = "insert into promo(name,discount,startDate,endDate,description,status)values(?,?,?,?,?,?)";
            
            PreparedStatement ps = conn.prepareStatement(sqlinsert);
            ps.setString(1, name);
            ps.setDouble(2, discount);
            ps.setString(3, startDate);
            ps.setString(4, endDate);
            ps.setString(5, description);
            ps.setString(6, status);
            
            ps.executeUpdate();
            
            conn.close();
            
            response.sendRedirect("MainPromo.jsp");
            
            
        }
        catch(Exception ex){}
    }
}
