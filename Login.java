package com.shop;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


public class Login extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("uname");
		String password = request.getParameter("pass");
		LoginDao dao = new LoginDao();
		
		if(user.equals("kush45") && password.equals("1234")) {
			HttpSession ses = request.getSession();
			ses.setAttribute("user",user);
			response.sendRedirect("Welcome.jsp");
			
		}
		else {
			if(dao.check(user, password)) {
				HttpSession ses = request.getSession();
				ses.setAttribute("user",user);
				response.sendRedirect("users.jsp");
			}
			else {
				response.sendRedirect("NewFile.jsp");
			}
		}
		
	}
}
