package com.neusoft.web.impl;
//查看单个学生状态申请记录
public class EA0204Servlet extends EA0202ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "stuStatusReq";
	}
}
