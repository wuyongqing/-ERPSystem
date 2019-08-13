package com.neusoft.web.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.services.impl.EA.EA0501ServicesImpl;

/**
 * Servlet implementation class EA0501QueryServlet
 */
@WebServlet("/EA0501Query.htm")
public class EA0501QueryServlet extends EA0501ControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.savePageData();
		this.savePageSelectRows();
		this.savePageMemRows();
		return "mergeClass";
	}
	
}
