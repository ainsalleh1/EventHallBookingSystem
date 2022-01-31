<%-- 
    Document   : UpdateHallInventory
    Created on : Jan 31, 2022, 4:04:23 PM
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
        <title>Hall Inventory</title>
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
                          <a class="nav-link" aria-current="page" href="#">Item List</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="InventoryHall.jsp">Hall Inventory</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="InsertItem.html">Add Item</a>
                        </li>
                        
                    </ul>
                    <span class="navbar-text">Inventory :</span>
                    <form class="d-flex">                
                       <input class="form-control me-2" type="search" placeholder="items name" aria-label="Search">
                      <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
                </div>
            </nav>                
            
            <br><br>
            
            
            <h2>Update Item Quantity</h2>
            
            <br><br>
            
            <form action="../UpdateInventoryHall" method="POST">           

                <%
                    
                    int counter = 0;
                    int inventoryID = Integer.parseInt(request.getParameter("inventoryID"));
                    try{                  
                        Class.forName("com.mysql.jdbc.Driver");
                       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");   

                        String hallItems = "select inventory_id,quantity,item_name,item_type,name,hall_id from inventoryhall,item,hall where inventory_id=?";                   
                        PreparedStatement ps_hallItems = conn.prepareStatement(hallItems);
                        ps_hallItems.setInt(1, inventoryID);
                        ResultSet rs_hallItems = ps_hallItems.executeQuery();
                        if(rs_hallItems.next()){
                            
                %>
                        
                 <div class="mb-6 row">
                    <label for="hallName" class="col-sm-2 col-form-label">Hall Name</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" placeholder="Disabled input" aria-label="Disabled input example" value="<%= rs_hallItems.getString("name") %>" disabled>
                    </div>
                  </div>
                  <input type="text" class="form-control" id="inputInventoryID" name="inventory_id" value="<%= rs_hallItems.getInt("inventory_id") %>" hidden>
                  <input type="text" class="form-control" id="inputHallID" name="hall_id" value="<%= rs_hallItems.getInt("hall_id") %>" hidden>

                    <br>
                 <div class="mb-6 row">
                 <label for="hall_item" class="col-sm-2 col-form-label">Item:</label>
                 <div class="col-sm-10">
                <input type="text" class="form-control" id="hall_item" name="hall_item" value="<%= rs_hallItems.getString("item_name") %>" disabled>
                 </div>
                 </div>
                 <br>
                <div class="mb-6 row">
                <label for="inputQuantity" class="col-sm-2 col-form-label">Quantity: </label>
                <div class="col-sm-10">
                <input type="number" class="form-control" id="inputQuantity" name="quantity" value="<%= rs_hallItems.getInt("quantity") %>" required>
              </div>
                </div>
                <br><br>
                <div class="col-12">
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

