package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��14��
 * @time ����4:17:34
 */
public class EB0201QueryAFRequestServlet extends EB0201ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryAFRequestEB0201";
	}

}
