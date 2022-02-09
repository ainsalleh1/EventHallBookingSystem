<%-- 
    Document   : myBooking
    Created on : Jan 17, 2022, 7:14:21 PM
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
        <title>My Booking</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
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
    </head>
    <header class="w3-panel w3-center" style="padding:128px 16px 20px 16px">
            <h1 class="w3-xlarge">HALLS BOOKING</h1>
            <h1>System</h1>
  
                <div class="w3-padding-32">
                    <div class="w3-bar w3-border">
                    <a href="../MainHomepage.jsp" class="w3-bar-item w3-button">Home</a>
                    <a href="../MainHall" class="w3-bar-item w3-button">Hall List</a>
                    <a href="../MainBooking.jsp" class="w3-bar-item w3-button w3-light-grey">Booking</a>
                    <a href="../MainPromo" class="w3-bar-item w3-button w3-hide-small">Promo</a>
                    <a href="../InventoryView/MainInventory.jsp" class="w3-bar-item w3-button">Inventory</a>
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
                    <a href="MainBooking.jsp" class="w3-bar-item w3-button">Booking</a>
                    <a href="#" class="w3-bar-item w3-button w3-light-grey">My Booking</a>
                    <a href="#" class="w3-bar-item w3-button">Past Booking</a>
                </div>
                <div class="w3-bar" style="padding:0px 0px 0px 250px">
                    <form class="d-flex">                
                    <span class="navbar-text">Booking :</span>
                    <input class="form-control me-2" type="search" placeholder="Booking id" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
                <br>
            <br><br>
            <table class="table table-hover">
               <thead>
                    <tr>
                      <th scope="col">Number</th>
                      <th scope="col">Hall Booked</th>
                      <th scope="col">Hall Charge (RM)</th>
                      <th scope="col">Booking date</th>
                      <th scope="col">Payment</th>
                      <th scope="col">Status</th>
                      <th scope="col">Action</th>
                    </tr>
                  </thead>
                  <tbody>
            <%
                String email = (String)session.getAttribute("sessionEmail");
                int counter=0;
                int user_id=0;
                try{
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");                   
                    
                    String sql = "select * from user where email=?";                   
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setString(1, email);
                    ResultSet user = ps.executeQuery();
                    if(user.next()){
                        user_id=user.getInt("user_id");
                    }
                    String sql_book = "select id,date,name,totalPrice,status,paymentSlip from booking,hall where hallBooked=hall_id and customer=?";                   
                    PreparedStatement ps_book = conn.prepareStatement(sql_book);
                    ps_book.setInt(1, user_id);
                    ResultSet booking = ps_book.executeQuery();
                    while(booking.next()){  
                        counter=counter+1;
                
            %>
            
                    <tr>
                      <th scope="row"><%= counter %></th>
                      <td><%= booking.getString("name")%></td>
                      <td>RM <%= booking.getDouble("totalPrice")%></td>
                      <td><%= booking.getDate("date")%></td>
                      <td><%= booking.getString("paymentSlip")%></td>
                      <td><%= booking.getString("status")%></td>
                      <td><a href="../BookingView/BookingPayment.jsp?booking=<%= booking.getInt("id") %>" class="btn btn-primary">Insert payment slip</a></td>
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
