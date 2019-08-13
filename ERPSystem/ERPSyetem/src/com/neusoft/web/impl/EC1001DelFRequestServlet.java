package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月12日
 * @time 下午4:48:17
 */
public class EC1001DelFRequestServlet extends EC1001ControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("batchDelete", "批量删除");
		this.savePageDataForDelete();
		return "queryFRequestEC1001";
	}

}
