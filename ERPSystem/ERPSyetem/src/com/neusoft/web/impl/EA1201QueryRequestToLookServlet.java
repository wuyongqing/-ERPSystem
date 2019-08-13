package com.neusoft.web.impl;

public class EA1201QueryRequestToLookServlet extends EA1201ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "EA1201GiveRightToLook";
	}
}
