package com.neusoft.web.impl;

public class EC0601FindByIdSubjectServlet extends EC0601ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "EC0601AddSubject";
	}

}
