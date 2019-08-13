package com.neusoft.web.impl;

public class EA1303Servlet extends EA1301ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.saveSubPageInstance();
		return "EA1303";
	}
}
