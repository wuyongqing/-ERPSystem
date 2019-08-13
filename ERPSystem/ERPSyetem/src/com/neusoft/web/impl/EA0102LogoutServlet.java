package com.neusoft.web.impl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EA01LogoutServlet
 */
@WebServlet("/EA0102Logout.htm")
public class EA0102LogoutServlet extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.getSession().removeAttribute("user");
		request.getSession().removeAttribute("role");
		request.getSession().removeAttribute("name");
		request.getSession().removeAttribute("numb");
		request.getSession().removeAttribute("token");
		request.getSession().invalidate();
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
