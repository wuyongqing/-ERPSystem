package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��10��
 * @time ����5:58:00
 * ɾ�����е׸�
 */
public class EC1101DelByIdDraftServlet extends EC1101ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delById", "ɾ���׸�");
		this.savePageDataForDelete();
		return "queryDraftEC1101";
	}

}
