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
@WebServlet(name = "InsertItem", urlPatterns = {"/InsertItem"})
public class InsertItem extends HttpServlet {

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
        
        String itemName = request.getParameter("ItemName");
        String itemType = request.getParameter("ItemType");
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
            
            String sqlinsert = "insert into item(item_name,item_type)values(?,?)";
            
            PreparedStatement ps = conn.prepareStatement(sqlinsert);
            ps.setString(1, itemName);
            ps.setString(2, itemType);

            ps.executeUpdate();
            
            conn.close();
            
            response.sendRedirect("InventoryView/MainInventory.jsp");
            
            
        }
        catch(Exception ex){}
    }
        
    
}
