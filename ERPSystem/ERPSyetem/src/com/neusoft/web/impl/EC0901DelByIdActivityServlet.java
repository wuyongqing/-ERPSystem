package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��6��
 * @time ����4:40:15
 * ɾ��ĳһ���л
 */
public class EC0901DelByIdActivityServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delByIdActivity", "ɾ��");
		this.saveSubPageDataForDelete();
		return "addPlanEC0901";
	}
}
