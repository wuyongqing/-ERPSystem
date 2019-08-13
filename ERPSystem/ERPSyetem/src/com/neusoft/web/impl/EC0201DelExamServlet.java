package com.neusoft.web.impl;

public class EC0201DelExamServlet extends EC0201ControllerSupport {

	@Override
	public String execute() throws Exception
	{
		System.out.println("1");
		this.update("batchDelete", "É¾³ý");
		this.savePageDataForDelete();
		return "EC0201QueryExam";
	}
}
