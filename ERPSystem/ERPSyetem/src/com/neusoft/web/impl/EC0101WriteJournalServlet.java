package com.neusoft.web.impl;

public class EC0101WriteJournalServlet extends EC0101ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("write", "Ìí¼Ó");
		return "EC0101WriteJournal";
	}

}
