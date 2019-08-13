package com.neusoft.web.impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.services.impl.EA.EA0102ServicesImpl;

@WebServlet(value="/EA0102Menu.htm",loadOnStartup=1)
public class EA0102MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void init() throws ServletException 
	{
		try 
		{
			EA0102ServicesImpl services = new EA0102ServicesImpl();
			Map<String, List<Map<String, String>>> menulist;
			menulist = services.getMenu();
			this.getServletContext().setAttribute("menu", menulist);
			System.out.println("menu¥Ê»Î");
		} catch (Exception e) 
		{
			//request.setAttribute("msg", "Ã· æ:Õ¯¬Áπ ’œ!");
			System.out.println("Ã· æ:Õ¯¬Áπ ’œ!");
			e.printStackTrace();
		}
	}
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try 
		{
			EA0102ServicesImpl services = new EA0102ServicesImpl();
			Map<String, List<Map<String, String>>> menulist;
			menulist = services.getMenu();
			this.getServletContext().setAttribute("menu", menulist);
		} catch (Exception e) 
		{
			request.setAttribute("msg", "Ã· æ:Õ¯¬Áπ ’œ!");
			e.printStackTrace();
		}
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
