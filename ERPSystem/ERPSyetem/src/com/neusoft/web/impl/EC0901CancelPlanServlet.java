package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019��7��6��
 * @time ����10:42:15
 * ������ʦ�������з���������
 */
public class EC0901CancelPlanServlet extends EC0901ControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.update("cancelPlan","����");
		this.savePageData();
		return "queryPlanEC0901";
	}

}
