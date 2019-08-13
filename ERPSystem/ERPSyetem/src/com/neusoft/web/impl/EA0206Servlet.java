package com.neusoft.web.impl;

public class EA0206Servlet extends EA0203ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "ED05";
	}
}
