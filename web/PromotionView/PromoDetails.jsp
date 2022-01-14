<%-- 
    Document   : PromoDetails
    Created on : Jan 14, 2022, 3:24:47 PM
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
        <title>PromoDetails</title>
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
                
                #hall{
                    border: 4px solid black;
                }
                .center {
                    margin-left: auto;
                    margin-right: auto;
                    
                }
                table {
                    border-collapse: separate;
                    border-spacing: 0 1em;
                }
        </style>
    </head>
    <body>
        <div class="container">
            
            <div class="container">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                      <a class="nav-link" aria-current="page" href="MainHomepage.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="MainHall.jsp">Halls</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="MainBooking.jsp">Booking</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="../MainPromo.jsp">Promo</a>
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
            </div>
                  
            <br><br>
            
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="./MainPromo.jsp">Promotion Management</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                  <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                        <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="#">Promo List</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="PromotionView/InsertPromo.html">Add Promo</a>
                        </li>
                        
                    </ul>
                    <span class="navbar-text">Promo :</span>
                    <form class="d-flex">                
                       <input class="form-control me-2" type="search" placeholder="promo name" aria-label="Search">
                      <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
                </div>
            </nav>
            
            <br><br>
            
            <%
                
                String promoID = request.getParameter("promoID");
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
                    String sql = "select * from promotion where id=?";
                    
                    PreparedStatement ps = conn.prepareStatement(sql);
                    
                    ps.setString(1, promoID);
                    ResultSet rs = ps.executeQuery();
                    
                    while(rs.next()){ 
                        double calcDiscount = rs.getDouble("discount")*100;
                
            %>
            
            <div class="container border border-dark">
                <h2 style="text-align: center">Promotion Details</h2>
                
                <table width="100%" style="text-align:center">
                    <tr>
                        <th style="width: 30%;">Promotion Name</th>
                        <td style="width: 70%;background-color: lightblue"><%= rs.getString("name") %></td>
                    </tr>
                    <tr>
                        <th style="width: 30%">Discount</th>
                        <td style="width: 70%;background-color: lightblue"><%= calcDiscount %> %</td>
                    </tr>
                    <tr>
                        <th style="width: 30%">Period</th>
                        <td style="width: 70%;background-color: lightblue"><%= rs.getString("startDate") %> until <%= rs.getString("endDate") %></td>
                    </tr>
                    <tr>
                        <th style="width: 30%">Description</th>
                        <td style="width: 70%;background-color: lightblue"><%= rs.getString("description") %></td>
                    </tr>
                    <%
                        if(session.getAttribute("sessionUserLevel").equals("Staff")){
                    %>
                    <tr>
                        
                        <td colspan="2" style="text-align:right">
                            <a href="UpdatePromo.jsp?promoID=<%= rs.getString("id")%>" class="btn btn-primary">Update</a>
                        </td>
                        <td>
                            <a href="DeletePromo.jsp?promoID=<%= rs.getString("id")%>" class="btn btn-primary">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <br>
            </div>
            
            <br><br>
            <%
                    }
                }
                catch(Exception ex){}
                %>
            
        </div>
    </body>
</html>
