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
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author End-User
 */
@WebServlet(name = "UpdateHall", urlPatterns = {"/UpdateHall"})
@MultipartConfig
public class UpdateHall extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));        
        String name = request.getParameter("HallName");
        String location = request.getParameter("Location");
//        String address = request.getParameter("HallAddress");
//        String city = request.getParameter("HallCity");
//        String zip = request.getParameter("HallZip");
//        String state = request.getParameter("HallState");
//        String location = address + ", " + zip + ", "  + city+ ", "  + state;
        double charge = Double.parseDouble(request.getParameter("HallCharge"));
        String capacity = request.getParameter("Capacity");
        String description = request.getParameter("Description");
        Part filePart = request.getPart("HallMedia");
        String file = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
//        try{
//            
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
//            
//            String sqlinsert = "update hall set name=?,location=?,charge=?,capacity=?,description=?,media=? where hall_id=?";
//            
//            PreparedStatement ps = conn.prepareStatement(sqlinsert);
//            ps.setString(1, name);
//            ps.setString(2, location);
//            ps.setDouble(3, charge);
//            ps.setString(4, capacity);
//            ps.setString(5, description);
//            ps.setString(6, file);
//            ps.setString(7, id);
//            ps.executeUpdate();
//            
//            conn.close();
//            
//            response.sendRedirect("MainHall.jsp");
//            
//            
//        }
//        catch(Exception ex){}

        out.println(charge);

        Hall hu = new Hall(name,location,charge,capacity,description,file);
        HallDAO dao = new HallDAOImpl();
        dao.updateHall(id, hu);

        response.sendRedirect("MainHall");
    }

}
