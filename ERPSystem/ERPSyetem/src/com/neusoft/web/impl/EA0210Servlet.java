package com.neusoft.web.impl;

public class EA0210Servlet extends EA0202ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("rejectChangeStatus", "�������벢�޸���Ϣ");
		this.savePageData();
		return "EA0202";
	}
}
