package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��13��
 * @time ����2:32:17
 */
public class EC1401ModifyRecordServlet extends EC1401ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("modifyRecord", "�޸ļ�¼");
		return "addRecordEC1401";
	}

}
