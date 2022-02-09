<%@page import="java.util.List"%>
<%@page import="Model.Hall"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link href='https://fonts.googleapis.com/css?family=Playfair Display' rel='stylesheet'>
        <title>Halls</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
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
                    background-image: url("media/cool.jpg");
                    background-position: center;
                    
                    
                }
                a{
                    text-decoration: none;
                    
                }
    </style>
    <header class="w3-panel w3-center" style="padding:128px 16px 20px 16px">
            <h1 class="w3-xlarge">HALLS BOOKING</h1>
            <h1>System</h1>
  
                <div class="w3-padding-32">
                    <div class="w3-bar w3-border">
                    <a href="index.jsp" class="w3-bar-item w3-button">Home</a>
                    <a href="MainHall" class="w3-bar-item w3-button">Halls</a>
                    <a href="MainPromo" class="w3-bar-item w3-button w3-hide-small">Promo</a>
                    <a href="GeneralAboutUs.html" class="w3-bar-item w3-button  w3-light-grey">About Us</a>
                    <a href="login.jsp" class="w3-bar-item w3-button">Log In</a>
                    </div>
                    
                </div>
        </header>
    <body>
        <div class="container">
<!--            <div class="container">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                      <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="MainHall">Halls</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="MainPromo">Promo</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="GeneralAboutUs.html">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                </ul>
            </div>-->
            
            <div class="container">
                <br>
                <h1><b>Book With Us!</b></h1>
                <br><br>
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <%
                        List<Hall> hl = (List<Hall>)request.getAttribute("hl");
                        for(int i=0;i<hl.size();i++){
                            
                    %>
                    
                        <div class="col">
                          <div class="card h-100">
                            <img src="media/hall1.jpg" class="card-img-top" alt="hall">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align:center;text-transform: capitalize;"><%= hl.get(i).getName()%></h5>
                              <p class="card-text">
                              <ul>
                                  <li><%= hl.get(i).getLocation()%></li>
                                  <li>RM <%= hl.get(i).getCharge() %></li>
                                  <li>Capacity: <%= hl.get(i).getCapacity() %></li>
                              </ul>
                              </p>
                            </div>
                          </div>
                        </div>
                        
                     
                    <%
                }
                %>
                 </div>
                </div>
                
 <!--               <div class="container">
                    <div class="row">
                      <div class="col">
                        <div class="card h-100">
                            <img src="media/hall1.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            </div>
                        </div>
                      </div>
                      <div class="col-6">
                        <div class="col">
                            <div class="card h-100">
                                <img src="media/hall1.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                            </div>
                        </div>
                      </div>
                      <div class="col">
                        <div class="col">
                            <div class="card h-100">
                                <img src="media/hall1.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                            </div>
                          </div>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                      <div class="col">
                        <div class="col">
                            <div class="card h-100">
                                <img src="media/hall1.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                            </div>
                        </div>
                      </div>
                      <div class="col-5">
                        <div class="col">
                            <div class="card h-100">
                                <img src="media/hall1.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                            </div>
                        </div>
                      </div>
                      <div class="col">
                        <div class="col">
                            <div class="card h-100">
                                <img src="media/hall1.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                            </div>
                        </div>
                      </div>
                    </div>
                    <br>
                </div>-->
            
        </div>
    </body>
</html>
