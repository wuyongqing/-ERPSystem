package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��5��
 * @time ����3:02:53
 * ����������ѯ���з���
 */
public class EC0901QueryPlanServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryPlanEC0901";
	}
}
