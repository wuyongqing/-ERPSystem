package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��9��
 * @time ����11:17:35
 * ��ӽ��гɹ�
 */
public class EC1201AddResultServlet extends EC1201ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addResult", "��ӳɹ�");
		this.savePageDataForUpdate();
		return "queryResultEC1201";
	}

}
