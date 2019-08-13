package com.neusoft.web.impl;

public class ED0604Servlet extends ED06ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delCertificateById", "É¾³ýÖ¤Êé¼ÇÂ¼");
		this.savePageDataForDelete();
		return "ED0602";
	}
}
