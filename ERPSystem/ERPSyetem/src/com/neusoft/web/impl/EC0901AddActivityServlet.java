package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��6��
 * @time ����4:36:33
 * ��ӽ��л
 */
public class EC0901AddActivityServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addActivity", "��ӻ");
		return "addActivityEC0901";
	}
}
