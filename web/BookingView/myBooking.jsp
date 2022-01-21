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
        <style>
            
            body {
                background-image: url("media/background.png");
                height: 100%;

                /* Center and scale the image nicely */
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="container">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                      <a class="nav-link" href="../MainHomepage.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../MainHall.jsp">Halls</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="../MainBooking.jsp">Booking</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../MainPromo.jsp">Promo</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../AboutUs.html">About Us</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../profile.jsp">Profile</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../LogOut">Log Out</a>
                    </li>
                </ul>
            </div>
            
            <br><br>
            
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="MainBooking.jsp">Booking</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                  <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                        <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="#">My Booking</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" aria-current="page">Past Booking</a>
                        </li> 
                    </ul>
                    <span class="navbar-text">Booking :</span>
                    <form class="d-flex">                
                       <input class="form-control me-2" type="search" placeholder="Booking id" aria-label="Search">
                      <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
                </div>
            </nav>
                      
            <hr>
            <h2>My Booking List</h2>
            <hr>
              
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
                        user_id=user.getInt("id");
                    }
                    String sql_book = "select id,date,name,charge,status,paymentSlip from booking,hall where hallBooked=hall_id and customer=?";                   
                    PreparedStatement ps_book = conn.prepareStatement(sql_book);
                    ps_book.setInt(1, user_id);
                    ResultSet booking = ps_book.executeQuery();
                    while(booking.next()){  
                        counter=counter+1;
                
            %>
            
                    <tr>
                      <th scope="row"><%= counter %></th>
                      <td><%= booking.getString("name")%></td>
                      <td><%= booking.getDouble("charge")%></td>
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
