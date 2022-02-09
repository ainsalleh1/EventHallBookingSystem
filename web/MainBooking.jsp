<%-- 
    Document   : MainBooking
    Created on : Dec 29, 2021, 9:49:33 PM
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <title>Booking</title>
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
                    background-image: url("media/cool.jpg");
                    background-position: center;
                    
                    
                }
                a{
                    text-decoration: none;
                    
                }
        </style>
    </head>
    <header class="w3-panel w3-center" style="padding:128px 16px 20px 16px">
            <h1 class="w3-xlarge">EVENT HALLS BOOKING</h1>
            <h1>System</h1>
  
                <div class="w3-padding-32">
                    <div class="w3-bar w3-border">
                    <a href="MainHomepage.jsp" class="w3-bar-item w3-button">Home</a>
                    <a href="MainHall" class="w3-bar-item w3-button">Halls</a>
                    <a href="MainBooking.jsp" class="w3-bar-item w3-button w3-light-grey">Booking</a>
                    <a href="MainPromo" class="w3-bar-item w3-button w3-hide-small">Promo</a>
                    <a href="InventoryView/MainInventory.jsp" class="w3-bar-item w3-button">Inventory</a>
                    <a href="AboutUs.html" class="w3-bar-item w3-button">About Us</a>
                    <a href="profile.jsp" class="w3-bar-item w3-button">Profile</a>
                    <a href="LogOut" class="w3-bar-item w3-button">Log Out</a>
                    </div>
                    
                </div>
        </header>  
    <body>
        <div class="container">
            <div class="w3-center" style="padding:2px 16px 0px 16px">
                <div class="w3-padding-32">
                    <div class="w3-bar w3-border">
                        <%
                            if(session.getAttribute("sessionUserLevel").equals("Staff")){
                        %>
                    <a href="MainBooking.jsp" class="w3-bar-item w3-button w3-light-grey">Booking Management</a>
                    <a href="BookingView/ManageBooking.jsp" class="w3-bar-item w3-button">Manage Booking</a>
                    <!--<a href="#" class="w3-bar-item w3-button">Booking List</a>-->    
                    <a href="BookingView/myBooking.jsp" class="w3-bar-item w3-button">My Booking</a>
                <br><br>
            <%
                } else{
            %>
            
                    <a href="MainBooking.jsp" class="w3-bar-item w3-button w3-light-grey">Booking Management</a>
                    <a href="BookingView/ManageBooking.jsp" class="w3-bar-item w3-button">Manage Booking</a>   
                    <a href="BookingView/myBooking.jsp" class="w3-bar-item w3-button">My Booking</a>        
                    </div>
            
            <%
                }
            %>
                </div>
                <div class="w3-bar">
                <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                  Sort By...
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                  <li><a class="dropdown-item" href="BookingView/CheapestHall.jsp">Cheapest</a></li>
                  <li><a class="dropdown-item" href="BookingView/MostExpensiveHall.jsp">Most Expensive</a></li>
                </ul>


            </div>
                    </div>
            <br>
            
            <%
                if(session.getAttribute("sessionUserLevel").equals("Staff")){
            
            %>
            
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="MainBooking.jsp">Booking Management</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                  <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                        <li class="nav-item">
                          <a class="nav-link" aria-current="page" href="BookingView/ManageBooking.jsp">Manage Booking</a>
                        </li>
<!--                        <li class="nav-item">
                          <a class="nav-link" aria-current="page" href="#">Booking List</a>
                        </li>-->
                        <li class="nav-item">
                          <a class="nav-link" aria-current="page" href="BookingView/myBooking.jsp">My Booking</a>
                        </li> 
                    </ul>
                    <span class="navbar-text">Booking :</span>
                    <form class="d-flex" action="GetBooking" method="get">                
                       <input class="form-control me-2" type="search" placeholder="Booking id" aria-label="Search" name="BookingID">
                      <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>

                </div>
                <br>
            
            </div>
            </nav>
            <%
                }
            %>
            <br>
            
            <%
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
                    String sql = "select * from hall";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();
                    
                    while(rs.next()){             
                
            %>
            
            <div class="row">
                <div class="col">
                  <img src="media/4.jpg" class="img-fluid" alt="hall">
                </div>
                <div class="col">
                  <div class="card text-center h-100">
                        <div class="card-body">
                          <h5 class="card-title"><%= rs.getString("name")%></h5>
                          <p class="card-text"><%= rs.getString("description") %></p>
                          <p class="card-text">RM <%= rs.getDouble("charge") %></p>
                          <p class="card-text"><%= rs.getString("location") %></p>
                          <a href="BookingView/createBooking.jsp?hallID=<%= rs.getString("hall_id")%>" class="btn btn-primary">Book Now</a>
                          
                        </div>
                    </div>
                </div>  
            </div>
            
            <br>
            <hr>
            
            <%              
                    }
                    conn.close();
                } catch(Exception ex){}              
            %>            
                
            <br>
        </div>
    </body>
</html>
