package com.neusoft.web.impl;

public class EA0301QueryForSubServlet extends EA0301ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryClassForSub";
	}

}
