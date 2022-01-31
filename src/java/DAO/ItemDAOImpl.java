/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtility.DBConnection;
import Model.Item;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author End-User
 */
public class ItemDAOImpl implements ItemDAO {

    
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    
    @Override
    public void InsertItem(Item i) {
        try {
            String sqlinsert = "insert into item(item_name,item_type)values(?,?)";
            conn = DBConnection.openConnection();
            ps = conn.prepareStatement(sqlinsert);
            ps.setString(1, i.getItemName());
            ps.setString(2, i.getItemType());
            ps.executeUpdate();
        } catch (Exception ex) {
        }

    }

    @Override
    public void UpdateItem(int id, Item i) {
        
        Item iu = i;
        int cond_id=id;
        try{
            String sqlupdate = "update item set item_name=?,item_type=? where item_id=?";
            
            conn = DBUtility.DBConnection.openConnection();
            
            ps = conn.prepareStatement(sqlupdate);
            ps.setString(1, iu.getItemName());
            ps.setString(2, iu.getItemType());
            ps.setInt(3, cond_id);
            ps.executeUpdate();
          
        }
        catch(Exception ex){}
        
    }

    @Override
    public void DeleteItem(int id) {
        
        int cond_id=id;
        try{
            
            String sqldelete = "delete from item where item_id=?";
            
            conn = DBUtility.DBConnection.openConnection();
            ps = conn.prepareStatement(sqldelete);
            ps.setInt(1, cond_id);
            ps.executeUpdate();        
   
        }
        catch(Exception ex){ }
        
    }
    
}
