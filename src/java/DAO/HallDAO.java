/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Hall;
import java.util.List;

/**
 *
 * @author End-User
 */
public interface HallDAO {
    public List<Hall> getAllHall();
    public Hall getHall(String HallName);
    public void insertHall(Hall h);
    public void deleteHall(int id);
    public void updateHall(int id, Hall h);
}
