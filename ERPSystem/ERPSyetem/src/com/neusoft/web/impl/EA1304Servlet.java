package com.neusoft.web.impl;

public class EA1304Servlet extends EA1301ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("agreeTeachPlan", "审批通过教学方案");
		this.savePageData();
		return "EA1301";
	}
}
