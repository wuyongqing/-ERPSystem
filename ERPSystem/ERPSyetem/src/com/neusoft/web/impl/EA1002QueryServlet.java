package com.neusoft.web.impl;

public class EA1002QueryServlet extends EA1002ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInsAndRows(0);
		return "queryRoom";
	}

}
