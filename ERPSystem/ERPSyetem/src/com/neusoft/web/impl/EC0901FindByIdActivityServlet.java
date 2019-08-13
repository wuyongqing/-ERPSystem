package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月8日
 * @time 上午9:11:15
 * 根据主键查找教研活动
 */
public class EC0901FindByIdActivityServlet extends EC0901ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.saveSubPageInstance();
		return "modifyActivityEC0901";
	}

}
