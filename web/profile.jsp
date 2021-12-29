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
    </head>
    <body>
        <div class="container">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                  <a class="nav-link" href="MainHomepage.jsp">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Halls</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Booking</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Promo</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">About Us</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="profile.jsp">Profile</a>
                </li>
            </ul>
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
                                <a class="btn btn-primary" href="editProfile.jsp?id=<%= rs.getString("id")%>" role="button">Edit</a>
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
