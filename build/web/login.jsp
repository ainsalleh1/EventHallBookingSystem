<%-- 
    Document   : login
    Created on : Dec 24, 2021, 10:31:11 PM
    Author     : End-User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        
        <style>
            h3{
                text-align: center;
            }
            
            body {
                background-image: url("media/cool1.jpg");
                height: 750px;

                /* Center and scale the image nicely */
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                }
            .box
            {
                width: 520px;
                padding: 10px;
                border: 1px solid white;
                background-color: white;
                margin-left:390px;
                opacity: 0.7;
                border-radius: 25px;
            }
            
            h4{
                font-size: 16px;
            }
            h5{
                text-align: center;
                font-size: 14px;
            }
        </style>
        <title>Login</title>
    </head>
    <body>
        <div class="container">
            <!--<h1>Event Halls Booking System</h1>-->            
        </div>
        
        <div class="container">
            <br><br><br><h3>Login</h3><br><br>
            <div class="box">
            <div>
                <form method="POST" class="container text-center" action="LoginServlet">
                    <div class="form-group">
                        <br><br><label for="InputEmail1" class="container text-left" ><h4><b>Email</b></h4></label>
                        <input type="email" class="form-control" id="InputEmail1" aria-describedby="emailHelp"placeholder="Enter email" name="email" required >
                        <br/>
                        <small id="emailHelp" class="form-text text-muted"><h5>We'll never share your email with anyone else.</h5></small>
                    </div>
                    <br>
                    <div class="form-group">
                        <label for="InputPassword" class="container text-left" ><h4><b>Password</b></h4></label>
                        <input type="password" class="form-control" id="InputPassword" placeholder="Enter password" name="password" required>
                        <br><h4><input type="checkbox" onclick="myFunction()">   Show Password</h4><br>
                        <script>
                            function myFunction() {
                                var x = document.getElementById("InputPassword");
                                if (x.type === "password") {
                                  x.type = "text";
                                } else {
                                  x.type = "password";
                                }
                            } 
                         </script>
                      </div>
<!--                    <div class="form-group">
                        <label class="container text-left">User Level</label>
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
                        
                    </div>-->
                                        
                    <button type="submit" class="btn btn-success" >Login</button>
                    <button type="reset" class="btn btn-success" >Reset</button>
                    
                </form>
                <br/><br/>
                <em><h5>Do not have an account? <a href="register.jsp" >Click here</h5></a></em>
            </div>
        </div>
        </div>
    </body>
</html>
