<%-- 
    Document   : SearchHall
    Created on : Jan 24, 2022, 12:28:47 AM
    Author     : End-User
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page import="java.util.List"%>
<%@page import="Model.Hall"%>
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
        <title>HallDetails</title>
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
                    background-image: url("../media/cool.jpg");
                    background-position: center;
                    
                    
                }
                a{
                    text-decoration: none;
                    
                }

            #hall{
                border: 4px solid black;
            }
            .center {
                margin-left: auto;
                margin-right: auto;

            }
            table {
                border-collapse: separate;
                border-spacing: 0 1em;
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
                    <a href="MainBooking.jsp" class="w3-bar-item w3-button w3-light-grey">Booking</a>
                    <a href="MainPromo" class="w3-bar-item w3-button w3-hide-small">Promo</a>
<!--                    <a href="InventoryView/MainInventory.jsp" class="w3-bar-item w3-button">Inventory</a>-->
                    <a href="AboutUs.html" class="w3-bar-item w3-button">About Us</a>
                    <a href="profile.jsp" class="w3-bar-item w3-button">Profile</a>
                    <a href="LogOut" class="w3-bar-item w3-button">Log Out</a>
                    </div>
                    
                </div>
        </header> 
    <body>
        <div class="container">

<!--            <div class="container">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="MainHomepage.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="MainHall">Halls</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="MainBooking.jsp">Booking</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="MainPromo">Promo</a>
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

            <br>

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="MainHall.jsp">Halls Management</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarScroll">
                        <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Hall List</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="InsertHall.html">Add Hall</a>
                            </li>

                        </ul>
                        <span class="navbar-text">Hall :</span>
                        <form class="d-flex" action="GetHall" method="get">                
                            <input class="form-control me-2" type="search" placeholder="hall name" aria-label="Search" name="HallName">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </div>
            </nav>

            <br><br>

            <div class="container">
                <p><i>Search result of </i><mark><%= request.getAttribute("searchkey")%></mark><i> keyword.</i></p>
            </div>

            <%
                if (request.getAttribute("message") != null) {
            %>
            <div class="container">
                <%= request.getAttribute("message")%>      
            </div>
            <%
            } else {
            %>
            <%
//                    List<Hall> hu = (List<Hall>)request.getAttribute("hu");
//                    for(int i=0;i<hu.size();i++){

            %>
            <c:forEach items="${hu}" var="hu" step="1">
                <div class="card w-100">    
                    <div class="card-body">               
                        <div class="row">
                            <div class="col">
                                <h5 class="card-title" style="text-align: center"><c:out value="${hu.name}"/> </h5>
                                <img src="media/hall1.jpg" class="card-img-bottom" alt="hall">
                            </div>
                            <div class="col-6">
                                <p class="card-text"><c:out value="${hu.description}"/></p>
                            </div>
                            <div class="col">
                                <a href="HallView/HallDetails.jsp?hallID=<c:out value="${hu.hall_id}"/>" class="btn btn-primary">Detail</a>
                            </div>

                        </div>          
                    </div>                
                </div>

                <br>
            </c:forEach>
            <%                }
            %>

            <br><br>

        </div>
    </body>
</html>

