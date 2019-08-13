package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月14日
 * @time 下午6:58:56
 */
public class EB0201FindByIdAFRequestServlet extends EB0201ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "giveAFRequestEB0201";
	}

}
