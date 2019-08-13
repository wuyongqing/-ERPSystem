package com.neusoft.web.impl;

public class EA06QueryServlet extends EA06ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryCourse";
	}
}
