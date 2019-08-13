package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月17日
 * @time 上午11:51:34
 */
public class ED0601CheckFundRecordServlet extends ED0601ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("checkFundRecord", "操作");
		this.savePageData();
		return "queryFundRecordED0601";
	}

}
