package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��11��
 * @time ����2:45:40
 * ��Ӿ���ʹ�ü�¼
 */
public class EC1401AddRecordServlet extends EC1401ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("addRecord", "���");
		return "addRecordEC1401";
	}

}
