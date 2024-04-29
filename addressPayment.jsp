<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style9.css">
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" >
<title>Payment</title>
</head>
<body style="background-color: blue;">
<%String str = session.getAttribute("user").toString(); %>
<br>
<table>
<thead>
<% 
int total=0;
int sno=0;

String url="jdbc:mysql://localhost:3306/shopping";
String username = "root";
String password="1234";
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, username, password);
	Statement st = con.createStatement();
	ResultSet rs1 = st.executeQuery("select sum(total) from cart where username='"+str+"' and address is NULL");
	while(rs1.next()){
		total=rs1.getInt(1);
	}
%>
          <tr>
          <th scope="col"><a href=""><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
         <%
              ResultSet rs = st.executeQuery("select * from product inner join cart on product.product_ID =cart.product_ID and cart.username='"+str+"' and cart.address is NULL");
              while(rs.next()){
            	  System.out.println(rs.getString(3));
              %>
          <tr>
           <%sno=sno+1; %>
           <td><%out.println(sno); %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"><%=rs.getString(4) %> </i> ></td>
            <td><%=rs.getString(8) %> </td>
            <td><i class="fa fa-inr"><%=rs.getString(10)%></i> </td>
            </tr>
         <%}
              ResultSet rs2 = st.executeQuery("select * from credentials where username='"+str+"'");
              while(rs2.next()){
              %>
        </tbody>
      </table>
      
<hr style="width: 100%">
    <form action="AddressPaymentAction.jsp">
    <div class="upper">
    <div class="left-div">
            <h3>Enter Address</h3>
           <input class="input-style" type="text" name="address" placeholder="Enter Address" required>
            </div>
           
           <div class="right-div">
           <h3>Enter city</h3>
           <input class="input-style" type="text" name="city" placeholder="Enter City" required>
           </div> 
    </div>
     
    <div class="bottom">
        <div class="left-div">
            <h3>Enter State</h3>
            <input class="input-style" type="text" name="state" placeholder="Enter State" required>
            </div>
            
            <div class="right-div">
            <h3>Enter country</h3>
            <input class="input-style" type="text" name="country" placeholder="Enter Country" required>
            </div>
    </div>
    
    <h3 style="color: red; text-align: center; ">*If there is no address its mean that you did not set you address!</h3>
    <h3 style="color: red ; text-align: center;">*This address will also updated to your profile</h3>
    <hr style="width: 100%">
<div class="upper">
    <div class="left-div">
        <h3 style="color: white; margin-left: 50px;">Select way of Payment</h3>
        <select class="input-style" name="paymentMethod">
            <option value="Cash on Delivery(COD)">Cash on Delivery(COD)</option>
            <option value="Online Payment">Online Payment</option>
        </select>
    </div>
    <div class="right-div">
    <h3 style="color: red">*If you enter wrong transaction id then your order will be canceled!</h3>
        <input class="input-style" type="text" name="transactionID" placeholder="Enter Transaction ID">
        <h3 style="color: red">Leave blank in case of COD</h3>
    </div>
</div>    
    <hr style="width: 100%">
    <div class="upper">
        <div class="left-div">
            <h3 style="color: white;">Mobile Number</h3>
            <input class="input-style" type="text" name="mobilenumber" placeholder="Enter Phone Number">
            <h3 style="color: red">*This mobile number will also updated to your profile</h3>
            </div>
    </div>
    <div class="but">
        <button class="button" type="submit"><i class='far fa-arrow-alt-circle-right'>  Procced to  Generate Bill</i></button><br>
        <h3 style="color: red">*Fill form correctly</h3>
    </div>
    </form>
        
<%
              }           
}
catch(Exception e){
System.out.println(e);}%>
      <br>
      <br>
      <br>

</body>
</html>