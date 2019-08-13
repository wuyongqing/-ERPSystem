package com.neusoft.web.impl;

public class EC0801ModifyMemberServlet extends EC0801ControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		this.update("modifyMember", "ÐÞ¸Ä");
		return "EC0801AddMember";
	}

}
