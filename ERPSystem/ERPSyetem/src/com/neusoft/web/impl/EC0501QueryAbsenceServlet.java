package com.neusoft.web.impl;

public final class EC0501QueryAbsenceServlet extends EC0501ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "EC0501QueryAbsence";
	}
}
