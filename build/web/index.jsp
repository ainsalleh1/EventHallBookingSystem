<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>EventHallBookingSystem</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet'>
        <style>
                .mySlides {display:none;}
                
                body {
/*                background-image: url("media/background.png");*/
                height: 100%;
                Font-family: "Raleway", Arial, sans-serif;

                /* Center and scale the image nicely */
                background-position: center;
/*                background-repeat: no-repeat;
                background-size: cover;
                background-attachment: fixed;*/
                }
                
                h1{
                    text-align: center;
                    font-family: 'Playfair Display';
                    font-size: 82px;
                }
                h2{
                    text-align: center;
                    font-family: 'Playfair Display';
                    font-size: 42px;
                }
            
                a:link{
                    color: black;
                    text-decoration: none;
                    text-align: center;
                }
                header{
                    background-image: url("media/cool.jpg");
                    background-position: center;
                    
                    
                }
                .w3-row-padding img {margin-bottom: 12px}
        </style>
        
       
    </head>
    <body>
        <% 
            if(session.getAttribute("sessionEmail") != null){
                response.sendRedirect("MainHomepage.jsp");
            }
            else{
        
        %>
        <header class="w3-panel w3-center w3-opacity" style="padding:128px 16px">
            <h1 class="w3-xlarge">HALLS BOOKING</h1>
            <h1>System</h1>
  
                <div class="w3-padding-32">
                    <div class="w3-bar w3-border">
                    <a href="#" class="w3-bar-item w3-button w3-light-grey">Home</a>
                    <a href="GeneralHall.jsp" class="w3-bar-item w3-button">Halls</a>
                    <a href="GeneralPromo.jsp" class="w3-bar-item w3-button">Promo</a>
                    <a href="GeneralAboutUs.html" class="w3-bar-item w3-button w3-hide-small">About Us</a>
                    <a href="login.jsp" class="w3-bar-item w3-button">Login</a>
                    </div>
                </div>
        </header> 
        
<!--        <div class="container">
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
        </div>-->
<!--<h2>Customer's review</h2>-->
        <!-- First Photo Grid-->
        <br>
  <div class="w3-row-padding w3-padding-16 w3-center" id="food">
    <div class="w3-quarter">
      <img src="media/1.jpg" alt="Sandwich" style="width:100%">
      <h3>The Perfect Sandwich, A Real NYC Classic</h3>
      <p>Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="media/2.jpg" alt="Steak" style="width:100%">
      <h3>Let Me Tell You About This Steak</h3>
      <p>Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="media/3.jpg" alt="Cherries" style="width:100%">
      <h3>Cherries, interrupted</h3>
      <p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
      <p>What else?</p>
    </div>
    <div class="w3-quarter">
      <img src="media/4.jpg" alt="Pasta and Wine" style="width:100%">
      <h3>Once Again, Robust Wine and Vegetable Pasta</h3>
      <p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
  </div>
        
          <!-- Second Photo Grid-->
        <div class="w3-row-padding w3-padding-16 w3-center" id="food">
    <div class="w3-quarter">
      <img src="media/1.jpg" alt="Sandwich" style="width:100%">
      <h3>The Perfect Sandwich, A Real NYC Classic</h3>
      <p>Just some random text, lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="media/2.jpg" alt="Steak" style="width:100%">
      <h3>Let Me Tell You About This Steak</h3>
      <p>Once again, some random text to lorem lorem lorem lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
    <div class="w3-quarter">
      <img src="media/3.jpg" alt="Cherries" style="width:100%">
      <h3>Cherries, interrupted</h3>
      <p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
      <p>What else?</p>
    </div>
    <div class="w3-quarter">
      <img src="media/4.jpg" alt="Pasta and Wine" style="width:100%">
      <h3>Once Again, Robust Wine and Vegetable Pasta</h3>
      <p>Lorem ipsum text praesent tincidunt ipsum lipsum.</p>
    </div>
  </div>
  
<!-- End Page Content -->
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
