package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月10日
 * @time 下午5:58:00
 * 删除教研底稿
 */
public class EC1101DelByIdDraftServlet extends EC1101ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delById", "删除底稿");
		this.savePageDataForDelete();
		return "queryDraftEC1101";
	}

}
