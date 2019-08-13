package com.neusoft.web.impl;

public class EA1201PassRequestServlet extends EA1201ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("passRequestToLook", "同意查看申请");
		this.savePageDataForUpdate();
		return "EA1201GiveRightToLook";
	}
}
