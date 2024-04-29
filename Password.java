package com.shop;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Password
 */
public class Password extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user = request.getParameter("user");
		String pass= request.getParameter("pass");
		PassWordDao dao = new PassWordDao();
		if(dao.setPass(user, pass)) {
			response.sendRedirect("NewFile.jsp");
		}
		else {
			response.sendRedirect("password.jsp");
		}
	}

	

}
