package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��17��
 * @time ����11:51:34
 */
public class ED0601CheckFundRecordServlet extends ED0601ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("checkFundRecord", "����");
		this.savePageData();
		return "queryFundRecordED0601";
	}

}
