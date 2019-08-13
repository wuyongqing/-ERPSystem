package com.neusoft.web.impl;

public class EA1305Servlet extends EA1301ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("rejectTeachPlan", "审批驳回教学方案");
		this.savePageData();
		return "EA1301";
	}
}
