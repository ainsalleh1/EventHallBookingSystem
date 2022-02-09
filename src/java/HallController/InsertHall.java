/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HallController;

import DAO.HallDAO;
import DAO.HallDAOImpl;
import Model.Hall;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletContext;
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
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
//        Part filePart = request.getPart("HallMedia");
//        String file = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
        
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
            
//            Part part = request.getPart("HallMedia");
//            String fileName = part.getSubmittedFileName();
//            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
//            ServletContext servletContext = request.getSession().getServletContext();
//            String path = servletContext.getRealPath("/"+"media/"+File.separator+fileName);
//            String path = getServletContext().getRealPath("/media"+File.separator+fileName);
//            String mediaPath = "C:\\Users\\End-User\\Documents\\NetBeansProjects\\GitHub\\EventHallBookingSystem\\web";
//            String path = mediaPath+"/"+"media"+File.separator+fileName;
//
//            
//            InputStream is = part.getInputStream();
//            
//            boolean succs = uploadFile(is,path);
//            if(succs){
//                out.println("File uploaded to this directory: " + path);
//            } else{
//                out.println(path);
//                out.println("Error");
//            }
            
//        try{
//            
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
//            
//            String sqlinsert = "insert into hall(name,location,charge,capacity,description,media)values(?,?,?,?,?,?)";
//            
//            PreparedStatement ps = conn.prepareStatement(sqlinsert);
//            ps.setString(1, name);
//            ps.setString(2, location);
//            ps.setDouble(3, charge);
//            ps.setString(4, capacity);
//            ps.setString(5, description);
////            out.println("<h1> " + fileName + "</h1>");
////            out.println("<h1> " + path + "</h1>");
////            ps.setBinaryStream(6, fileContent, (int)file.length());
////            ps.setBlob(6, fileContent);
//            ps.setString(6, file);
////            ps.setString(6, path);
//            ps.executeUpdate();
//            
//            conn.close();
//            
//            response.sendRedirect("MainHall.jsp");
//            
//            
//        }
//        catch(Exception ex){}

        Hall hu = new Hall(name,location,charge,capacity,description);
        HallDAO dao = new HallDAOImpl();
        dao.insertHall(hu);
        
        response.sendRedirect("MainHall");
    }
    
//    public boolean uploadFile(InputStream is, String path){
//        boolean test = false;
//        try{
//            byte [] byt = new byte[is.available()];
//            is.read();
//            FileOutputStream fops = new FileOutputStream(path);
//            fops.write(byt);
//            fops.flush();
//            fops.close();
//            
//            test = true;
//            
//        }catch(Exception e){
//            e.printStackTrace();
//        }
//        
//        return test;
//    }
//
//    
//    private String extractFileName(Part filePart){
//        String contentDisp = filePart.getHeader("content-disposition");
//        String [] items = contentDisp.split(";");
//        for (String s:items){
//            if(s.trim().startsWith("filename")){
//                return s.substring(s.indexOf("=") + 2, s.length()-1);
//            }
//        }
//        return "";
//    }

}
