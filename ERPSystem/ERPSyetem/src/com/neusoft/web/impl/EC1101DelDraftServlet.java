package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��10��
 * @time ����6:59:08
 * ����ɾ�����е׸�
 */
public class EC1101DelDraftServlet extends EC1101ControllerSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("batchDelete", "����ɾ��");
		this.savePageDataForDelete();
		return "queryDraftEC1101";
	}

}
