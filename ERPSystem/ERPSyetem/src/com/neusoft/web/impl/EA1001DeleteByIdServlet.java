package com.neusoft.web.impl;

public class EA1001DeleteByIdServlet extends EA1001ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "É¾³ý");
		this.savePageDataForUpdate();
		return "queryDormitory";
	}

}
