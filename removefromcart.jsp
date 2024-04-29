<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>   
<%
String str = session.getAttribute("user").toString();
String product_id=request.getParameter("id");
String url="jdbc:mysql://localhost:3306/shopping";
String username = "root";
String password="1234";
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, username, password);
	Statement st = con.createStatement();
	st.executeUpdate("delete from cart where username='"+str+"' and product_ID='"+product_id+"' and address is NULL" );
	response.sendRedirect("mycart.jsp?msg=removed");
}catch(Exception e){
	System.out.print("Here");
}
%>