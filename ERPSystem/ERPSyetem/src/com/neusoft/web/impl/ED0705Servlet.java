package com.neusoft.web.impl;

public class ED0705Servlet extends ED07ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyRewAndPun", "ÐÞ¸Ä½±³Í¼ÇÂ¼");
		return "ED0701";
	}
}
