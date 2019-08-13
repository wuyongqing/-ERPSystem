package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月12日
 * @time 下午7:33:46
 */
public class EA1401QueryCFRequestServlet extends EA1401ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryCFRequestEA1401";
	}

}
