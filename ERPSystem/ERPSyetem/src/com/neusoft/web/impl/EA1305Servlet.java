package com.neusoft.web.impl;

public class EA1305Servlet extends EA1301ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("rejectTeachPlan", "�������ؽ�ѧ����");
		this.savePageData();
		return "EA1301";
	}
}
