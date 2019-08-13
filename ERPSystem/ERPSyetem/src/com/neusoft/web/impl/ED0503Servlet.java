package com.neusoft.web.impl;

public class ED0503Servlet extends ED05ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		System.out.println("即将删除调转申请");
		//this.update("delDorRecById", "取消宿舍调转申请");
		this.savePageDataForDelete();
		return "ED0502";
	}
}
