/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtility.DBConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.util.Date;
import java.sql.Date;


public class DateAvailabilityDAOImpl implements DateAvailabilityDAO{

    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    


    @Override
    public void UpdateDateAvailibity(int id, Date startDate, Date endDate) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.

    try{
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
            
            String sqlupdate = "update dateavailability set startDate=? set endDate=? where id=?";
            
            PreparedStatement ps = conn.prepareStatement(sqlupdate);
            
            ps.setDate(1, startDate);
            ps.setDate(2, endDate);
            ps.executeUpdate();
            
            conn.close();
            
            
        }
        catch(Exception ex){}
    }
    
    }
 
