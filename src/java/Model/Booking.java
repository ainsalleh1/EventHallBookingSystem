
package Model;

import java.io.Serializable;

public class Booking implements Serializable{
    private double totalPrice;
    private String status;
    private int hallBooked;
    private int customer;
    private int promo_id;
    private String file;

    public Booking(double totalPrice, String status, int hallBooked, int customer, int promo_id) {
        this.totalPrice = totalPrice;
        this.status = status;
        this.hallBooked = hallBooked;
        this.customer = customer;
        this.promo_id = promo_id;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public String getFile() {
        return file;
    }

    public Booking() {
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public int getHallBooked() {
        return hallBooked;
    }

    public int getCustomer() {
        return customer;
    }

    public int getPromo_id() {
        return promo_id;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setHallBooked(int hallBooked) {
        this.hallBooked = hallBooked;
    }

    public void setCustomer(int customer) {
        this.customer = customer;
    }

    public void setPromo_id(int promo_id) {
        this.promo_id = promo_id;
    }
}


