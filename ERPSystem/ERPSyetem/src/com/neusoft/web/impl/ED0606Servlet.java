package com.neusoft.web.impl;

public class ED0606Servlet extends ED06ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("batchDelete", "É¾³ýÖ¤Êé¼ÇÂ¼");
		this.savePageDataForDelete();
		return "ED0602";
	}
}
