package com.neusoft.web.impl;

import com.neusoft.web.impl.ED01ControllerSupport;

public class StuInfoModifyServlet extends ED01ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyStu", "ÐÞ¸Ä");
		return "stuInfoModify";
	}
}
