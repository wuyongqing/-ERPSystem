package com.neusoft.web.impl;

public class EA15QueryServlet extends EA15ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		this.savePageSelectRows();
		return "queryProblem";
	}

}
