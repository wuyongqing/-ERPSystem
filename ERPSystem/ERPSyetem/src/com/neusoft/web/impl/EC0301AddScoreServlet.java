package com.neusoft.web.impl;

public class EC0301AddScoreServlet extends EC0301ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("addScore", "¼��");
		return "EC0301AddScore";
	}

}
