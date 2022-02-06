<%-- 
    Document   : SearchPromo
    Created on : Jan 31, 2022, 10:14:25 AM
    Author     : End-User
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="Model.Promo"%>
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
                    <form class="d-flex" action="GetPromo" method="get">                
                       <input class="form-control me-2" type="search" placeholder="promo name" aria-label="Search" name="PromoName">
                      <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
                </div>
            </nav>
            
            <br><br>
            <div class="container">
                <p><i>Search result of </i><mark><%= request.getAttribute("searchkey") %></mark><i> keyword.</i></p>
            </div>
            <%
                DecimalFormat df = new DecimalFormat("0.00");
                List<Promo> pu = (List<Promo>)request.getAttribute("pu");
                for(int i=0;i<pu.size();i++){
                
            %>
            
            <div class="card w-100">    
                <div class="card-body">               
                    <div class="row">
                       <div class="col">
                           <h5 class="card-title" style="text-align: center"><%= pu.get(i).getPromo_name()  %></h5>
                            <img src="media/hall1.jpg" class="card-img-bottom" alt="hall">
                        </div>
                        <div class="col-6">
                            <h2 class="card-text" style="text-align: center">Discount: <%= df.format(pu.get(i).getDiscount()) %> %</h2>
                        </div>
                        <div class="col">
                            <a href="./PromotionView/PromoDetails.jsp?promoID=<%= pu.get(i).getPromo_id() %>" class="btn btn-primary">Detail</a>
                        </div>

                    </div>          
                </div>                
            </div>
            
            <br><br>
            <%
                    }
                %>
            
            <br><br>
            
        </div>
    </body>
</html>

