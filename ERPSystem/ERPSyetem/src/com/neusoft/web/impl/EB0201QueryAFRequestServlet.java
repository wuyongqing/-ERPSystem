package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月14日
 * @time 下午4:17:34
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
