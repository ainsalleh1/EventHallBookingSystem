<%-- 
    Document   : InsertHall
    Created on : Jan 1, 2022, 8:18:36 PM
    Author     : End-User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Hall</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
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
                    <a class="navbar-brand" href="MainPromo.jsp">Promo Management</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                  <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                        <li class="nav-item">
                          <a class="nav-link" aria-current="page" href="MainPromo.jsp">Promo List</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link active" href="InsertPromo.jsp">Add Promo</a>
                        </li>
                        
                    </ul>                    
                  </div>
                </div>
            </nav>
            <br>
            <hr>
            <h2>Register new promo</h2>
            <hr>
            <br>
            
            <form method="POST" class="container text-left" >
            <form class="row g-3">

              <div class="col-md-6">
                <label for="inputPromoName" class="form-label">Package Name : </label>
                <input class="form-control" id="inputPromoName" name="PackageName" rows="10" cols="10" placeholder="Enter hall name" required></textarea>
              </div>
              <br/><br/>
                         
              
              <div class="col-md-6">
                <label for="inputPrice" class="form-label">Price (RM) : </label>
                <input type="number" class="form-control" id="inputPrice" name="Charge" rows="10" cols="10" step="0.2" placeholder="Enter price" required></textarea>
              </div>
              <br/><br/>
              
              
              <div class="col-md-6">
                <label for="inputDescription" class="form-label">Description : </label>
                <input class="form-control" id="inputDescription" name="Description" rows="10" cols="10" placeholder="Enter description" required></textarea>
              </div>
              <br/><br/>
              
              <div class="col-12">
                <button type="submit" class="btn btn-success">Create</button>
              </div>
            </form>
                
                <br><br>
        </div>
    </body>
</html>
