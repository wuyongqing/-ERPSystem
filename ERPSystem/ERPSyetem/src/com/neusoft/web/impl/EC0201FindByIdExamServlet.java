package com.neusoft.web.impl;

public class EC0201FindByIdExamServlet extends EC0201ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "EC0201AddExam";
	}

}
