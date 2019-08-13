package com.neusoft.web.impl;

public class EA1001AddServlet extends EA1001ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addDormitory", "Ìí¼Ó");
		return "addDormitory";
	}
}
