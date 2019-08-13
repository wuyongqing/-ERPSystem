package com.neusoft.web.impl;

public class EA0211Servlet extends EA0203ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("agreeChangeDorm", "同意申请并修改信息");
		this.savePageData();
		return "EA0203";
	}
}
