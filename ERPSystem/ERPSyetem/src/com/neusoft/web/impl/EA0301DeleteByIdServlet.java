package com.neusoft.web.impl;

public class EA0301DeleteByIdServlet extends EA0301ControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("deleteById", "ɾ��");
		this.savePageDataForUpdate();
		return "queryClass";
	}

}
