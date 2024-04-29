<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="messagerec.css">
    <title>Home</title>
    <style>
    h3
    {
        color: yellow;
        text-align: center;
    }
    </style>
    </head>
    <body style="background-color: aquamarine;">
        <div class="nav-bar">
            <div class="company-name">
                <b>DEAL BREAK</b>
            </div>
            <ul class="navigation-links">
                <li><a href="AddProduct.jsp">Add new Product</a> <i class="fa-solid fa-cart-plus"></i></li>
                <li><a href="MessageRecieved.jsp">Message recieved</a><i class="fa-solid fa-message"></i></li>
                <li><a href="OrderRecieved.jsp">Order recieved</a><i class="fa-solid fa-message"></i></li>
                <li><a href="CancelOrder.jsp">Cancel orders</a><i class="fa-solid fa-xmark"></i></li>
                <li><a href="DeliveredOrder.jsp">Delieverd orders</a><i class="fa-solid fa-truck"></i></li>
                <li><a href="NewFile.jsp">Logout</a><i class="fa-solid fa-right-from-bracket"></i></li>
            </ul>
        </div>
    <div style="color: white; text-align: center; font-size: 30px; margin-top: 40px;">Messages Received <i class='fas fa-comment-alt'></i></div>
    <table>
            <thead>
              <tr>
                <th scope="col">ID</th>
                <th scope="col">Email</th>
                <th scope="col">Subject</th>
                <th scope="col">Body</th>
              </tr>
            </thead>
            <tbody>
           <%
           String url="jdbc:mysql://localhost:3306/shopping";
           String username = "root";
           String password="1234";
           try{
        	   Class.forName("com.mysql.jdbc.Driver");
        		Connection con = DriverManager.getConnection(url, username, password);
        		Statement st = con.createStatement();
        		ResultSet rs = st.executeQuery("select * from message");
           while(rs.next()){
        	
           %>
              <tr>
                <td><%=rs.getString(1) %></td>
                <td><%=rs.getString(2) %></td>
                <td><%=rs.getString(3) %></td>
                <td><%=rs.getString(4) %></td>
              </tr>
             <%}
           }catch(Exception e){
        	   System.out.println(e);
           }%>
            </tbody>
          </table>
          <br>
          <br>
          <br>
    
    </body>
    </html>