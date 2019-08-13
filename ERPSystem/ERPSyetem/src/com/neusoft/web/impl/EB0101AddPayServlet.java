package com.neusoft.web.impl;

/**
 * @author susheng
 * @date 2019年7月16日
 * @time 下午2:33:55
 */
public class EB0101AddPayServlet extends EB0101ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("addPay","添加");
		return "addPayEB0101";
	}

}
