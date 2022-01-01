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
                          <a class="nav-link" aria-current="page" href="MainHall.jsp">Hall List</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link active" href="InsertHall.jsp">Add Hall</a>
                        </li>
                        
                    </ul>                    
                  </div>
                </div>
            </nav>
            <br>
            <hr>
            <h2>Register new hall</h2>
            <hr>
            <br>
            
            <form method="POST" class="container text-left" >
            <form class="row g-3">

              <div class="col-md-6">
                <label for="inputHallName" class="form-label">Hall Name : </label>
                <input class="form-control" id="inputHallName" name="HallName" rows="10" cols="10" placeholder="Enter hall name" required></textarea>
              </div>
              <br/><br/>
              <div class="row g-3">
                  <label class="form-label">Location : </label>
                <div class="col-sm-7">
                  <input type="text" class="form-control" placeholder="Address" aria-label="Address" name="HallAddress" required>
                </div>
                <div class="col-sm">
                  <input type="text" class="form-control" placeholder="City" aria-label="City" name="HallCity" required>
                </div>
                <div class="col-sm">
                  <input type="text" class="form-control" placeholder="Zip" aria-label="Zip" name="HallZip" required>
                </div>
              </div>
              <br><br>              
              <div class="col-md-6">
                <label for="inputStateLocation" class="form-label">State : </label>
                <select id="inputLocation" name="HallState" required>
                  <option value="Johor" selected>Johor</option>
                  <option value="Kedah">Kedah</option>
                  <option value="Kelantan">Kelantan</option>
                  <option value="Melaka">Melaka</option>
                  <option value="Negeri Sembilan">Negeri Sembilan</option>
                  <option value="Pahang">Pahang</option>
                  <option value="Pulau Pinang">Pulau Pinang</option>
                  <option value="Perak">Perak</option>
                  <option value="Perlis">Perlis</option>
                  <option value="Sabah">Sabah</option>
                  <option value="Sarawak">Sarawak</option>
                  <option value="Selangor">Selangor</option>
                  <option value="Terengganu">Terengganu</option>
                  <option value="W.P. Kuala Lumpur">W.P. Kuala Lumpur</option>
                </select>
              </div>
              <br/><br/>
              <div class="col-md-6">
                <label for="inputCharge" class="form-label">Charge (RM) : </label>
                <input type="number" class="form-control" id="inputCharge" name="Charge" rows="10" cols="10" step="0.2" placeholder="Enter Charge" required></textarea>
              </div>
              <br/><br/>
              
              <div class="col-md-6">
                <label for="inputCapacity" class="form-label">Capacity : </label>
                <input class="form-control" id="inputCapacity" name="Capacity" rows="10" cols="10" placeholder="Enter Capacity" required></textarea>
              </div>
              <br/><br/>
              <div class="col-md-6">
                <label for="inputDescription" class="form-label">Description : </label>
                <input class="form-control" id="inputDescription" name="Description" rows="10" cols="10" placeholder="Enter description" required></textarea>
              </div>
              <br/><br/>
              <div class="mb-3">
                <label for="formFile" class="form-label">Media</label>
                <input class="form-control" type="file" id="formFile" name="HallMedia" required>
              </div>
              <br><br>
              <div class="col-12">
                <button type="submit" class="btn btn-success">Create</button>
              </div>
            </form>
                
                <br><br>
        </div>
    </body>
</html>