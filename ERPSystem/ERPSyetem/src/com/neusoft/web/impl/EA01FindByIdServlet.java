package com.neusoft.web.impl;

public class EA01FindByIdServlet extends EA01ControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "addAccount";
	}

}
