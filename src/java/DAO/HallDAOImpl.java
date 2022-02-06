/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtility.DBConnection;
import Model.Hall;
import static com.sun.activation.registries.LogSupport.log;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author End-User
 */
public class HallDAOImpl implements HallDAO{
    
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List<Hall> getAllHall() {
        
        List<Hall> hl = new ArrayList<Hall>();
        try{
            String sql = "select * from hall";
//            conn = DBUtility.DBConnection.openConnection();
            conn = DBConnection.openConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                Hall h = new Hall();
                h.setHall_id(rs.getInt("hall_id"));
                h.setName(rs.getString("name"));
                h.setLocation(rs.getString("location"));
                h.setCharge(rs.getDouble("charge"));              
                h.setCapacity(rs.getString("capacity"));
                h.setMedia(rs.getString("media"));
                h.setDescription(rs.getString("description"));
                hl.add(h);
                
            }
            
        }catch(Exception ex){}
        
        
        return hl;
    }

    /**
     *
     * @param HallName
     * @return
     */
    @Override
    public Hall getHall(String HallName) {
        
        Hall hu = new Hall();
        String cond = HallName;
        try{
//            String SQL = "SELECT * FROM hall WHERE name=?";
            String SQL = "SELECT * FROM hall WHERE name LIKE ?";
            conn = DBConnection.openConnection();
            ps = conn.prepareStatement(SQL);
            ps.setString(1, "%" + cond + "%");
            rs = ps.executeQuery();
            
            while(rs.next()){
                
                hu.setHall_id(rs.getInt("hall_id"));
                hu.setName(rs.getString("name"));
                hu.setLocation(rs.getString("location"));
                hu.setCharge(rs.getDouble("charge"));   
                hu.setCapacity(rs.getString("capacity"));
                hu.setDescription(rs.getString("description")); 
                hu.setMedia(rs.getString("media"));  

            }
            
        }catch(Exception ex){}
        
        
        return hu;
    }

    @Override
    public void insertHall(Hall h) {
        
        Hall hu = h;
        
        try{
            String sqlinsert = "insert into hall(name,location,charge,capacity,description,media)values(?,?,?,?,?,?)";
            conn = DBUtility.DBConnection.openConnection();
            ps = conn.prepareStatement(sqlinsert);
            
            ps.setString(1, hu.getName());
            ps.setString(2, hu.getLocation());
            ps.setDouble(3, hu.getCharge());
            ps.setString(4, hu.getCapacity());
            ps.setString(5, hu.getDescription());
            ps.setString(6, hu.getMedia());
//            ps.setString(6, path);
            ps.executeUpdate();
            
        }catch(Exception e){
            
        }
        
        
    }

    @Override
    public void deleteHall(int id) {
        
        int cond_id=id;
        try{
            
            String sqldelete = "delete from hall where hall_id=?";
            
            conn = DBUtility.DBConnection.openConnection();
            ps = conn.prepareStatement(sqldelete);
            ps.setInt(1, cond_id);
            ps.executeUpdate();        
   
        }
        catch(Exception ex){ }
    }

    @Override
    public void updateHall(int id, Hall h) {
        
        Hall hu = h;
        int cond_id=id;
        try{
            String sqlupdate = "update hall set name=?,location=?,charge=?,capacity=?,description=?,media=? where hall_id=?";
            
            conn = DBUtility.DBConnection.openConnection();
            
            ps = conn.prepareStatement(sqlupdate);
            ps.setString(1, hu.getName());
            ps.setString(2, hu.getLocation());
            ps.setDouble(3, hu.getCharge());
            ps.setString(4, hu.getCapacity());
            ps.setString(5, hu.getDescription());
            ps.setString(6, hu.getMedia());
            ps.setInt(7, cond_id);
            ps.executeUpdate();
            
         
            
        }
        catch(Exception ex){
            
        
        }
        
    }
    
}
