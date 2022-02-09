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
        <style>
            
            body {
                background-image: url("../media/background.png");
                height: 100%;

                /* Center and scale the image nicely */
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                background-attachment: fixed;
            }
            
            #book{
                text-align: center; 
                height: 100%;
            }
        </style>
    </head>
    <body>
        <div class="container">
            
            <div class="container">
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
            </div>
            <br><br>

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

