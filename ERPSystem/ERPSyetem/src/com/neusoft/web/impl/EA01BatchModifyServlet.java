package com.neusoft.web.impl;

public class EA01BatchModifyServlet extends EA01ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("batchModify", "ÐÞ¸Ä");
		this.savePageDataForUpdate();
		return "queryAccount";
	}
}
