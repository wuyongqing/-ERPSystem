package com.neusoft.web.impl;
//����ҳ�����鿴����ת�������¼
public class EA0202Servlet extends EA0201ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.savePageInstance();
		return "changeClass";
	}
}
