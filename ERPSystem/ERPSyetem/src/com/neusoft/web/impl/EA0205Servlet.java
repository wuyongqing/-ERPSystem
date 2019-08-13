package com.neusoft.web.impl;

public class EA0205Servlet extends EA0203ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "EA0203";
	}
}
