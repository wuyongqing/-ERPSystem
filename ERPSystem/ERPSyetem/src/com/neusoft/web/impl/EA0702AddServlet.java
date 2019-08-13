package com.neusoft.web.impl;

public class EA0702AddServlet extends EA0702ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addViolation", "Ìí¼Ó");
		return "addSviolation";
	}

}
