package com.neusoft.web.impl;

import com.neusoft.web.impl.EA0901ControllerSupport;

public class EA0901DeleteServlet extends EA0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("batchDelete", "É¾³ý");
		this.savePageDataForUpdate();
		return "queryVisitor";
	}

}
