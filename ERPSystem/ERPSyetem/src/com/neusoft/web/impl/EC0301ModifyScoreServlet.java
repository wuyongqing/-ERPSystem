package com.neusoft.web.impl;

public class EC0301ModifyScoreServlet extends EC0301ControllerSupport 
{

	@Override
	public String execute() throws Exception
	{
		this.update("modifyScore", "ÐÞ¸Ä");
		return "EC0301AddScore";
	}

}
