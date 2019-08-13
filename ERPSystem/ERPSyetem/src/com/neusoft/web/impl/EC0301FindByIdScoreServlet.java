package com.neusoft.web.impl;

public class EC0301FindByIdScoreServlet extends EC0301ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "EC0301AddScore";
	}

}
