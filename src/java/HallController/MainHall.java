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
import java.util.List;
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
@WebServlet(name = "MainHall", urlPatterns = {"/MainHall"})
public class MainHall extends HttpServlet {

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HallDAO dao = new HallDAOImpl();
        List<Hall> hl = dao.getAllHall();
        request.setAttribute("hl",hl);
        HttpSession session = request.getSession();
        if(session.getAttribute("sessionEmail") != null){       
            request.getRequestDispatcher("/HallView/MainHall.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("GeneralHall.jsp").forward(request,response);
        }

    }
}
