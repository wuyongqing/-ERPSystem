package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月15日
 * @time 下午11:16:37
 */
public class EB0101QueryPayServlet extends EB0101ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryPayEB0101";
	}

}
