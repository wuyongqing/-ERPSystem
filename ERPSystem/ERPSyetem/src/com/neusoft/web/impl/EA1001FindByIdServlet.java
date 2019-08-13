package com.neusoft.web.impl;

public class EA1001FindByIdServlet extends EA1001ControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.savePageInstance();
		return "addDormitory";
	}

}
