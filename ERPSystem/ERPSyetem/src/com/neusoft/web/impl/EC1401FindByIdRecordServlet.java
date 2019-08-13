package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月11日
 * @time 下午3:22:04
 * 根据主键查找经费使用记录
 */
public class EC1401FindByIdRecordServlet extends EC1401ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "addRecordEC1401";
	}

}
