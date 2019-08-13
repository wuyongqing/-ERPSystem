package com.neusoft.web.impl;

public class EA0402FindByIdServlet extends EA0402ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.savePageDataForUpdate();
		this.savePageSelectRows();
		return "checkClass";
	}

}
