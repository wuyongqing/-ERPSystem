package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��9��
 * @time ����9:14:07
 * ����������ѯ���л
 */
public class EC0901QueryActivityServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.saveSubPageData();
		return "addPlanEC0901";
	}

}
