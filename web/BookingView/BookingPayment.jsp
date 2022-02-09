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
                    background-image: url("../media/cool.jpg");
                    background-position: center;
                    
                    
                }
                a{
                    text-decoration: none;
                    
                }
            #book{
                text-align: center; 
                height: 100%;
            }
            #formPayment{
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 20px;
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
                    <a href="../MainBooking.jsp" class="w3-bar-item w3-button w3-light-grey">Booking</a>
                    <a href="MainPromo" class="w3-bar-item w3-button w3-hide-small">Promo</a>
<!--                    <a href="InventoryView/MainInventory.jsp" class="w3-bar-item w3-button">Inventory</a>-->
                    <a href="AboutUs.html" class="w3-bar-item w3-button">About Us</a>
                    <a href="profile.jsp" class="w3-bar-item w3-button">Profile</a>
                    <a href="../LogOut" class="w3-bar-item w3-button">Log Out</a>
                    </div>
                    
                </div>
        </header> 
    <body>
        <div class="container">
            
<!--            <div class="container">
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
            <br><br>-->

            <h3>
                You're one step away from confirming your booking with us!<br>
                <small class="text-muted">Please do the payment and complete the payment details below!</small>
            </h3>
            <br><br>
            <dl class="row">
                
                <dt class="col-sm-3">Account</dt>
                <dd class="col-sm-9">Maybank</dd>
                
                <dt class="col-sm-3">Account Number</dt>
                <dd class="col-sm-9">111122223333</dd>
                
                <dt class="col-sm-3">Account Name</dt>
                <dd class="col-sm-9">PPG EVENTS ORGANIZER</dd>
                
<!--                <dt class="col-sm-3">Reference</dt>
                <dd class="col-sm-9">...</dd>-->
           
            </dl>
            
            <h3>Payment Details</h3>
            
            <div id="formPayment">
            <form method="POST" class="container text-left" action="../UpdatePaymentStatus" enctype="multipart/form-data">
                
<!--                <div class="mb-3">
                <label for="formFile" class="form-label">Payment Slip (.pdf)</label>
                <input class="form-control" type="file" id="formFile" name="PaymentSlip" accept='.pdf' required>
              </div>-->
<!--                <p>Payment status:</p>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="paymentStatus" id="flexRadioDefault1" value='Not done' checked>
                    <label class="form-check-label" for="flexRadioDefault1">
                      Not done
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="paymentStatus" id="flexRadioDefault2" value='Done'>
                    <label class="form-check-label" for="flexRadioDefault2">
                      Done
                    </label>
                  </div>
                <br/>-->
                        <label for="bank">Bank</label> 
                        <select class="form-select" id="bank" name="bank">
                            <option value="Maybank" selected>Maybank</option>
                            <option value="CIMB">CIMB</option>
                            <option value="BSN">BSN</option>
                            <option value="RHB">RHB</option>
                            <option value="Public Bank">Public Bank</option>
                            <option value="Bank Islam">Bank Islam</option>  
                        </select>
                        <br/>
              <div class="col-12">
                  <label for="inputReferenceNo" class="form-label">Reference No.:</label>
                  <input type="text" class="form-control" id="inputReferenceNo" name="referenceNo" required>
                </div>
                <input type="hidden" value="Completed" name="paymentStatus">
                <input type="hidden" value="Payment pending approval" name="bookingStatus">
                <input type="hidden" value="<%= request.getParameter("booking") %>" name="bookingID">
              <br>
              <div class="col-12">
                <button type="submit" class="btn btn-success">Save</button>
                <a href="myBooking.jsp" class="btn btn-primary">Later</a>
              </div>
              
            </form>  
              
            </div>
            <br/><br/>
        </div>
    </body>
</html>
