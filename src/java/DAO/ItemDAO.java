/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Item;

/**
 *
 * @author End-User
 */
public interface ItemDAO {
    public void InsertItem(Item i);
    public void UpdateItem(int id, Item i);
    public void DeleteItem(int id);
}
