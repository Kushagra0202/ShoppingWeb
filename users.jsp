<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Welcome</title>
    <link rel="stylesheet" href="style7.css">
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" >
</head>
<body style="background-color: aquamarine;" >
<%String str = session.getAttribute("user").toString(); %>
    <div class="nav-bar">
        <div class="company-name">
            <b>DEAL BREAK</b>
        </div>
        <ul class="navigation-links">
            <li><a href=""><%out.println(str); %></a> <i class="fa-regular fa-user"></i></li>
            <li><a href="users.jsp">Home</a><i class="fa-solid fa-house"></i></li>
            <li><a href="mycart.jsp">My Cart</a><i class="fa-solid fa-cart-shopping"></i></li>
            <li><a href="myOrders.jsp">My orders</a><i class="fa-solid fa-truck"></i></li>
            <li><a href="">Change Details</a><i class="fa-regular fa-pen-to-square"></i></li>
            <li><a href="messageUs.jsp">Message Us</a><i class="fa-solid fa-envelope-open"></i></li>
            <li><a href="">About Us</a><i class="fa-solid fa-address-card"></i></li>
            <li><a href="NewFile.jsp">Logout</a><i class="fa-solid fa-right-from-bracket"></i></li>
        </ul>
    </div>
    <div class="product-table">
        <table>
        <thead>
          <tr>
            <th scope="col">Product-ID</th>
            <th scope="col">Product Name</th>
            <th scope="col">Price</th>
            <th scope="col">Add to Cart <i class="fa-solid fa-cart-plus"></i></th>
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
        	
        	ResultSet rs = st.executeQuery("select product_ID,product_name,price from product where status='Yes'");
        	
        	while(rs.next()){
        
        %>
          <tr>
            <td ><%=rs.getString(1) %></td>
            <td ><%=rs.getString(2) %></td>
            <td ><%=rs.getInt(3) %></td>
            <td><a href="addToCart.jsp?id=<%=rs.getString(1)%>">Add to Cart <i class="fa-solid fa-cart-plus"></i></a></td>
            </tr>
            <%
        	}}catch(Exception e){
        	System.out.println("Here in users");
        }
            %>
        </tbody>
    </table>
    </div>
    <% 
            String msg = request.getParameter("msg");
            if (msg != null) {
                if (msg.equals("done")) {
                    out.println("<div style='text-align: center; color: green; font-size: 20px;'>Product added successfully</div>");
                } 
                if(msg.equals("exist")){
                    out.println("<div style='text-align: center; color: red; font-size: 20px;'>Quantity increased!</div>");
                }
                if(msg.equals("wrong")){
                    out.println("<div style='text-align: center; color: red; font-size: 20px;'>OOps Something went wrong!</div>");
                }
                
            }
        %>
</body>
</html>