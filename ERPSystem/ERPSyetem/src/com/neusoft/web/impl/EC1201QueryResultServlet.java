package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��9��
 * @time ����11:14:31
 * ����������ѯ���н��
 */
public class EC1201QueryResultServlet extends EC1201ControllerSupport 
{
	@Override
	public String execute() throws Exception
    {
		this.savePageData();
		return "queryResultEC1201";
	}

}
