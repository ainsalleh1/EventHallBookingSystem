<%-- 
    Document   : createBooking
    Created on : Jan 17, 2022, 3:02:27 PM
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
        <%--<%@include file="../head.html" %>--%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <title>Booking</title>
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
                      <a class="nav-link" href="MainHall.jsp">Halls</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="../MainBooking.jsp">Booking</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="MainPromo.jsp">Promo</a>
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
                
                String hallID = request.getParameter("hallID");
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");                   
                    
                    String sql = "select * from hall where hall_id=?";                   
                    PreparedStatement ps = conn.prepareStatement(sql);
                    
                    ps.setString(1, hallID);
                    ResultSet rs = ps.executeQuery();
                    
                    String sqlPromo = "select * from promotion";
                    PreparedStatement ps_promo = conn.prepareStatement(sqlPromo);
                    ResultSet promo = ps_promo.executeQuery();
                    
                    while(rs.next()){             
                
            %>
            
            <div class="row" id="book">
                <div class="col">
                    <h2><%= rs.getString("name")%> HALL</h2>
                  <img src="../media/hall1.jpg" class="img-fluid" alt="hall">
                </div>
                <div class="col">
                    
                    <form id="bookingForm" action="../createBooking" method="POST">
                            
                        <div class="col-md-6">
                            <label for="startDate" class="form-label">Start Date:</label>
                            <input type="date" class="form-control" id="startDate" name="startDate" required>
                        </div>
                        <div class="col-md-6">
                            <label for="endDate" class="form-label">End Date:</label>
                            <input type="date" class="form-control" id="startDate" name="endDate" required>
                        </div>
                        <input type="hidden" value="<%= rs.getInt("hall_id") %>" name="hallID">
                                               
                        <%
                            if(promo.next()){
                        %>
                        <br>
                        <label for="promotion">Choose a promotion package for discount!</label> 
                        <select class="form-select" id="promotion" name="promotion">
                            <option selected>Open this select menu</option>
                            <option value="<%= promo.getInt("promo_id") %>"> <%= promo.getString("promo_name") %> </option>
                        <%
                                while(promo.next()){
                        %>                                             
                        
                        <option value="<%= promo.getInt("promo_id") %>"> <%= promo.getString("promo_name") %> </option>
                          
                        <%
                                }
                        %>
                        </select>
                        <br>
                        <%
                            } else{
                        %>
                        <br>
                        <p><i>Note: No promotion package currently available.</i></p>
                        <%
                            }
                        %>
                    </form>
                    
                    <div class="card text-center h-100">
                        <div class="card-body">
                            <h5 class="card-title"><%= rs.getString("name")%></h5>
                            <p class="card-text">
                                <ul>
                                    <li><%= rs.getString("location") %></li>
                                    <li><%= rs.getString("capacity") %> people</li>
                                    <li>RM <%= rs.getString("charge") %></li>
                                    <li><%= rs.getString("description") %></li>
                                </ul>                  
                            </p>
                            <div class="col-12">                                            
                                <button type="submit" form="bookingForm" class="btn btn-success">Book</button>  
                                <a href="../InventoryView/ListHallInventory.jsp?hallID=<%= rs.getInt("hall_id") %>" target="_blank" class="btn btn-primary">Inventory Detail</a>
                            </div>                          
                        </div>
                    </div>
                </div>  
            </div>
                          
            <%
                    }
                    conn.close();
                }catch(Exception ex){}
                
            %>
            
        </div>
    </body>
</html>
