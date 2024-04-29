<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.*"
%>

<%@ page import="java.text.SimpleDateFormat" %>
<%
int id = Integer.parseInt(request.getParameter("ID"));
String name = request.getParameter("name");
int price=Integer.parseInt(request.getParameter("price"));
if(id<0 || price<0){
	response.sendRedirect("AddProduct.jsp?msg=wrong");
}
String status = request.getParameter("status");
String user = session.getAttribute("user").toString();
String url="jdbc:mysql://localhost:3306/shopping";
String username = "root";
String password="1234";
String q = "insert into product values(?,?,?,?,?)";
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, username, password);
	PreparedStatement st = con.prepareStatement(q);
	st.setString(1, user);
	st.setInt(2, id);
	st.setString(3, name);
	st.setInt(4, price);
	st.setString(5,status);
	st.executeUpdate();
	response.sendRedirect("AddProduct.jsp?msg=done");
	
}catch(Exception e){
	System.out.println("AddProduct.jsp?msg=wrong");
}
%>
