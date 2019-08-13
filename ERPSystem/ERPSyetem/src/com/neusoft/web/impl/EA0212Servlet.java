package com.neusoft.web.impl;

public class EA0212Servlet extends EA0203ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("rejectChangeDorm", "驳回申请并修改信息");
		this.savePageData();
		return "EA0203";
	}
}
