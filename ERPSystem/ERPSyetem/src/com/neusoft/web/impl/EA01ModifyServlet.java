package com.neusoft.web.impl;

public class EA01ModifyServlet extends EA01ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyAccount", "ÐÞ¸Ä");
		this.savePageDataForUpdate();
		return "queryAccount";
	}
}
