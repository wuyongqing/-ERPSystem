package com.neusoft.web.impl;

public class ED0603Servlet extends ED06ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "ED0601";
	}
}
