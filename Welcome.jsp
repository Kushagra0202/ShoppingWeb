<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Welcome</title>
    <link rel="stylesheet" href="style4.css">
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" >
</head>
<body style="background-color: aquamarine;" >
<%String str = session.getAttribute("user").toString(); %>
    <div class="nav-bar">
        <div class="company-name">
            <b>DEAL BREAK</b>
        </div>
        <ul class="navigation-links">
            <li><a href="AddProduct.jsp">Add new Product</a> <i class="fa-solid fa-cart-plus"></i></li>
            <li><a href="AllProducts.jsp">All Products and edits</a></li>
            <li><a href="MessageRecieved.jsp">Message received</a><i class="fa-solid fa-message"></i></li>
            <li><a href="OrderRecieved.jsp">Order received</a><i class="fa-solid fa-message"></i></li>
            <li><a href="CancelOrder.jsp">Cancel orders</a><i class="fa-solid fa-xmark"></i></li>
            <li><a href="DeliveredOrder.jsp">Delivered orders</a><i class="fa-solid fa-truck"></i></li>
            <li><a href="NewFile.jsp">Logout</a><i class="fa-solid fa-right-from-bracket"></i></li>
        </ul>
    </div>

    <div class="head">
        <h1>Welcome..<%out.print(str); %> </h1>
    </div>
</body>
</html>