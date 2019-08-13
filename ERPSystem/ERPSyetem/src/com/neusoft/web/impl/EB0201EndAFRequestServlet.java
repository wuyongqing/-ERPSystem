package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月14日
 * @time 下午8:36:23
 */
public class EB0201EndAFRequestServlet extends EB0201ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("end", "结算");
		this.saveSubPageData();
		return "endAFRequestEB0201";
	}

}
