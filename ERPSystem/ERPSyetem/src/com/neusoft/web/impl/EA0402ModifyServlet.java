package com.neusoft.web.impl;

public class EA0402ModifyServlet extends EA0402ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyClass", "�޸�");
		this.savePageInsForUpdate();
		return "checkClass";
	}

}
