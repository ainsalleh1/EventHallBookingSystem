<%-- 
    Document   : DeleteHall
    Created on : Jan 14, 2022, 1:03:58 AM
    Author     : End-User
--%>

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
                              
                body {
                background-image: url("../media/background.png");
                height: 100%;

                /* Center and scale the image nicely */
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                background-attachment: fixed;
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
    <body>
        <div class="container">
            
            <div class="container">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                      <a class="nav-link" href="MainHomepage.jsp">Home</a>
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
            </div>
                  
            <br><br>
            
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="MainHall">Halls Management</a>
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
                    <form class="d-flex">                
                       <input class="form-control me-2" type="search" placeholder="hall name" aria-label="Search">
                      <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
                </div>
            </nav>
            
            <br><br>
            
            <%
                
                int hallID = Integer.parseInt(request.getParameter("hallID"));
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
                    String sql = "select * from hall where hall_id=?";
                    
                    PreparedStatement ps = conn.prepareStatement(sql);
                    
                    ps.setInt(1, hallID);
                    ResultSet rs = ps.executeQuery();
                    
                    while(rs.next()){             
                
            %>
            
            <div class="container border border-dark">
                <h2 style="text-align: center">Delete Hall Confirmation</h2>
                
                <form method="POST" ACTION="../DeleteHall">                
                    
                    <table width="100%" style="text-align:center">
                        <tr>
                            <th style="width: 30%;">Hall ID</th>
                            <td style="width: 70%;background-color: lightblue">
                                
                                <input type="text" class="form-control" id="inputHallID" name="id" value="<%= rs.getInt("hall_id") %>" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th style="width: 30%;">Hall Name</th>
                            <td style="width: 70%;background-color: lightblue">
                                
                                <input type="text" class="form-control" id="inputHallName" name="HallName" value="<%= rs.getString("name") %>" disabled>
                            </td>
                        </tr>
                        <tr>
                            <th style="width: 30%">Location</th>
                            <td style="width: 70%;background-color: lightblue">
                                
                                <input type="text" class="form-control" aria-label="Address" name="Location" value="<%= rs.getString("location") %>" disabled>         
                            </td>
                        </tr>
                        <tr>
                            <th style="width: 30%">Charge</th>
                            <td style="width: 70%;background-color: lightblue">
                                
                                <input type="number" class="form-control" id="inputCharge" name="HallCharge" step="0.02" value="<%= rs.getString("charge") %>" disabled>

                            </td>
                        </tr>
                        <tr>
                            <th style="width: 30%">Capacity</th>
                            <td style="width: 70%;background-color: lightblue">
                                
                                <input type="text" class="form-control" id="inputCapacity" name="Capacity" value="<%= rs.getString("capacity") %>" disabled>

                            </td>
                        </tr>
                        <tr>
                            <th style="width: 30%">Description</th>
                            <td style="width: 70%;background-color: lightblue">
                               
                                <input type="text" class="form-control" id="inputDescription" name="Description" value="<%= rs.getString("description") %>" disabled>

                            </td>
                        </tr>
                        <tr>
                            <th>Media</th>
                            <td>
                                <input class="form-control" type="file" id="formFile" name="HallMedia" value="<%= rs.getString("media") %>" disabled>

                            </td>
                        </tr>
                        
                    </table>
                    <input class="form-control" id="inputHallID" name="hallId" value="<%= rs.getInt("hall_id") %>" hidden>
                    <p style="text-align:center">
                        <button type="submit" class="btn btn-success">Confirm</button>
                    <p>
                    
                </form>            
                
                <br>
            </div>
            
            <br><br>
            <%
                    }
                    conn.close();
                }
                catch(Exception ex){}
                %>
            
        </div>
    </body>
</html>
