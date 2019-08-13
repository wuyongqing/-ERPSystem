package com.neusoft.web.impl;

public class ED0602Servlet extends ED06ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "ED0602";
	}
}
