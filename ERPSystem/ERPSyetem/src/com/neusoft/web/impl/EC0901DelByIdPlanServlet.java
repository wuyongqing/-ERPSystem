package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��5��
 * @time ����9:46:55
 * ɾ��δͨ���Ľ��з���
 */
public class EC0901DelByIdPlanServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delById", "ɾ��");
		this.savePageDataForDelete();
		return "queryPlanEC0901";
	}

}
