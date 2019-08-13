package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月13日
 * @time 下午3:56:49
 */
public class EC1401DelByIdRecordServlet extends EC1401ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delByIdRecord", "删除记录");
		this.savePageDataForDelete();
		return "queryRecordEC1401";
	}

}
