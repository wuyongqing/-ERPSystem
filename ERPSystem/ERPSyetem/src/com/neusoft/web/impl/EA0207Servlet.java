package com.neusoft.web.impl;

public class EA0207Servlet extends EA0201ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("agreeChangeClass", "同意申请并修改信息");
		this.savePageData();
		return "EA0201";
	}
}
