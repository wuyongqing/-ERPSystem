package com.neusoft.web.impl;

public class EA0209Servlet extends EA0202ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("agreeChangeStatus", "ͬ��״̬������޸���Ϣ");
		this.savePageData();
		return "EA0202";
	}
}
