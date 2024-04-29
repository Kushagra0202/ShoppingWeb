<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="style10.css">
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" >
</head>
<body style="background-color: aquamarine;">
<%String str = session.getAttribute("user").toString(); %>
    <div class="nav-bar">
        <div class="company-name">
            <b>DEAL BREAK</b>
        </div>
        <ul class="navigation-links">
            <li><a href=""></a> <i class="fa-regular fa-user"></i></li>
            <li><a href="">Home</a><i class="fa-solid fa-house"></i></li>
            <li><a href="">My Cart</a><i class="fa-solid fa-cart-shopping"></i></li>
            <li><a href="">My orders</a><i class="fa-solid fa-truck"></i></li>
            <li><a href="">Change Details</a><i class="fa-regular fa-pen-to-square"></i></li>
            <li><a href="">Message Us</a><i class="fa-solid fa-envelope-open"></i></li>
            <li><a href="">About Us</a><i class="fa-solid fa-address-card"></i></li>
            <li><a href="">Logout</a><i class="fa-solid fa-right-from-bracket"></i></li>
        </ul>
    </div>
<div style="color: white; text-align: center; font-size: 30px; margin-top: 30px;">My Orders <i class='fab fa-elementor'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">Status</th>
              
          </tr>
        </thead>
        <tbody>
<%int sno=0;%>
<% 
try{
	String url="jdbc:mysql://localhost:3306/shopping";
	String username = "root";
	String password="1234";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, username, password);
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from cart inner join product where cart.product_ID=product.product_ID and cart.username='"+str+"' and cart.order_Date is NOT NULL and cart.status = 'processing'");
	
	while(rs.next()){
	%>
          <tr>
            <td><%out.println(sno); %></td>
            <td><%=rs.getString(18) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(19) %> </td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(5) %> </td>
             <td><%=rs.getString(11) %></td>
              <td><%=rs.getString(12) %></td>
               <td><%=rs.getString(13) %></td>
               <td><%=rs.getString(15) %></td>
            </tr>
         <%
	}
}catch(Exception e){
	System.out.println(e);
}
         %>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>