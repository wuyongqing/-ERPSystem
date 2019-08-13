package com.neusoft.web.impl;

public class EA1201RejectRequestServlet extends EA1201ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("rejectRequestToLook", "≤µªÿ≤Èø¥…Í«Î");
		this.savePageDataForUpdate();
		return "EA1201GiveRightToLook";
	}
}
