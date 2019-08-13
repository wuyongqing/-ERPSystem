package com.neusoft.web.impl;

public class EC0202AddPaperServlet extends EC0202ControllerSupport {

	@Override
	public String execute() throws Exception
	{
		
		this.update("batchAdd", "ÅúÁ¿Ìí¼Ó");
		this.saveSubPageData2();
		System.out.println("1");
		return "EC0202ExamPaper";
	}
}
