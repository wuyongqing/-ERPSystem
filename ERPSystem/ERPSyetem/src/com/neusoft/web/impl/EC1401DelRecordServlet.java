package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月13日
 * @time 下午4:12:07
 */
public class EC1401DelRecordServlet extends EC1401ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("batchDelete","批量删除");
		this.savePageDataForDelete();
		return "queryRecordEC1401";
	}

}
