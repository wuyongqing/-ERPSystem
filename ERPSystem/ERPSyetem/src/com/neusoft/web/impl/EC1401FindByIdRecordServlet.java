package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��11��
 * @time ����3:22:04
 * �����������Ҿ���ʹ�ü�¼
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
