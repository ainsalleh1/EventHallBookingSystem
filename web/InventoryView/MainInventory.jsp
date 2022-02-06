<%-- 
    Document   : MainInventory
    Created on : Jan 20, 2022, 5:49:20 PM
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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .mySlides {display:none;}
            body,h1 {
/*                background-image: url("media/background.png");*/
                height: 100%;

                /* Center and scale the image nicely */
                
                Font-family: "Raleway", Arial, sans-serif;
                
            }
            
            
           h1{
                    text-align: center;
                    font-family: 'Playfair Display';
                    font-size: 82px;
                    color: black;
                }
            h3{
                    text-align: center;
                    font-family: 'Playfair Display';
                    font-size: 22px;
                    color: black;
                   
                }
            h2{
                    text-align: center;
                    font-family: 'Playfair Display';
                    color: black;
                   
                }
            .w3-row-padding img {margin-bottom: 12px}
            header{
                    background-image: url("../media/cool.jpg");
                    background-position: center;
                    
                    
                }
                a{
                    text-decoration: none;
                    
                }
        </style>
        <title>Main Inventory</title>
    </head>
        <header class="w3-panel w3-center" style="padding:128px 16px 20px 16px">
            <h1 class="w3-xlarge">HALLS BOOKING</h1>
            <h1>System</h1>
  
                <div class="w3-padding-32">
                    <div class="w3-bar w3-border">
                    <a href="MainHomepage.jsp" class="w3-bar-item w3-button">Home</a>
                    <a href="MainHall" class="w3-bar-item w3-button">Hall List</a>
                    <a href="MainBooking.jsp" class="w3-bar-item w3-button">Booking</a>
                    <a href="MainPromo.jsp" class="w3-bar-item w3-button w3-hide-small">Promo</a>
                    <a href="InventoryView/MainInventory.jsp" class="w3-bar-item w3-button w3-light-grey">Inventory</a>
                    <a href="AboutUs.html" class="w3-bar-item w3-button">About Us</a>
                    <a href="profile.jsp" class="w3-bar-item w3-button">Profile</a>
                    <a href="LogOut" class="w3-bar-item w3-button">Log Out</a>
                    </div>
                    
                </div>
        </header>
    <body>
        <div class="container">
            
            <div class="w3-center" >
                <br>
                <div class="w3-bar w3-border">
                    <a href="MainInventory.jsp" class="w3-bar-item w3-button w3-light-grey">Inventory Management</a>
                    <a href="#" class="w3-bar-item w3-button">Item List</a>
                    <a href="InventoryHall.jsp" class="w3-bar-item w3-button">Hall Inventory</a> 
                    <a href="InsertItem.html" class="w3-bar-item w3-button">Add Item</a> 
                </div>
                <div class="w3-bar" style="padding:0px 0px 0px 250px">
                    <form class="d-flex">                
                    <span class="navbar-text">Promo :</span>
                    <input class="form-control me-2" type="search" placeholder="Promo Name" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
                <br>
            </div>
        
<!--            <nav class="navbar navbar-expand-lg navbar-light bg-light">
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
                    <span class="navbar-text">Inventory :</span>
                    <form class="d-flex">                
                       <input class="form-control me-2" type="search" placeholder="items name" aria-label="Search">
                      <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
                </div>
            </nav>-->
            
            <hr>
            <h2>Items</h2>
            <hr>
            
            <table class="table table-hover">              
                <thead>
                    <tr>
                      <th scope="col">Number</th>
                      <th scope="col">Name</th>
                      <th scope="col">Type</th>
                    </tr>
                  </thead>
                  <tbody>
            
            <%
                int counter=0;
                try{                  
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");                   
                    
                    String sql = "select * from item";                   
                    PreparedStatement ps_item = conn.prepareStatement(sql);

                    ResultSet item = ps_item.executeQuery();
                    while(item.next()){
                        counter=counter+1;
                
            %>          
            
            <tr>                    
                <th scope="row"><%= counter %></th>
                      <td><%= item.getString("item_name")%></td>
                      <td><%= item.getString("item_type")%></td>                   
            </tr>
            
            <%
               
                    }
                    conn.close();
                }catch(Exception ex){}
                
            %>
                            
                  </tbody>
            </table>
            
        </div>
    </body>
</html>
