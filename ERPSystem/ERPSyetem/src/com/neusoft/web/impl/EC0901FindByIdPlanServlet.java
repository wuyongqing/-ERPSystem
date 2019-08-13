package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月8日
 * @time 上午9:05:15
 * 根据主键查找教研方案
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
