package com.neusoft.web.impl;
//查询所有的转班申请记录
public class EA0201Servlet extends EA0201ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "EA0201";
	}
}
