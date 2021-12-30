import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;


@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       
        String connectionUrl = "jdbc:mysql://localhost:3306/";
//        String database = "EventHallBookingSystem";
        String database = "eventhallbookingsystem";
        String userid = "root";
        
        String user_email = request.getParameter("email");
        String user_password = request.getParameter("password");
//        String user_level = request.getParameter("userLevel");
       
        try {
    
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(connectionUrl+database,userid,"");
            String sql = "select * from user WHERE email=? and password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user_email);
            ps.setString(2, user_password);
            ResultSet result = ps.executeQuery();
            
            if(result.next()){
//                    out.println("<h1> before jpane " + request.getContextPath() + "</h1>");
//                    JOptionPane.showMessageDialog(null, "Login Successfull", "Login Success", JOptionPane.INFORMATION_MESSAGE);
                HttpSession session = request.getSession();
                session.setAttribute("sessionEmail", user_email);
//                    session.setAttribute("Login", "Yes");
                session.setAttribute("sessionUserLevel", result.getString("userLevel"));
                    
//                    if(rs.getString("userLevel").equals("Customer")){
//                        request.getRequestDispatcher("MainCustomerHomepage.jsp").forward(request, response);                       
//                    }
//                    else{
//                        request.getRequestDispatcher("MainStaffHomepage.jsp").forward(request, response);                        
//                    }
                    
                request.getRequestDispatcher("MainHomepage.jsp").forward(request, response);  
                    
                    
            }
            else{
                out.println("<p style=\"color:red;\">Invalid username or password. Please try again... </p>");
                request.getRequestDispatcher("login.jsp").include(request, response);
            }

            conn.close();
        
        }
        catch (Exception ex){
            out.println("<h1> exception Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            ex.printStackTrace(System.err);
        
        }   
        
        
    }
    
}
