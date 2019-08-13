package com.neusoft.web.impl;

public final class QueryStuServlet extends ED01ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryStu";
	}
}
