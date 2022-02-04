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

public class BookingDAOImpl implements BookingDAO {

//    Connection conn;
//    PreparedStatement ps;
//    ResultSet rs;
    
    @Override
    public int createBooking(Booking b, int hallID, int promo_id, String startDate, String endDate, String status, String email, int userID, int promoID, double priceDisc,int getRecordId) {


        Booking bu = b;
//        int rec_id=getRecordId;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
            
            String sqlinsertBooking = "insert into booking(totalPrice,status,hallBooked,customer,promo_id)values(?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sqlinsertBooking, Statement.RETURN_GENERATED_KEYS);
            ps.setDouble(1, b.getTotalPrice());
            ps.setString(2, b.getStatus());
            ps.setInt(3, b.getHallBooked());
            ps.setInt(4, b.getCustomer());
            ps.setInt(5, b.getPromo_id());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                getRecordId = rs.getInt(1);
            }

            String sqlinsertDateAvailability = "insert into dateAvailability(startDate, endDate, hallBooked, bookingID)values(?,?,?,?)";

             PreparedStatement ps_date = conn.prepareStatement(sqlinsertDateAvailability);

            ps_date.setDate(1, java.sql.Date.valueOf(startDate));
            ps_date.setDate(2, java.sql.Date.valueOf(endDate));
            ps_date.setInt(3, hallID);
            ps_date.setInt(4, getRecordId);
            ps_date.executeUpdate();
            

        } catch (Exception ex) {}
        
        return getRecordId;

    }

    @Override
    public void UpdateBookingStatus(int bookingID, String status) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");

            String sqlupdate = "update booking set status=? where id=?";

            PreparedStatement ps = conn.prepareStatement(sqlupdate);

            ps.setString(1, status);
            ps.setInt(2, bookingID);
            ps.executeUpdate();

            conn.close();

        } catch (Exception ex) {
        }
    }

    @Override
    public void insertPaymentSlip(String file, String status, int booking_id) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");

            String sqlupdate = "update booking set paymentSlip=?,status=? where id=?";

            PreparedStatement ps = conn.prepareStatement(sqlupdate);

            ps.setString(1, file);
            ps.setString(2, status);
            ps.setInt(3, booking_id);
            ps.executeUpdate();

            conn.close();

        } catch (Exception ex) {
        }
    }

    /**
     *
     * @param sc_id
     * @param email
     * @return
     */
    @Override
    public Booking getBooking(int sc_id, String email) {
        Booking b = new Booking();
        int cond_id = sc_id;
        String user_email=email;
        int user_id = 0;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
            
            String sql_user = "SELECT * FROM user WHERE email=?";
            PreparedStatement us = conn.prepareStatement(sql_user);
            us.setString(1, user_email);
            ResultSet urs = us.executeQuery();
            if(urs.next()){
                user_id = urs.getInt("user_id");
                
                String SQL = "SELECT * FROM booking WHERE id=? and customer=?";
                PreparedStatement ps = conn.prepareStatement(SQL);
                ps.setInt(1, cond_id);
                ps.setInt(2, user_id);
                ResultSet rs = ps.executeQuery();

                while(rs.next()){
                    b.setBooking_id(rs.getInt("id"));
                    b.setDateBooked(rs.getDate("date"));
                    b.setTotalPrice(rs.getDouble("totalPrice"));
                    b.setStatus(rs.getString("status"));
                    b.setHallBooked(rs.getInt("hallBooked"));
                    b.setCustomer(rs.getInt("customer"));
                    b.setPromo_id(rs.getInt("promo_id"));
                    b.setFile(rs.getString("paymentSlip"));
                }
            }
            
        }catch(Exception ex){}
        
        
        return b;
    }

}
