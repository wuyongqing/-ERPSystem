package com.neusoft.web.impl;


public class EC0801DelByIdMemberServlet extends EC0801ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		
		this.update("deleteById", "É¾³ý");
		this.savePageDataForDelete();
		//this.savePageData();
		return "EC0801QueryMember";
	}

}
