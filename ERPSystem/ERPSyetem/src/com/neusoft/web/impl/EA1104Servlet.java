package com.neusoft.web.impl;

public class EA1104Servlet extends EA1101ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("updateJournal", "�޸ı�ע");
		return "EA1102";
	}
}
