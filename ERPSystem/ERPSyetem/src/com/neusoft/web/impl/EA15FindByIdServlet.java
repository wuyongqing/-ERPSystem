package com.neusoft.web.impl;

public class EA15FindByIdServlet extends EA15ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "addProblem";
	}

}
