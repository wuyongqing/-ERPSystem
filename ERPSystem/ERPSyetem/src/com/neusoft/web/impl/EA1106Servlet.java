package com.neusoft.web.impl;

public class EA1106Servlet extends EA1101ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("batchPassJournal", "Ò»¼üÅúÔÄ");
		this.savePageData();
		return "EA1101";
	}
}
