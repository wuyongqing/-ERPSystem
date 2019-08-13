package com.neusoft.web.impl;

public class ED0703Servlet extends ED07ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "ED0701";
	}
}
