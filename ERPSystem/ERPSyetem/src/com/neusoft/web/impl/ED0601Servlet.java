package com.neusoft.web.impl;

public class ED0601Servlet extends ED06ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addCertificateRecord", "添加证书发放记录");
		return "ED0601";
	}
}
