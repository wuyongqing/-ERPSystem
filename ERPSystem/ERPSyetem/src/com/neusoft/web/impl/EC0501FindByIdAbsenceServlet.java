package com.neusoft.web.impl;

public class EC0501FindByIdAbsenceServlet extends EC0501ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "EC0501AddAbsence";
	}

}
