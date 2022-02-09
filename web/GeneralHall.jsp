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
    </head>
    <style>
            h1{
               text-align: center;
               font-family: 'Playfair Display';
               font-size: 42px;
            }
    </style>
    <body>
        <div class="container">
            <div class="container">
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
            </div>
            
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
