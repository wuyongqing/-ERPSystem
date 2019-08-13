package com.neusoft.web.impl;

public final class EC0101QueryJournalServlet extends EC0101ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "EC0101QueryJournal";
	}
}
