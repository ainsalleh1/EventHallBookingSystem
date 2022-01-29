/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtility.DBConnection;
import Model.Inventory;
import Model.Item;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Ain
 */
public class InventoryDAOImpl implements InventoryDAO{

    PreparedStatement ps;
    ResultSet rs;
    @Override
    public void InsertInventoryHall(Inventory i) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
            
            String sqlinsert = "insert into inventoryhall(hallInventory,itemInventory,quantity)values(?,?,?)";
            conn = DBConnection.openConnection();
            conn.prepareStatement(sqlinsert);
            ps = conn.prepareStatement(sqlinsert);
            ps.setInt(1,i.getHallID());
            ps.setInt(2,i.getItem());
            ps.setInt(3,i.getQuantity());
            ps.executeUpdate(); 
            }
            
        catch(Exception ex){}

    }

    @Override
    public void InsertItem(Item i) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
            
            String sqlinsert = "insert into item(item_name,item_type)values(?,?)";
            conn = DBConnection.openConnection();
            conn.prepareStatement(sqlinsert);
            ps = conn.prepareStatement(sqlinsert);
            ps.setString(1,i.getItemName());
            ps.setString(2,i.getItemType());
            ps.executeUpdate(); 
            }
        catch(Exception ex){}

    }
    
    }
 