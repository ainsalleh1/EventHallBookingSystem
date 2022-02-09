<%-- 
    Document   : GeneralPromo
    Created on : Dec 29, 2021, 10:21:08 PM
    Author     : End-User
--%>

<%@page import="Model.Promo"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
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
                      <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="MainHall">Halls</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="MainPromo">Promo</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="GeneralAboutUs.html">About Us</a>
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
                    <%
                    DecimalFormat df = new DecimalFormat("0.00");

                    List<Promo> p = (List<Promo>)request.getAttribute("pl");
                    for(int i=0;i<p.size();i++){
                
            %>
                  <div class="card h-100 text-center">
                    <!--<img src="..." class="card-img-top" alt="...">-->
                    <div class="card-body">
                      <h5 class="card-title"><%= p.get(i).getPromo_name()  %></h5>
                      <p class="card-text">
                      <ul>
                          <li><%= p.get(i).getDescription() %> </li>
                          <li>Discount: <%= df.format(p.get(i).getDiscount()) %> %</li>
                      </ul>
                      </p>
                      <!--<a href="#" class="btn btn-primary">More details</a>-->
                    </div>
                  </div>
                  <%
                    }
                %>
                </div>
                
            </div>
            <br><br>
        </div>
    </body>
</html>
