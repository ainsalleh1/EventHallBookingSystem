<%-- 
    Document   : BookingPayment
    Created on : Jan 21, 2022, 11:55:16 AM
    Author     : End-User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Payment</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
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
            
            #book{
                text-align: center; 
                height: 100%;
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
                      <a class="nav-link" href="MainHall">Halls</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="../MainBooking.jsp">Booking</a>
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
                      <a class="nav-link" href="../LogOut">Log Out</a>
                    </li>
                </ul>
            </div>
            <br><br>

            <h3>
                You're one step away from confirming your booking with us!<br>
                <small class="text-muted">Please do the payment and insert the payment slip below</small>
            </h3>
            <br><br>
            <dl class="row">
                
                <dt class="col-sm-3">Account</dt>
                <dd class="col-sm-9">Maybank</dd>
                
                <dt class="col-sm-3">Account Number</dt>
                <dd class="col-sm-9">111122223333</dd>
                
                <dt class="col-sm-3">Account Name</dt>
                <dd class="col-sm-9">PPG EVENTS ORGANIZER</dd>
                
                <dt class="col-sm-3">Reference</dt>
                <dd class="col-sm-9">...</dd>
           
            </dl>
            
            <form method="POST" class="container text-left" action="../insertPaymentSlip" enctype="multipart/form-data">
                
                <div class="mb-3">
                <label for="formFile" class="form-label">Payment Slip (.pdf)</label>
                <input class="form-control" type="file" id="formFile" name="PaymentSlip" accept='.pdf' required>
              </div>
                <input type="hidden" value="Payment pending approval" name="paymentStatus">
                <input type="hidden" value="<%= request.getParameter("booking") %>" name="bookingID">
              <br><br>
              <div class="col-12">
                <button type="submit" class="btn btn-success">Save</button>
                <a href="myBooking.jsp" class="btn btn-primary">Later</a>
              </div>
              
            </form>
            
            
            
        </div>
    </body>
</html>
