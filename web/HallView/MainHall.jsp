<%@page import="Model.Hall"%>
<%@page import="java.util.List"%>
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
        <title>Halls</title>
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
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                background-attachment: fixed;
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
                    <a href="MainHall" class="w3-bar-item w3-button w3-light-grey">Hall List</a>
                    <a href="MainBooking.jsp" class="w3-bar-item w3-button">Booking</a>
                    <a href="MainPromo" class="w3-bar-item w3-button w3-hide-small">Promo</a>
                    <a href="InventoryView/MainInventory.jsp" class="w3-bar-item w3-button">Inventory</a>
                    <a href="AboutUs.html" class="w3-bar-item w3-button">About Us</a>
                    <a href="profile.jsp" class="w3-bar-item w3-button">Profile</a>
                    <a href="LogOut" class="w3-bar-item w3-button">Log Out</a>
                    </div>
                    
                </div>
        </header>  
    <body>
        <div class="container">

            <div class="w3-center" style="padding:2px 16px 0px 16px">
            <div class="w3-padding-32">
                    <div class="w3-bar w3-border">
                    <a href="MainHall.jsp" class="w3-bar-item w3-button w3-light-grey">Halls Management</a>
                    <a href="MainHall" class="w3-bar-item w3-button">Hall List</a>
                    <a href="./HallView/InsertHall.html" class="w3-bar-item w3-button">Add Hall</a>
                    </div>
                <br><br>
                
                    <form class="d-flex" action="GetHall" method="get"><span class="navbar-text">Hall :  </span>                
                        <input class="form-control me-2" type="search" placeholder="Hall Name" aria-label="Search" name="HallName">

            
<!--            <div class="container">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                      <a class="nav-link" aria-current="page" href="MainHomepage.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="MainHall.jsp">Halls</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="MainBooking.jsp">Booking</a>
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
                      <a class="nav-link" href="LogOut">Log Out</a>
                    </li>
                </ul>
            </div>
           
        -->
            <br><br>
        
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="MainHall">Halls Management</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                  <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                        <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="MainHall">Hall List</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="./HallView/InsertHall.html">Add Hall</a>
                        </li>
                        
                    </ul>
                    <span class="navbar-text">Hall :</span>
                    <form class="d-flex" action="GetHall" method="get">                
                        <input class="form-control me-2" type="search" placeholder="hall name" aria-label="Search" name="HallName">

                      <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
           </div>
            
            <br><br>  
            
            <%
//                try{
//                    Class.forName("com.mysql.jdbc.Driver");
//                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
//                    String sql = "select * from hall";
////                    Statement stmt = conn.createStatement();
//                    PreparedStatement ps = conn.prepareStatement(sql);
//                    ResultSet rs = ps.executeQuery();
//                    
//                    while(rs.next()){          
                List<Hall> hl = (List<Hall>)request.getAttribute("hl");
                for(int i=0;i<hl.size();i++){
                
            %>
            
            <div class="w3-row-padding" id="about">
                <div class="w3-col l4 12">
                    <h3><%= hl.get(i).getName()%></h3>
                    
                    <h6><%= hl.get(i).getDescription() %></h6>
                    <div class="col">
                      <a href="HallView/HallDetails.jsp?hallID=<%= hl.get(i).getHall_id()%>" class="btn btn-primary">Detail</a>
                    </div>
                </div>
                <div class="w3-col l8">
                <!-- Image of location/map -->
                <img src="media/3.jpg" class="w3-image w3-greyscale" style="width:80%;">
                </div>
            </div>
                    
            
            
                    
                    
                    
                    
<!--            <div class="card w-100">    
                <div class="card-body">               
                    <div class="row">
                       <div class="col">
                            <h5 class="card-title" style="text-align: center"><%= hl.get(i).getName()%></h5>
                            <img src="media/hall1.jpg" class="card-img-bottom" alt="hall">
                        </div>
                        <div class="col-6">
                            <p class="card-text"><%= hl.get(i).getDescription() %></p>
                        </div>
                        

                    </div>          
                </div>                
            </div>-->
           
            <br><br>
            <%
                }
                %>
        </div>
       
    </body>
</html>
