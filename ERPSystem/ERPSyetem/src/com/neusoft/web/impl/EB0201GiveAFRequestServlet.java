package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��14��
 * @time ����6:02:08
 */
public class EB0201GiveAFRequestServlet extends EB0201ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("give", "����");
		this.savePageData();
		return "queryAFRequestEB0201";
	}

}
