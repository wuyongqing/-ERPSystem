package com.neusoft.web.impl;

public final class EC0801QueryMemberServlet extends EC0801ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "EC0801QueryMember";
	}
}
