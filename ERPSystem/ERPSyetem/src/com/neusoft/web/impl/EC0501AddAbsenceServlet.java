package com.neusoft.web.impl;

public class EC0501AddAbsenceServlet extends EC0501ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("addAbsence", "Â¼Èë");
		return "EC0501AddAbsence";
	}

}
