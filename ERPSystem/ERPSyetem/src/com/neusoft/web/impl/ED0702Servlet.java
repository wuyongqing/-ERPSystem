package com.neusoft.web.impl;

public class ED0702Servlet extends ED07ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "ED0702";
	}
}
