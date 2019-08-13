package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月9日
 * @time 上午9:14:07
 * 不定条件查询教研活动
 */
public class EC0901QueryActivityServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.saveSubPageData();
		return "addPlanEC0901";
	}

}
