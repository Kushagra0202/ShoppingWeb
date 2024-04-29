package com.shop;

import java.sql.DriverManager;
import java.sql.*;

public class PassWordDao {
	String q = "update credentials set password=? where username=?";
	String url="jdbc:mysql://localhost:3306/shopping";
	String username="root";
	String password="1234";
	
	
	public boolean setPass(String user, String pass) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement(q);
			st.setString(1, pass);
			st.setString(2, user);
			int rows = st.executeUpdate();
			if(rows>0) {
				return true;
			}
			return false;
		} catch (Exception e) {
			System.out.println("Here");
		}
		return false;
	}

}
