package com.neusoft.web.impl;
//��ѯ���е�ѧ��״̬�����¼
public class EA0203Servlet extends EA0202ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "EA0202";
	}
}
