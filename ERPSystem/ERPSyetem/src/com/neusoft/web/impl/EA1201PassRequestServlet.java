package com.neusoft.web.impl;

public class EA1201PassRequestServlet extends EA1201ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("passRequestToLook", "ͬ��鿴����");
		this.savePageDataForUpdate();
		return "EA1201GiveRightToLook";
	}
}
