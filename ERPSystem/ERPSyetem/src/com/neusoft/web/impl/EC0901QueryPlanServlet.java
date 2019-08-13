package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月5日
 * @time 下午3:02:53
 * 不定条件查询教研方案
 */
public class EC0901QueryPlanServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryPlanEC0901";
	}
}
