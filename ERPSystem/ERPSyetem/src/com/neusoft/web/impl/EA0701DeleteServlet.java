package com.neusoft.web.impl;

public class EA0701DeleteServlet extends EA0701ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("batchDelete", "ɾ��");
		this.savePageDataForUpdate();
		return "queryTviolation";
	}

}
