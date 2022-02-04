<%-- 
    Document   : ListHallInventory
    Created on : Jan 20, 2022, 8:27:06 PM
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
        <title>Inventory Hall</title>
    </head>
    <body>
        <div class="container">
            
            <ul class="nav nav-tabs">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#">Home</a>
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
                  <a class="nav-link" href="MainInventory.jsp">Inventory</a>
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
                    
                </div>
                </div>
            </nav>                
            
            <br><br>
            <%
                if(session.getAttribute("sessionUserLevel").equals("Staff")){
            
            %>
            <div class="container">
                <a href="InsertHallInventory.jsp?hallID=<%= Integer.parseInt(request.getParameter("hallID"))%>" class="btn btn-light">Insert Hall Item</a>
            </div>
                <%
                    }
                    %>
    
            <%
                int counter=0;
                int hall_ID = Integer.parseInt(request.getParameter("hallID"));
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", ""); 
                    
                    String hall = "select * from hall where hall_id=?";                   
                    PreparedStatement hallObj = conn.prepareStatement(hall);
                    hallObj.setInt(1, hall_ID);

                    ResultSet hall_rs = hallObj.executeQuery();
                    if(hall_rs.next()){

                    %>
                  
                    <br>
                  <hr>
                  <h2><%= hall_rs.getString("name") %> Hall Inventory</h2>
                  <hr>
                  <p><em>
                    Dear customer, please make sure that you complete this inventory and note down anything which is missing or damaged, and also indicate to what extent you are satisfied with the condition of each item. Any damaged or missing items found at a later date may be charged for.
                      </em>
                  </p>
                  <br>
                  
                  <table class="table table-hover">              
                    <thead>
                        <tr>
                          <th scope="col">Num</th>
                          <th scope="col">Item Name</th>
                          <th scope="col">Item Type</th>
                          <th scope="col">Quantity</th>
                          <%
                        if(session.getAttribute("sessionUserLevel").equals("Staff")){
                    %>
                          <th scope="col">Actions</th>
                          <%
                        }
                    %>
                        </tr>
                      </thead>
                      <tbody>
                    <%
                        }
                    String sqlHall = "select * from inventoryhall where hallInventory=?";                   
                    PreparedStatement ps_hall = conn.prepareStatement(sqlHall);
                    ps_hall.setInt(1, hall_ID);

                    ResultSet inventory = ps_hall.executeQuery();
                    if(inventory.next()){
                        
                        String hallItems = "select inventory_id,quantity,item_name,item_type from inventoryhall,item where itemInventory=item_id";                   
                        PreparedStatement ps_hallItem = conn.prepareStatement(hallItems);

                        ResultSet hallInventory = ps_hallItem.executeQuery();
                        
                        while(hallInventory.next()){
                            counter=counter+1;
                
            %>          
            
            <tr>                    
                <th scope="row"><%= counter  %></th>
                <td><%= hallInventory.getString("item_name")%></td>
                <td><%= hallInventory.getString("item_type")%></td>     
                <td><%= hallInventory.getInt("quantity")%></td> 
                <%
                        if(session.getAttribute("sessionUserLevel").equals("Staff")){
                    %>
                        
                        <td style="text-align:left;">
                            <a href="UpdateHallInventory.jsp?inventoryID=<%= hallInventory.getInt("inventory_id") %>" class="btn btn-warning">Update</a>
                            <a href="DeleteHallInventory.jsp?inventoryID=<%= hallInventory.getInt("inventory_id") %>" class="btn btn-danger">Delete</a>
                        </td>
                    <%
                        }
                    %>
            </tr>
            
            <%
               
                    }
                    conn.close();
        
                }else{ %>
                  <p>This hall does not has any items in its inventory.</p>
                <%
                    }
                    
                }catch(Exception ex){}
                
            %>
                            
                  </tbody>
            </table>
            <br>
        </div>
    </body>
</html>

