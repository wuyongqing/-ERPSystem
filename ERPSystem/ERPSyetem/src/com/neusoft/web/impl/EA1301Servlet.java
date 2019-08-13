package com.neusoft.web.impl;

public class EA1301Servlet extends EA1301ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "EA1301";
	}
}
