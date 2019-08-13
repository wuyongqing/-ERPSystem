package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月13日
 * @time 下午2:32:17
 */
public class EC1401ModifyRecordServlet extends EC1401ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("modifyRecord", "修改记录");
		return "addRecordEC1401";
	}

}
