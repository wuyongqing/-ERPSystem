package com.neusoft.web.impl;


public class EC0601DelByIdSubjectServlet extends EC0601ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		
		this.update("deleteById", "É¾³ý");
		this.savePageDataForDelete();
		//this.savePageData();
		return "EC0601QuerySubject";
	}

}
