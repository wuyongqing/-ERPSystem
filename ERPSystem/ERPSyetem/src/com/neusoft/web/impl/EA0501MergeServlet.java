package com.neusoft.web.impl;

public class EA0501MergeServlet extends EA0501ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("mergeClass", "�ϲ�");
		this.savePageSelectRows();
		this.savePageMemRows();
		return "mergeClass";
	}

}
