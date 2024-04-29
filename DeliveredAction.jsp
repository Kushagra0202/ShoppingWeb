<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String id = request.getParameter("id");
String str = request.getParameter("user");
String status = "delivered";
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/shopping";
 	String username = "root";
 	String password="1234";
 	Connection con = DriverManager.getConnection(url, username, password);
 	Statement st = con.createStatement();
 	st.executeUpdate("update cart set status ='"+status+"' where product_ID='"+id+"' and username='"+str+"' and address is NOT NULL");
 	response.sendRedirect("OrderRecieved.jsp?msg=delivered");
	
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("OrderRecieved.jsp?msg=invalid");
}

%>