package com.neusoft.web.impl;

public class EA0702DeleteByIdServlet extends EA0702ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "É¾³ý");
		this.savePageDataForUpdate();
		return "querySviolation";
	}

}
