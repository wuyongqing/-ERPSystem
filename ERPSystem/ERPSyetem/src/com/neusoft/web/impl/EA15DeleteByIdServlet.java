package com.neusoft.web.impl;

public class EA15DeleteByIdServlet extends EA15ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "ɾ��");
		this.savePageDataForUpdate();
		return "queryProblem";
	}

}
