package com.neusoft.web.impl;

public final class EC0301QueryScoreServlet extends EC0301ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "EC0301QueryScore";
	}
}
