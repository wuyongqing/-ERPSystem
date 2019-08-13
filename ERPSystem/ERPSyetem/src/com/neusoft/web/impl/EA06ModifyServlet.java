package com.neusoft.web.impl;

public class EA06ModifyServlet extends EA06ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("modifyCourse","ÐÞ¸Ä");
		this.savePageDataForUpdate();
		return "queryCourse";
	}

}
