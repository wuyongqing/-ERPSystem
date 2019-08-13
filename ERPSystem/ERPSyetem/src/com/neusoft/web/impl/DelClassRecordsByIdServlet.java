package com.neusoft.web.impl;

public class DelClassRecordsByIdServlet extends ED04ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delClassRecordsById", "È¡Ïû");
		this.savePageData();
		return "changeClassRecords";
	}
}