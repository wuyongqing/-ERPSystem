package com.neusoft.web.impl;

public class EC0801AddMemberServlet extends EC0801ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("addMember", "���");
		return "EC0801AddMember";
	}

}
