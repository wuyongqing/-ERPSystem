package com.neusoft.web.impl;

public class ChangeClassServlet extends ED04ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addChangeClassRec", "���ת������");
		this.savePageData();
		return "changeClass";
	}
}
