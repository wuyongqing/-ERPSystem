package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月6日
 * @time 上午10:42:15
 * 用于老师撤销教研方案的申请
 */
public class EC0901CancelPlanServlet extends EC0901ControllerSupport {

	@Override
	public String execute() throws Exception 
	{
		this.update("cancelPlan","撤销");
		this.savePageData();
		return "queryPlanEC0901";
	}

}
