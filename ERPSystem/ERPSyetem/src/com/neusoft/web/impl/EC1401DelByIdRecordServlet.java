package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��13��
 * @time ����3:56:49
 */
public class EC1401DelByIdRecordServlet extends EC1401ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delByIdRecord", "ɾ����¼");
		this.savePageDataForDelete();
		return "queryRecordEC1401";
	}

}
