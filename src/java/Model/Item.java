/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Ain
 */
public class Item {
    private String itemName;
    private String itemType;

    public Item(String itemName, String itemType) {
        this.itemName = itemName;
        this.itemType = itemType;
    }

    public Item() {
    }

    public String getItemName() {
        return itemName;
    }

    public String getItemType() {
        return itemType;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public void setItemType(String itemType) {
        this.itemType = itemType;
    }
}
