/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package InventoryController;

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
@WebServlet(name = "InsertInventoryHall", urlPatterns = {"/InsertInventoryHall"})
public class InsertInventoryHall extends HttpServlet {

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
        
        int hallID = Integer.parseInt(request.getParameter("hall_id"));
        int item = Integer.parseInt(request.getParameter("hall_item"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
            
            String sqlinsert = "insert into inventoryhall(hallInventory,itemInventory,quantity)values(?,?,?)";
            
            PreparedStatement ps = conn.prepareStatement(sqlinsert);
            ps.setInt(1, hallID);
            ps.setInt(2, item);
            ps.setInt(3, quantity);

            ps.executeUpdate();
            
            conn.close();
            
            out.println("<p style=\"color:red;\"> Item added to hall inventory successfully </p>");                
            request.getRequestDispatcher("InventoryView/InsertHallInventory.jsp?hallID="+hallID).include(request, response);
            
            
        }
        catch(Exception ex){}
        
    }

}
