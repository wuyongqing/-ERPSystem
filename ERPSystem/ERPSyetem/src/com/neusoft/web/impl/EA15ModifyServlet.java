package com.neusoft.web.impl;

public class EA15ModifyServlet extends EA15ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyProblem", "�޸�");
		this.savePageDataForUpdate();
		return "queryProblem";
	}

}
