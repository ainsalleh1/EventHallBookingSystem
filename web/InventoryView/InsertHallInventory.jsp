<%-- 
    Document   : InsertHallInventory
    Created on : Jan 20, 2022, 8:56:50 PM
    Author     : End-User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .mySlides {display:none;}
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
        </style>
        <title>Hall Inventory</title>
    </head>
    <header class="w3-panel w3-center" style="padding:128px 16px 20px 16px">
            <h1 class="w3-xlarge">HALLS BOOKING</h1>
            <h1>System</h1>
  
                <div class="w3-padding-32">
                    <div class="w3-bar w3-border">
                    <a href="../MainHomepage.jsp" class="w3-bar-item w3-button">Home</a>
                    <a href="../MainHall" class="w3-bar-item w3-button">Hall List</a>
                    <a href="MainBooking.jsp" class="w3-bar-item w3-button w3-light-grey">Booking</a>
                    <a href="MainPromo" class="w3-bar-item w3-button w3-hide-small">Promo</a>
                    <a href="MainInventory.jsp" class="w3-bar-item w3-button">Inventory</a>
                    <a href="AboutUs.html" class="w3-bar-item w3-button">About Us</a>
                    <a href="profile.jsp" class="w3-bar-item w3-button">Profile</a>
                    <a href="LogOut" class="w3-bar-item w3-button">Log Out</a>
                    </div>
                    
                </div>
        </header> 
    <body>
        <div class="container">
            
<!--            <ul class="nav nav-tabs">
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="../MainHomepage.jsp">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="../MainHall">Halls</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="MainBooking.jsp">Booking</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="MainPromo">Promo</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" href="MainInventory.jsp">Inventory</a>
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

            </ul>-->
            
            <br>
            
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="MainInventory.jsp">Inventory Management</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                  <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                        <li class="nav-item">
                          <a class="nav-link" aria-current="page" href="#">Item List</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link active" aria-current="page" href="InventoryHall.jsp">Hall Inventory</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="InsertItem.html">Add Item</a>
                        </li>
                        
                    </ul>
                    
                </div>
                </div>
            </nav>                
            
            <br><br>
            
            
            <h2>Insert Item into Hall Inventory</h2>
            
            <br><br>
            
            <form action="../InsertInventoryHall" method="POST">           
                
                
                <%
                    int counter = 0;
                    int hall_ID = Integer.parseInt(request.getParameter("hallID"));
                    try{                  
                        Class.forName("com.mysql.jdbc.Driver");

                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventhallbookingsystem", "root", "");   


                        String sqlHall = "select * from hall where hall_id=?";                   
                        PreparedStatement ps_hall = conn.prepareStatement(sqlHall);
                        ps_hall.setInt(1, hall_ID);
                        ResultSet hall = ps_hall.executeQuery();
                        if(hall.next()){
                            
                %>
                        
                 <div class="mb-6 row">
                    <label for="hallName" class="col-sm-2 col-form-label">Hall Name</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" placeholder="Disabled input" aria-label="Disabled input example" value="<%= hall.getString("name") %>" disabled>
                    </div>
                  </div>
                  <input type="text" class="form-control" id="inputHallID" name="hall_id" value="<%= hall.getString("hall_id") %>" hidden>
                    <br><br>
                 <%
                     }
                 %>
                 <label for="hall_item">Choose a car:</label>
                 <select name="hall_item" id="hall_item" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                        <%
                        String sql = "select * from item";                   
                        PreparedStatement ps_item = conn.prepareStatement(sql);

                        ResultSet item = ps_item.executeQuery();
                        while(item.next()){
                            counter=counter+1;

                %> 


                    <option value="<%= item.getInt("item_id") %>"><%= item.getString("item_name") %></option>


    <!--            <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="<%= item.getString("item_name") %>" id="<%=counter%>">
                    <label class="form-check-label" for="<%=counter%>">
                      <%= item.getString("item_name") %>
                    </label>
                </div> -->

                <%      
                        }
                %>
                </select>
                
                <div class="col-md-3">
                <label for="inputQuantity" class="form-label">Quantity: </label>
                <input type="number" class="form-control" id="inputQuantity" name="quantity" required>
              </div>
                <br><br>
                <div class="col-12">
                <button type="submit" class="btn btn-success">Save</button>
              </div>
            </form>
            <%
                    conn.close();
                }catch(Exception ex){}
                
            %>
            
                        
            
                
        </div>
    </body>
</html>
