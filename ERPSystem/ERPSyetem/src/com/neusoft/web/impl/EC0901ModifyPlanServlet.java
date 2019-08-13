package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月6日
 * @time 下午4:37:14
 * 修改教研方案
 */
public class EC0901ModifyPlanServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyPlan", "修改");
		this.savePageInstance();
		this.saveSubPageData();
		return "addPlanEC0901";
	}

}
