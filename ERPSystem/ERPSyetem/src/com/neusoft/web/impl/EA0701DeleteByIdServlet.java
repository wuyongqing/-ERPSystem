package com.neusoft.web.impl;

public class EA0701DeleteByIdServlet extends EA0701ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "ɾ��");
		this.savePageDataForUpdate();
		return "queryTviolation";
	}

}
