package com.neusoft.web.impl;

public class EC0301ModifyScoreServlet extends EC0301ControllerSupport 
{

	@Override
	public String execute() throws Exception
	{
		this.update("modifyScore", "�޸�");
		return "EC0301AddScore";
	}

}
