package com.neusoft.web.impl;

public class EA0701ModifyServlet extends EA0701ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyViolation", "�޸�");
		this.savePageDataForUpdate();
		return "queryTviolation";
	}

}
