package com.neusoft.web.impl;

public class EA01AddServlet extends EA01ControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.update("addAccount", "账号添加","账号添加成功,账号为","ssa402");
		this.savePageDataForUpdate();
		return "queryAccount";
	}

}
