package com.neusoft.web.impl;

public class EA06AddServlet extends EA06ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addCourse", "添加", "添加课程成功,课程名称为", "aab502");
		return "addCourse";
	}

}
