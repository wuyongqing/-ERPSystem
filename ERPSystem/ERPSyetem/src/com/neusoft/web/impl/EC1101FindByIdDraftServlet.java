package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��10��
 * @time ����5:48:07
 * �����������ҽ��е׸�
 */
public class EC1101FindByIdDraftServlet extends EC1101ControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "addDraftEC1101";
	}

}
