package com.neusoft.web.impl;

public class ED0605Servlet extends ED06ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyCertificate", "�޸�֤���¼");
		return "ED0601";
	}
}
