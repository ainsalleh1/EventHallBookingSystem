<%-- 
    Document   : profile
    Created on : Dec 25, 2021, 10:07:55 AM
    Author     : End-User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <title>Profile</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
            .mySlides {display:none;}
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
    </head>
    <header class="w3-panel w3-center" style="padding:128px 16px 20px 16px">
            <h1 class="w3-xlarge">HALLS BOOKING</h1>
            <h1>System</h1>
  
                <div class="w3-padding-32">
                    <div class="w3-bar w3-border">
                    <a href="MainHomepage.jsp" class="w3-bar-item w3-button">Home</a>
                    <a href="MainHall" class="w3-bar-item w3-button">Hall List</a>
                    <a href="MainBooking.jsp" class="w3-bar-item w3-button">Booking</a>
                    <a href="MainPromo" class="w3-bar-item w3-button w3-hide-small">Promo</a>
                    <a href="InventoryView/MainInventory.jsp" class="w3-bar-item w3-button">Inventory</a>
                    <a href="AboutUs.html" class="w3-bar-item w3-button">About Us</a>
                    <a href="profile.jsp" class="w3-bar-item w3-button w3-light-grey">Profile</a>
                    <a href="LogOut" class="w3-bar-item w3-button">Log Out</a>
                    </div>
                    
                </div>
        </header>
    <body>
        <div class="container">
<!--            <ul class="nav nav-tabs">
                <li class="nav-item">
                  <a class="nav-link" href="MainHomepage.jsp">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="MainHall">Halls</a>
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
                  <a class="nav-link active" aria-current="page" href="profile.jsp">Profile</a>
                </li>
            </ul>-->
        </div>
        <br><br>
        <section class="section about-section gray-bg" id="about">
            <div class="container">
                <div class="row align-items-center flex-row-reverse">
                    <div class="col-lg-6">
                        <div class="about-text go-to">
                            <h3 class="dark-color">About Me</h3>
                            <%
                                try{
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
                                    String sql = "select * from user";
                                    Statement stmt = conn.createStatement();
                                    ResultSet rs = stmt.executeQuery("select * from user");
                                    while(rs.next()){
                                        if(rs.getString("email").equals(session.getAttribute("sessionEmail"))){
                                                                                                          
                                
                                %>
                            <h6 class="theme-color lead"><%= rs.getString("description")%></h6>
                            <div class="row about-list">
                                <div class="col-md-6">
                                    <div class="media">
                                        <label>Birthday</label>
                                        <p><%= rs.getString("birthday")%></p>
                                    </div>
                                    <div class="media">
                                        <label>Age</label>
                                        <p><%= rs.getString("age")%></p>
                                    </div>
                                    <div class="media">
                                        <label>Gender</label>
                                        <p><%= rs.getString("userGender")%></p>
                                    </div>
                                    <div class="media">
                                        <label>Address</label>
                                        <p><%= rs.getString("address")%>, <%= rs.getString("city")%>, <%= rs.getString("zip")%>, <%= rs.getString("state")%></p>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="media">
                                        <label>E-mail</label>
                                        <p><%= rs.getString("email")%></p>
                                    </div>
                                    <div class="media">
                                        <label>Phone Number</label>
                                        <p><%= rs.getString("phoneNumber")%></p>
                                    </div>
                                    <div class="media">
                                        <label>User Level</label>
                                        <p><%= rs.getString("userLevel")%></p>
                                    </div>
                                    
          
                                </div>
                            </div>
                            <div class="container" style="text-align: center">
                                <a class="btn btn-primary" href="editProfile.jsp?id=<%= rs.getString("user_id")%>" role="button">Edit</a>
                            </div>
                        </div>
                    </div>
                    <% if(rs.getString("userGender").equals("Male")){ %>
                    <div class="col-lg-6">
                        <div class="about-avatar">
                            <img src="https://bootdey.com/img/Content/avatar/avatar7.png" title="" alt="">
                        </div>
                    </div>
                    <% } else{ %>
                    <div class="col-lg-6">
                        <div class="about-avatar">
                            <img src="https://bootdey.com/img/Content/avatar/avatar3.png" title="" alt="">
                        </div>
                    </div>
                    <% } %>
                    
                    
                </div>
                            
                <%
                                        }
                            }
                        }
                        catch(Exception ex){
                            ex.printStackTrace();
                        }
                    
                    %>
                    
                    
                
            </div>
        </section>
    </body>
</html>
