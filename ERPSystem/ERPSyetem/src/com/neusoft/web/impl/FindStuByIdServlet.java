package com.neusoft.web.impl;

public class FindStuByIdServlet extends ED01ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "stuInfoModify";
	}
}
