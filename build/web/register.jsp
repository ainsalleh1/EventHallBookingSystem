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
        
        <div class="container">
            
            <form class="row g-3" action="RegisterServlet" method="POST">
                <div class="col-md-6">
                  <label for="inputEmail" class="form-label">Email</label>
                  <input type="email" class="form-control" id="inputEmail" name="email">
                </div>
                <div class="col-md-6">
                  <label for="inputPassword" class="form-label">Password</label>
                  <input type="password" class="form-control" id="inputPassword" name="password">
                </div>
                <div class="col-md-6">
                  <label for="inputPhoneNumber" class="form-label">Phone Number</label>
                  <input type="text" class="form-control" id="inputPhoneNumber" name="phoneNumber">
                  
                </div><br>
                <fieldset class="row mb-3">
                    <legend class="col-form-label col-sm-2 pt-0">User Level</legend>
                    <div class="col-sm-10">
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="userLevel" id="gridRadios1" value="Customer" checked>
                        <label class="form-check-label" for="gridRadios1">
                          User
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="userLevel" id="gridRadios2" value="Staff">
                        <label class="form-check-label" for="gridRadios2">
                          Admin
                        </label>
                      </div>
                      
                    </div>
                    
                </fieldset>
                <div class="mb-3">
                    <label for="inputBirthday" class="form-label">Birthday:</label>
                    <input type="date" class="form-control" id="inputBirthday" placeholder="Insert birthday" name="birthday">
                  </div>
                  <div class="mb-3">
                    <label for="inputAge" class="form-label">Age:</label>
                    <input type="text" class="form-control" id="inputAge" placeholder="Insert age" name="age">
                 </div>
                <div class="col-12">
                  <label for="inputAddress" class="form-label">Address</label>
                  <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" name="address">
                </div>
                <div class="col-md-6">
                  <label for="inputCity" class="form-label">City</label>
                  <input type="text" class="form-control" id="inputCity" name="city">
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
                  <input type="text" class="form-control" id="inputZip" name="zip">
                </div>
                <div class="mb-3">
                    <label for="inputDescription" class="form-label">About you</label>
                    <input type="text" class="form-control" id="inputDescription" placeholder="Describe yourself" name="description">
                </div>
                <div class="col-12">
                  <button type="submit" class="btn btn-primary">Register</button>
                </div>
        
            </form>
            
        </div>
        <br>
        
</html>
