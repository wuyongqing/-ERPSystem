package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月14日
 * @time 下午6:02:08
 */
public class EB0201GiveAFRequestServlet extends EB0201ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("give", "操作");
		this.savePageData();
		return "queryAFRequestEB0201";
	}

}
