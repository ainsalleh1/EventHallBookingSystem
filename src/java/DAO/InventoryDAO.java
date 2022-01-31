/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Inventory;
import Model.Item;

/**
 *
 * @author Ain
 */
public interface InventoryDAO {
    public void InsertInventoryHall(Inventory i);
    public void InsertItem(Item i);
    public void UpdateInventoryHall(int id, Inventory i);
    public void DeleteInventoryHall(int id);
}
