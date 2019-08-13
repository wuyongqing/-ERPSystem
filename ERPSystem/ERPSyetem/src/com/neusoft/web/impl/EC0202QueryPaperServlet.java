package com.neusoft.web.impl;

public class EC0202QueryPaperServlet extends EC0202ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		//System.out.println("1");
		this.saveSubPageData();
		return "EC0202ExamPaper";
	}

}
