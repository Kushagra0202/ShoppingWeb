package com.shop;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;


/**
 * Servlet implementation class Creation
 */
public class Creation extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
        String uname = request.getParameter("uname");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String dob = request.getParameter("dob");
        String g = request.getParameter("g");
        String phone = request.getParameter("ph");
        CreationDao dao = new CreationDao();
        dao.insert(name, uname, email, pass, dob, g, phone);
        response.sendRedirect("NewFile.jsp");
        
	}

}
