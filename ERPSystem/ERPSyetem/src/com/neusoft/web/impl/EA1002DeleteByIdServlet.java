package com.neusoft.web.impl;

public class EA1002DeleteByIdServlet extends EA1002ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "É¾³ý");
		this.savePageInsAndRows(1);
		return "queryRoom";
	}

}
