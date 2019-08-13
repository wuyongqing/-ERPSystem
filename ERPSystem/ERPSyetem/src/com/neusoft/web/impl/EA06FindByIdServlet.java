package com.neusoft.web.impl;

public class EA06FindByIdServlet extends EA06ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "addCourse";
	}
}
