package com.neusoft.web.impl;

public class EC0201AddExamServlet extends EC0201ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("addExam", "���");
		return "EC0201AddExam";
	}

}
