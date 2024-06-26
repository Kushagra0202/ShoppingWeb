<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="order.css">
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" >
    <title>Home</title>
    <style>
    .th-style
    { width: 25%;}
    </style>
    </head>
    <body style="background-color: aquamarine;">

        <div class="nav-bar">
            <div class="company-name">
                <b>DEAL BREAK</b>
            </div>
            <ul class="navigation-links">
                <li><a href="AddNewProduct.jsp">Add new Product</a> <i class="fa-solid fa-cart-plus"></i></li>
                <li><a href="MessageRecieved.jsp">Message recieved</a><i class="fa-solid fa-message"></i></li>
                <li><a href="OrderRecieved.jsp">Orders recieved</a><i class="fa-solid fa-message"></i></li>
                <li><a href="CancelOrder.jsp">Cancel orders</a><i class="fa-solid fa-xmark"></i></li>
                <li><a href="DeliveredOrder.jsp">Delieverd orders</a><i class="fa-solid fa-truck"></i></li>
                <li><a href="NewFile.jsp">Logout</a><i class="fa-solid fa-right-from-bracket"></i></li>
            </ul>
        </div>
    <div style="color: white; text-align: center; font-size: 30px;">Orders Received <i class="fas fa-archive"></i></div>
    <%String msg = request.getParameter("msg"); %>
    <%if("cancel".equals(msg)){ %>
    <h3 class="alert">Order Cancel Successfully!</h3>
    <%} %>
    <%if("delivered".equals(msg)){ %>
    <h3 class="alert">Successfully Updated!</h3>
    <%} %>
    <%if("invalid".equals(msg)){ %>
    <h3 class="alert">Some thing went wrong! Try Again!</h3>
    <%} %>
    
    <table id="customers">
              <tr>
                <th scope="col">Product Name</th>
                <th scope="col">Quantity</th>
                <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
                <th>Address</th>
                <th>City</th>
                <th>State</th>
                <th>Country</th>
                <th scope="col">Order Date</th>
                 <th scope="col">Expected Delivery Date</th>
                 <th scope="col">Payment Method</th>
                  <th scope="col">T-ID</th>
                  <th scope="col">Status</th>
                  <th scope="col">Cancel order <i class='fas fa-window-close'></i></th>
                  <th scope="col">Order Delivered <i class='fas fa-dolly'></i></i></th>
              </tr>
         <%int sno=0;
         try{
        	Class.forName("com.mysql.cj.jdbc.Driver");
         	String url="jdbc:mysql://localhost:3306/shopping";
         	String username = "root";
         	String password="1234";
         	Connection con = DriverManager.getConnection(url, username, password);
         	Statement st = con.createStatement();
         	ResultSet rs = st.executeQuery("select * from cart inner join product where cart.product_ID=product.product_ID and cart.order_Date is NOT NULL and cart.status='processing'");
         	
         	while(rs.next()){
        
         %>   
           
              <tr>
                <td><%=rs.getString(18) %></td>
                <td><%=rs.getString(3) %></td>
                <td><i class="fa fa-inr"></i><%=rs.getString(5) %>  </td>
                    <td><%=rs.getString(6) %></td>
                   <td><%=rs.getString(7)%></td>
                    <td><%=rs.getString(8)%></td>
                     <td><%=rs.getString(9)%></td>
                 <td><%=rs.getString(11)%></td>
                  <td><%=rs.getString(12)%></td>
                   <td><%=rs.getString(13)%></td>
                   <td><%=rs.getString(14)%></td>
                   <td><%=rs.getString(15)%></td>
                   <td><a href="cancelOrderAction.jsp?id=<%=rs.getString(2)%>&user=<%=rs.getString(1)%>">Cancel <i class='fas fa-window-close'></i></a></td>
                    <td><a href="DeliveredAction.jsp?id=<%=rs.getString(2)%>&user=<%=rs.getString(1)%>">Delivered <i class='fas fa-dolly'></i></i></a></td>
                </tr>
             <%}
         	}catch(Exception e){
         		System.out.println(e);
         	}%>
            </table>
          <br>
          <br>
          <br>
    
    </body>
    </html>