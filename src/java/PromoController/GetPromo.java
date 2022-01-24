package PromoController;

import DAO.PromoDAO;
import DAO.PromoDAOImpl;
import Model.Promo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetPromo extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String PromoName = request.getParameter("PromoName");
        
        PromoDAO dao = new PromoDAOImpl();
        Promo pu = dao.getPromo(PromoName);
        request.setAttribute("pu", pu);
        request.getRequestDispatcher("/PromotionView/PromoDetails.jsp").forward(request, response);
    }
}
