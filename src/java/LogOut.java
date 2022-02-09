/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author End-User
 */
@WebServlet(urlPatterns = {"/LogOut"})
public class LogOut extends HttpServlet {

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
        
//        Cookie cEmail = new Cookie("cookuser", null);
//	Cookie cPassword = new Cookie("cookpass", null);
//	Cookie cRemember = new Cookie("cookrem", null);
//	cEmail.setMaxAge(0);
//	cPassword.setMaxAge(0);
//	cRemember.setMaxAge(0);
//	response.addCookie(cEmail);
//	response.addCookie(cPassword);
//	response.addCookie(cRemember);
//        
        HttpSession session = request.getSession();
        session.invalidate();

        response.sendRedirect("index.jsp");
        
    }


}
