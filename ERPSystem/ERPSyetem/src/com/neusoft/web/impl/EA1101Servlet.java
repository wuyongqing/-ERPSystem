package com.neusoft.web.impl;

public class EA1101Servlet extends EA1101ControllerSupport 
{
	@Override
	public String execute() throws Exception {
		this.savePageData();
		return "EA1101";
	}
}
