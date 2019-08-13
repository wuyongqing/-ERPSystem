package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月11日
 * @time 下午2:45:40
 * 添加经费使用记录
 */
public class EC1401AddRecordServlet extends EC1401ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("addRecord", "添加");
		return "addRecordEC1401";
	}

}
