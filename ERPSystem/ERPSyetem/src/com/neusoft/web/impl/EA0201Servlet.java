package com.neusoft.web.impl;
//��ѯ���е�ת�������¼
public class EA0201Servlet extends EA0201ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "EA0201";
	}
}
