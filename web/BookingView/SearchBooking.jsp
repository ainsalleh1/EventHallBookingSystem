<%-- 
    Document   : SearchBooking
    Created on : Feb 4, 2022, 9:09:47 AM
    Author     : End-User
--%>

<%@page import="Model.Booking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Booking</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
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
        </style>
    </head>
    <body>
        <div class="container">
            <div class="container">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                      <a class="nav-link" href="../MainHomepage.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../MainHall">Halls</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="../MainBooking.jsp">Booking</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../MainPromo">Promo</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../AboutUs.html">About Us</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../profile.jsp">Profile</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="../LogOut">Log Out</a>
                    </li>
                </ul>
            </div>
            
            <br><br>
            
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="MainBooking.jsp">Booking</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                  <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                        <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="#">My Booking</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" aria-current="page">Past Booking</a>
                        </li> 
                    </ul>
                    <span class="navbar-text">Booking :</span>
                    <form class="d-flex">                
                       <input class="form-control me-2" type="search" placeholder="Booking id" aria-label="Search">
                      <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
                </div>
            </nav>
                      
            <br><br>
            
            <div class="container">
                <p><i>Search result of </i><mark><%= request.getAttribute("searchkey") %></mark><i> keyword.</i></p>
                <% if (request.getAttribute("message") != null ){ %>
                    <p><i><%= request.getAttribute("message") %></p>
                
            </div>
                 <%
                    } else{
                %>
            
            <jsp:useBean id="b" class="Model.Booking" scope="request"></jsp:useBean>
            
            <div class="container border border-dark">
                <h2 style="text-align: center">Booking Details</h2>

                <table width="100%" style="text-align:center">
                    <tr>
                        <th style="width: 30%;">Booking ID</th>
                        <td style="width: 70%;background-color: lightblue"><jsp:getProperty name="b" property="booking_id"/></td>
                    </tr>
                    <tr>
                        <th style="width: 30%">Booking Date</th>
                        <td style="width: 70%;background-color: lightblue"><jsp:getProperty name="b" property="dateBooked"/></td>
                    </tr>
                    <tr>
                        <th style="width: 30%">Status</th>
                        <td style="width: 70%;background-color: lightblue"><jsp:getProperty name="b" property="status"/></td>
                    </tr>
                    <tr>
                        <th style="width: 30%">Total Price</th>
                        <td style="width: 70%;background-color: lightblue">RM <jsp:getProperty name="b" property="totalPrice"/></td>
                    </tr>
                    <tr>
                        <th style="width: 30%">Payment Slip</th>
                        <td style="width: 70%;background-color: lightblue"><jsp:getProperty name="b" property="file"/></td>
                    </tr>
                    
                </table>
                <br>
            
            </div>
                        <%
                            }
                            %>
                    
                    <!--using EL-->
<!--             <div class="container border border-dark">
                <h2 style="text-align: center">Booking Details</h2>

                <table width="100%" style="text-align:center">
                    <tr>
                        <th style="width: 30%;">Booking ID</th>
                        <td style="width: 70%;background-color: lightblue"> ${requestScope.b.booking_id}</td>
                    </tr>
                    <tr>
                        <th style="width: 30%">Booking Date</th>
                        <td style="width: 70%;background-color: lightblue">${requestScope.b.dateBooked}</td>
                    </tr>
                    <tr>
                        <th style="width: 30%">Status</th>
                        <td style="width: 70%;background-color: lightblue">${requestScope.b.status}</td>
                    </tr>
                    <tr>
                        <th style="width: 30%">Total Price</th>
                        <td style="width: 70%;background-color: lightblue">${requestScope.b.totalPrice}</td>
                    </tr>
                    <tr>
                        <th style="width: 30%">Payment Slip</th>
                        <td style="width: 70%;background-color: lightblue">${requestScope.b.file}</td>
                    </tr>
                    
                </table>
                <br>
            
            </div>-->
        </div>
    </body>
</html>
