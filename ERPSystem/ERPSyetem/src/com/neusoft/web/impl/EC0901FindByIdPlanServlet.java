package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��8��
 * @time ����9:05:15
 * �����������ҽ��з���
 */
public class EC0901FindByIdPlanServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.saveSubPageData();
		return "addPlanEC0901";
	}

}
