/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.User;
import java.util.List;

/**
 *
 * @author End-User
 */
public interface UserDAO {
    public List<User> getAllUser();
    public User getUser(int id);
    public void insertUser(User u);
    public void deleteUser(int id);
    public void updateUser(int id, User u);
}
