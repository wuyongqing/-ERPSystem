package com.neusoft.web.impl;

public class EA0901DeleteByIdServlet extends EA0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "É¾³ý");
		this.savePageDataForUpdate();
		return "queryVisitor";
	}

}
