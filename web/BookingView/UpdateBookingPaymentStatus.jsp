<%-- 
    Document   : UpdateBookingPaymentStatus
    Created on : Jan 21, 2022, 2:32:34 PM
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
        <title>Manage Booking Status</title>
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
            
            #book{
                text-align: center; 
                height: 100%;
            }
        </style>
    </head>
    <header class="w3-panel w3-center" style="padding:128px 16px 20px 16px">
            <h1 class="w3-xlarge">HALLS BOOKING</h1>
            <h1>System</h1>
  
                <div class="w3-padding-32">
                    <div class="w3-bar w3-border">
                    <a href="MainHomepage.jsp" class="w3-bar-item w3-button">Home</a>
                    <a href="MainHall" class="w3-bar-item w3-button">Hall List</a>
                    <a href="../MainBooking.jsp" class="w3-bar-item w3-button w3-light-grey">Booking</a>
                    <a href="MainPromo" class="w3-bar-item w3-button w3-hide-small">Promo</a>
<!--                    <a href="InventoryView/MainInventory.jsp" class="w3-bar-item w3-button">Inventory</a>-->
                    <a href="AboutUs.html" class="w3-bar-item w3-button">About Us</a>
                    <a href="profile.jsp" class="w3-bar-item w3-button">Profile</a>
                    <a href="../LogOut" class="w3-bar-item w3-button">Log Out</a>
                    </div>
                    
                </div>
        </header> 
    <body>
        <div class="container">
            
<!--            <div class="container">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                      <a class="nav-link" href="MainHomepage.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="MainHall">Halls</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="../MainBooking.jsp">Booking</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="MainPromo">Promo</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="AboutUs.html">About Us</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="profile.jsp">Profile</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../LogOut">Log Out</a>
                    </li>
                </ul>
            </div>-->
            <br>

            <%
                
                int bookingID = Integer.parseInt(request.getParameter("booking"));
                
                try{
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");                   
     
                    String sql_booking = "select id,date,name,charge,status,paymentSlip from booking,hall where hallBooked=hall_id and id=?";                   
                    PreparedStatement ps_manageBooking = conn.prepareStatement(sql_booking);
                    ps_manageBooking.setInt(1, bookingID);
                    
                    ResultSet booking = ps_manageBooking.executeQuery();
                    while(booking.next()){  
                                     
            %>
            
            <br><br>
            
            <dl class="row">
                                
                <dt class="col-sm-3">Booking ID</dt>
                <dd class="col-sm-9"><%= booking.getInt("id") %></dd>
                
                <dt class="col-sm-3">Booking Date</dt>
                <dd class="col-sm-9"><%= booking.getDate("date") %></dd>
                
                <dt class="col-sm-3">Hall Name</dt>
                <dd class="col-sm-9"><%= booking.getString("name") %></dd>
                
                <dt class="col-sm-3">Total Charge</dt>
                <dd class="col-sm-9"><%= booking.getDouble("charge") %></dd>
                
                <dt class="col-sm-3">Current Booking Status</dt>
                <dd class="col-sm-9"><%= booking.getString("status") %></dd>
                
                
           
            </dl>
            
            <form method="POST" class="container text-left" action="../UpdateBookingStatus">
                
                <p>Update customer's booking status:</p>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="status" id="flexRadioDefault1" value='Payment approved, Booking confirmed'>
                    <label class="form-check-label" for="flexRadioDefault1">
                      Approve payment, Confirm booking
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="status" id="flexRadioDefault2" value='Payment rejected'>
                    <label class="form-check-label" for="flexRadioDefault2">
                      Reject payment slip
                    </label>
                  </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="status" id="flexRadioDefault2" value='Booking is cancelled'>
                    <label class="form-check-label" for="flexRadioDefault2">
                      Cancel booking
                    </label>
                  </div>
              <br><br>
              <input type="hidden" value="<%= booking.getInt("id") %>" name="bookingID">
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

