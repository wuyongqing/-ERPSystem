package com.neusoft.web.impl;

public class StuReqRecordsServlet extends ED02ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "stuReqRecords";
	}
}
