package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月14日
 * @time 下午12:06:44
 */
public class EC0901DelActivityServlet extends EC0901ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("batchDelete", "批量删除");
		this.saveSubPageDataForDelete();
		return "addPlanEC0901";
	}

}
