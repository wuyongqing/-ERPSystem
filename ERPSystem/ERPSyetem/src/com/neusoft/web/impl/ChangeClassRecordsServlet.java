package com.neusoft.web.impl;

public class ChangeClassRecordsServlet extends ED04ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "changeClassRecords";
	}
}
