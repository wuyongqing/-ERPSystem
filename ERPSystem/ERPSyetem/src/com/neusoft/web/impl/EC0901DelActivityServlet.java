package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��14��
 * @time ����12:06:44
 */
public class EC0901DelActivityServlet extends EC0901ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("batchDelete", "����ɾ��");
		this.saveSubPageDataForDelete();
		return "addPlanEC0901";
	}

}
