package com.neusoft.web.impl;

public class EA06DeleteByIdServlet extends EA06ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "É¾³ý");
		this.savePageDataForUpdate();
		return "queryCourse";
	}

}
