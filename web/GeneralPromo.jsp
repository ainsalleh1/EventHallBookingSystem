<%-- 
    Document   : GeneralPromo
    Created on : Dec 29, 2021, 10:21:08 PM
    Author     : End-User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <title>JSP Page</title>
        <style>
            .centered {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                text-transform: capitalize;
                font-size: 300%;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="container">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                      <a class="nav-link" aria-current="page" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="GeneralHall.jsp">Halls</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="GeneralPromo.jsp">Promo</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="AboutUs.html">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                </ul>
            </div>
        </div>
        
        <div class="container">
            <br>
            <div class="card bg-dark text-white">
                <img src="media/hall1.jpg" class="card-img" alt="..." height="500">
                <div class="card-img-overlay">
                  <h5 class="card-title centered">What We Offer</h5>
                </div>
            </div>
            <br>
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <div class="col">
                  <div class="card h-100 text-center">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      <a href="#" class="btn btn-primary">More details</a>
                    </div>
                  </div>
                </div>
                <div class="col">
                  <div class="card h-100 text-center">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">This is a short card.</p>
                      <a href="#" class="btn btn-primary">More details</a>
                    </div>
                  </div>
                </div>
                <div class="col">
                  <div class="card h-100 text-center">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
                      <a href="#" class="btn btn-primary">More details</a>
                    </div>
                  </div>
                </div>
                <div class="col">
                  <div class="card h-100 text-center">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      <a href="#" class="btn btn-primary">More details</a>
                    </div>
                  </div>
                </div>
            </div>
            <br><br>
        </div>
    </body>
</html>
