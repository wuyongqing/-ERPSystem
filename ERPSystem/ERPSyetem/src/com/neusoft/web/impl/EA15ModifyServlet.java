package com.neusoft.web.impl;

public class EA15ModifyServlet extends EA15ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyProblem", "ÐÞ¸Ä");
		this.savePageDataForUpdate();
		return "queryProblem";
	}

}
