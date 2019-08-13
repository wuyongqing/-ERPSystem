package com.neusoft.web.impl;

public class ED0704Servlet extends ED07ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delRewAndPunById", "É¾³ý½±³Í¼ÇÂ¼");
		this.savePageDataForDelete();
		return "ED0702";
	}
}
