package com.neusoft.web.impl;

public class EA0208Servlet extends EA0201ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("rejectChangeClass", "驳回申请并修改信息");
		this.savePageData();
		return "EA0201";
	}
}
