/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.List;

/**
 *
 * @author End-User
 */
public class UserDAOImpl implements UserDAO{
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List<User> getAllUser() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public User getUser(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String insertUser(User u) {
        User su = u;
        try{
            
            String sqlinsert = "insert into user(email,password,phoneNumber,userLevel,userGender,birthday,age,address,city,zip,state,description)values('"
                +su.getEmail()+"','"
                +su.getPassword()+"','"
                +su.getPhoneNumber()+"','"
                +su.getUserLevel()+"','"
                +su.getUserGender()+"','"
                +su.getBirthday()+"','"
                +su.getAge()+"','"
                +su.getAddress()+"','"
                +su.getCity()+"','"
                +su.getZip()+"','"
                +su.getState()+"','"          
                +su.getDescription()+"'"
                +")"; 
            
            conn = DBUtility.DBConnection.openConnection();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sqlinsert);
            
            return "Account successfully created!";
            
        }
        catch (SQLIntegrityConstraintViolationException e){
            String msg = "Account already exist!";
            return msg;
        }
        catch(Exception ex){
            String msg = "Account already exist!";
            return msg;
        }
    }

    @Override
    public void deleteUser(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateUser(int id, User u) {
        
        User su = u;
        int cond_id = id;
        try{
            String sqlupdate = "UPDATE user SET " 
                    + "email=?,"
                    + "password=?,"
                    + "phoneNumber=?,"
                    + "userLevel=?,"
                    + "userGender=?,"
                    + "birthday=?,"
                    + "age=?,"
                    + "address=?,"
                    + "city=?,"
                    + "state=?,"
                    + "zip=?,"
                    + "description=?"
                    + " WHERE user_id=?";
            
            conn = DBUtility.DBConnection.openConnection();
            
            ps = conn.prepareStatement(sqlupdate);
            
            ps.setString(1, su.getEmail());
            ps.setString(2, su.getPassword());
            ps.setString(3, su.getPhoneNumber());
            ps.setString(4, su.getUserLevel());
            ps.setString(5, su.getUserGender());
            ps.setString(6, su.getBirthday());
            ps.setInt(7, su.getAge());
            ps.setString(8, su.getAddress());
            ps.setString(9, su.getCity());
            ps.setString(10, su.getState());
            ps.setString(11, su.getZip());
            ps.setString(12, su.getDescription());
            ps.setInt(13, cond_id);
            ps.executeUpdate();
            
        }catch(Exception e){}
    }
    
}
