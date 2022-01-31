/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package InventoryController;

import DAO.InventoryDAO;
import DAO.InventoryDAOImpl;
import Model.Inventory;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author End-User
 */
@WebServlet(name = "DeleteInventoryHall", urlPatterns = {"/DeleteInventoryHall"})
public class DeleteInventoryHall extends HttpServlet {

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
        
        int inventory_id = Integer.parseInt(request.getParameter("inventory_id"));        
        int hallID = Integer.parseInt(request.getParameter("hall_id"));        
        
        InventoryDAO dao = new InventoryDAOImpl();
        dao.DeleteInventoryHall(inventory_id);
        
        request.getRequestDispatcher("InventoryView/ListHallInventory.jsp?hallID=" + hallID).forward(request, response);

    
}
}
