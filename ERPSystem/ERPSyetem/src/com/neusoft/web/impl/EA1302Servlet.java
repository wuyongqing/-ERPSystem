package com.neusoft.web.impl;

public class EA1302Servlet extends EA1301ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.saveSubPageData();
		this.showDto();
		return "EA1302";
	}
}
