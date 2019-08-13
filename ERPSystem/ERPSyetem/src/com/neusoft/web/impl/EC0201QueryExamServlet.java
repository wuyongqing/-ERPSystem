package com.neusoft.web.impl;

public final class EC0201QueryExamServlet extends EC0201ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "EC0201QueryExam";
	}
}
