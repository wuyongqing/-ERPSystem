package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��12��
 * @time ����9:39:33
 */
public class EA1401AgreeCFRequestServlet extends EA1401ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("agreeCFRequest", "ͬ������");
		this.savePageData();
		return "queryCFRequestEA1401";
	}
}
