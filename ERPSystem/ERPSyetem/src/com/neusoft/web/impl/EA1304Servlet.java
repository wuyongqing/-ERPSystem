package com.neusoft.web.impl;

public class EA1304Servlet extends EA1301ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("agreeTeachPlan", "����ͨ����ѧ����");
		this.savePageData();
		return "EA1301";
	}
}
