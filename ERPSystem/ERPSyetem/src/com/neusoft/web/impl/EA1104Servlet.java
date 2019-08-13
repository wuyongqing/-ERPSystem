package com.neusoft.web.impl;

public class EA1104Servlet extends EA1101ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("updateJournal", "ÐÞ¸Ä±¸×¢");
		return "EA1102";
	}
}
