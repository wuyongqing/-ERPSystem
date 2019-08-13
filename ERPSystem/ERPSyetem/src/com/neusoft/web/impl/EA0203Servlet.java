package com.neusoft.web.impl;
//查询所有的学生状态申请记录
public class EA0203Servlet extends EA0202ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "EA0202";
	}
}
