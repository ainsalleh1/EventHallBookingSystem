
package DAO;

import Model.Booking;
import java.util.Date;

public interface BookingDAO {
    public int createBooking(Booking b,int hallID,int promo_id, String startDate, String endDate,String status,String email, int userID,int promoID,double priceDisc, int getRecordId);
    public void UpdateBookingStatus(int bookingID, String status);
    public void insertPaymentSlip(String file , String status , int booking_id);
    public Booking getBooking(int sc_id, String email);
}
