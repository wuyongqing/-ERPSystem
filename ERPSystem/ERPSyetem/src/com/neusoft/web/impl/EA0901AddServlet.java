package com.neusoft.web.impl;

public class EA0901AddServlet extends EA0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addVisitor", "Ìí¼Ó");
		return "addVisitor";
	}

}
