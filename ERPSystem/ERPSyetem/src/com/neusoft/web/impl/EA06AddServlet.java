package com.neusoft.web.impl;

public class EA06AddServlet extends EA06ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addCourse", "���", "��ӿγ̳ɹ�,�γ�����Ϊ", "aab502");
		return "addCourse";
	}

}
