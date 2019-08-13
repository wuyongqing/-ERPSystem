package com.neusoft.web.impl;

public class EA0801QueryServlet extends EA0801ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryWorkRecord";
	}

}
