package com.neusoft.web.impl;

public class EC0801ModifyMemberServlet extends EC0801ControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		this.update("modifyMember", "�޸�");
		return "EC0801AddMember";
	}

}
