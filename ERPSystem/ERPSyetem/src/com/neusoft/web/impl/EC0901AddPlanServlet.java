package com.neusoft.web.impl;
/**
 * @author susheng
 * @date 2019年7月6日
 * @time 上午11:09:43
 * 添加教研方案
 */
public class EC0901AddPlanServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addPlan", "添加方案");
		this.savePageData();
		return "queryPlanEC0901";
	}
}
