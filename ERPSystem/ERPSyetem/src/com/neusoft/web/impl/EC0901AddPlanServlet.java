package com.neusoft.web.impl;
/**
 * @author susheng
 * @date 2019��7��6��
 * @time ����11:09:43
 * ��ӽ��з���
 */
public class EC0901AddPlanServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addPlan", "��ӷ���");
		this.savePageData();
		return "queryPlanEC0901";
	}
}
