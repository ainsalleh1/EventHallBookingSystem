<%-- 
    Document   : register
    Created on : Dec 25, 2021, 10:18:38 AM
    Author     : End-User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <title>Register</title>
    </head>
    <body>
        <div class="container">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="index.html">Home</a>
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
            </ul>
        </div>
        <br>       
        
        <div class="container">
            <hr>
            <h1>Registration</h1>
            <hr>
        </div>
        <br>
        <%
//            String msg = (String)request.getAttribute("msg");
            if(request.getAttribute("msg") != null){
            %>
            <div class="container">
                <p><%=request.getAttribute("msg")%> </p>
            </div>
            
            <%
                }
                %>
            <!--<p><%=request.getAttribute("msg")%> </p>-->
        
        <div class="container">
            
            <form class="row g-3" action="RegisterServlet" method="POST">
                <div class="col-md-6">
                  <label for="inputEmail" class="form-label">Email</label>
                  <input type="email" class="form-control" id="inputEmail" name="email" required>
                </div>
                <div class="col-md-6">
                  <label for="inputPassword" class="form-label">Password</label>
                  <input type="password" class="form-control" id="inputPassword" name="password" required>
                </div>
                <div class="col-md-6">
                  <label for="inputPhoneNumber" class="form-label">Phone Number</label>
                  <input type="text" class="form-control" id="inputPhoneNumber" name="phoneNumber" required>
                  <br>
                </div><br>
                <fieldset class="row mb-3">
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
                    <label for="inputBirthday" class="form-label">Birthday:</label>
                    <input type="date" class="form-control" id="inputBirthday" placeholder="Insert birthday" name="birthday" required>
                  </div>
                  <div class="mb-3">
                    <label for="inputAge" class="form-label">Age:</label>
                    <input type="text" class="form-control" id="inputAge" placeholder="Insert age" name="age" required>
                 </div>
                <div class="col-12">
                  <label for="inputAddress" class="form-label">Address</label>
                  <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" name="address" required>
                </div>
                <div class="col-md-6">
                  <label for="inputCity" class="form-label">City</label>
                  <input type="text" class="form-control" id="inputCity" name="city" required>
                  <br>
                </div>
                
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
                  <input type="text" class="form-control" id="inputZip" name="zip" required>
                </div>
                <div class="mb-3">
                    <label for="inputDescription" class="form-label">About you</label>
                    <input type="text" class="form-control" id="inputDescription" placeholder="Describe yourself" name="description" required>
                </div>
                <div class="col-12">
                  <button type="submit" class="btn btn-primary">Register</button>
                </div>
        
            </form>
            
        </div>
        <br>
        
</html>
