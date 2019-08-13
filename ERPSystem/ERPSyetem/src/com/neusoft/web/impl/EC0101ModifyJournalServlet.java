package com.neusoft.web.impl;

public class EC0101ModifyJournalServlet extends EC0101ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("modifyJournal", "ÐÞ¸Ä");
		return "EC0101WriteJournal";
	}
}
