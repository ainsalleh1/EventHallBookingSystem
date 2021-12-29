import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from user");
            
            while(rs.next()){
                if(rs.getString("email").equals(user_email) && rs.getString("password").equals(user_password) ){
//                    out.println("<h1> before jpane " + request.getContextPath() + "</h1>");
//                    JOptionPane.showMessageDialog(null, "Login Successfull", "Login Success", JOptionPane.INFORMATION_MESSAGE);
                    HttpSession session = request.getSession();
                    session.setAttribute("sessionEmail", user_email);
                    session.setAttribute("sessionUserLevel", rs.getString("userLevel"));
                    
//                    if(rs.getString("userLevel").equals("Customer")){
//                        request.getRequestDispatcher("MainCustomerHomepage.jsp").forward(request, response);                       
//                    }
//                    else{
//                        request.getRequestDispatcher("MainStaffHomepage.jsp").forward(request, response);                        
//                    }
                    
                    request.getRequestDispatcher("MainHomepage.jsp").forward(request, response);  
                    
                    
                }
                else{
                    out.println("<p style=\"color:red;\">Invalid username of password. Please try again... </p>");
                    request.getRequestDispatcher("login.jsp").include(request, response);
                }
            }
            
            conn.close();
        
        }
        catch (Exception ex){
            out.println("<h1> exception Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            ex.printStackTrace(System.err);
        
        }   
        
        
    }
    
}
