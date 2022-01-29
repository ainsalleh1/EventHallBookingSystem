<%-- 
    Document   : MainHall
    Created on : Dec 29, 2021, 9:48:12 PM
    Author     : End-User
--%>

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
    </head>
    <body>
        <div class="container">
            
            <div class="container">
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
           
        
            <br><br>
        
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="MainHall.jsp">Halls Management</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                  <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                        <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="MainHall.jsp">Hall List</a>
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
            </nav>
            
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
            
            <div class="card w-100">    
                <div class="card-body">               
                    <div class="row">
                       <div class="col">
                            <h5 class="card-title" style="text-align: center"><%= hl.get(i).getName()%></h5>
                            <img src="media/hall1.jpg" class="card-img-bottom" alt="hall">
                        </div>
                        <div class="col-6">
                            <p class="card-text"><%= hl.get(i).getDescription() %></p>
                        </div>
                        <div class="col">
                            <a href="HallView/HallDetails.jsp?hallID=<%= hl.get(i).getHall_id()%>" class="btn btn-primary">Detail</a>
                        </div>

                    </div>          
                </div>                
            </div>
            
            <br><br>
            <%
                }
                %>
        </div>
    </body>
</html>