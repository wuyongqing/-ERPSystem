package com.neusoft.web.impl;

public class EC1201RequestToLookServlet extends EC1201ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("requestToLookResult", "Ã·Ωª≤È‘ƒ…Í«Î");
		this.savePageDataForUpdate();
		return "queryResultEC1201";
	}
}
