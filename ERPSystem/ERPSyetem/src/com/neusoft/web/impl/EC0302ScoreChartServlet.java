package com.neusoft.web.impl;

public class EC0302ScoreChartServlet extends EC0302ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.savePageData();
		return "EC0302ScoreChart";
	}
}
