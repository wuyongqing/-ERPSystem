package com.neusoft.web.impl;
//�鿴����ѧ��״̬�����¼
public class EA0204Servlet extends EA0202ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "stuStatusReq";
	}
}
