package com.neusoft.web.impl;

public class EA0701FindByIdServlet extends EA0701ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "addTviolation";
	}

}
