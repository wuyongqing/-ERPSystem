package com.neusoft.web.impl;

import com.neusoft.web.impl.ED01ControllerSupport;

public class StuStatusReqServlet extends ED01ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		this.update("addStatusRecord", "ÃÌº”…Í«Î");
		return "stuStatusReq";
	}
}
