<%-- 
    Document   : InventoryHall
    Created on : Jan 20, 2022, 8:08:46 PM
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
        <title>Inventory Hall</title>
    </head>
    <header class="w3-panel w3-center" style="padding:128px 16px 20px 16px">
            <h1 class="w3-xlarge">HALLS BOOKING</h1>
            <h1>System</h1>
  
                <div class="w3-padding-32">
                    <div class="w3-bar w3-border">
                    <a href="../MainHomepage.jsp" class="w3-bar-item w3-button">Home</a>
                    <a href="../MainHall" class="w3-bar-item w3-button">Hall List</a>
                    <a href="../MainBooking.jsp" class="w3-bar-item w3-button">Booking</a>
                    <a href="../MainPromo.jsp" class="w3-bar-item w3-button w3-hide-small">Promo</a>
                    <a href="#" class="w3-bar-item w3-button w3-light-grey">Inventory</a>
                    <a href="../AboutUs.html" class="w3-bar-item w3-button">About Us</a>
                    <a href="../profile.jsp" class="w3-bar-item w3-button">Profile</a>
                    <a href="../LogOut" class="w3-bar-item w3-button">Log Out</a>
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
                    <a href="InventoryHall" class="w3-bar-item w3-button">Inventory List</a> 
                    <a href="InsertItem.html" class="w3-bar-item w3-button">Add Item</a> 
                </div>
                <div class="w3-bar" style="padding:0px 0px 0px 250px">
                    <form class="d-flex">                
                    <span class="navbar-text">Promo :</span>
                    <input class="form-control me-2" type="search" placeholder="Items Name" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
                <br>
            </div>
            
            <br><br>
            
<!--            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="MainInventory.jsp">Inventory Management</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                  <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                        <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="MainInventory.jsp">Item List</a>
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
            </nav>-->
            
            <table class="table table-hover">              
                <thead>
                    <tr>
                      <th scope="col">Hall ID</th>
                      <th scope="col">Name</th>
                      <th scope="col">Location</th>
                      <th scope="col">&nbsp;</th>
                    </tr>
                  </thead>
                  <tbody>
            
            <%
                try{                  
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");                   
                    
                    String sql = "select * from hall";                   
                    PreparedStatement ps_hall = conn.prepareStatement(sql);

                    ResultSet hall = ps_hall.executeQuery();
                    while(hall.next()){
                
            %>          
            
            <tr>                    
                <th scope="row"><%= hall.getInt("hall_id")  %></th>
                <td><%= hall.getString("name")%></td>
                <td><%= hall.getString("location")%></td>     
                <td> <a href="ListHallInventory.jsp?hallID=<%= hall.getInt("hall_id")%>"> View Inventory</a> </td> 
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
