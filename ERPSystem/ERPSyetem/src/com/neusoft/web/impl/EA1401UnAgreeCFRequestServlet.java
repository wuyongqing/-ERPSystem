package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月12日
 * @time 下午9:43:02
 */
public class EA1401UnAgreeCFRequestServlet extends EA1401ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("unAgreeCFRequest","拒绝申请");
		this.savePageData();
		return "queryCFRequestEA1401";
	}

}
