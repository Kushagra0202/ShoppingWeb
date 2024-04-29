<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="bill.css">
<title>Bill</title>
</head>
<body>
<%String str = session.getAttribute("user").toString(); %>
<%
try{
	String url="jdbc:mysql://localhost:3306/shopping";
	String username = "root";
	String password="1234";
	int total=0;
	int sno=0;
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, username, password);
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select sum(total) from cart where username='"+str+"' and status='bill'");
	while(rs.next()){
		total=rs.getInt(1);
	}
	ResultSet rs2 = st.executeQuery("select * from credentials inner join cart on credentials.username=cart.username where cart.username='"+str+"' and cart.status='bill'");
	while(rs2.next()){
%>
<h3>Deal Breaker</h3>
<hr>
<div class="left-div"><h3>Name:<%=rs2.getString(1) %>  </h3></div>
<div class="right-div-right"><h3>Email: <%=rs2.getString(3) %> </h3></div>
<div class="right-div"><h3>Mobile Number: <%=rs2.getString(7) %>  </h3></div>  

<div class="left-div"><h3>Order Date: <%=rs2.getString(18) %> </h3></div>
<div class="right-div-right"><h3>Payment Method:<%=rs2.getString(20) %>  </h3></div>
<div class="right-div"><h3>Expected Delivery: <%=rs2.getString(19) %> </h3></div> 

<div class="left-div"><h3>Transaction Id: <%=rs2.getString(21) %> </h3></div>
<div class="right-div-right"><h3>City: <%=rs2.getString(14) %>  </h3></div> 
<div class="right-div"><h3>Address:<%=rs2.getString(13) %>  </h3></div> 

<div class="left-div"><h3>State:<%=rs2.getString(15) %>  </h3></div>
<div class="right-div-right"><h3>Country: <%=rs2.getString(16) %>  </h3></div>  

<hr>
<%break;} %>

	
	<br>
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%ResultSet rs1 = st.executeQuery("select * from cart inner join product where cart.product_ID=product.product_ID and cart.username='"+str+"' and cart.status='bill'");
  while(rs1.next()){
	  sno=sno+1;
  %>
  <tr>
    <td><%=sno %></td>
    <td><%=rs1.getString(18) %></td>
    <td><%=rs1.getString(4) %></td>
    <td><%=rs1.getString(3) %></td>
     <td><%=rs1.getString(5) %></td>
  </tr>
  <tr>
<%} %>
</table>
<h3>Total:<%out.println(total); %> </h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<%}catch(Exception e){
	System.out.println(e);
}%>
</body>
</html>