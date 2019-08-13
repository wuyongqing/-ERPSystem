package com.neusoft.web.impl;

public class EA06DeleteServlet extends EA06ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("batchDelete", "É¾³ý");
		this.savePageDataForUpdate();
		return "queryCourse";
	}
}