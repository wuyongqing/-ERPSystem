package com.neusoft.web.impl;

public class EA15SelectServlet extends EA15ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageSelectRows();
		return "addProblem";
	}

}
