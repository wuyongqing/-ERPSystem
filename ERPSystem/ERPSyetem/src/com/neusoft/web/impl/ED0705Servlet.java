package com.neusoft.web.impl;

public class ED0705Servlet extends ED07ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyRewAndPun", "�޸Ľ��ͼ�¼");
		return "ED0701";
	}
}
