package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��6��
 * @time ����4:37:14
 * �޸Ľ��з���
 */
public class EC0901ModifyPlanServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyPlan", "�޸�");
		this.savePageInstance();
		this.saveSubPageData();
		return "addPlanEC0901";
	}

}
