package com.neusoft.web.impl;

public class EA0702ModifyServlet extends EA0702ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyViolation", "�޸�");
		this.savePageDataForUpdate();
		return "querySviolation";
	}

}
