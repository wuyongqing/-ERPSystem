package com.neusoft.web.impl;

public class EA0402AddServlet extends EA0402ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addClass", "添加","添加成功,班级编号为","aab303");
		return "addClass";
	}

}
