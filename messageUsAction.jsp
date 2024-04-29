<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<% 
String str = session.getAttribute("user").toString();
String subject = request.getParameter("subject");
String body = request.getParameter("body");
String user = session.getAttribute("user").toString();
String url="jdbc:mysql://localhost:3306/shopping";
String username = "root";
String password="1234";
String email="";
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, username, password);
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select email from credentials where username='"+str+"'");
	while(rs.next()){
		email = rs.getString(1);
	}
	PreparedStatement ps = con.prepareStatement("insert into message (email,subject,body) values(?,?,?)");
	ps.setString(1,email);
	ps.setString(2,subject);
	ps.setString(3,body);
	ps.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=valid");
	
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("messageUs.jsp?msg=invalid");
}
%>