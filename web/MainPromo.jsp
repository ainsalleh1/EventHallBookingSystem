<%-- 
    Document   : MainPromo
    Created on : Dec 29, 2021, 9:48:22 PM
    Author     : End-User
--%>

<%@page import="java.text.DecimalFormat"%>
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
        <title>Promotion</title>
    </head>
    <body>
        <div class="container">
            <div class="container">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                      <a class="nav-link" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="MainHall.jsp">Halls</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="MainBooking.jsp">Booking</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="MainPromo.jsp">Promo</a>
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
                    <a class="navbar-brand" href="MainPromo.jsp">Promotion Management</a>
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
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
                    String sql = "select * from promotion";
//                    Statement stmt = conn.createStatement();
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();
                    
                    DecimalFormat df = new DecimalFormat("0.00");
                    
                    while(rs.next()){ 
                        double calcDiscount = rs.getDouble("discount")*100;
                
            %>
            
            <div class="card w-100">    
                <div class="card-body">               
                    <div class="row">
                       <div class="col">
                            <h5 class="card-title" style="text-align: center"><%= rs.getString("name")%></h5>
                            <img src="media/hall1.jpg" class="card-img-bottom" alt="hall">
                        </div>
                        <div class="col-6">
                            <h2 class="card-text" style="text-align: center">Discount: <%= df.format(calcDiscount) %> %</h2>
                        </div>
                        <div class="col">
                            <a href="./PromotionView/PromoDetails.jsp?promoID=<%= rs.getString("id")%>" class="btn btn-primary">Detail</a>
                        </div>

                    </div>          
                </div>                
            </div>
            
            <br><br>
            <%
                    }
                }
                catch(Exception ex){}
                %>
            
            <br><br>
           
        </div>
    </body>
</html>
