package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月14日
 * @time 下午3:40:25
 */
public class EC1401SubmitAllRecordServlet extends EC1401ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("submitRecord", "提交");
		this.savePageData();
		return "queryRecordEC1401";
	}

}
