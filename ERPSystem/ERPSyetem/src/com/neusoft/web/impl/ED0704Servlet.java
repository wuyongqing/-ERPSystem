package com.neusoft.web.impl;

public class ED0704Servlet extends ED07ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delRewAndPunById", "ɾ�����ͼ�¼");
		this.savePageDataForDelete();
		return "ED0702";
	}
}
