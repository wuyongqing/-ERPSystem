package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月12日
 * @time 下午9:39:33
 */
public class EA1401AgreeCFRequestServlet extends EA1401ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("agreeCFRequest", "同意申请");
		this.savePageData();
		return "queryCFRequestEA1401";
	}
}
