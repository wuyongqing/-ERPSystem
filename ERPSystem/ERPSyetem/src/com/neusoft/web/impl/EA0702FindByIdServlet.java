package com.neusoft.web.impl;

public class EA0702FindByIdServlet extends EA0702ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "addSviolation";
	}

}
