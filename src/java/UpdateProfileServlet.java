/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author End-User
 */
@WebServlet(urlPatterns = {"/UpdateProfileServlet"})
public class UpdateProfileServlet extends HttpServlet {

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
        
        String userID = request.getParameter("Id");        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneNumber = request.getParameter("phoneNumber");
        String userLevel = request.getParameter("userLevel");
        String userGender = request.getParameter("userGender");
        String birthday = request.getParameter("birthday");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zip = request.getParameter("zip");
        String description = request.getParameter("description");
        
//        out.println("<h4>" +" birthday: " + birthday + "</h4>");
     
        try {
            Class.forName("com.mysql.jdbc.Driver");
//            out.println("<h4>" +" birthday: " + birthday + "</h4>");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
//            out.println("<h4>" +" birthday: " + birthday + "</h4>");
            Statement stmt = conn.createStatement();
//            out.println("<h4>" +" birthday: " + birthday + "</h4>");
            String sqlupdate = "UPDATE user SET " 
                    + "email=?,"
                    + "password=?,"
                    + "phoneNumber=?,"
                    + "userLevel=?,"
                    + "userGender=?,"
                    + "birthday=?,"
                    + "age=?,"
                    + "address=?,"
                    + "city=?,"
                    + "state=?,"
                    + "zip=?,"
                    + "description=?"
                    + " WHERE user_id=?";
            
            PreparedStatement ps = conn.prepareStatement(sqlupdate);
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, phoneNumber);
            ps.setString(4, userLevel);
            ps.setString(5, userGender);
            ps.setString(6, birthday);
            ps.setInt(7, age);
            ps.setString(8, address);
            ps.setString(9, city);
            ps.setString(10, state);
            ps.setString(11, zip);
            ps.setString(12, description);
            ps.setString(13, userID);
            ps.executeUpdate();
            
            request.getSession().removeAttribute("sessionEmail");
            request.getSession().setAttribute("sessionEmail", email);
            
            conn.close();
            
            response.sendRedirect("profile.jsp");
 
        }
        catch (Exception ex){
            
            out.println("<h4>" +" exception </h4>");
        
        } 
        
        
        
        
    }

}
