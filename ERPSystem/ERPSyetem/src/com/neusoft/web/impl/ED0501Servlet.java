package com.neusoft.web.impl;

public class ED0501Servlet extends ED05ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addChangeDormRec", "�ύ�����������");
		return "ED05";
	}
}
