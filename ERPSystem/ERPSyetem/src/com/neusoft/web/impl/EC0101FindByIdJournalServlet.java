package com.neusoft.web.impl;

public class EC0101FindByIdJournalServlet extends EC0101ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "EC0101WriteJournal";
	}

}
