package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��13��
 * @time ����4:12:07
 */
public class EC1401DelRecordServlet extends EC1401ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("batchDelete","����ɾ��");
		this.savePageDataForDelete();
		return "queryRecordEC1401";
	}

}
