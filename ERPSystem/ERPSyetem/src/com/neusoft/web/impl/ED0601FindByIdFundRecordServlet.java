package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��17��
 * @time ����10:54:22
 */
public class ED0601FindByIdFundRecordServlet extends ED0601ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "lookFundRecordED0601";
	}

}
