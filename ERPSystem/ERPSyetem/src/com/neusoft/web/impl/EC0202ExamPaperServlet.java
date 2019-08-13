package com.neusoft.web.impl;

public class EC0202ExamPaperServlet extends EC0202ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		//System.out.println("1");
		this.savePageData();
		return "EC0202ExamPaper";
	}

}
