package com.neusoft.web.impl;

public class EA06DeleteServlet extends EA06ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("batchDelete", "ɾ��");
		this.savePageDataForUpdate();
		return "queryCourse";
	}
}