package com.neusoft.web.impl;

public class ED0706Servlet extends ED07ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("batchDelete", "ɾ�����ͼ�¼");
		this.savePageDataForDelete();
		return "ED0702";
	}
}
