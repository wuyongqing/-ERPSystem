package com.neusoft.web.impl;

public class EC0601AddSubjectServlet extends EC0601ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("addSubject", "���");
		return "EC0601AddSubject";
	}

}
