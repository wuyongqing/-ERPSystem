package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��6��
 * @time ����4:38:46
 * �޸Ľ��л
 */
public class EC0901ModifyActivityServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyActivity", "�޸�");
		return "modifyActivityEC0901";
	}

}
