package com.neusoft.web.impl;

public class EA0208Servlet extends EA0201ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("rejectChangeClass", "�������벢�޸���Ϣ");
		this.savePageData();
		return "EA0201";
	}
}
