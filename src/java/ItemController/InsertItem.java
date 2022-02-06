/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ItemController;

import DAO.ItemDAO;
import DAO.ItemDAOImpl;
import Model.Item;
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String itemName = request.getParameter("ItemName");
        String itemType = request.getParameter("ItemType");
        
        ItemDAO dao = new ItemDAOImpl();
        Item i = new Item(itemName, itemType);
        dao.InsertItem(i);
       
        response.sendRedirect("InventoryView/MainInventory.jsp");   
        
    }
        
    
}
