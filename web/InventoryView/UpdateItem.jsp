<%-- 
    Document   : UpdateItem
    Created on : Jan 31, 2022, 5:50:34 PM
    Author     : End-User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <style>
            .mySlides {display:none;}
            body {
                background-image: url("../media/background.png");
                height: 100%;

                /* Center and scale the image nicely */
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
        <title>Update Item</title>
    </head>
    <body>
        <div class="container">
            
            <ul class="nav nav-tabs">
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="../MainHomepage.jsp">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="../MainHall.jsp">Halls</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="MainBooking.jsp">Booking</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="MainPromo.jsp">Promo</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" href="MainInventory.jsp">Inventory</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="AboutUs.html">About Us</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="profile.jsp">Profile</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="LogOut">Log Out</a>
                </li>

            </ul>
            
            <br><br>
            
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="MainInventory.jsp">Inventory Management</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                  <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                        <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="#">Item List</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" aria-current="page" href="InventoryHall.jsp">Hall Inventory</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="InsertItem.html">Add Item</a>
                        </li>
                        
                    </ul>
                    
                </div>
                </div>
            </nav>                
            
            <br><br>
            
            
            <h2>Update Item Details</h2>
            
            <br><br>
            
                <%
                    
                    int itemID = Integer.parseInt(request.getParameter("itemID"));
                    try{                  
                        Class.forName("com.mysql.jdbc.Driver");
                       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");   

                        String sql_item = "select * from item where item_id=?";                   
                        PreparedStatement ps_item = conn.prepareStatement(sql_item);
                        ps_item.setInt(1, itemID);
                        ResultSet rs_item = ps_item.executeQuery();
                        if(rs_item.next()){
                            
                %>
                        
                 <form method="POST" class="container text-left" action="../UpdateItem">
            
              <div class="col-md-6">
                <label for="inputItemName" class="form-label">Item Name : </label>
                <input type="text" class="form-control" id="inputItemName" name="ItemName" value="<%= rs_item.getString("item_name") %>" required>
              </div>
              
              <br><br>
              <p>Current item type: <%= rs_item.getString("item_type") %></p>
              Item Type:
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="ItemType" id="flexRadioDefault1" value="Entrance & Hallway">
                    <label class="form-check-label" for="flexRadioDefault1">
                      Entrance & Hallway
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="ItemType" id="flexRadioDefault2" value="Kitchen" checked>
                    <label class="form-check-label" for="flexRadioDefault2">
                      Kitchen
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="ItemType" id="flexRadioDefault3" value="Others">
                    <label class="form-check-label" for="flexRadioDefault3">
                      Others
                    </label>
                  </div>
              <br><br>
              <div class="col-12">
               <input type="text" class="form-control" id="inputItemID" name="item_id" value="<%= rs_item.getInt("item_id") %>" hidden>
                <button type="submit" class="btn btn-success">Save</button>
              </div>
            </form>
            <%
                    }
                conn.close();
                }catch(Exception ex){}
                
            %>
            
                        
            
                
        </div>
    </body>
</html>