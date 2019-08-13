package com.neusoft.web.impl;

public class EA0702DeleteServlet extends EA0702ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("batchDelete", "É¾³ý");
		this.savePageDataForUpdate();
		return "querySviolation";
	}

}
