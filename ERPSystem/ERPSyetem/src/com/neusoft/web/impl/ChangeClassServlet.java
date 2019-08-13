package com.neusoft.web.impl;

public class ChangeClassServlet extends ED04ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addChangeClassRec", "Ìí¼Ó×ª°àÉêÇë");
		this.savePageData();
		return "changeClass";
	}
}
