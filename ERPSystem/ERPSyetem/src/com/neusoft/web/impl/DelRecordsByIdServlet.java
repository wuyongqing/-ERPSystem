package com.neusoft.web.impl;

public class DelRecordsByIdServlet extends ED02ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delRecordsById", "ȡ��");
		this.savePageData();
		return "stuReqRecords";
	}

}
