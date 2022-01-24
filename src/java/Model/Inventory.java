/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.logging.Logger;

/**
 *
 * @author Ain
 */
public class Inventory {
    private int hallID;
    private int item;
    private int quantity;

    public Inventory(int hallID, int item, int quantity) {
        this.hallID = hallID;
        this.item = item;
        this.quantity = quantity;
    }

    public Inventory() {
    }

    public int getHallID() {
        return hallID;
    }

    public int getItem() {
        return item;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setHallID(int hallID) {
        this.hallID = hallID;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
  
            
}
