package com.neusoft.web.impl;

public class EA0901FindByIdServlet extends EA0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "addVisitor";
	}

}
