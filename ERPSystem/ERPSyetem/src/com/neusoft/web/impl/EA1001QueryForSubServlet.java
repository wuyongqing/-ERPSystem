package com.neusoft.web.impl;

public class EA1001QueryForSubServlet extends EA1001ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryDorForSub";
	}
}
