package com.neusoft.web.impl;

public class EA0210Servlet extends EA0202ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("rejectChangeStatus", "驳回申请并修改信息");
		this.savePageData();
		return "EA0202";
	}
}
