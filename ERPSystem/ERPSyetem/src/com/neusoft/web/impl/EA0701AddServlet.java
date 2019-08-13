package com.neusoft.web.impl;

public class EA0701AddServlet extends EA0701ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addViolation", "Ìí¼Ó");
		return "addTviolation";
	}

}
