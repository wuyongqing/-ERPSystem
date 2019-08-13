package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月14日
 * @time 下午2:31:58
 */
public class EC1201FindByIdResultServlet extends EC1201ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "lookResultEC1201";
	}

}
