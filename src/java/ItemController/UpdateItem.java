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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author End-User
 */
@WebServlet(name = "UpdateItem", urlPatterns = {"/UpdateItem"})
public class UpdateItem extends HttpServlet {

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
        
        int itemID = Integer.parseInt(request.getParameter("item_id"));        
        String itemName = request.getParameter("ItemName");
        String itemType = request.getParameter("ItemType");
        
        Item iu = new Item(itemName,itemType);
        ItemDAO dao = new ItemDAOImpl();
        dao.UpdateItem(itemID, iu);

        response.sendRedirect("InventoryView/MainInventory.jsp");           
        
        
    }

}
