package com.neusoft.web.impl;

public class ED0604Servlet extends ED06ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delCertificateById", "ɾ��֤���¼");
		this.savePageDataForDelete();
		return "ED0602";
	}
}
