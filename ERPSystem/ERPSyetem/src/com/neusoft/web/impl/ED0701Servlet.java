package com.neusoft.web.impl;

public class ED0701Servlet extends ED07ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addRewAndPunRecord", "��ӽ��ͼ�¼");
		return "ED0701";
	}
}
