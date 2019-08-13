package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月6日
 * @time 下午4:38:46
 * 修改教研活动
 */
public class EC0901ModifyActivityServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("modifyActivity", "修改");
		return "modifyActivityEC0901";
	}

}
