package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月6日
 * @time 下午4:36:33
 * 添加教研活动
 */
public class EC0901AddActivityServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addActivity", "添加活动");
		return "addActivityEC0901";
	}
}
