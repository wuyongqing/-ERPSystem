package com.neusoft.web.impl;

public class EC0201ModifyExamServlet extends EC0201ControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("modifyExam", "�޸�");
		return "EC0201AddExam";
	}

}
