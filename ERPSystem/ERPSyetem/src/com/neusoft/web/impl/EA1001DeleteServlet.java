package com.neusoft.web.impl;

public class EA1001DeleteServlet extends EA1001ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("batchDelete", "ɾ��");
		this.savePageDataForUpdate();
		return "queryDormitory";
	}

}
