package com.neusoft.web.impl;

public class EA15DeleteByIdServlet extends EA15ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "É¾³ý");
		this.savePageDataForUpdate();
		return "queryProblem";
	}

}
