package com.neusoft.web.impl;
//审批页面点击查看单个转班申请记录
public class EA0202Servlet extends EA0201ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.savePageInstance();
		return "changeClass";
	}
}
