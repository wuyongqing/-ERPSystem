package com.neusoft.web.impl;

public class EA1001ModifyServlet extends EA1001ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyDormitory", "ÐÞ¸Ä");
		this.savePageDataForUpdate();
		return "queryDormitory";
	}
}
