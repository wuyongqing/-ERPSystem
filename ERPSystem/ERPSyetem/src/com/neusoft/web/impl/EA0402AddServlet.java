package com.neusoft.web.impl;

public class EA0402AddServlet extends EA0402ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addClass", "���","��ӳɹ�,�༶���Ϊ","aab303");
		return "addClass";
	}

}
