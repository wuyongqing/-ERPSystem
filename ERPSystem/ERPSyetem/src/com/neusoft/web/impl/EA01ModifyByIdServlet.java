package com.neusoft.web.impl;

public class EA01ModifyByIdServlet extends EA01ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyById", "�޸�");
		this.savePageDataForUpdate();
		return "queryAccount";
	}
	
}
