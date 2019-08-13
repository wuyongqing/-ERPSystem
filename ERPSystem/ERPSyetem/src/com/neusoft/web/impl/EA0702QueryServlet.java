package com.neusoft.web.impl;

public class EA0702QueryServlet extends EA0702ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "querySviolation";
	}

}
