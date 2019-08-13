package com.neusoft.web.impl;

public class EA1201FindByIdResultServlet extends EA1201ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "EA1202LookResult";
	}
}
