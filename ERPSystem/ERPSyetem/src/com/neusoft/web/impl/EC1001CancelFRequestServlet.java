package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月12日
 * @time 下午3:52:59
 */
public class EC1001CancelFRequestServlet extends EC1001ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("cancelRequest", "申请取消");
		this.savePageData();
		return "queryFRequestEC1001";
	}

}
