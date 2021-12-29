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
                            String sql = "select * from user WHERE id=?";
                            PreparedStatement ps = conn.prepareStatement(sql);
                            ps.setString(1, userID);
                            ResultSet rs = ps.executeQuery();

                            while(rs.next()){

                            %>
                    <div class="form-row field-Id mb-3 row">
                        <div>
                            <input type="hidden" name="Id" value="<%= rs.getString("id")%>"  class="vTextField" required="" id="id">
                        </div>
                      </div>
                    <div class="col-md-6">
                      <label for="inputEmail" class="form-label">Email</label>
                      <input type="email" class="form-control" id="inputEmail" name="email" value="<%= rs.getString("email")%>">
                    </div>
                    <div class="col-md-6">
                      <label for="inputPassword" class="form-label">Password</label>
                      <input type="password" class="form-control" id="inputPassword" name="password" value="<%= rs.getString("password")%>">
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
                            <input class="form-check-input" type="radio" name="userLevel" id="gridRadios1" value="Customer" checked>
                            <label class="form-check-label" for="gridRadios1">
                              Customer
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="userLevel" id="gridRadios2" value="Staff">
                            <label class="form-check-label" for="gridRadios2">
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
                            <input class="form-check-input" type="radio" name="userGender" id="gridRadios1" value="Male" checked>
                            <label class="form-check-label" for="gridRadios1">
                              Male
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="userGender" id="gridRadios2" value="Female">
                            <label class="form-check-label" for="gridRadios2">
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
                            <input class="form-check-input" type="radio" name="state" id="gridRadios1" value="Melaka" checked>
                            <label class="form-check-label" for="gridRadios1">
                              Melaka
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="gridRadios2" value="Selangor">
                            <label class="form-check-label" for="gridRadios2">
                              Selangor
                            </label>
                          </div>

                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="gridRadios3" value="Johor">
                            <label class="form-check-label" for="gridRadios3">
                              Johor
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="gridRadios4" value="Pahang">
                            <label class="form-check-label" for="gridRadios4">
                              Pahang
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="gridRadios5" value="Negeri Sembilan">
                            <label class="form-check-label" for="gridRadios5">
                              Negeri Sembilan
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="gridRadios6" value="Wilayah Persekutuan (Labuan)">
                            <label class="form-check-label" for="gridRadios6">
                              Wilayah Persekutuan (Labuan)
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="gridRadios7" value="Perak">
                            <label class="form-check-label" for="gridRadios7">
                              Perak
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="gridRadios8" value="Kedah">
                            <label class="form-check-label" for="gridRadios8">
                              Kedah
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="gridRadios9" value="Perlis">
                            <label class="form-check-label" for="gridRadios9">
                              Perlis
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="gridRadios10" value="Kelantan">
                            <label class="form-check-label" for="gridRadios10">
                              Kelantan
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="gridRadios11" value="Sarawak">
                            <label class="form-check-label" for="gridRadios11">
                              Sarawak
                            </label>
                          </div>
                          <div class="form-check">
                            <input class="form-check-input" type="radio" name="state" id="gridRadios12" value="Sabah">
                            <label class="form-check-label" for="gridRadios12">
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
        
    </body>
</html>