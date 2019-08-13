package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月6日
 * @time 下午4:40:15
 * 删除某一教研活动
 */
public class EC0901DelByIdActivityServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delByIdActivity", "删除");
		this.saveSubPageDataForDelete();
		return "addPlanEC0901";
	}
}
