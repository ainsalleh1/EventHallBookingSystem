/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BookingController;

import DAO.BookingDAO;
import DAO.BookingDAOImpl;
import Model.Booking;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "GetBooking", urlPatterns = {"/GetBooking"})
public class GetBooking extends HttpServlet {

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
        
        int sc_id = Integer.parseInt(request.getParameter("BookingID"));
        HttpSession session = request.getSession();
        String email = (String)session.getAttribute("sessionEmail");
        
        BookingDAO dao = new BookingDAOImpl();
        Booking b = dao.getBooking(sc_id,email);
        request.setAttribute("searchkey",sc_id);
        request.setAttribute("b",b);
        
        request.getRequestDispatcher("/BookingView/SearchBooking.jsp").forward(request,response);
        
    }

}
