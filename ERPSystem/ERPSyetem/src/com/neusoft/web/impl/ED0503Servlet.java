package com.neusoft.web.impl;

public class ED0503Servlet extends ED05ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		System.out.println("����ɾ����ת����");
		//this.update("delDorRecById", "ȡ�������ת����");
		this.savePageDataForDelete();
		return "ED0502";
	}
}
