<%-- 
    Document   : UpdatePromo
    Created on : Jan 14, 2022, 11:29:35 AM
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
                background-image: url("./media/background.png");
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
                      <a class="nav-link" aria-current="page" href="MainHomepage.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="MainHall.jsp">Halls</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="MainBooking.jsp">Booking</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="MainPromo.jsp">Promo</a>
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
                    <a class="navbar-brand" href="./MainPromo.jsp">Promotion Management</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                  <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                        <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="#">Promo List</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="InsertPromo.html">Add Promo</a>
                        </li>
                        
                    </ul>
                    <span class="navbar-text">Promo :</span>
                    <form class="d-flex">                
                       <input class="form-control me-2" type="search" placeholder="promo name" aria-label="Search">
                      <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
                </div>
            </nav>
            
            <br><br>
            
            <%
                
                 String promoID = request.getParameter("promoID");
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
                    String sql = "select * from promotion where id=?";
                    
                    PreparedStatement ps = conn.prepareStatement(sql);
                    
                    ps.setString(1, promoID);
                    ResultSet rs = ps.executeQuery();
                    
                    while(rs.next()){             
                
            %>
            
            <div class="container border border-dark">
                <br>
                <h2 style="text-align: center">Update Promotion Details</h2>
                
                <form method="POST" ACTION="../UpdatePromo" id="usrform">                
                    
                    <table width="100%" style="text-align:center">
                        <tr>
                            <th style="width: 30%;">Promotion ID</th>
                            <td style="width: 70%;background-color: lightblue">
                                
                                <input type="text" class="form-control" id="inputPromoID" name="id" value="<%= rs.getString("id") %>" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th style="width: 30%;">Name</th>
                            <td style="width: 70%;background-color: lightblue">                     
                                <input type="text" class="form-control" id="inputPromoName" name="name" value="<%= rs.getString("name") %>" required>
                            </td>
                        </tr>
                        <tr>
                            <th style="width: 30%">Discount</th>
                            <td style="width: 70%;background-color: lightblue">
                                <input type="number" class="form-control" id="inputDiscount" name="discount" step="0.01" value="<%= rs.getDouble("discount") %>" required>
                            </td>
                        </tr>
                        <tr>
                            <th style="width: 30%">Start Date</th>
                            <td style="width: 70%;background-color: lightblue">
                                <input type="date" class="form-control" id="inputStartDate" name="StartDate" value="<%= rs.getString("startDate") %>" required>
                            </td>
                        </tr>
                        <tr>
                            <th style="width: 30%">End Date</th>
                            <td style="width: 70%;background-color: lightblue">
                                
                                <input type="date" class="form-control" id="inputEndDate" name="EndDate" value="<%= rs.getString("startDate") %>" required>                                

                            </td>
                        </tr>
                        <tr>
                            <th style="width: 30%">
                                <label for="inputDescription" class="form-label">Description : </label>
                            </th>
                            <td style="width: 70%;background-color: lightblue">                             
                                <textarea class="form-control" id="inputDescription" rows="4" cols="50" name="description" form="usrform" required><%= rs.getString("description") %></textarea>

                            </td>
                        </tr>
                        <tr>
                            <th>Status</th>
                            <td>
                                <div class="col-sm-10" style="text-align:left">
                                    <div class="form-check">
                                      <input class="form-check-input" type="radio" name="status" id="gridRadios1" value="Valid" checked>
                                      <label class="form-check-label" for="gridRadios1">
                                        Valid
                                      </label>
                                    </div>
                                    <div class="form-check">
                                      <input class="form-check-input" type="radio" name="status" id="gridRadios2" value="Invalid">
                                      <label class="form-check-label" for="gridRadios2">
                                        Invalid
                                      </label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        
                    </table>
                    <p style="text-align:center">
                        <button type="submit" class="btn btn-success">Save</button>
                    <p>
                    
                </form>            
                
                <br>
            </div>
            
            <br><br>
            <%
                    }
                }
                catch(Exception ex){}
                %>
            
        </div>
    </body>
</html>

