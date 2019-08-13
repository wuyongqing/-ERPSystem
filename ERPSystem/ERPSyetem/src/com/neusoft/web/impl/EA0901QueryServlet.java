package com.neusoft.web.impl;

public class EA0901QueryServlet extends EA0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryVisitor";
	}

}
