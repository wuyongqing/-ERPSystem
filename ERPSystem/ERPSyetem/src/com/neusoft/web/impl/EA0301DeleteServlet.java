package com.neusoft.web.impl;

public class EA0301DeleteServlet extends EA0301ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("batchDelete", "ɾ��");
		this.savePageDataForUpdate();
		return "queryClass";
	}

}
