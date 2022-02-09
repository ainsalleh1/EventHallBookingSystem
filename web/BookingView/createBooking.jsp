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
                    <a href="MainBooking.jsp" class="w3-bar-item w3-button w3-light-grey">Booking</a>
                    <a href="MainPromo.jsp" class="w3-bar-item w3-button w3-hide-small">Promo</a>
                    <a href="InventoryView/MainInventory.jsp" class="w3-bar-item w3-button">Inventory</a>
                    <a href="AboutUs.html" class="w3-bar-item w3-button">About Us</a>
                    <a href="profile.jsp" class="w3-bar-item w3-button">Profile</a>
                    <a href="LogOut" class="w3-bar-item w3-button">Log Out</a>
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
                            <div class="w3-half w3-margin-bottom">
                                <label><i class="fa fa-calendar-o"></i> Start date:</label>
                                <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY" name="startDate" id="startDate" required>
                                </div>
                            <div class="w3-half">
                                <label><i class="fa fa-calendar-o"></i> End date:</label>
                                <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY" name="endDate" id="endDate" required>
                                </div>
<!--                        <div class="col-md-6">
                            <label for="startDate" class="form-label">Start Date:</label>
                            <input type="date" class="form-control" id="startDate" name="startDate" required>
                        </div>
                        <div class="col-md-6">
                            <label for="endDate" class="form-label">End Date:</label>
                            <input type="date" class="form-control" id="startDate" name="endDate" required>
                        </div>-->
                        
<br><br>
                        <input type="hidden" value="<%= rs.getInt("hall_id") %>" name="hallID">
                                               
                        <%
                            if(promo.next()){
                        %>
                        <br>
                        <label for="promotion">Choose a promotion package for discount!</label> 
                        <select class="form-select" id="promotion" name="promotion">
                            <option value="0" selected>Open this select menu</option>
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
