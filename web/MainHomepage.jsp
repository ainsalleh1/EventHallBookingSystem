<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Homepage</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet'>

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

            h1{
                    text-align: center;
                    font-family: 'Playfair Display';
                    font-size: 42px;
                }
            
                a:link{
                    color: black;
                    text-decoration: none;
                    text-align: center;
                }
                a:visited{
                    color: darkslategrey;

                    text-decoration: none;
                }
        </style>
    </head>
    
    <!-- Header -->
    <header class="w3-panel w3-center w3-opacity" style="padding:128px 16px">
            <h1 class="w3-xlarge">EVENT HALLS BOOKING</h1>
            <h1>System</h1>
  
                <div class="w3-padding-32">
                    <div class="w3-bar w3-border">
                    <a href="#" class="w3-bar-item w3-button w3-light-grey">Home</a>
                    <a href="MainHall" class="w3-bar-item w3-button">Halls</a>
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
<!--        <div class="container">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="MainHall.jsp">Halls</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="MainHall">Halls</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="MainBooking.jsp">Booking</a>
                </li>
<!--                <li class="nav-item">
                  <a class="nav-link" href="MainPromo.jsp">Promo</a>
                </li>-->
<!--                <li class="nav-item">
                  <a class="nav-link" href="MainPromo">Promo</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="InventoryView/MainInventory.jsp">Inventory</a>
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
        </div>-->
        

<!--        <div class="container">
=======
        <div class="container">
            <br>

            <h1>
                <b>Event Hall Booking System</b>
            </h1><br><br>
            <div class="w3-content w3-display-container">
                <img class="mySlides" src="media/hall1.jpg" style="width:100%">
                <img class="mySlides" src="media/hall2.jpg" style="width:100%">
                <img class="mySlides" src="media/hall3.jpg" style="width:100%">
                <img class="mySlides" src="media/hall4.jpg" style="width:100%">

                <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
                <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
            </div>
            
        </div>
        
        <div class="container">
            <h3 style="text-align: center">
                <small class="text-muted">Make Your Dream Comes True</small>
            </h3>
        </div>-->

<br>
  <div class="w3-row-padding w3-padding-16 w3-center" id="food">
    <div class="w3-quarter">
      <img src="media/1.jpg" alt="Sandwich" style="width:100%">
      <h3><a href="MainHall">MainHall</a></h3>
      <p>Choose the best hall for your event now!</p>
    </div>
    <div class="w3-quarter">
      <img src="media/2.jpg" alt="Steak" style="width:100%">
      <h3><a href="MainBooking.jsp">Booking</a></h3>
      <p>View your booking now. Don't miss anything!</p>
    </div>
    <div class="w3-quarter">
      <img src="media/3.jpg" alt="Cherries" style="width:100%">
      <h3><a href="MainPromo.jsp">Promo</a></h3>
      <p>Don't miss out our best sales & discount of the year! Check it out now</p>
    </div>
    <div class="w3-quarter">
      <img src="media/4.jpg" alt="Pasta and Wine" style="width:100%">
      <h3><a href="InventoryView/MainInventory.jsp">Inventory</a></h3>
      <p>Halls are provided with some items too. Click to choose the best for your events</p>
    </div>
  </div>
        
       
    
        <script>
            var slideIndex = 1;
            showDivs(slideIndex);

            function plusDivs(n) {
              showDivs(slideIndex += n);
            }

            function showDivs(n) {
              var i;
              var x = document.getElementsByClassName("mySlides");
              if (n > x.length) {slideIndex = 1;}
              if (n < 1) {slideIndex = x.length;}
              for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";  
              }
              x[slideIndex-1].style.display = "block";  
            }
    
        </script>
    </body>
</html>
