package com.neusoft.web.impl;

public class EC0202PrintPaperServlet extends EC0202ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		//System.out.println("1");
		this.saveSubPageData2();
		return "EC0202PrintPaper";
	}

}
