package PromoController;

import DAO.PromoDAO;
import DAO.PromoDAOImpl;
import Model.Promo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "InsertPromo", urlPatterns = {"/InsertPromo"})
public class InsertPromo extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        double discount = Double.parseDouble(request.getParameter("discount"));
        String startDate = request.getParameter("StartDate");
        String endDate = request.getParameter("EndDate");
        String description = request.getParameter("description");
        String status = request.getParameter("status");
    
//        try{
//            
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
//            
//            String sqlinsert = "insert into promotion(promo_name,discount,startDate,endDate,description,status)values(?,?,?,?,?,?)";
//            
//            PreparedStatement ps = conn.prepareStatement(sqlinsert);
//            ps.setString(1, name);
//            ps.setDouble(2, discount);
//            ps.setString(3, startDate);
//            ps.setString(4, endDate);
//            ps.setString(5, description);
//            ps.setString(6, status);
//            
//            ps.executeUpdate();
//            
//            conn.close();
//            
//            response.sendRedirect("MainPromo.jsp");
//            
//            
//        }
//        catch(Exception ex){}
        Promo pu = new Promo(name,discount,startDate,endDate,description,status);
        PromoDAO dao = new PromoDAOImpl();
        dao.insertPromo(pu);
        
        response.sendRedirect("MainPromo");
    }
}
