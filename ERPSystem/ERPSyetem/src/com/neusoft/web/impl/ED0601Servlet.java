package com.neusoft.web.impl;

public class ED0601Servlet extends ED06ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addCertificateRecord", "���֤�鷢�ż�¼");
		return "ED0601";
	}
}
