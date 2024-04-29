<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String user = session.getAttribute("user").toString();
String url="jdbc:mysql://localhost:3306/shopping";
String username = "root";
String password="1234";
String s = request.getParameter("id");
int product_price=0;
int product_total=0;
int cart_total=0;
int z=0;
int quantity=1;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, username, password);
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from product where product_ID='"+s+"'");
	while(rs.next()){
		product_price = rs.getInt(4);
		product_total=product_price;
	}
	ResultSet rs1 = st.executeQuery("select * from cart where product_ID ='"+s+"' and username='"+user+"'and address is NULL ");
	while(rs1.next()){
		cart_total = rs1.getInt(5);
		cart_total = cart_total+product_price; 
		quantity = rs1.getInt(3);
		quantity=quantity+1;
		z=1;
	}
	if(z==1){
		st.executeUpdate("update cart set total='"+cart_total+"' ,quantity='"+quantity+"' where product_ID='"+s+"' and username='"+user+"' and address is NULL");
		 response.sendRedirect("users.jsp?msg=exist");
	}
	if(z==0){
		PreparedStatement st1 = con.prepareStatement("insert into cart (username,product_ID,quantity,price,total) values(?,?,?,?,?)");
		st1.setString(1,user);
		st1.setString(2,s);
		st1.setInt(3,quantity);
		st1.setInt(4,product_price);
		st1.setInt(5,product_total);
		st1.executeUpdate();
		response.sendRedirect("users.jsp?msg=done");
	}
}catch(Exception e){
	System.out.println(e.getMessage());
	System.out.println("HERE in cart block");
	response.sendRedirect("users.jsp?msg=wrong");
}

%>
</body>
</html>