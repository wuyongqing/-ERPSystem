package com.neusoft.web.impl;

public class EA0211Servlet extends EA0203ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("agreeChangeDorm", "ͬ�����벢�޸���Ϣ");
		this.savePageData();
		return "EA0203";
	}
}
