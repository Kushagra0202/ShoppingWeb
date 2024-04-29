package com.shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

public class CreationDao {
	String q = "insert into credentials values(?,?,?,?,?,?,?)";
	String url="jdbc:mysql://localhost:3306/shopping";
	String username = "root";
	String password="1234";
	public void insert(String name,String uname,String email,String pass,String dob,String g,String phone) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement(q);
			st.setString(1, name);
			st.setString(2, uname);
			st.setString(3, email);
			st.setString(4, pass);
			st.setDate(5, java.sql.Date.valueOf(dob));
			st.setString(6, g);
			st.setString(7, phone);
			st.executeUpdate();
		} catch (Exception e) {
			e.getMessage();
			System.out.println("Error here2");
		}
		
	}
}
