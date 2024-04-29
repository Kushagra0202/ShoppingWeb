<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style6.css">
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" >
</head>
<body style="background-color: aquamarine;" >
<%
String str = session.getAttribute("user").toString();
%>
    <div class="nav-bar">
        <div class="company-name">
            <b>DEAL BREAK</b>
        </div>
        <ul class="navigation-links">
            <li><a href="">Add new Product</a> <i class="fa-solid fa-cart-plus"></i></li>
            <li><a href="">All Products and edits</a> <i class="fa-solid fa-cart-plus"></i></li>
            <li><a href="">Message recieved</a><i class="fa-solid fa-message"></i></li>
            <li><a href="">Cancel orders</a><i class="fa-solid fa-xmark"></i></li>
            <li><a href="">Delieverd orders</a><i class="fa-solid fa-truck"></i></li>
            <li><a href="">Logout</a><i class="fa-solid fa-right-from-bracket"></i></li>
        </ul>
    </div>
    <div class="product-table">
        <table>
        <thead>
          <tr>
            <th scope="col">Product-ID</th>
            <th scope="col">Product Name</th>
            <th scope="col">Price</th>
            <th>Status</th>
            <th scope="col">Edit <i class="fa-solid fa-pen-to-square"></i></th>
          </tr>
        </thead>
        <tbody>
        <%
        try{
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	String url="jdbc:mysql://localhost:3306/shopping";
        	String username = "root";
        	String password="1234";
        	Connection con = DriverManager.getConnection(url, username, password);
        	Statement st = con.createStatement();
        	ResultSet rs = st.executeQuery("select product_ID,product_name,price,status from product where username='" + str + "';");
        	while(rs.next()){
        %>
        <tr>
            <td ><%=rs.getInt(1) %></td>
            <td ><%=rs.getString(2) %></td>
            <td ><%=rs.getInt(3) %></td>
            <td><%=rs.getString(4) %></td>
            <td><a href="">Edit <i class="fa-solid fa-pen-to-square"></i></a></td>
            </tr>
            <%
        	}}catch(Exception e){
        	System.out.println("here");
        }
        %>
            
        </tbody>
    </table>
    </div>
</body>
</html>