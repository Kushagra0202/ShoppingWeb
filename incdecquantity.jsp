<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>   

<%

String str = session.getAttribute("user").toString();
String id = request.getParameter("id");
String incdec=request.getParameter("quantity");
int price=0;
int total=0;
int quantity = 0;
int final_total=0;
String url="jdbc:mysql://localhost:3306/shopping";
String username = "root";
String password="1234";
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, username, password);
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from cart where username='"+str+"' and product_ID='"+id+"' and address is NULL ");
	while(rs.next()){
		price = rs.getInt(4);
		total = rs.getInt(5);
		quantity = rs.getInt(3);
	}
	if(quantity==1 && incdec.equals("dec")){
		response.sendRedirect("mycart.jsp?msg=notPossible");
	}
	else if(quantity!=1 && incdec.equals("dec")){
		 total=total-price;
		 quantity=quantity-1;
		 st.executeUpdate("update cart set total='"+total+"' , quantity='"+quantity+"' where username='"+str+"' and product_ID='"+id+"' and address is NULL");
		 response.sendRedirect("mycart.jsp?msg=dec");
	}
	else{
		total=total+price;
		 quantity=quantity+1;
		 st.executeUpdate("update cart set total='"+total+"' , quantity='"+quantity+"' where username='"+str+"' and product_ID='"+id+"' and address is NULL");
		 response.sendRedirect("mycart.jsp?msg=inc");
	}
}catch(Exception e){
	System.out.println(e);
}
%>