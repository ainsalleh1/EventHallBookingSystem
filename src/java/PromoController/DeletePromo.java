package PromoController;

import DAO.PromoDAO;
import DAO.PromoDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DeletePromo", urlPatterns = {"/DeletePromo"})
public class DeletePromo extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        int id = Integer.parseInt(request.getParameter("id"));  
//        
//        try{
//            
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
//            
//            String sqldelete = "DELETE FROM promotion " 
//                    + "WHERE id=?";
//            
//            PreparedStatement ps = conn.prepareStatement(sqldelete);
//            ps.setString(1, id);            
//            ps.executeUpdate();
//            
//            conn.close();
//            
//        }
//        catch(Exception ex){}

        PromoDAO dao = new PromoDAOImpl();
        dao.deletePromo(id);
        response.sendRedirect("MainPromo.jsp");
    }
}
