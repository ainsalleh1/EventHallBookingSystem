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
        
        
        <title>Login</title>
    </head>
    <body>
        <div class="container">
            <h1>Event Halls Booking System</h1>            
        </div>
        
        <div class="container">
            <h3>Login</h3>
            <div>
                <form method="POST" class="container text-center" action="LoginServlet">
                    <div class="form-group">
                        <label for="InputEmail1" class="container text-left" >Email</label>
                        <input type="email" class="form-control" id="InputEmail1" aria-describedby="emailHelp"placeholder="Enter email" name="email" required >
                        <br/>
                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                    </div>
                    <div class="form-group">
                        <label for="InputPassword" class="container text-left" >Password</label>
                        <input type="password" class="form-control" id="InputPassword" placeholder="Enter password" name="password" required>
                        <input type="checkbox" onclick="myFunction()">Show Password
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
                <br/><br/><br/>
                <em>Do not have an account? <a href="register.jsp" >Click here</a></em>
            </div>
        </div>
    </body>
</html>
