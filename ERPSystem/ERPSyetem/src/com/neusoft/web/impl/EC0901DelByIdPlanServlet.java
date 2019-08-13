package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月5日
 * @time 下午9:46:55
 * 删除未通过的教研方案
 */
public class EC0901DelByIdPlanServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("delById", "删除");
		this.savePageDataForDelete();
		return "queryPlanEC0901";
	}

}
