package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��9��
 * @time ����11:17:35
 * ��ӵ׸�
 */
public class EC1101AddDraftServlet extends EC1101ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addDraft", "��ӵ׸�");
		return "addDraftEC1101";
	}

}
