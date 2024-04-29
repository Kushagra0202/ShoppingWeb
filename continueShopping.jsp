<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String str = session.getAttribute("user").toString();
String status = "processing";
String url="jdbc:mysql://localhost:3306/shopping";
String username = "root";
String password="1234";
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, username, password);
	PreparedStatement st = con.prepareStatement("update cart set status=? where username=? and status='bill'");
	st.setString(1, status);
	st.setString(2,str);
	st.executeUpdate();
	response.sendRedirect("users.jsp");
}
	catch(Exception e){
		System.out.println(e);
}
%>