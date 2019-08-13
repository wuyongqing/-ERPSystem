package com.neusoft.web.impl;

public final class EC0601QuerySubjectServlet extends EC0601ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "EC0601QuerySubject";
	}
}
