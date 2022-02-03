<%-- 
    Document   : login
    Created on : Dec 24, 2021, 10:31:11 PM
    Author     : End-User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                background-attachment: fixed;
            }
            .box
            {
                width: 520px;
                padding: 10px;
                border: 1px solid white;
                background-color: white;
                /*margin-left:390px;*/
                margin-left:auto;
                margin-right:auto;
                opacity: 0.8;
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
        <%
            Cookie[] cookies = request.getCookies();
            String email = "", password = "", rememberVal = "";

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("cookuser")) {
                        email = cookie.getValue();
                    }
                    if (cookie.getName().equals("cookpass")) {
                        password = cookie.getValue();
                    }
                    if (cookie.getName().equals("cookrem")) {
                        rememberVal = cookie.getValue();
                    }
                }
            }

        %>
        <div class="container">
            <br><br><br><h3>Login</h3><br><br>
            <div class="box">
                <div class="container">
                    <form method="POST" class="container text-center" action="LoginServlet">
                        <div class="form-group">
                            <label for="InputEmail1" class="container text-left" ><h4>Email</h4></label>
                            <input type="email" class="form-control" id="InputEmail1" aria-describedby="emailHelp"placeholder="Enter email" name="email" value="<%=email%>" required >
                            <br/>
                            <small id="emailHelp" class="form-text text-muted"><h5>We'll never share your email with anyone else.</h5></small>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="InputPassword" class="container text-left" ><h4>Password</h4></label>
                            <input type="password" class="form-control" id="InputPassword" placeholder="Enter password" name="password" value="<%=password%>" required>
                            <br><h4><input type="checkbox" onclick="myFunction()">   Show Password</h4>

                            <input type="checkbox" id="remember" name="remember" value="1"
                                   <%= "1".equals(rememberVal.trim()) ? "checked=\"checked\"" : ""%>/> <label>Remember me</label> <br><br><br>
                        </div>

                        <button type="submit" class="btn btn-success" >Login</button>
                        <button type="reset" class="btn btn-success" >Reset</button>

                    </form>
                    <br/><br/><br/>
                    <em>Do not have an account? <a href="register.jsp" >Click here</a></em>

                </div>      
            </div>
        </div>
    </body>
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
</html>
