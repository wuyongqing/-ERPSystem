package com.neusoft.web.impl;


public class EC0201DelByIdExamServlet extends EC0201ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		
		this.update("deleteById", "ɾ��");
		this.savePageDataForDelete();
		//this.savePageData();
		return "EC0201QueryExam";
	}

}
