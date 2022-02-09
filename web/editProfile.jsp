<%-- 
    Document   : editProfile
    Created on : Dec 29, 2021, 3:40:38 PM
    Author     : End-User
--%>

<%@page import="java.sql.PreparedStatement"%>
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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                    background-image: url("media/cool.jpg");
                    background-position: center;
                    
                    
                }
                a{
                    text-decoration: none;
                    
                }
            #contact{
                text-align: center;
                background-color: white;
            }
        </style>
    </head>
    <header class="w3-panel w3-center" style="padding:128px 16px 20px 16px">
            <h1 class="w3-xlarge">HALLS BOOKING</h1>
            <h1>System</h1>
  
                <div class="w3-padding-32">
                    <div class="w3-bar w3-border">
                    <a href="MainHomepage.jsp" class="w3-bar-item w3-button">Home</a>
                    <a href="#" class="w3-bar-item w3-button">Halls</a>
                    <a href="#" class="w3-bar-item w3-button">Booking</a>
                    <a href="#" class="w3-bar-item w3-button w3-hide-small">Promo</a>
<!--                   <a href="InventoryView/MainInventory.jsp" class="w3-bar-item w3-button">Inventory</a>-->
                    <a href="#" class="w3-bar-item w3-button  w3-light-grey">About Us</a>
                    <a href="profile.jsp" class="w3-bar-item w3-button">Profile</a>
<!--                    <a href="LogOut" class="w3-bar-item w3-button">Log Out</a>-->
                    </div>
                    
                </div>
        </header>
    <body>
<!--        <div class="container">
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
        </div>-->
        <br>
        <div class="container">
            <div class="container">
                <h1>Update Profile Form</h1>
                <hr>
            </div>
            <div class="container">
                <form action="UpdateProfileServlet" method="POST">
                    <%
    //                    int userID = Integer.parseInt(request.getParameter("id"));
                          String userID = request.getParameter("id");
    //                    out.println("<p> id: " + userID + "</p>");
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");
                            String sql = "select * from user WHERE user_id=?";
                            PreparedStatement ps = conn.prepareStatement(sql);
                            ps.setString(1, userID);
                            ResultSet rs = ps.executeQuery();

                            while(rs.next()){

                            %>
                    <div class="form-row field-Id mb-3 row">
                        <div>
                            <input type="hidden" name="Id" value="<%= rs.getString("user_id")%>"  class="vTextField" required="" id="id">
                        </div>
                      </div>
                    <div class="col-md-6">
                      <label for="inputEmail" class="form-label">Email</label>
                      <input type="email" class="form-control" id="inputEmail" name="email" value="<%= rs.getString("email")%>">
                    </div>
                    <div class="col-md-6">
                      <label for="inputPassword" class="form-label">Password</label>
                      <input type="password" class="form-control" id="inputPassword" name="password" value="<%= rs.getString("password")%>">
                      <p><input type="checkbox" onclick="myFunction()">   Show Password</p>
                    </div>
                    <div class="col-md-6">
                      <label for="inputPhoneNumber" class="form-label">Phone Number</label>
                      <input type="text" class="form-control" id="inputPhoneNumber" name="phoneNumber" value="<%= rs.getString("phoneNumber")%>">

                    </div><br>
                    <fieldset class="row mb-3">
                        <p><i>Current user level: <%= rs.getString("userLevel")%></i></p>
                        <legend class="col-form-label col-sm-2 pt-0">User Level</legend>
                        <div class="col-sm-10">
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="userLevel" id="userLevel1" value="Customer" checked>
                            <label class="form-check-label" for="userLevel1">
                              Customer
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="userLevel" id="userLevel2" value="Staff">
                            <label class="form-check-label" for="userLevel2">
                              Staff
                            </label>
                          </div>

                        </div>

                    </fieldset>
                    <div class="mb-3">
                        <p><i>Current gender: <%= rs.getString("userGender")%></i></p>
                        <legend class="col-form-label col-sm-2 pt-0">Gender</legend>
                        <div class="col-sm-10">
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="userGender" id="gender1" value="Male" checked>
                            <label class="form-check-label" for="gender1">
                              Male
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="userGender" id="gender2" value="Female">
                            <label class="form-check-label" for="gender2">
                              Female
                            </label>
                          </div>

                        </div>
                      </div>
                    <div class="mb-3">
                        <p><i>Current birthday date: <%= rs.getString("birthday")%></i></p>
                        <label for="inputBirthday" class="form-label">Birthday:</label>
                        <input type="date" class="form-control" id="inputBirthday" value="<%= rs.getString("birthday")%>" name="birthday">
                      </div>
                      <div class="mb-3">
                        <label for="inputAge" class="form-label">Age:</label>
                        <input type="text" class="form-control" id="inputAge" value="<%= rs.getString("age")%>" name="age">
                     </div>
                    <div class="col-12">
                      <label for="inputAddress" class="form-label">Address</label>
                      <input type="text" class="form-control" id="inputAddress" value="<%= rs.getString("address")%>" name="address">
                    </div>
                    <div class="col-md-6">
                      <label for="inputCity" class="form-label">City</label>
                      <input type="text" class="form-control" id="inputCity" name="city" value="<%= rs.getString("city")%>">
                    </div><br>
                    <fieldset class="row mb-3">
                        <legend class="col-form-label col-sm-2 pt-0">State</legend><br>
                        <div class="col-sm-10">
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="state1" value="Melaka" checked>
                            <label class="form-check-label" for="state1">
                              Melaka
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="state2" value="Selangor">
                            <label class="form-check-label" for="state2">
                              Selangor
                            </label>
                          </div>

                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="state3" value="Johor">
                            <label class="form-check-label" for="state3">
                              Johor
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="state4" value="Pahang">
                            <label class="form-check-label" for="state4">
                              Pahang
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="state5" value="Negeri Sembilan">
                            <label class="form-check-label" for="state5">
                              Negeri Sembilan
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="state6" value="Wilayah Persekutuan (Labuan)">
                            <label class="form-check-label" for="state6">
                              Wilayah Persekutuan (Labuan)
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="state7" value="Perak">
                            <label class="form-check-label" for="state7">
                              Perak
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="state8" value="Kedah">
                            <label class="form-check-label" for="state8">
                              Kedah
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="state9" value="Perlis">
                            <label class="form-check-label" for="state9">
                              Perlis
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="state10" value="Kelantan">
                            <label class="form-check-label" for="state10">
                              Kelantan
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="state11" value="Sarawak">
                            <label class="form-check-label" for="state11">
                              Sarawak
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="state12" value="Sabah">
                            <label class="form-check-label" for="state12">
                              Sabah
                            </label>
                          </div>

                        </div>
                    </fieldset>
                    <div class="col-md-2">
                      <label for="inputZip" class="form-label">Zip</label>
                      <input type="text" class="form-control" id="inputZip" name="zip" value="<%= rs.getString("zip")%>">
                    </div>
                    <div class="mb-3">
                        <label for="inputDescription" class="form-label">About you</label>
                        <input type="text" class="form-control" id="inputDescription" value="<%= rs.getString("description")%>" name="description">
                    </div>
                    <div class="col-12">
                      <button type="submit" class="btn btn-primary">Update</button>
                    </div>

                    <%
                        }
                            }
                            catch(Exception ex){
                                ex.printStackTrace();
                            }

                        %>
                </form>
                
            </div>
                               
                <hr><hr>
  
        </div>
                
                <script>
        function myFunction() {
            var x = document.getElementById("inputPassword");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
    </script>
        
    </body>
</html>
