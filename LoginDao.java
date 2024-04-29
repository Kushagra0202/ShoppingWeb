package com.shop;
import java.sql.*;

public class LoginDao {
	String q = "select * from credentials where username=? and password=?";
	String url="jdbc:mysql://localhost:3306/shopping";
	String username = "root";
	String password="1234";

	public boolean check(String user, String pass) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement(q);
			st.setString(1, user);
			st.setString(2, pass);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				return true;
			}
			return false;
			
		} catch (Exception e) {
			System.out.println("Error here");
		}
		return false;
	}
	
}
