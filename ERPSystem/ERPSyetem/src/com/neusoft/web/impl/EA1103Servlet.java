package com.neusoft.web.impl;

public class EA1103Servlet extends EA1101ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("passJournal", "���Ľ�ѧ��־");
		this.savePageData();
		return "EA1101";
	}
}