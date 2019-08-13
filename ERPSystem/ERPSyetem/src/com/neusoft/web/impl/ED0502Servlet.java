package com.neusoft.web.impl;

public class ED0502Servlet extends ED05ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "ED0502";
	}
}
