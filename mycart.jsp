<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
    <link rel="stylesheet" href="style8.css">
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" >
</head>
<body style="background-color: aquamarine;" >
<%String str = session.getAttribute("user").toString(); %>
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
    <div class="head">
        <h1 style="text-align: center;">MY CART <i class="fa-solid fa-cart-arrow-down"></i></h1>
    </div>
<%String msg = request.getParameter("msg");
if("notPossible".equals(msg)){
%>
<h3 class="alert" style="text-align: center;">There is only one Quantity! So click on remove!</h3>
<%} %>
<%if("inc".equals(msg)){
	%>
<h3 class="alert" style="text-align: center;">Quantity  Increased Successfully!</h3>
<%} %>
<%if("dec".equals(msg)){
	%>
<h3 class="alert" style="text-align: center;">Quantity  Decreased Successfully!</h3>
<%} %>
<%if("remove".equals(msg)){
	%>

<h3 class="alert" style="text-align: center;">Product Successfully Removed!</h3>
<%} %>
    <table>
        <thead>
        <%int total=0;
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
                    <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
                    <%if(total>0){ %><th scope="col"><a href="addressPayment.jsp">Proceed to order</a></th><%} %>
                  </tr>
                </thead>
                <thead>
                  <tr>
                  <th scope="col">S.No</th>
                    <th scope="col">Product Name</th>
                    <th scope="col"><i class="fa fa-inr"></i> price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Sub Total</th>
                    <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
                  </tr>
                </thead>
                <tbody>
              <%
              ResultSet rs = st.executeQuery("select * from product inner join cart on product.product_ID =cart.product_ID and cart.username='"+str+"' and cart.address is NULL");
              while(rs.next()){
              %>
                  <tr>
                  <%sno=sno+1; %>
                   <td><%out.println(sno); %></td>
                    <td><%=rs.getString(3) %></td>
                    <td><i class="fa fa-inr"></i><%=rs.getString(4) %> </td>
                    <td><a href="incdecquantity.jsp?id=<%=rs.getString(2)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a><%=rs.getString(8) %><a href="incdecquantity.jsp?id=<%=rs.getString(2)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
                    <td><i class="fa fa-inr"></i><%=rs.getString(10) %> </td>
                    <td><a href="removefromcart.jsp?id=<%=rs.getString(2)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
                  </tr>
                  <%
              }
        }catch(Exception e){
        	System.out.println("Here");
        }
                  %>
                </tbody>
              </table>
</body>
</html>