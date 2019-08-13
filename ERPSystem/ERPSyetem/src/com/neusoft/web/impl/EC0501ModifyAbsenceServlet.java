package com.neusoft.web.impl;

public class EC0501ModifyAbsenceServlet extends EC0501ControllerSupport {

	@Override
	public String execute() throws Exception
	{
		this.update("modifyAbsence", "ÐÞ¸Ä");
		return "EC0501AddAbsence";
	}

}
