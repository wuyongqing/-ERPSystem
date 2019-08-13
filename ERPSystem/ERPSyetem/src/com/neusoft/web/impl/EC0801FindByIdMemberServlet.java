package com.neusoft.web.impl;

public class EC0801FindByIdMemberServlet extends EC0801ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "EC0801AddMember";
	}

}
