/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HallController;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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
@WebServlet(name = "InsertHall", urlPatterns = {"/InsertHall"})
@MultipartConfig
public class InsertHall extends HttpServlet {

    @Override
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
//        out.println("<h1>Servlet insert hall at " + request.getContextPath() + "</h1>");
        
        String name = request.getParameter("HallName");
        String address = request.getParameter("HallAddress");
        String city = request.getParameter("HallCity");
        String zip = request.getParameter("HallZip");
        String state = request.getParameter("HallState");
        String location = address + ", " + zip + ", "  + city+ ", "  + state;
//        String hallCharge = request.getParameter("HallCharge");
//        out.println("<h1> " + location + "</h1>");
        double charge = Double.parseDouble(request.getParameter("HallCharge"));
        String capacity = request.getParameter("Capacity");
        String description = request.getParameter("Description");
        Part filePart = request.getPart("HallMedia");
        String file = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
        
//        Part filePart = request.getPart("HallMedia");
//        String fileName = extractFileName(filePart);
//        String savePath = "C:\\Users\\End-User\\Documents\\NetBeansProjects\\GitHub\\EventHallBookingSystem\\web\\media\\" + File.separator + file;
//        File fileSaveDir = new File(savePath);
//        filePart.write(savePath + File.separator);
        
//        String file = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
//        InputStream fileContent = filePart.getInputStream();
//        String file2 = filePart.getSubmittedFileName();
//        filePart.write("C:\\Users\\End-User\\Documents\\uploadedMedia\\"+file2);
//        String mediaPath = "C:\\Users\\End-User\\Documents\\uploadedMedia\\"+file2;
        
        
//        File uploads = new File("C:/Users/End-User/Documents/uploadedMedia");
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
            
            String sqlinsert = "insert into hall(name,location,charge,capacity,description,media)values(?,?,?,?,?,?)";
            
            PreparedStatement ps = conn.prepareStatement(sqlinsert);
            ps.setString(1, name);
            ps.setString(2, location);
            ps.setDouble(3, charge);
            ps.setString(4, capacity);
            ps.setString(5, description);
            out.println("<h1> " + file + "</h1>");
//            ps.setBinaryStream(6, fileContent, (int)file.length());
//            ps.setBlob(6, fileContent);
            ps.setString(6, file);
            ps.executeUpdate();
            
            conn.close();
            
            response.sendRedirect("MainHall.jsp");
            
            
        }
        catch(Exception ex){}
    }
    
    private String extractFileName(Part filePart){
        String contentDisp = filePart.getHeader("content-disposition");
        String [] items = contentDisp.split(";");
        for (String s:items){
            if(s.trim().startsWith("filename")){
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }

}
