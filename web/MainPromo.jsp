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
            <h1 class="w3-xlarge">HALLS BOOKING</h1>
            <h1>System</h1>
  
                <div class="w3-padding-32">
                    <div class="w3-bar w3-border">
                    <a href="MainHomepage.jsp" class="w3-bar-item w3-button">Home</a>
                    <a href="MainHall" class="w3-bar-item w3-button">Hall List</a>
                    <a href="MainBooking.jsp" class="w3-bar-item w3-button">Booking</a>
                    <a href="MainPromo.jsp" class="w3-bar-item w3-button w3-hide-small w3-light-grey">Promo</a>
                    <a href="InventoryView/MainInventory.jsp" class="w3-bar-item w3-button">Inventory</a>
                    <a href="AboutUs.html" class="w3-bar-item w3-button">About Us</a>
                    <a href="profile.jsp" class="w3-bar-item w3-button">Profile</a>
                    <a href="LogOut" class="w3-bar-item w3-button">Log Out</a>
                    </div>
                    
                </div>
        </header> 
    <body>
        <div class="container">
            <div class="w3-center" >
                <br>
                <div class="w3-bar w3-border">
                    <a href="MainPromo.jsp" class="w3-bar-item w3-button  w3-light-grey">Promotion Management</a>
                    <a href="#" class="w3-bar-item w3-button">Promo List</a>
                    <a href="PromotionView/InsertPromo.html" class="w3-bar-item w3-button">Add Promo</a>    
                </div>
                <div class="w3-bar" style="padding:0px 0px 0px 250px">
                    <form class="d-flex">                
                    <span class="navbar-text">Promo :</span>
                    <input class="form-control me-2" type="search" placeholder="Promo Name" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
                <br>
            
            <br><br>
        
<!--            <nav class="navbar navbar-expand-lg navbar-light bg-light">
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
            
            <br><br>  -->
            
            
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
//                        double calcDiscount = rs.getDouble("discount")*100;
                
            %>
            
            <div class="card w-100">    
                <div class="card-body">               
                    <div class="row">
                       <div class="col">
                            <h5 class="card-title" style="text-align: center"><%= rs.getString("promo_name")%></h5>
                            <img src="media/hall1.jpg" class="card-img-bottom" alt="hall">
                        </div>
                        <div class="col-6">
                            <h2 class="card-text" style="text-align: center">Discount: <%= df.format(rs.getDouble("discount")) %> %</h2>
                        </div>
                        <div class="col">
                            <a href="./PromotionView/PromoDetails.jsp?promoID=<%= rs.getInt("promo_id")%>" class="btn btn-primary">Detail</a>
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
