<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet'>
        <style>
                .mySlides {display:none;}
                
                body {
                background-image: url("media/background.png");
                height: 100%;

                /* Center and scale the image nicely */
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                }
                
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
            
        </style>
        
        
    </head>
    <body>
        <% 
            if(session.getAttribute("sessionEmail") != null){
                response.sendRedirect("MainHomepage.jsp");
            }
            else{
        
        %>
        <div class="container">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="GeneralHall.jsp">Halls</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="GeneralPromo.jsp">Promo</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="GeneralAboutUs.html">About Us</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="login.jsp">Login</a>
                </li>

            </ul>
        </div>
        
        <div class="container">
            <br>
            <h1>
                <b>Halls Booking System</b>
            </h1><br><br>
            
            <div class="w3-content w3-display-container">
                <img class="mySlides" src="media/1.jpg" style="max-width:100%">
                <img class="mySlides" src="media/2.jpg" style="max-width:100%">
                <img class="mySlides" src="media/3.jpg" style="max-width:100%">
                <img class="mySlides" src="media/4.jpg" style="max-width:100%">

                <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
                <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
            </div>
            
        </div>
        
        <div class="container">
            <h3 style="text-align: center">
                <small class="text-muted">Make Your Dream Comes True</small>
            </h3>
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
        <%
            }
        %>
    </body>
    
</html>