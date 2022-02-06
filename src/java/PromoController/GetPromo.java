package PromoController;

import DAO.PromoDAO;
import DAO.PromoDAOImpl;
import Model.Promo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "GetPromo", urlPatterns = {"/GetPromo"})
public class GetPromo extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String PromoName = request.getParameter("PromoName");
        
        PromoDAO dao = new PromoDAOImpl();
        Promo pu = dao.getPromo(PromoName);
        request.setAttribute("pu", pu);
//        request.getRequestDispatcher("/PromotionView/PromoDetails.jsp").forward(request, response);
        request.getRequestDispatcher("/PromotionView/SearchPromo.jsp").forward(request,response);

    }
}
