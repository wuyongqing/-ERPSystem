package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月11日
 * @time 上午11:33:16
 * 不定条件查询经费使用记录
 */
public class EC1401QueryRecordServlet extends EC1401ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryRecordEC1401";
	}
}
