package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月16日
 * @time 下午2:06:42
 */
public class EB0101FindByIdPayServlet extends EB0101ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "addPayEB0101";
	}

}
