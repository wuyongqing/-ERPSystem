package com.neusoft.web.impl;

public class EA1103Servlet extends EA1101ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("passJournal", "批阅教学日志");
		this.savePageData();
		return "EA1101";
	}
}