package com.neusoft.web.impl;

public class EA15AddServlet extends EA15ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("addProblem", "���");
		return "addProblem";
	}

}
