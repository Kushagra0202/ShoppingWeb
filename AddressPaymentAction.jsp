<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String str = session.getAttribute("user").toString();
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");
String mobilenumber = request.getParameter("mobilenumber");
String paymentmethod = request.getParameter("paymentMethod");
String transactionID = "";
transactionID=request.getParameter("transactionID");
String status = "bill";
String url="jdbc:mysql://localhost:3306/shopping";
String username = "root";
String password="1234";
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, username, password);
	PreparedStatement st = con.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobile_Number=?,order_Date=now(),delivery_date=DATE_ADD(order_Date,INTERVAL 7 DAY),payment_method=?,transaction_ID=?,status=? where username=? and address is NULL");
    st.setString(1, address);
    st.setString(2,city);
    st.setString(3,state);
    st.setString(4,country);
    st.setString(5,mobilenumber);
    st.setString(6,paymentmethod);
    st.setString(7,transactionID);
    st.setString(8,status);
    st.setString(9,str);
    st.executeUpdate();
    response.sendRedirect("bill.jsp");
}catch(Exception e){
	System.out.println(e);
}
%>