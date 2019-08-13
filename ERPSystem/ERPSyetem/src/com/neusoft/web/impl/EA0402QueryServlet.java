package com.neusoft.web.impl;

public class EA0402QueryServlet extends EA0402ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		this.savePageSelectRows();
		return "addClass";
	}

}
