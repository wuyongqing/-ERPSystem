package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月10日
 * @time 下午6:59:08
 * 批量删除教研底稿
 */
public class EC1101DelDraftServlet extends EC1101ControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("batchDelete", "批量删除");
		this.savePageDataForDelete();
		return "queryDraftEC1101";
	}

}
