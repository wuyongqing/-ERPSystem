package com.neusoft.web.impl;

public class ED0701Servlet extends ED07ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addRewAndPunRecord", "Ìí¼Ó½±³Í¼ÇÂ¼");
		return "ED0701";
	}
}
