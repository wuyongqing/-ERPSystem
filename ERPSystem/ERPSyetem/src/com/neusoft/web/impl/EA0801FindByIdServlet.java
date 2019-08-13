package com.neusoft.web.impl;

public class EA0801FindByIdServlet extends EA0801ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "checkWorkRecord";
	}

}
