package DAO;


import DBUtility.DBConnection;
import Model.Booking;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import javax.servlet.http.HttpServletResponse;


public class BookingDAOImpl implements BookingDAO{
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    
    @Override
    public void createBooking(Booking b,int hallID,int promo_id, String startDate, String endDate, Date dateStart, Date dateEnd,String status,String email, int userID,int promoID,double priceDisc,int getRecordId) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    try{
//            
//            String SQL = "INSERT INTO BOOKING(totalPrice, status, hallBooked, customer,promo_id) values (?,?,?,?)";
//            conn = DBConnection.openConnection();
//            conn.prepareStatement(SQL);
//            ps = conn.prepareStatement(SQL);
//            ps.setDouble(1,p.getTotalPrice());
//            ps.setString(2,p.getStatus());
//            ps.setInt(3,p.getHallBooked());
//            ps.setInt(4,p.getCustomer());
//            ps.setInt(4,p.getPromo_id());
//            ps.executeUpdate(); 
//            }
//            
//        catch(Exception ex){}
//    }
//response.setContentType("text/html;charset=UTF-8");
//PrintWriter out = response.getWriter();
try{
    
//            out.println("cubaan");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
            String selectUser = "select * from user where email=?";
            PreparedStatement us = conn.prepareStatement(selectUser);
            us.setString(1, email);
            ResultSet urs = us.executeQuery();
//            out.println("cubaan");
            if(urs.next()){
                userID = urs.getInt("user_id");
            }
            //check date availability
            String checkDate = "select * from dateavailability where hallBooked=? and startDate>=? and endDate<=?";
//            out.println("cubaan");
            PreparedStatement check = conn.prepareStatement(checkDate);
//            out.println("cubaan");
            check.setInt(1, hallID);
//            out.println(startDate);
//            out.println(endDate);
            check.setDate(2,java.sql.Date.valueOf(startDate));
            check.setDate(3,java.sql.Date.valueOf(endDate));
            ResultSet cas = check.executeQuery();
            if(cas.next()){
//                out.println("cubaan dalam checking");
//                out.println("<p style=\"color:red;\">Chosen dates are unavailable </p>");                
 //               request.getRequestDispatcher("BookingView/createBooking.jsp").include(request, response);
            }
            else{

                String sqlPromo = "select * from promotion where promo_id=?";
                PreparedStatement ps_promo = conn.prepareStatement(sqlPromo);
                ps_promo.setInt(1, promo_id);
                ResultSet promo = ps_promo.executeQuery();
//                out.println("penanda");
                
                String selectHall = "select charge from hall where hall_id=?";
                PreparedStatement ps_hall = conn.prepareStatement(selectHall);
                ps_hall.setInt(1, hallID);
                ResultSet rs_hall = ps_hall.executeQuery();
                
                if(promo.next()){
 //                   out.println("/ncubaan penanda");
                    promoID = promo.getInt("promo_id");
//                    out.println(promoID);
                    double disc = promo.getDouble("discount")/100;
                    if(rs_hall.next()){
                        priceDisc = rs_hall.getDouble("charge") - (rs_hall.getDouble("charge")*disc);
                    }
                } else{
                    
                    if(rs_hall.next()){
                        priceDisc = rs_hall.getDouble("charge");
                    }
                    
                }
                      
                String sqlinsertBooking = "insert into booking(totalPrice,status,hallBooked,customer,promo_id)values(?,?,?,?,?)";    
//                out.println(status);
                PreparedStatement ps = conn.prepareStatement(sqlinsertBooking, Statement.RETURN_GENERATED_KEYS);
 //               out.println("cubaan dalam checking");
                ps.setDouble(1, priceDisc);
                ps.setString(2, status);
 //               out.println("cubaan dalam checking");
                ps.setInt(3, hallID);
 //               out.println("cubaan dalam checking");
                ps.setInt(4, userID);
 //               out.println(hallID);
                ps.setInt(5, promoID);
                ps.executeUpdate();
 //               out.println("penanda");
                ResultSet rs = ps.getGeneratedKeys();
 //               out.println("penanda");
                if(rs.next()){
                    getRecordId = rs.getInt(1);
  }
  //             out.println(getRecordId);                
                
                String sqlinsertDateAvailability = "insert into dateAvailability(startDate, endDate, hallBooked, bookingID)values(?,?,?,?)";
                
                
                PreparedStatement ps_date = conn.prepareStatement(sqlinsertDateAvailability);

    //            ps_date.setDate(1, (java.sql.Date) dateStart);
    //            ps_date.setDate(2, (java.sql.Date) dateEnd);
                ps_date.setDate(1,java.sql.Date.valueOf(startDate));
                ps_date.setDate(2,java.sql.Date.valueOf(endDate));
                ps_date.setInt(3,hallID);
                ps_date.setInt(4,getRecordId);
                ps_date.executeUpdate();
                

                conn.close();

//                response.sendRedirect("BookingView/myBooking.jsp");
                
            }       
            
        }
        catch(Exception ex){}
        
    }

    @Override
    public void UpdateBookingStatus(int bookingID, String status) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    
    try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
            
            String sqlupdate = "update booking set status=? where id=?";
            
            PreparedStatement ps = conn.prepareStatement(sqlupdate);
            
            ps.setString(1, status);
            ps.setInt(2, bookingID);
            ps.executeUpdate();
            
            conn.close();
            
            
        }
        catch(Exception ex){}
    }

    @Override
    public void insertPaymentSlip(String file, String status, int booking_id) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
            
            String sqlupdate = "update booking set paymentSlip=?,status=? where id=?";
            
            PreparedStatement ps = conn.prepareStatement(sqlupdate);
       
            ps.setString(1, file);
            ps.setString(2, status);
            ps.setInt(3, booking_id);
            ps.executeUpdate();
            
            conn.close();
            
           
            
            
        }
        catch(Exception ex){}
    }
    
}
