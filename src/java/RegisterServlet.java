/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
@WebServlet(urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

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
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneNumber = request.getParameter("phoneNumber");
        String userLevel = request.getParameter("userLevel");
        String userGender = request.getParameter("userGender");
//        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//        Date birthday = null;
//        try {
//            birthday = format.parse(request.getParameter("birthday"));
//        } catch (ParseException ex) {
//            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
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
            String sqlinsert = "insert into user(email,password,phoneNumber,userLevel,userGender,birthday,age,address,city,zip,state,description)values('"
                +email+"','"
                +password+"','"
                +phoneNumber+"','"
                +userLevel+"','"
                +userGender+"','"
                +birthday+"','"
                +age+"','"
                +address+"','"
                +city+"','"
                +zip+"','"
                +state+"','"          
                +description+"'"
                +")"; 
            
//            out.println("<h4>" +" birthday: " + birthday + "</h4>");
            
            log(sqlinsert);
            
            stmt.executeUpdate(sqlinsert);
            out.println("<h4>" +" birthday: " + birthday + "</h4>");
            
            conn.close();
            
            response.sendRedirect("index.jsp");
 
        }
        catch (Exception ex){
            
            out.println("<h4>" +" exception </h4>");
        
        } 
        
        
        
        
    }

}
