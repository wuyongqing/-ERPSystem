package com.neusoft.web.impl;

public class EA0209Servlet extends EA0202ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("agreeChangeStatus", "同意状态变更并修改信息");
		this.savePageData();
		return "EA0202";
	}
}
