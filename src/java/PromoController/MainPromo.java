package PromoController;

import DAO.PromoDAO;
import DAO.PromoDAOImpl;
import Model.Promo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainPromo", urlPatterns = {"/MainPromo"})
public class MainPromo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        PromoDAO dao = new PromoDAOImpl();
        List<Promo> pl = dao.getAllPromo();
        request.setAttribute("pl",pl);
        HttpSession session = request.getSession();
        if(session.getAttribute("sessionEmail") != null){       
            request.getRequestDispatcher("MainPromo.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("GeneralPromo.jsp").forward(request,response);
        }
        
}
}
