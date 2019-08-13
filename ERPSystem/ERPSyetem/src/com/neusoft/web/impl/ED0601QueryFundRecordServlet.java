package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月17日
 * @time 上午9:34:03
 */
public class ED0601QueryFundRecordServlet extends ED0601ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryFundRecordED0601";
	}

}
