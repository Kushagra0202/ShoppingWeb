<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="messageus.css">
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" >
    <title>Message Us</title>
</head>
<body style="background-color: aquamarine;">
    <div class="nav-bar">
        <div class="company-name">
            <b>DEAL BREAK</b>
        </div>
        <ul class="navigation-links">
            <li><a href=""></a> <i class="fa-regular fa-user"></i></li>
            <li><a href="users.jsp">Home</a><i class="fa-solid fa-house"></i></li>
            <li><a href="mycart.jsp">My Cart</a><i class="fa-solid fa-cart-shopping"></i></li>
            <li><a href="myOrders.jsp">My orders</a><i class="fa-solid fa-truck"></i></li>
            <li><a href="">Change Details</a><i class="fa-regular fa-pen-to-square"></i></li>
            <li><a href="messageUs.jsp">Message Us</a><i class="fa-solid fa-envelope-open"></i></li>
            <li><a href="">About Us</a><i class="fa-solid fa-address-card"></i></li>
            <li><a href="NewFile.jsp">Logout</a><i class="fa-solid fa-right-from-bracket"></i></li>
        </ul>
    </div>
<div style="color: white; text-align: center; font-size: 30px; margin-top: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>
<%String msg = request.getParameter("msg");
if("valid".equals(msg)){
%>
<h3 style="text-align:center; color:yellow;">Message successfully sent. Our team will contact you soon!</h3>
<%} %>
<% 
if("invalid".equals(msg)){
	
%>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%} %>
<form action="messageUsAction.jsp">
<input class="input-style" name="subject" type="text" placeholder="subject" required>
<hr>
<textarea class="input-style" name="body"  placeholder="Enter your message" required ></textarea>
<button class="button" type="submit">Send <i class="fa-solid fa-arrow-right fa-beat"></i></button>
</form>
<br><br><br>
</body>
</html>