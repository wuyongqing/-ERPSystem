package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��11��
 * @time ����11:33:16
 * ����������ѯ����ʹ�ü�¼
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
