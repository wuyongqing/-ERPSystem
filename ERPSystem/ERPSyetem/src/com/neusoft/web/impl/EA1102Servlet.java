package com.neusoft.web.impl;

public class EA1102Servlet extends EA1101ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "EA1102";
	}
}
