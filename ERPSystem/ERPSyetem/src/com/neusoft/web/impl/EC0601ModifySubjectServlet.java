package com.neusoft.web.impl;

public class EC0601ModifySubjectServlet extends EC0601ControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		this.update("modifySubject", "ÐÞ¸Ä");
		return "EC0601AddSubject";
	}

}
