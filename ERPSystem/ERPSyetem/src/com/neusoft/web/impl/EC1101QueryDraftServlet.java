package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��9��
 * @time ����11:14:31
 * ����������ѯ���е׸�
 */
public class EC1101QueryDraftServlet extends EC1101ControllerSupport 
{
	@Override
	public String execute() throws Exception
    {
		this.savePageData();
		return "queryDraftEC1101";
	}

}
