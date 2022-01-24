/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HallController;

import DAO.HallDAO;
import DAO.HallDAOImpl;
import Model.Hall;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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
@WebServlet(name = "DeleteHall", urlPatterns = {"/DeleteHall"})
public class DeleteHall extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        
        int id = Integer.parseInt(request.getParameter("id"));  
        
//        try{
//            
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
//            
//            out.println(id);
//            String sqldelete = "DELETE FROM hall WHERE hall_id=?";
//            out.println(id);
//            PreparedStatement ps = conn.prepareStatement(sqldelete);
//            ps.setInt(1, id);   
//            out.println("cubaan");
//            log(sqldelete);
//            ps.executeUpdate();
//            
//            out.println("cubaan");
//            conn.close();
//            
//            response.sendRedirect("MainHall.jsp");
//            
//            
//        }
//        catch(Exception ex){}
        
        out.println("Cuba");
        
        HallDAO dao = new HallDAOImpl();
        dao.deleteHall(id);
        
        
        response.sendRedirect("MainHall");
        
    }
}
