package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��10��
 * @time ����6:26:07
 * �޸Ľ��е׸�
 */
public class EC1101ModifyDraftServlet extends EC1101ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyDraft", "�޸�");
		return "addDraftEC1101";
	}

}
