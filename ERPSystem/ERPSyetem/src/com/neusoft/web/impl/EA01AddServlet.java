package com.neusoft.web.impl;

public class EA01AddServlet extends EA01ControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.update("addAccount", "�˺����","�˺���ӳɹ�,�˺�Ϊ","ssa402");
		this.savePageDataForUpdate();
		return "queryAccount";
	}

}
