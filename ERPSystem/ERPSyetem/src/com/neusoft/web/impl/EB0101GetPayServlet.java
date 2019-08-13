package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月16日
 * @time 下午2:26:43
 */
public class EB0101GetPayServlet extends EB0101ControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("getPay","缴费");
		this.savePageData();
		return "queryPayEB0101";
	}

}
