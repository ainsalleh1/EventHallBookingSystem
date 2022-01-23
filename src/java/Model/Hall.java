/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;

public class Hall implements Serializable{
    int hall_id;
    String name;
    String location;
    double charge;
    String capacity;
    String description;
    String media;

    public Hall() {
    }

    public Hall(String name, String location, double charge, String capacity, String description, String media) {
        this.name = name;
        this.location = location;
        this.charge = charge;
        this.capacity = capacity;
        this.description = description;
        this.media = media;
    }

    public void setHall_id(int hall_id) {
        this.hall_id = hall_id;
    }

    public int getHall_id() {
        return hall_id;
    }
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public double getCharge() {
        return charge;
    }

    public void setCharge(double charge) {
        this.charge = charge;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMedia() {
        return media;
    }

    public void setMedia(String media) {
        this.media = media;
    }
    
    
}