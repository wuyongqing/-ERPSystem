package com.neusoft.web.impl;

public class EA15DeleteServlet extends EA15ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("batchDelete","É¾³ý");
		this.savePageDataForUpdate();
		return "queryProblem";
	}

}
