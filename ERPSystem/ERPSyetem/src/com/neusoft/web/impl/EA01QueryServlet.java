package com.neusoft.web.impl;

public class EA01QueryServlet extends EA01ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryAccount";
	}
}
